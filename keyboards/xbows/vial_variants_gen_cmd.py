models = ['nature', 'knight', 'knight_plus']

vanilla_features = {
    'GRAVE_ESC_ENABLE': 'yes',
    'NKRO_ENABLE': 'yes',
    'EXTRAKEY_ENABLE': 'yes',
    'SPACE_CADET_ENABLE': 'yes',
    'MAGIC_ENABLE': 'yes',
    'MOUSEKEY_ENABLE': 'yes',
    'KEY_OVERRIDE_ENABLE': 'no',
    'TAP_DANCE_ENABLE': 'no',
    'COMBO_ENABLE': 'no',
    'QMK_SETTINGS': 'no',
    'RGB_MATRIX_ENABLE': 'yes'
}

qmk_setting_no_mouse_key_features = {
    'GRAVE_ESC_ENABLE': 'yes',
    'NKRO_ENABLE': 'yes',
    'EXTRAKEY_ENABLE': 'yes',
    'SPACE_CADET_ENABLE': 'yes',
    'MAGIC_ENABLE': 'yes',
    'MOUSEKEY_ENABLE': 'no',
    'KEY_OVERRIDE_ENABLE': 'no',
    'TAP_DANCE_ENABLE': 'no',
    'COMBO_ENABLE': 'no',
    'QMK_SETTINGS': 'yes',
    'RGB_MATRIX_ENABLE': 'yes'
}

qmk_setting_mouse_key_features = {
    'GRAVE_ESC_ENABLE': 'no',
    'NKRO_ENABLE': 'no',
    'EXTRAKEY_ENABLE': 'yes',
    'SPACE_CADET_ENABLE': 'no',
    'MAGIC_ENABLE': 'no',
    'MOUSEKEY_ENABLE': 'yes',
    'KEY_OVERRIDE_ENABLE': 'no',
    'TAP_DANCE_ENABLE': 'no',
    'COMBO_ENABLE': 'no',
    'QMK_SETTINGS': 'yes',
    'RGB_MATRIX_ENABLE': 'yes'
}

sed_cmd="sed -i 's/{feature} = \\w*/{feature} = {state}/' $rules_mk"

grep_cmd='grep --color=never "{feature}" $rules_mk'

for features in [vanilla_features, qmk_setting_no_mouse_key_features, qmk_setting_mouse_key_features]:
    for feature, state in features.items():
        print(sed_cmd.format(feature=feature, state=state))
    print()

for feature in vanilla_features:
    print(grep_cmd.format(feature=feature))
