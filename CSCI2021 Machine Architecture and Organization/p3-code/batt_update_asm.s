.text
.global  set_batt_from_ports
        
set_batt_from_ports:
        # Arg1: %rdi = batt_t *batt
        # (%rdi) = batt->mlvolts
        # 2(%rdi) = batt->percent
        # 3(%rdi) = batt->mode

        ## return -1 if BATT_VOLTAGE_PORT < 0
        movw BATT_VOLTAGE_PORT(%rip), %dx   # copy BATT_VOLTAGE_PORT to %dx
        cmpw $0, %dx    # %dx - 0
        js .ERROR_RET   # if %dx - 0 < 0 (or, %dx < 0), jump to return 1

        ## set volt value
        movw %dx, %cx   # copy BATT_VOLTAGE_PORT of %dx to %cx
        sarw $1, %cx    # divide %cx by 2 by shifting right by 1
        movw %cx, (%rdi)    # batt->mlvolts = BATT_VOLTAGE_PORT / 2

        ## set percentage
        cmpw $3800, (%rdi)  # (%rdi) - 3800
        js .MLVOLTS_ELIF    # batt->mlvolts < 3800 (negative)
        # (%rdi) >= 3800, fall through
        movb $100, 2(%rdi)  # batt->percent = 100
        jmp .SET_MODE

    ## batt->mlvolts < 3800
    .MLVOLTS_ELIF:
        cmpw $3000, (%rdi)  # (%rdi) - 3000
        jns .MLVOLTS_ELSE    # (%rdi) > 3000 (negative)
        # (%rdi) <= 3000, fall through
        movb $0, 2(%rdi)    # batt->percent = 0
        jmp .SET_MODE
    
    ## batt->mlvolts > 3000
    .MLVOLTS_ELSE:
        movw (%rdi), %cx    # %cx = batt->mlvolts
        subw $3000, %cx     # %cx -= 3000
        sarw $3, %cx        # divide %cx by 8 by shifting right by 3
        movb %cl, 2(%rdi)   # batt->percent = (batt->mlvolts - 3000) / 8
        ## moving cl instead of cx? buggy?

    .SET_MODE:
        ## check the second bit of BATT_STATUS_PORT
        ## if it is 1, percent
        movb BATT_STATUS_PORT(%rip), %dl    # copy BATT_STATUS_PORT to %dl
        movb $1, %cl            # %cl = 1
        salb $2, %cl            # %cl << 2
        testb %dl, %cl          # %dl & %cl 
        jz .STATUSPORT_ZERO     # if BATT_STATUS_PORT & (1 << 2) == 0
        # fall through if 1
        movb $2, 3(%rdi)
        jmp .SUCCESS_RETURN

    .STATUSPORT_ZERO:
        movb $1, 3(%rdi)

    .SUCCESS_RETURN:
        ## return 0 on success
        movl $0, %eax
        ret

    .ERROR_RET: # return on error
        movl $1, %eax
        ret                                      

### Change to definint semi-global variables used with the next function 
### via the '.data' directive
.data
bit_masks:                      # index = number
        .int 0b0111111
        .int 0b0000110
        .int 0b1011011
        .int 0b1001111
        .int 0b1100110
        .int 0b1101101
        .int 0b1111101
        .int 0b0000111
        .int 0b1111111
        .int 0b1101111

blank_bit_mask:
        .int 0b0000000

volt_decimal_bit_mask:
        .int 0b11

.text
.global  set_display_from_batt

