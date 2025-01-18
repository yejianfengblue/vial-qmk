#include QMK_KEYBOARD_H

// Each layer gets a name for readability, which is then used in the keymap matrix below.
// The underscores don't mean anything - you can have a layer called STUFF or any other name.
// Layer names don't all need to be of the same length, obviously, and you can also skip them
// entirely and just use numbers.


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
        [0] = LAYOUT_ortho_4x4(
KC_1,KC_2,KC_3,KC_4,
KC_Q,KC_W,KC_E,KC_R,
KC_A,KC_S,KC_D,KC_F,
KC_Z,KC_X,KC_C,KC_V
  )
};


