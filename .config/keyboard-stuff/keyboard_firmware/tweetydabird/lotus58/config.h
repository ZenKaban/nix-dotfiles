// Copyright 2022 Markus Knutsson (@TweetyDaBird)
// SPDX-License-Identifier: GPL-2.0-or-later

#pragma once

// Options not yet fully implemented in info.json
#define RGBLIGHT_DEFAULT_VAL 87

#define SPLIT_HAND_PIN B5
#ifndef NO_DEBUG
#define NO_DEBUG
#endif // !NO_DEBUG
#if !defined(NO_PRINT) && !defined(CONSOLE_ENABLE)
#define NO_PRINT
#endif // !NO_PRINT

/* #define NO_ACTION_ONESHOT */
#define QUICK_TAP_TERM 100
#define QUICK_TAP_TERM_PER_KEY
/* #define HOLD_ON_OTHER_KEY_PRESS_PER_KEY */
/* #define IGNORE_MOD_TAP_INTERRUPT */
