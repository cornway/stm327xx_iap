/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "lcd_main.h"

const char *snd_dir_path = "/sys/sound";

extern int boot_main (int argc, char **argv);
extern int dev_main (void);

int main(void)
{
    dev_main();
}

static void *__vid_alloc (uint32_t size)
{
    return Sys_AllocVideo((int *)&size);
}

void VID_PreConfig (void)
{
    screen_t screen;
    screen.buf = NULL;
    screen.width = -1;
    screen.height = -1;
    screen_win_cfg(__vid_alloc, NULL, &screen, GFX_COLOR_MODE_RGBA8888, 1);
}

int mainloop (int argc, const char *argv[])
{
    boot_main(argc, argv);
    return 0;
}

