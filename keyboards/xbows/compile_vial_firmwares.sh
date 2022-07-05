#!/bin/bash

# 1. Use 'sed' command to set different value in keyboards/xbows/{keyboard_model}/keymaps/vial/rules.mk and config.h
#    to setup different QMK features and RGB effects
# 2. Use 'qmk compile' to compile firmware
# 3. Move firmware to directory 'xbows'
# to compile vial firmware with different QMK features and RGB effects
#
# Before run this script, setup the QMK build environment https://docs.qmk.fm/#/newbs_getting_started.
# Run 'qmk doctor' to check the build environment


main() {

    # get qmk home, e.g., ~/vial-qmk
    qmk_home=$(qmk config user.qmk_home | cut -d'=' -f 2)
    # expand ~/vial-qmk to /home/xxx/vial-qmk
    qmk_home=${qmk_home/#\~/$HOME}
    printf "QMK home directory is ${qmk_home}\n"

    # make directory e.g. /home/xxx/vial-qmk/xbows to store hex files
    xbows_firmware_dir=$qmk_home/xbows
    mkdir -pv $xbows_firmware_dir

    compile_vial_firmwares nature
    compile_vial_firmwares knight
    compile_vial_firmwares knight_plus
    compile_vial_firmwares numpad
}


print_features() {

    grep --color=never "GRAVE_ESC_ENABLE" $rules_mk
    grep --color=never "NKRO_ENABLE" $rules_mk
    grep --color=never "EXTRAKEY_ENABLE" $rules_mk
    grep --color=never "SPACE_CADET_ENABLE" $rules_mk
    grep --color=never "MAGIC_ENABLE" $rules_mk
    grep --color=never "MOUSEKEY_ENABLE" $rules_mk
    grep --color=never "KEY_OVERRIDE_ENABLE" $rules_mk
    grep --color=never "TAP_DANCE_ENABLE" $rules_mk
    grep --color=never "COMBO_ENABLE" $rules_mk
    grep --color=never "QMK_SETTINGS" $rules_mk
    grep --color=never "RGB_MATRIX_ENABLE" $rules_mk

    # ignore the first match in the comment in config.h
    grep --color=never "#undef ENABLE_RGB_MATRIX_BAND_SPIRAL_VAL" $config_h | tail +2
}


compile_vanilla_vial() {

    sed -i 's/GRAVE_ESC_ENABLE = \w*/GRAVE_ESC_ENABLE = yes/' $rules_mk
    sed -i 's/NKRO_ENABLE = \w*/NKRO_ENABLE = yes/' $rules_mk
    sed -i 's/EXTRAKEY_ENABLE = \w*/EXTRAKEY_ENABLE = yes/' $rules_mk
    sed -i 's/SPACE_CADET_ENABLE = \w*/SPACE_CADET_ENABLE = yes/' $rules_mk
    sed -i 's/MAGIC_ENABLE = \w*/MAGIC_ENABLE = yes/' $rules_mk
    sed -i 's/MOUSEKEY_ENABLE = \w*/MOUSEKEY_ENABLE = yes/' $rules_mk
    sed -i 's/KEY_OVERRIDE_ENABLE = \w*/KEY_OVERRIDE_ENABLE = no/' $rules_mk
    sed -i 's/TAP_DANCE_ENABLE = \w*/TAP_DANCE_ENABLE = no/' $rules_mk
    sed -i 's/COMBO_ENABLE = \w*/COMBO_ENABLE = no/' $rules_mk
    sed -i 's/QMK_SETTINGS = \w*/QMK_SETTINGS = no/' $rules_mk
    sed -i 's/RGB_MATRIX_ENABLE = \w*/RGB_MATRIX_ENABLE = yes/' $rules_mk

    sed -i 's:[/ ]*#undef ENABLE_RGB_MATRIX_BAND_SPIRAL_VAL     // Single hue spinning spiral fades brightness://  #undef ENABLE_RGB_MATRIX_BAND_SPIRAL_VAL     // Single hue spinning spiral fades brightness:' $config_h

    printf "Compile ${kb} firmware with default features:\n"
    print_features $kb_dir

    printf "\n\n"

    qmk compile -kb "xbows/${kb}" -km vial
    printf "\n"
    mv -v "${qmk_home}/.build/xbows_${kb}_vial.hex" "${xbows_firmware_dir}/xbows_${kb}_vial.hex"
}


compile_qmk_setting_no_mouse_key() {

    sed -i 's/GRAVE_ESC_ENABLE = \w*/GRAVE_ESC_ENABLE = yes/' $rules_mk
    sed -i 's/NKRO_ENABLE = \w*/NKRO_ENABLE = yes/' $rules_mk
    sed -i 's/EXTRAKEY_ENABLE = \w*/EXTRAKEY_ENABLE = yes/' $rules_mk
    sed -i 's/SPACE_CADET_ENABLE = \w*/SPACE_CADET_ENABLE = yes/' $rules_mk
    sed -i 's/MAGIC_ENABLE = \w*/MAGIC_ENABLE = yes/' $rules_mk
    sed -i 's/MOUSEKEY_ENABLE = \w*/MOUSEKEY_ENABLE = no/' $rules_mk
    sed -i 's/KEY_OVERRIDE_ENABLE = \w*/KEY_OVERRIDE_ENABLE = no/' $rules_mk
    sed -i 's/TAP_DANCE_ENABLE = \w*/TAP_DANCE_ENABLE = no/' $rules_mk
    sed -i 's/COMBO_ENABLE = \w*/COMBO_ENABLE = no/' $rules_mk
    sed -i 's/QMK_SETTINGS = \w*/QMK_SETTINGS = yes/' $rules_mk
    sed -i 's/RGB_MATRIX_ENABLE = \w*/RGB_MATRIX_ENABLE = yes/' $rules_mk

    sed -i 's:[/ ]*#undef ENABLE_RGB_MATRIX_BAND_SPIRAL_VAL     // Single hue spinning spiral fades brightness://  #undef ENABLE_RGB_MATRIX_BAND_SPIRAL_VAL     // Single hue spinning spiral fades brightness:' $config_h

    printf "Compile ${kb} firmware with QMK setting and no mouse key:\n"
    print_features

    printf "\n\n"

    qmk compile -kb "xbows/${kb}" -km vial
    printf "\n"
    mv -v "${qmk_home}/.build/xbows_${kb}_vial.hex" "${xbows_firmware_dir}/xbows_${kb}_vial_qmk-setting_no-mouse-key.hex"
}


compile_qmk_setting_mouse_key() {

    sed -i 's/GRAVE_ESC_ENABLE = \w*/GRAVE_ESC_ENABLE = no/' $rules_mk
    sed -i 's/NKRO_ENABLE = \w*/NKRO_ENABLE = no/' $rules_mk
    sed -i 's/EXTRAKEY_ENABLE = \w*/EXTRAKEY_ENABLE = yes/' $rules_mk
    sed -i 's/SPACE_CADET_ENABLE = \w*/SPACE_CADET_ENABLE = no/' $rules_mk
    sed -i 's/MAGIC_ENABLE = \w*/MAGIC_ENABLE = no/' $rules_mk
    sed -i 's/MOUSEKEY_ENABLE = \w*/MOUSEKEY_ENABLE = yes/' $rules_mk
    sed -i 's/KEY_OVERRIDE_ENABLE = \w*/KEY_OVERRIDE_ENABLE = no/' $rules_mk
    sed -i 's/TAP_DANCE_ENABLE = \w*/TAP_DANCE_ENABLE = no/' $rules_mk
    sed -i 's/COMBO_ENABLE = \w*/COMBO_ENABLE = no/' $rules_mk
    sed -i 's/QMK_SETTINGS = \w*/QMK_SETTINGS = yes/' $rules_mk
    sed -i 's/RGB_MATRIX_ENABLE = \w*/RGB_MATRIX_ENABLE = yes/' $rules_mk

    if [ $kb != "knight" ]
    then
        # disable one RGB effect to release space
        sed -i 's:[/ ]*#undef ENABLE_RGB_MATRIX_BAND_SPIRAL_VAL     // Single hue spinning spiral fades brightness:    #undef ENABLE_RGB_MATRIX_BAND_SPIRAL_VAL     // Single hue spinning spiral fades brightness:' $config_h
    else
        sed -i 's:[/ ]*#undef ENABLE_RGB_MATRIX_BAND_SPIRAL_VAL     // Single hue spinning spiral fades brightness://  #undef ENABLE_RGB_MATRIX_BAND_SPIRAL_VAL     // Single hue spinning spiral fades brightness:' $config_h
    fi

    printf "Compile ${kb} firmware with QMK setting and mouse key:\n"
    print_features

    printf "\n\n"

    qmk compile -kb "xbows/${kb}" -km vial
    printf "\n"
    mv -v "${qmk_home}/.build/xbows_${kb}_vial.hex" "${xbows_firmware_dir}/xbows_${kb}_vial_qmk-setting_mouse-key.hex"
}


compile_numpad() {

    sed -i 's/GRAVE_ESC_ENABLE = \w*/GRAVE_ESC_ENABLE = yes/' $rules_mk
    sed -i 's/NKRO_ENABLE = \w*/NKRO_ENABLE = yes/' $rules_mk
    sed -i 's/EXTRAKEY_ENABLE = \w*/EXTRAKEY_ENABLE = yes/' $rules_mk
    sed -i 's/SPACE_CADET_ENABLE = \w*/SPACE_CADET_ENABLE = yes/' $rules_mk
    sed -i 's/MAGIC_ENABLE = \w*/MAGIC_ENABLE = yes/' $rules_mk
    sed -i 's/MOUSEKEY_ENABLE = \w*/MOUSEKEY_ENABLE = yes/' $rules_mk
    sed -i 's/KEY_OVERRIDE_ENABLE = \w*/KEY_OVERRIDE_ENABLE = no/' $rules_mk
    sed -i 's/TAP_DANCE_ENABLE = \w*/TAP_DANCE_ENABLE = no/' $rules_mk
    sed -i 's/COMBO_ENABLE = \w*/COMBO_ENABLE = no/' $rules_mk
    sed -i 's/QMK_SETTINGS = \w*/QMK_SETTINGS = yes/' $rules_mk
    sed -i 's/RGB_MATRIX_ENABLE = \w*/RGB_MATRIX_ENABLE = yes/' $rules_mk

    printf "Compile ${kb} firmware:\n"
    print_features

    printf "\n\n"

    qmk compile -kb "xbows/${kb}" -km vial
    printf "\n"
    mv -v "${qmk_home}/.build/xbows_${kb}_vial.hex" "${xbows_firmware_dir}/xbows_${kb}_vial.hex"
}


# Compile firmware for one keyboard with various features
compile_vial_firmwares() {

    if [ $# -eq 1 ]
    then
        kb=$1  # nature, knight, knight_plus, numpad
        kb_dir=$qmk_home/keyboards/xbows/$kb
        rules_mk=$kb_dir/keymaps/vial/rules.mk
        config_h=$kb_dir/keymaps/vial/config.h

        if [ $kb != "numpad" ]
        then
            printf "\n\n"
            compile_qmk_setting_mouse_key
            printf "\n\n"
            compile_qmk_setting_no_mouse_key
            printf "\n\n"
            compile_vanilla_vial
        else
            printf "\n\n"
            compile_numpad
        fi
    else
        printf "Wrong argument. compile_vial_firmware nature/knight/knight_plus/numpad"
    fi
}


main "$@"
