# stm32xx IAP Driver
In-Application-Programming Driver\
This is the top instance used to build iap driver image.
## How to build
Hierarchy of the project:
```
root/ (this)
    common/ (https://github.com/cornway/stm32xx-hal-master)
    ulib/ (https://github.com/cornway/ulib)
other stuff..
```
For Keil MDK 
1. build stm32fxx-hal target
2. build ulib target
3. build main target.

Arm-gcc (none-eabi):\
```
make all
```
default and only target is - stm32f769 discovery board.\
Or
```
make hal && make ulib && make main && make bin
```
output - /bin/\
Notes: arm-gcc produces larger binary - comparing to the Keil output (both with -O0) size increases by 30%.\
There is no strict relation between c-files and headers, so the best choice for now is to re-build everything.
