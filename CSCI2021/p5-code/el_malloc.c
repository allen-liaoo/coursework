// el_malloc.c: implementation of explicit list malloc functions.

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "el_malloc.h"

////////////////////////////////////////////////////////////////////////////////
// Global control functions

// Global control variable for the allocator. Must be initialized in
// el_init().
el_ctl_t el_ctl = {};

// REQUIRED
// 
// Create an initial block of memory for the heap using
// mmap(). Initialize the el_ctl data structure to point at this
// block. The initializ size/position of the heap for the memory map
// are given in the symbols EL_HEAP_INITIAL_SIZE and
// EL_HEAP_START_ADDRESS.  Initialize the lists in el_ctl to contain a
// single large block of available memory and no used blocks of
// memory.
int el_init(){
  void *heap = mmap(EL_HEAP_START_ADDRESS, 
        EL_HEAP_INITIAL_SIZE,
        PROT_READ | PROT_WRITE,
        MAP_PRIVATE | MAP_ANONYMOUS,
        -1, 0);

  assert(heap == EL_HEAP_START_ADDRESS);

  el_ctl.heap_bytes = EL_HEAP_INITIAL_SIZE;      // make the heap as big as possible to begin with
  el_ctl.heap_start = EL_HEAP_START_ADDRESS;     // set addresses of start and end of heap
  el_ctl.heap_end   = PTR_PLUS_BYTES(EL_HEAP_START_ADDRESS, EL_HEAP_INITIAL_SIZE);

  if(el_ctl.heap_bytes < EL_BLOCK_OVERHEAD){
    fprintf(stderr,"el_init: heap size %ld to small for a block overhead %ld\n",
            el_ctl.heap_bytes,EL_BLOCK_OVERHEAD);
    return 1;
  }
 
  el_init_blocklist(&el_ctl.avail_actual);
  el_init_blocklist(&el_ctl.used_actual);
  el_ctl.avail = &el_ctl.avail_actual;
  el_ctl.used  = &el_ctl.used_actual;

  // establish the first available block by filling in size in
  // block/foot and null links in head
  size_t size = el_ctl.heap_bytes - EL_BLOCK_OVERHEAD;
  el_blockhead_t *ablock = el_ctl.heap_start;
  ablock->size = size;
  ablock->state = EL_AVAILABLE;
  el_blockfoot_t *afoot = el_get_footer(ablock);
  afoot->size = size;
  el_add_block_front(el_ctl.avail, ablock);
  return 0;
}


// Clean up the heap area associated with the system which simply
// calls free() on the malloc'd block used as the heap.
void el_cleanup(){
  munmap(el_ctl.heap_start, el_ctl.heap_bytes);
  el_ctl.heap_start = NULL;
  el_ctl.heap_end   = NULL;
}

////////////////////////////////////////////////////////////////////////////////
// Pointer arithmetic functions to access adjacent headers/footers

// Compute the address of the foot for the given head which is at a
// higher address than the head.
el_blockfoot_t *el_get_footer(el_blockhead_t *head){
  size_t size = head->size;
  return PTR_PLUS_BYTES(head, sizeof(el_blockhead_t) + size);
}

// REQUIRED
// Compute the address of the head for the given foot which is at a
// lower address than the foot.
el_blockhead_t *el_get_header(el_blockfoot_t *foot){
  size_t size = foot->size;
  return PTR_MINUS_BYTES(foot, size + sizeof(el_blockhead_t));
}

// Return a pointer to the block that is one block higher in memory
// from the given block.  This should be the size of the block plus
// the EL_BLOCK_OVERHEAD which is the space occupied by the header and
// footer. Returns NULL if the block above would be off the heap.
// DOES NOT follow next pointer, looks in adjacent memory.
el_blockhead_t *el_block_above(el_blockhead_t *block){
  el_blockhead_t *higher =
    PTR_PLUS_BYTES(block, block->size + EL_BLOCK_OVERHEAD);
  if((void *) higher >= (void*) el_ctl.heap_end){
    return NULL;
  }
  else{
    return higher;
  }
}

// REQUIRED
// Return a pointer to the block that is one block lower in memory
// from the given block.  Uses the size of the preceding block found
// in its foot. DOES NOT follow block->next pointer, looks in adjacent
// memory. Returns NULL if the block below would be outside the heap.
// 
// WARNING: This function must perform slightly different arithmetic
// than el_block_above(). Take care when implementing it.
el_blockhead_t *el_block_below(el_blockhead_t *block){
  if (block == el_ctl.heap_start) {
    return NULL;
  }

  el_blockfoot_t *lower = PTR_MINUS_BYTES(block, sizeof(el_blockfoot_t));
  return el_get_header(lower);
    // PTR_MINUS_BYTES(block, block->size + EL_BLOCK_OVERHEAD);
}

