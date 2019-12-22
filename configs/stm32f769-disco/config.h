#ifndef __CONFIG_H__
#define __CONFIG_H__

#define MAX_UART_TTY (1)
#if (HAVE_SAFE_TTY_ONLY)
#define SERIAL_TTY_HAS_DMA (0)
#else
#define SERIAL_TTY_HAS_DMA (1)
#endif

#if (HAVE_AUDIO)
#define AUDIO_MODULE_PRESENT (1)
#else
#define AUDIO_MODULE_PRESENT (0)
#endif

#if (HAVE_AUDIO)
#define MUSIC_MODULE_PRESENT (1)
#else
#define MUSIC_MODULE_PRESENT (0)
#endif

#if (HAVE_HDMI)
#define USE_LCD_HDMI (1)
#else
#define USE_LCD_HDMI (0)
#endif

#if (HAVE_USB)
#define USE_USB_HS (1)
#else
#define USE_USB_HS (0)
#endif

#define MAX_OPEN_FILES (6)
#endif // __CONFIG_H__
