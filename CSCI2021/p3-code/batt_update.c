#include "batt.h"
#include <string.h>
#include <stdio.h>

// int set_batt_from_ports(batt_t *batt) {
//     if (BATT_VOLTAGE_PORT < 0) {
//         return 1;
//     }

//     // set volt value
//     batt->mlvolts = BATT_VOLTAGE_PORT / 2;

//     // set percentage
//     if (batt->mlvolts >= 3800) { // full
//         batt->percent = 100;
//     } else if (batt->mlvolts <= 3000) { // empty
//         batt->percent = 0;
//     } else {
//         batt->percent = (batt->mlvolts - 3000) / 8;
//     }

//     // check the second bit of BATT_STATUS_PORT
//     // if it is 1, percent
//     if (BATT_STATUS_PORT & (1 << 2)) {
//         batt->mode = 2;

//     // if 0, volt
//     } else {
//         batt->mode = 1;
//     }
//     return 0;
// }

// int set_display_from_batt(batt_t batt, int *display) {
//     // index = number
//     int bit_masks[] = {
//         0b0111111,
//         0b0000110,
//         0b1011011,
//         0b1001111,
//         0b1100110,
//         0b1101101,
//         0b1111101,
//         0b0000111,
//         0b1111111,
//         0b1101111
//     };

//     int left, middle, right; // 3 digits
//     int number; // display bitstring
//     int is_percent = batt.mode == 2; // boolean, 1 if batt's mode is percent
//     if (is_percent) number = batt.percent;
//     else {
//         number = batt.mlvolts;

//         // volt - rounding up value
//         if (number % 10 >= 5) number += 10;
//         number /= 10;
//     }

//     // calculate the 3 digits
//     right = bit_masks[number%10];
//     number = number / 10;
//     middle = bit_masks[number%10];
//     left = bit_masks[number/10];

//     // percent - turn leading 0s blank
//     if (is_percent && left == bit_masks[0]) {
//         left = 0b0;
//         if (middle == bit_masks[0]) { // middle leading 0
//             middle = 0b0;
//         }
//     }

//     // reset display value
//     *display = 0;

//     // set numbers
//     *display = *display | left << 14;
//     *display = *display | middle << 7;
//     *display = *display | right;

//     // set volt/percent and decimal point
//     if (batt.mode == 2) { // percent
//         *display = *display | 1 << 21;
//     } else { // volt
//         *display = *display | 0b11 << 22; // #22 for volt symbol, #23 for decimal point
//     }

//     // set battery levels
//     if (batt.percent > 5) *display = *display | 1 << 24;
//     if (batt.percent > 29) *display = *display | 1 << 25;
//     if (batt.percent > 49) *display = *display | 1 << 26;
//     if (batt.percent > 69) *display = *display | 1 << 27;
//     if (batt.percent > 89) *display = *display | 1 << 28;
//     return 0;
// }

// int batt_update() {
//     // set battery
//     batt_t batt = {};
//     int failed = set_batt_from_ports(&batt);
//     if (failed) {
//         return 1;
//     }

//     // display battery
//     int display;
//     set_display_from_batt(batt, &display);
//     BATT_DISPLAY_PORT = display; // change display value
//     return 0;
// }