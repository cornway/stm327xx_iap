/* Includes ------------------------------------------------------------------*/
#if !defined MODULE

#include <main.h>
#include <lcd_main.h>
#include <heap.h>
#include <audio_main.h>
#include <gui.h>

const char *snd_dir_path = "/sys/sound";

extern int boot_main (int argc, const char **argv);
extern int bsp_drv_main (void);

int main(void)
{
    bsp_drv_main();
}

void VID_PreConfig (void)
{
    screen_conf_t conf = {0};

    conf.res_x = -1;
    conf.res_y = -1;
    conf.alloc.malloc = heap_alloc_shared;
    conf.alloc.free = heap_free;
    conf.colormode = GFX_COLOR_MODE_RGBA8888;
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

#endif