////////////////////////////////////////////////////////////////////////////////
// Block list operations

// Print an entire blocklist. The format appears as follows.
//
// {length:   2  bytes:  3400}
//   [  0] head @ 0x600000000000 {state: a  size:   128}
//         foot @ 0x6000000000a0 {size:   128}
//   [  1] head @ 0x600000000360 {state: a  size:  3192}
//         foot @ 0x600000000ff8 {size:  3192}
//
// Note that the '@' column uses the actual address of items which
// relies on a consistent mmap() starting point for the heap.
void el_print_blocklist(el_blocklist_t *list){
  printf("{length: %3lu  bytes: %5lu}\n", list->length,list->bytes);
  el_blockhead_t *block = list->beg;
  for(int i=0; i<list->length; i++){
    printf("  ");
    block = block->next;
    printf("[%3d] head @ %p ", i, block);
    printf("{state: %c  size: %5lu}\n", block->state,block->size);
    el_blockfoot_t *foot = el_get_footer(block);
    printf("%6s","");          // indent
    printf("  foot @ %p ", foot);
    printf("{size: %5lu}", foot->size);
    printf("\n");
  }
}

// Print out basic heap statistics. This shows total heap info along
// with the Available and Used Lists. The output format resembles the following.
//
// HEAP STATS (overhead per node: 40)
// heap_start:  0x600000000000
// heap_end:    0x600000001000
// total_bytes: 4096
// AVAILABLE LIST: {length:   2  bytes:  3400}
//   [  0] head @ 0x600000000000 {state: a  size:   128}
//         foot @ 0x6000000000a0 {size:   128}
//   [  1] head @ 0x600000000360 {state: a  size:  3192}
//         foot @ 0x600000000ff8 {size:  3192}
// USED LIST: {length:   3  bytes:   696}
//   [  0] head @ 0x600000000200 {state: u  size:   312}
//         foot @ 0x600000000358 {size:   312}
//   [  1] head @ 0x600000000198 {state: u  size:    64}
//         foot @ 0x6000000001f8 {size:    64}
//   [  2] head @ 0x6000000000a8 {state: u  size:   200}
//         foot @ 0x600000000190 {size:   200}
void el_print_stats(){
  printf("HEAP STATS (overhead per node: %lu)\n",EL_BLOCK_OVERHEAD);
  printf("heap_start:  %p\n",el_ctl.heap_start); 
  printf("heap_end:    %p\n",el_ctl.heap_end); 
  printf("total_bytes: %lu\n",el_ctl.heap_bytes);
  printf("AVAILABLE LIST: ");
  el_print_blocklist(el_ctl.avail);
  printf("USED LIST: ");
  el_print_blocklist(el_ctl.used);
}

// Initialize the specified list to be empty. Sets the beg/end
// pointers to the actual space and initializes those data to be the
// ends of the list.  Initializes length and size to 0.
void el_init_blocklist(el_blocklist_t *list){
  list->beg        = &(list->beg_actual); 
  list->beg->state = EL_BEGIN_BLOCK;
  list->beg->size  = EL_UNINITIALIZED;
  list->end        = &(list->end_actual); 
  list->end->state = EL_END_BLOCK;
  list->end->size  = EL_UNINITIALIZED;
  list->beg->next  = list->end;
  list->beg->prev  = NULL;
  list->end->next  = NULL;
  list->end->prev  = list->beg;
  list->length     = 0;
  list->bytes      = 0;
}  

// REQUIRED
// Add to the front of list; links for block are adjusted as are links
// within list.  Length is incremented and the bytes for the list are
// updated to include the new block's size and its overhead.
void el_add_block_front(el_blocklist_t *list, el_blockhead_t *block){
  block->prev = list->beg;
  block->next = list->beg->next;
  block->prev->next = block;
  block->next->prev = block;
  list->length += 1;
  list->bytes += (block->size + EL_BLOCK_OVERHEAD);
}

// REQUIRED
// Unlink block from the list it is in which should be the list
// parameter.  Updates the length and bytes for that list including
// the EL_BLOCK_OVERHEAD bytes associated with header/footer.
void el_remove_block(el_blocklist_t *list, el_blockhead_t *block){
  block->prev->next = block->next;
  block->next->prev = block->prev;
  list->length -= 1;
  list->bytes -= (block->size + EL_BLOCK_OVERHEAD);
}

////////////////////////////////////////////////////////////////////////////////
// Allocation-related functions

