# stm32xx IAP Driver
In-Application-Programming Driver
This is the top instance used to build iap driver image.
## How to build
Ierarchy of the project:
*root:/ (this)
*    common/ (https://github.com/cornway/stm32xx-hal-master)
*    ulib/ (https://github.com/cornway/ulib)
*    other stuff..
For Keil MDK 
1. build stm32fxx-hal target
2. build ulib target
3. build main target.
Arm-gcc (none-eabi):
make all; default and only target is - stm32f769 discovery board.
output - /bin/
Note: arm-gcc produces larger binary - comparing to the Keil output (both with -O0) size increses by 30%.


