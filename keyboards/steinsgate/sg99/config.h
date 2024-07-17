#pragma once


/* key matrix size */
#define MATRIX_ROWS 6
#define MATRIX_COLS 18

#define SERIAL_DRIVER SD1 
#define SD1_TX_PIN A9
#define SD1_TX_PAL_MODE 1
#define SD1_RX_PIN A10
#define SD1_RX_PAL_MODE 1

#define LED_PIN_ON_STATE 1
#define LED_CAPS_LOCK_PIN C13
//#define LED_NUM_LOCK_PIN C14

/*
 * Feature disable options
 *  These options are also useful to firmware size reduction.
 */

/* disable debug print */
//#define NO_DEBUG

/* disable print */
//#define NO_PRINT

/* disable action features */
//#define NO_ACTION_LAYER
//#define NO_ACTION_TAPPING
//#define NO_ACTION_ONESHOT
