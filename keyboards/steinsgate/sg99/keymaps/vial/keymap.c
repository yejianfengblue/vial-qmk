#include QMK_KEYBOARD_H

// Each layer gets a name for readability, which is then used in the keymap matrix below.
// The underscores don't mean anything - you can have a layer called STUFF or any other name.
// Layer names don't all need to be of the same length, obviously, and you can also skip them
// entirely and just use numbers.


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
        [0] = LAYOUT(
KC_NO,   KC_PSCR, KC_NO,   KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_NO,   KC_NO,   KC_F7,   KC_F8,    KC_F9,    KC_F10,   KC_F11,   KC_F12,   KC_NO,
KC_PGUP, KC_HOME, KC_INS,  KC_GRV,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_NO,   KC_NO,   KC_6,    KC_7,     KC_8,     KC_9,     KC_0,     KC_MINS,  KC_EQL,
KC_PGDN, KC_END,  KC_DEL,  KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_NO,   KC_NO,   KC_Y,    KC_U,     KC_I,     KC_O,     KC_P,     KC_LBRC,  KC_RBRC,
KC_NO,   KC_UP,   KC_NO,   KC_CAPS, KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_NO,   KC_NO,   KC_H,    KC_J,     KC_K,     KC_L,     KC_SCLN,  KC_QUOT,  KC_BSLS,
KC_LEFT, KC_DOWN, KC_RGHT, KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_NO,   KC_NO,   KC_N,    KC_M,     KC_COMM,  KC_DOT,   KC_SLSH,  KC_RSFT,  KC_NO,
KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_LWIN, KC_LALT, KC_LSFT, KC_LCTL, KC_SPC,  KC_ENT,  KC_ESC,  KC_BSPC, KC_RCTL,  KC_RSFT,  KC_RALT,  KC_RWIN,  KC_NO,    KC_NO
  )
};


bool process_record_user(uint16_t keycode, keyrecord_t *record) {
// If console is enabled, it will print the matrix position and status of each key pressed
#ifdef CONSOLE_ENABLE
  uprintf("KL: kc: 0x%04X, col: %2u, row: %2u, pressed: %u, time: %5u, int: %u, count: %u\n", keycode, record->event.key.col, record->event.key.row, record->event.pressed, record->event.time, record->tap.interrupted, record->tap.count);
#endif
  return true;
}
