
extern int cm4_hal_init (void);
extern void cm4_hal_tick (void);

void VID_PreConfig (void)
{
}

int mainloop (int argc, const char *argv[])
{
    return 0;
}

int main(void)
{
    cm4_hal_init();
    for (;;) {
        cm4_hal_tick();
    }
}
