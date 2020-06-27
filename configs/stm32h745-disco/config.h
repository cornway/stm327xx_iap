#ifndef __DEV_CONF_H__
#define __DEV_CONF_H__

#if defined(SERIAL_TTY_HAS_DMA)     || \
    defined(MAX_UARTS)              || \
    defined(SERIAL_TSF)             || \
    defined(AUDIO_MODULE_PRESENT)   || \
    defined(MUSIC_MODULE_PRESENT)   || \
    defined(DEVIO_READONLY)         || \
    defined(MAX_HANDLES)            || \
    defined(DEV_MAXXDIM)            || \
    defined(DEV_MAXYDIM)

#error
#endif


#define NVIC_IRQ_MAX                (32)

#define DEBUG_SERIAL                (1)
#if USE_SAFE_TTY
#define SERIAL_TTY_HAS_DMA           (0)
#else
#define SERIAL_TTY_HAS_DMA           (1)
#endif
#define MAX_UARTS                    (1)
#define SERIAL_TSF                   (1)

#define AUDIO_MODULE_PRESENT        (1)
#define MUSIC_MODULE_PRESENT        (1)

#define DEVIO_READONLY              (0)
#define MAX_HANDLES                 (6)

#define DEV_MAXXDIM                 (320)
#define DEV_MAXYDIM                 (240)

#endif /*__DEV_CONF_H__*/