// REQUIRED
// Find the first block in the available list with block size of at
// least (size+EL_BLOCK_OVERHEAD). Overhead is accounted so this
// routine may be used to find an available block to split: splitting
// requires adding in a new header/footer. Returns a pointer to the
// found block or NULL if no of sufficient size is available.
el_blockhead_t *el_find_first_avail(size_t size){
  el_blockhead_t *block = el_ctl.avail->beg->next;
  size_t s = size + EL_BLOCK_OVERHEAD; // empty block!?
  while (block != el_ctl.avail->end) {
    if (block->size >= s) return block;
    block = block->next;
  }
  return NULL;
}

// REQUIRED
// Set the pointed to block to the given size and add a footer to
// it. Creates another block above it by creating a new header and
// assigning it the remaining space. Ensures that the new block has a
// footer with the correct size. Returns a pointer to the newly
// created block while the parameter block has its size altered to
// parameter size. Does not do any linking of blocks.  If the
// parameter block does not have sufficient size for a split (at least
// new_size + EL_BLOCK_OVERHEAD for the new header/footer) makes no
// changes and returns NULL.
el_blockhead_t *el_split_block(el_blockhead_t *block, size_t new_size){\
  if (new_size > block->size + EL_BLOCK_OVERHEAD) {
  // if (block->size < new_size + EL_BLOCK_OVERHEAD) {
    return NULL;
  }

  // calc the size of the second block
  size_t old_size = block->size;
  el_blockfoot_t *outer_foot = el_get_footer(block); // second block's footer

  block->size = new_size; 
  el_blockfoot_t *foot = el_get_footer(block);  // create first block footer
  foot->size = new_size;

  // create a second block
  el_blockhead_t *second = el_block_above(block);
  second->size = old_size - new_size - EL_BLOCK_OVERHEAD;
  outer_foot->size = second->size;

  return second;
}

// REQUIRED
// Return pointer to a block of memory with at least the given size
// for use by the user.  The pointer returned is to the usable space,
// not the block header. Makes use of find_first_avail() to find a
// suitable block and el_split_block() to split it.  Returns NULL if
// no space is available.
void *el_malloc(size_t nbytes){
  el_blockhead_t *block = el_find_first_avail(nbytes);
  if (block == NULL) {    // return NULL if no available block
    return NULL;
  }
  el_remove_block(el_ctl.avail, block); // remove from avail list

  el_blockhead_t *second = el_split_block(block, nbytes);
  block->state = EL_USED;
  // add first block to used list
  el_add_block_front(el_ctl.used, block);

  if (second != NULL) {
    // add second block to avail list
    second->state = EL_AVAILABLE;
    el_add_block_front(el_ctl.avail, second);
  }
  return PTR_PLUS_BYTES(block, sizeof(el_blockhead_t));
}

////////////////////////////////////////////////////////////////////////////////
// De-allocation/free() related functions

// REQUIRED
// Attempt to merge the block lower with the next block in
// memory. Does nothing if lower is null or not EL_AVAILABLE and does
// nothing if the next higher block is null (because lower is the last
// block) or not EL_AVAILABLE.  Otherwise, locates the next block with
// el_block_above() and merges these two into a single block. Adjusts
// the fields of lower to incorporate the size of higher block and the
// reclaimed overhead. Adjusts footer of higher to indicate the two
// blocks are merged.  Removes both lower and higher from the
// available list and re-adds lower to the front of the available
// list.
void el_merge_block_with_above(el_blockhead_t *lower){
  // check if the lower block is null or unavailable
  if (lower == NULL || lower->state != EL_AVAILABLE) {
    return;
  }

  // check if the higher block is null or unavailable
  el_blockhead_t *higher = el_block_above(lower);
  if (higher == NULL || higher->state != EL_AVAILABLE) {
    return;
  }

  el_remove_block(el_ctl.avail, lower); // remove lower from used list
  el_remove_block(el_ctl.avail, higher); // remove higher from avail list

  // update size of the new merged block
  int new_size = lower->size + higher->size + EL_BLOCK_OVERHEAD;
  lower->size = new_size;
  el_get_footer(higher)->size = new_size;

  el_add_block_front(el_ctl.avail, lower); // re-add lower to avail list
}

// REQUIRED
// Free the block pointed to by the give ptr.  The area immediately
// preceding the pointer should contain an el_blockhead_t with information
// on the block size. Attempts to merge the free'd block with adjacent
// blocks using el_merge_block_with_above().
void el_free(void *ptr){
  el_blockhead_t *block = PTR_PLUS_BYTES(ptr, -sizeof(el_blockhead_t));
  el_remove_block(el_ctl.used, block);
  block->state = EL_AVAILABLE;
  el_add_block_front(el_ctl.avail, block);

  el_merge_block_with_above(block);
  el_blockhead_t *below = el_block_below(block);
  el_merge_block_with_above(below);
}
