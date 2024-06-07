# Copyright 2022 Markus Knutsson (@TweetyDaBird)
# SPDX-License-Identifier: GPL-2.0-or-later

# Needed for VIAL compatability (all are needed)
VIA_ENABLE = yes
VIAL_ENABLE = yes
ENCODER_MAP_ENABLE = yes

# Reduce size on atmega32u4
ifeq ($(strip $(CONVERT_TO)), )
    TAP_DANCE_ENABLE = yes
    QMK_SETTINGS = yes
    KEY_OVERRIDE_ENABLE = no
    COMBO_ENABLE = no
	MAGIC_ENABLE = no
	MOUSEKEY_ENABLE = yes
	CONSOLE_ENABLE = no
	COMMAND_ENABLE = no
	SPACE_CADET_ENABLE = no
	GRAVE_ESC_ENABLE = no
	AVR_USE_MINIMAL_PRINTF = yes
		AUTO_SHIFT_ENABLE = no
	AUTO_SHIFT_MODIFIERS = yes
	# Reduce size even more for non-nanoboot bootloaders
    ifneq ($(strip $(BOOTLOADER_SIZE)), 512)
        MAGIC_ENABLE = no
        MOUSEKEY_ENABLE = no
    endif
endif
