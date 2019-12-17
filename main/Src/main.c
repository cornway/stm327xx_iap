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
    heap_set_api_shared(&conf.alloc);
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

void *_sbrk (int amount)
{
    return NULL;
}

int _write(int handle, char *buf, int count)
{
    dprintf("%s() : [%d] %s\n", __func__, handle, buf);
    return -1;
}

int _close (int fd)
{
    return -1;
}

long _lseek(int fd, long offset, int origin)
{
    return -1;
} 

int _read(int const fd, void * const buffer, unsigned const buffer_size)
{
    return -1;
}

void __c_hard_fault (arch_word_t p0, arch_word_t p1)
{
extern void *cpu_rise (void *frame);
    cpu_rise();
    while (1) {};
}

void SysTick_Handler (void)
{
  HAL_IncTick();
}

#endif
