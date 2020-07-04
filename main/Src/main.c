/* Includes ------------------------------------------------------------------*/
#include <stdint.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include <main.h>
#include <arch.h>
#include <bsp_api.h>
#include <misc_utils.h>
#include <debug.h>
#include <gfx.h>
#include <gfx2d_mem.h>
#include <lcd_main.h>
#include <heap.h>
#include <nvic.h>
#include <audio_main.h>
#include <gui.h>

const char *snd_dir_path = "/sys/sound";

extern int boot_main (int argc, const char **argv);
extern int bsp_drv_main (void);

int main(void)
{
    return bsp_drv_main();
}

void *vid_alloc (uint32_t size)
{
    return heap_alloc_shared(size);
}

void vid_free (void *p)
{
    heap_free(p);
}

void VID_PreConfig (void)
{
    screen_conf_t conf = {0};

    conf.res_x = -1;
    conf.res_y = -1;
    conf.alloc.malloc = vid_alloc;
    conf.alloc.free = vid_free;
    conf.colormode = GFX_COLOR_MODE_ARGB8888;
    conf.laynum = 1;
    conf.hwaccel = 0;
    conf.cachealgo = VID_CACHE_WBNWA;
    conf.clockpresc = 2;
    vid_config(&conf);
    vid_set_keying(COLOR_GREEN, 1);
}

int mainloop (int argc, const char *argv[])
{
    audio_conf("samplerate=22050, volume=64");
    vid_print_info();
    boot_main(argc, argv);
    return 0;
}

