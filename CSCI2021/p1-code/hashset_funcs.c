#include "hashset.h"

long hashcode(char key[]){
  union {
    char str[8];
    long num;
  } strnum;
  strnum.num = 0;

  for(int i=0; i<8; i++){
    if(key[i] == '\0'){
      break;
    }
    strnum.str[i] = key[i];
  }
  return strnum.num;
}

void hashset_init(hashset_t *hs, int table_size) {
    hs->table_size = table_size;
    hs->item_count = 0;
    hs->table = calloc(table_size, sizeof(hashnode_t));
    hs->order_first = NULL;
    hs->order_last = NULL;
}

int hashset_contains(hashset_t *hs, char key[]) {
    long k = hashcode(key);
    int nk = k % hs->table_size;
    if (nk < 0) nk = -1 * nk; // negate negative key

    // iterate through table
    hashnode_t *node = hs->table[nk];
    while(node != NULL) {
        if(strcmp(node->item, key) == 0) // if found
            return 1;
        
        node = node->table_next;
    }
    return 0;
}

int hashset_add(hashset_t *hs, char item[]) {
    if (hashset_contains(hs, item)) return 0;

    long key = hashcode(item);
    int nkey = key % hs->table_size;
    if (nkey < 0) nkey = -1 * nkey; // negate negative key

    hashnode_t *node = hs->table[nkey];

    // create new node and initialize
    hashnode_t *newnode = malloc(sizeof(hashnode_t));
    newnode->table_next = node;
    newnode->order_next = NULL;
    strcpy(newnode->item, item);

    // move pointers
    hs->table[nkey] = newnode;
    if (hs->order_first == NULL)
        hs->order_first = newnode;
    if (hs->order_last != NULL) 
        hs->order_last->order_next = newnode;
    hs->order_last = newnode;

    hs->item_count++;
    return 1;
}

void hashset_free_fields(hashset_t *hs) {
    int i = 0;
    // iterate through table and free node
    hashnode_t *node = hs->order_first;
    while (i < hs->item_count) {
        hashnode_t *temp = node;
        node = node->order_next;
        free(temp);
        i++;
    }
    free(hs->table);

    // reset fields
    hs->item_count = 0;
    hs->table_size = 0;
    hs->table = NULL;
    hs->order_first = NULL;
    hs->order_last = NULL;
}

void hashset_show_structure(hashset_t *hs) {
    // print fields
    printf("item_count: %d\n", hs->item_count);
    printf("table_size: %d\n", hs->table_size);
    char *temp = hs->order_first->item;
    printf("order_first: %s\n", (temp==NULL)?"NULL":temp);
    char *temp1 = hs->order_last->item;
    printf("order_last : %s\n", (temp1==NULL)?"NULL":temp1);
    printf("load_factor: %.4lf\n", ((double) hs->item_count) / hs->table_size);

    // iterate through table and print each node
    for (int i = 0; i < hs->table_size; i++) {
        printf("[%2d] : ", i);
        hashnode_t *node = hs->table[i];
        while (node != NULL) {
            // print node
            printf("{%ld %s ", hashcode(node->item), node->item);
            printf(">>%s} ", (node->order_next==NULL)?"NULL":node->order_next->item);
            node = node->table_next;
        }
        printf("\n");
    }
}

void hashset_write_items_ordered(hashset_t *hs, FILE *out) {
    // iterate through table and print each node
    int i = 1;
    hashnode_t *node = hs->order_first;
    while (i <= hs->item_count) {
        fprintf(out, "  %d %s\n", i, node->item);
        node = node->order_next;
        i++;
    }
}

void hashset_save(hashset_t *hs, char *filename) {
    FILE *out = fopen(filename, "w");
    // no file found
    if (out == NULL) {
        printf("ERROR: could not open file '%s'\n", filename);
        return;
    }

    // write to file
    fprintf(out, "%d %d\n", hs->table_size, hs->item_count);
    hashset_write_items_ordered(hs, out);
    fclose(out);
}

int hashset_load(hashset_t *hs, char *filename) {
    FILE *in = fopen(filename, "r");
    // no file found
    if (in == NULL) {
        printf("ERROR: could not open file '%s'\n", filename);
        return 0;
    }

    hashset_free_fields(hs);

    // scan file
    int status = 0;
    int table_size;
    status = fscanf(in, "%d %*d", &table_size);
    hashset_init(hs, table_size);

    // scan each line, ignore each number
    while(status != EOF) {
        char item[128];
        item[0] = '\0';
        status = fscanf(in, "%*d %s", item); 
        if (item[0] != '\0') hashset_add(hs, item);
    }
    fclose(in);
    return 1;
}

int next_prime(int num) {
    while (1) {
        int i = 2;
        while ((num % i) != 0) {
            // is prime
            if (i > num/2) {
                return num;
            }
            i++;
        }
        num = ((num%2) == 0) ? num+1 // even
         : num+2; // odd
    }
    return -1;// will not be executed
}

void hashset_expand(hashset_t *hs) {
    // calculate new table size
    int table_size = next_prime(2 * hs->table_size + 1);

    // init new table
    hashset_t newhs;
    hashset_init(&newhs, table_size);

    // iterate through old table, add each node to new table
    int i = 1;
    hashnode_t *node = hs->order_first;
    while (i <= hs->item_count) {
        if (node != NULL)
            hashset_add(&newhs, node->item);
        node = node->order_next;
        i++;
    }

    // update hashset fields
    hashset_free_fields(hs);
    hs->table_size = table_size;
    hs->item_count = newhs.item_count;
    hs->table = newhs.table;
    hs->order_first = newhs.order_first;
    hs->order_last = newhs.order_last;
    // newhs will be automatically disgarded except for its calloc'd and malloc'd fields
}