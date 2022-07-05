# See https://docs.qmk.fm/#/squeezing_avr?id=rulesmk-settings about reducing firmware size

LTO_ENABLE = yes # link time optimization

GRAVE_ESC_ENABLE = no # 140

SPACE_CADET_ENABLE = no # 380

EXTRAKEY_ENABLE = no       # Audio control and System control

NKRO_ENABLE = no # 366

# magic keycode, including toggle N-key rollover, https://docs.qmk.fm/#/keycodes_magic
MAGIC_ENABLE = no # 628 byte

BOOTMAGIC_ENABLE = no      # Enable Bootmagic Lite

# emulate mouse click and move
MOUSEKEY_ENABLE = yes # 1352 byte

KEY_OVERRIDE_ENABLE = no  # 2000 byte

TAP_DANCE_ENABLE = yes # 2000 byte

COMBO_ENABLE = no # 2500 byte

QMK_SETTINGS = yes # 3300 byte

VIA_ENABLE = yes
VIAL_ENABLE = yes

# RGB_MATRIX_ENABLE = yes
