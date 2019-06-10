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

void VID_PreConfig (void)
{
    screen_t screen;
    screen.buf = NULL;
    screen.width = 640;
    screen.height = 480;
    screen_win_cfg(NULL, &screen, GFX_COLOR_MODE, 1);
}

int mainloop (int argc, const char *argv[])
{
    boot_main(argc, argv);
    return 0;
}

