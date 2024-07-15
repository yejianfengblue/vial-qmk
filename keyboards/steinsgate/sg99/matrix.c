#include "matrix.h"
#include "uart.h"

#define UART_MATRIX_RESPONSE_TIMEOUT 10000

void matrix_init_custom(void) {
    uart_init(1000000);
}

bool matrix_scan_custom(matrix_row_t current_matrix[]) {
    uint32_t timeout = 0;
    bool changed = false;

    //the s character requests the RF slave to send the matrix
    uart_write('s');

    //trust the external keystates entirely, erase the last data
    uint8_t uart_data[MATRIX_COLS + 1] = {0};

    //there are 19 bytes corresponding to 18 columns, and then an end byte
    for (uint8_t i = 0; i <= MATRIX_COLS; i++) {
        //wait for the serial data, timeout if it's been too long
        //this only happened in testing with a loose wire, but does no
        //harm to leave it in here
        while (!uart_available()) {
            timeout++;
            if (timeout > UART_MATRIX_RESPONSE_TIMEOUT) {
                break;
            }
        }

        if (timeout < UART_MATRIX_RESPONSE_TIMEOUT) {
            uart_data[i] = uart_read();
        } else {
            uart_data[i] = 0x00;
        }
    }

    //check for the end packet, the key state bytes use the LSBs, so 0xE0
    //will only show up here if the correct bytes were recieved
    if (uart_data[MATRIX_COLS] == 0xE0) {
        //shifting and transferring the keystates to the QMK matrix variable
        for (int ri = 0; ri < MATRIX_ROWS; ri++) {
            matrix_row_t current_row = 0;
            for (int ci = MATRIX_COLS - 1; ci >= 0; ci--) {
                current_row = ((matrix_row_t) current_row << 1) | (((matrix_row_t) uart_data[ci] >> ri) & 1);
            }
            if (current_matrix[ri] != current_row) {
                changed = true;
            }
            current_matrix[ri] = current_row;
        }
    }

    return changed;
}