## ENTRY POINT FOR REQUIRED FUNCTION
set_display_from_batt:  
        # Arg1: %rdi = batt_t batt
        # Arg2: %rsi = int *display
        movq $0, %rcx
        movq $0, %r8
        movq $0, %r9
        movq $0, %r10
        movq $0, %r11
    
        # %cl = batt.mode
        movq %rdi, %rcx     # move batt at %rdi to %rax
        sarq $24, %rcx      # shift %rax to the right by 24

        ## set is_percent
    # is_percent = %r8b (1 byte)
        cmpb $2, %cl    # 2 - batt.mode
        jne .MODE_VOLTS_OR_ELSE
        movb $1, %r8b      # percent - boolean true (1) if batt.mode == 2
        jmp .SET_NUMBER

    .MODE_VOLTS_OR_ELSE:
    ## batt.mode is volt or neither
        cmpb $1, %cl    # 1 - batt.mode
        jne .ERROR_RETURN   # neither - return 1
        movb $0, %r8b   # volt - boolean false if batt.mode == 1

    .SET_NUMBER:
        ## set number by percent or volts
    # number = %r9d (4 byte)
        cmpb $1, %r8b   # compare is_percent and 1   
        jne .IS_VOLT    # if it is not percent, jump

        # fall through to is_percent == 1
        # %al = batt.percent
        movq $0, %rax       # zero out bits of rax
        movq %rdi, %rax     # move batt at %rdi to %rax
        sarq $16, %rax      # shift %rax to the right by 16
        movb %al, %r9b      # number = batt.percent
        jmp .CALC_DIGITS
    
    .IS_VOLT:   
        movq %rdi, %r9      # number = batt.mlvolts
        andq $0b111111111111111, %r9   # mask lower bits (ignore higher bits)
        # round up volts
        movq $0, %rax       # zero out bits of rax
        movl %r9d, %eax     # dividend = number
        cqto
        movl $10, %ecx      # divisor = 10
        idivl %ecx          # %edx = remainder

        ## if number % 10 >= 5
        cmpl $5, %edx           # remainder - 5 
        js .NUMBER_MOD_10_LESS_THAN_5   # remainder < 5
        addl $10, %r9d      # number += 10
        # number /= 10 after += 10
        movq $0, %rax       # zero out bits of rax
        movl %r9d, %eax     # dividend = number
        cqto
        movl $10, %ecx      # divisor = 10
        idivl %ecx          # %eax = quotient
        movl %eax, %r9d     # move quot back to %r9d
        jmp .CALC_DIGITS

    ## number /= 10
    .NUMBER_MOD_10_LESS_THAN_5:
        movl %eax, %r9d     # %eax is not udpated from last time
                            # it is the quotient of the last division (%r9d / 10)

    .CALC_DIGITS:
        ## Divide number by 10
        movq $0, %rax       # zero out bits of rax
        movl %r9d, %eax     # dividend = number
        cqto
        movl $10, %ecx      # divisor = 10
        idivl %ecx          
        # %eax = quotient, %edx = remainder

    # int right = %r11d
        # int[] bit_masks = %rcx (temporarily)
        leaq bit_masks(%rip), %rcx      # load bit_masks in %rcx
        movl (%rcx, %rdx, 4), %r11d     # right = bit_masks[number%10]

        # number = number / 10
        movl %eax, %r9d

        ## Divide number by 10 (again)
        # %eax is already the dividend
        cqto
        movl $10, %r10d      # divisor = 10 (borrow %r10d for divisor)
        idivl %r10d          
        # %rax = quotient, %rdx = remainder

    # int middle = %r10d
        movl (%rcx, %rdx, 4), %r10d     # middle = bit_masks[number%10]

    # int left = %r9d
        # number at %r9d is no longer needed
        movl (%rcx, %rax, 4), %r9d      # left = bit_masks[number/10]

        ## Turn leading numbers blank (percent)
        ## if is_percent
        cmpb $1, %r8b        # %r8b = is_percent, check if is_percent is true
        jne .SET_DISPLAY    # volt - skip this

        ## if left == bit_masks[0]
        # get 0th bitmask (%eax)
        movq $0, %rax                   # %rax = index = 0
        movl (%rcx, %rax, 4), %eax      # %eax = %rcx[%rax] (0th bitmask)

        # left == bit_masks[0]
        cmpl %r9d, %eax
        jne .SET_DISPLAY    # not leading 0 - skip this part

        # get 0b0 bitmask (%ecx)
        # %ecx is now 0b0 bitmask instead of bitmask array
        movl blank_bit_mask(%rip), %ecx 

        # set left to 0b0
        movl %ecx, %r9d

        ## if middle == bit_masks[0]
        cmpl %r10d, %eax
        jne .SET_DISPLAY
        movl %ecx, %r10d    # middle = 0b0, fell through

    .SET_DISPLAY:
        ## reset display value
        movl $0, (%rsi)

        ## set numbers to display
        sall $14, %r9d      # left = left << 24
        orl %r9d, (%rsi)    # *display = *displau | left << 14
        sall $7, %r10d      # middle = middle << 7
        orl %r10d, (%rsi)   # *display = *display | middle << 7
        orl %r11d, (%rsi)   # *display = *display | right

        ## set volt/percent and decimal point
        cmpb $1, %r8b
        jne .SET_VOLT_DISPLAY   # batt.mode == volt (0)
        # set percent display
        movl $1, %eax
        sall $21, %eax      # 1 << 21
        orl %eax, (%rsi)    # *display = *display | 1 << 21
        jmp .SET_BATT_LEVELS

    .SET_VOLT_DISPLAY:
        movl volt_decimal_bit_mask(%rip), %eax
        sall $22, %eax      # 0b11 << 22
        orl %eax, (%rsi)    # *display = *display | 0b11 << 22
        # #22 for volt symbol, #23 for decimal point

    .SET_BATT_LEVELS:
    # batt.percent = %cl
        movq %rdi, %rax     # move batt at %rdi to %rax
        sarq $16, %rax      # shift %rax to the right by 16
        movb %al, %cl       # move batt.percent at %al to %cl

    ## if batt.percent > 5
        cmpb $5, %cl
        jle .PERCENT_29
        # fall through if > 5
        movl $1, %eax
        sall $24, %eax      # 1 << 24
        orl %eax, (%rsi)    # *display = *display | 1 << 24

    ## if batt.percent > 29
    .PERCENT_29:
        cmpb $29, %cl
        jle .PERCENT_49
        # fall through if > 29
        movl $1, %eax
        sall $25, %eax      # 1 << 25
        orl %eax, (%rsi)    # *display = *display | 1 << 25

    ## if batt.percent > 49
    .PERCENT_49:
        cmpb $49, %cl
        jle .PERCENT_69
        # fall through if > 49
        movl $1, %eax
        sall $26, %eax      # 1 << 26
        orl %eax, (%rsi)    # *display = *display | 1 << 26

    ## if batt.percent > 69
    .PERCENT_69:
        cmpb $69, %cl
        jle .PERCENT_89
        # fall through if > 69
        movl $1, %eax
        sall $27, %eax      # 1 << 27
        orl %eax, (%rsi)    # *display = *display | 1 << 27

    ## if batt.percent > 89
    .PERCENT_89:
        cmpb $89, %cl
        jle .RET
        # fall through if > 89
        movl $1, %eax
        sall $28, %eax      # 1 << 28
        orl %eax, (%rsi)    # *display = *display | 1 << 28

    .RET:
        movl $0, %eax
        ret

    .ERROR_RETURN:
        movl $1, %eax
        ret

.text
.global batt_update
        
batt_update:
        subq $8, %rsp            # allocate memory for batt_t, make stack divisible by 16
        movq %rsp, %rdi          # Arg1 of set_batt_from_ports()
        call set_batt_from_ports

        ## if return val = 1; failure
        cmpl $1, %eax
        je .RETURN_ERROR

        # fall through to set display
        movq (%rsp), %rdi       # Arg1: batt
        movq %rsp, %rsi         # Arg2: &display (reused stack space)
        call set_display_from_batt

        # change display value
        movl (%rsp), %ecx
        movl %ecx, BATT_DISPLAY_PORT(%rip)

        # return 0
        addq $8, %rsp
        movl $0, %eax
        ret 

    .RETURN_ERROR:
        addq $8, %rsp           # free memory used by batt_t
        movl $1, %eax
        ret
        