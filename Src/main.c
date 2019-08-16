/* Includes ------------------------------------------------------------------*/
#if !defined MODULE

#include <main.h>
#include <lcd_main.h>
#include <heap.h>
#include <audio_main.h>

const char *snd_dir_path = "/sys/sound";

extern int boot_main (int argc, const char **argv);
extern int dev_main (void);

int main(void)
{
    dev_main();
}

static void *__vid_alloc (uint32_t size)
{
    return heap_alloc_shared(size);
}

void VID_PreConfig (void)
{
    screen_conf_t conf;

    conf.res_x = -1;
    conf.res_y = -1;
    conf.alloc.malloc = heap_alloc_shared;
    conf.alloc.free = heap_free;
    conf.colormode = GFX_COLOR_MODE_RGBA8888;
    conf.laynum = 1;
    conf.hwaccel = 0;
    conf.clockpresc = 2;
    vid_config(&conf);
}

int mainloop (int argc, const char *argv[])
{
    audio_conf("samplerate=22050, volume=64");
    vid_print_info();
    boot_main(argc, argv);
    return 0;
}

#endif
