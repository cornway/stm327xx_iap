
/*---------------------------------------------------------------------*
 *  include files                                                      *
 *---------------------------------------------------------------------*/

#include <stdio.h>
#include <arch.h>
/*---------------------------------------------------------------------*
 *  local definitions                                                  *
 *---------------------------------------------------------------------*/

#ifndef WEAK
#define WEAK __attribute__ ((weak))
#endif

__attribute__ ((used))
void WEAK Reset_Handler (void);
void HardFault_Handler (void);
void WEAK MemManage_Handler (void);
void WEAK BusFault_Handler (void);
void WEAK UsageFault_Handler (void);
void WEAK NMI_Handler (void);
void WEAK SVC_Handler (void);
void WEAK DebugMon_Handler (void);
void WEAK PendSV_Handler (void);
void SysTick_Handler (void);

void WEAK WWDG_IRQHandler (void);
void WEAK PVD_IRQHandler (void);
void WEAK TAMP_STAMP_IRQHandler (void);
void WEAK RTC_WKUP_IRQHandler (void);
void WEAK FLASH_IRQHandler (void);
void WEAK RCC_IRQHandler (void);
void WEAK EXTI0_IRQHandler (void);
void WEAK EXTI1_IRQHandler (void);
void WEAK EXTI2_IRQHandler (void);
void WEAK EXTI3_IRQHandler (void);
void WEAK EXTI4_IRQHandler (void);
void WEAK DMA1_Stream0_IRQHandler (void);
void WEAK DMA1_Stream1_IRQHandler (void);
void WEAK DMA1_Stream2_IRQHandler (void);
void WEAK DMA1_Stream3_IRQHandler (void);
void WEAK DMA1_Stream4_IRQHandler (void);
void WEAK DMA1_Stream5_IRQHandler (void);
void WEAK DMA1_Stream6_IRQHandler (void);
void WEAK ADC_IRQHandler (void);
void WEAK CAN1_TX_IRQHandler (void);
void WEAK CAN1_RX0_IRQHandler (void);
void WEAK CAN1_RX1_IRQHandler (void);
void WEAK CAN1_SCE_IRQHandler (void);
void WEAK EXTI9_5_IRQHandler (void);
void WEAK TIM1_BRK_TIM9_IRQHandler (void);
void WEAK TIM1_UP_TIM10_IRQHandler (void);
void WEAK TIM1_TRG_COM_TIM11_IRQHandler (void);
void WEAK TIM1_CC_IRQHandler (void);
void WEAK TIM2_IRQHandler (void);
void WEAK TIM3_IRQHandler (void);
void WEAK TIM4_IRQHandler (void);
void WEAK I2C1_EV_IRQHandler (void);
void WEAK I2C1_ER_IRQHandler (void);
void WEAK I2C2_EV_IRQHandler (void);
void WEAK I2C2_ER_IRQHandler (void);
void WEAK SPI1_IRQHandler (void);
void WEAK SPI2_IRQHandler (void);
void WEAK USART1_IRQHandler (void);
void WEAK USART2_IRQHandler (void);
void WEAK USART3_IRQHandler (void);
void WEAK EXTI15_10_IRQHandler (void);
void WEAK RTC_Alarm_IRQHandler (void);
void WEAK OTG_FS_WKUP_IRQHandler (void);
void WEAK TIM8_BRK_TIM12_IRQHandler (void);
void WEAK TIM8_UP_TIM13_IRQHandler (void);
void WEAK TIM8_TRG_COM_TIM14_IRQHandler (void);
void WEAK TIM8_CC_IRQHandler (void);
void WEAK DMA1_Stream7_IRQHandler (void);
void WEAK FMC_IRQHandler (void);
void WEAK SDIO_IRQHandler (void);
void WEAK TIM5_IRQHandler (void);
void WEAK SPI3_IRQHandler (void);
void WEAK UART4_IRQHandler (void);
void WEAK UART5_IRQHandler (void);
void WEAK TIM6_DAC_IRQHandler (void);
void WEAK TIM7_IRQHandler (void);
void WEAK DMA2_Stream0_IRQHandler (void);
void WEAK DMA2_Stream1_IRQHandler (void);
void WEAK DMA2_Stream2_IRQHandler (void);
void WEAK DMA2_Stream3_IRQHandler (void);
void WEAK DMA2_Stream4_IRQHandler (void);
void WEAK ETH_IRQHandler (void);
void WEAK ETH_WKUP_IRQHandler (void);
void WEAK CAN2_TX_IRQHandler (void);
void WEAK CAN2_RX0_IRQHandler (void);
void WEAK CAN2_RX1_IRQHandler (void);
void WEAK CAN2_SCE_IRQHandler (void);
void WEAK OTG_FS_IRQHandler (void);
void WEAK DMA2_Stream5_IRQHandler (void);
void WEAK DMA2_Stream6_IRQHandler (void);
void WEAK DMA2_Stream7_IRQHandler (void);
void WEAK USART6_IRQHandler (void);
void WEAK I2C3_EV_IRQHandler (void);
void WEAK I2C3_ER_IRQHandler (void);
void WEAK OTG_HS_EP1_OUT_IRQHandler (void);
void WEAK OTG_HS_EP1_IN_IRQHandler (void);
void WEAK OTG_HS_WKUP_IRQHandler (void);
void WEAK OTG_HS_IRQHandler (void);
void WEAK DCMI_IRQHandler (void);
void WEAK CRYP_IRQHandler (void);
void WEAK HASH_RNG_IRQHandler (void);
void WEAK FPU_IRQHandler (void);
void WEAK UART7_IRQHandler (void);
void WEAK UART8_IRQHandler (void);
void WEAK SPI4_IRQHandler (void);
void WEAK SPI5_IRQHandler (void);
void WEAK SPI6_IRQHandler (void);
void WEAK SAI1_IRQHandler (void);
void WEAK LTDC_IRQHandler (void);
void WEAK LTDC_ER_IRQHandler (void);
void WEAK DMA2D_IRQHandler (void);

void WEAK SAI2_IRQHandler (void);
void WEAK QUADSPI_IRQHandler (void);
void WEAK LPTIM1_IRQHandler (void);
void WEAK CEC_IRQHandler (void);
void WEAK I2C4_EV_IRQHandler (void);
void WEAK I2C4_ER_IRQHandler (void);
void WEAK SPDIF_RX_IRQHandler (void);
void WEAK DSI_IRQHandler (void);
void WEAK DFSDM1_FLT0_IRQHandler (void);
void WEAK DFSDM1_FLT1_IRQHandler (void);
void WEAK DFSDM1_FLT2_IRQHandler (void);
void WEAK DFSDM1_FLT3_IRQHandler (void);
void WEAK SDMMC2_IRQHandler (void);
void WEAK CAN3_TX_IRQHandler (void);
void WEAK CAN3_RX0_IRQHandler (void);
void WEAK CAN3_RX1_IRQHandler (void);
void WEAK CAN3_SCE_IRQHandler (void);
void WEAK JPEG_IRQHandler (void);
void WEAK MDIOS_IRQHandler (void);
void WEAK SDMMC1_IRQHandler (void);
void WEAK RNG_IRQHandler (void);

/* reset handler */
void Default_Reset_Handler (void);

/* default exception handler */
void Default_Handler (void);

/*---------------------------------------------------------------------*
 *  external declarations                                              *
 *---------------------------------------------------------------------*/

extern unsigned long _sidata;    /*!< Start address for the initialization
                                      values of the .data section.            */
extern unsigned long _sdata;     /*!< Start address for the .data section     */
extern unsigned long _edata;     /*!< End address for the .data section       */
extern unsigned long _sbss;      /*!< Start address for the .bss section      */
extern unsigned long _ebss;      /*!< End address for the .bss section        */

extern unsigned long __stack_mem, __stack_end;
extern unsigned long __heap_mem, __heap_end;
extern unsigned long __shared_mem, __shared_end;
extern unsigned long __user_heap_mem, __user_heap_end;

extern int main (void);           /*!< The entry point for the application.    */
extern void SystemInit (void);

__attribute__ ((naked))
void Default_Reset_Handler (void)
{
	/* Initialize data and bss */
	unsigned long *pulSrc, *pulDest;

	pulSrc = &_sidata;

	for(pulDest = &_sdata; pulDest < &_edata; )
	{
		*(pulDest++) = *(pulSrc++);
	}

	arch_startup();
	SystemInit();
	main ();
}

__attribute__ ((section(".stack")))
unsigned char stack[0x4000];

__attribute__ ((section(".sdram")))
unsigned char sdram[0x01000000];

__attribute__ ((section(".usrheap")))
unsigned char usrheap[0x01000000];

__attribute__ ((section(".shared")))
unsigned char shared[0x400];

__attribute__ ((used,section(".isr_vector")))
void (* const g_pfnVectors[]) (void) =
{
	/*----------Core Exceptions------------------------------------------------ */
	(void *)&stack[sizeof(stack) - 8],     /*!< The initial stack pointer         */
	Reset_Handler,
	NMI_Handler,
	HardFault_Handler,
	MemManage_Handler,
	BusFault_Handler,
	UsageFault_Handler,
	0,
	0,
	0,
	0,
	SVC_Handler,
	DebugMon_Handler,
	0,
	PendSV_Handler,
	SysTick_Handler,

	/*External*/
	WWDG_IRQHandler,
	PVD_IRQHandler,
	TAMP_STAMP_IRQHandler,
	RTC_WKUP_IRQHandler,
	FLASH_IRQHandler,
	RCC_IRQHandler,
	EXTI0_IRQHandler,
	EXTI1_IRQHandler,
	EXTI2_IRQHandler,
	EXTI3_IRQHandler,
	EXTI4_IRQHandler,
	DMA1_Stream0_IRQHandler,
	DMA1_Stream1_IRQHandler,
	DMA1_Stream2_IRQHandler,
	DMA1_Stream3_IRQHandler,
	DMA1_Stream4_IRQHandler,
	DMA1_Stream5_IRQHandler,
	DMA1_Stream6_IRQHandler,
	ADC_IRQHandler,
	CAN1_TX_IRQHandler,
	CAN1_RX0_IRQHandler,
	CAN1_RX1_IRQHandler,
	CAN1_SCE_IRQHandler,
	EXTI9_5_IRQHandler,
	TIM1_BRK_TIM9_IRQHandler,
	TIM1_UP_TIM10_IRQHandler,
	TIM1_TRG_COM_TIM11_IRQHandler,
	TIM1_CC_IRQHandler,
	TIM2_IRQHandler,
	TIM3_IRQHandler,
	TIM4_IRQHandler,
	I2C1_EV_IRQHandler,
	I2C1_ER_IRQHandler,
	I2C2_EV_IRQHandler,
	I2C2_ER_IRQHandler,
	SPI1_IRQHandler,
	SPI2_IRQHandler,
	USART1_IRQHandler,
	USART2_IRQHandler,
	USART3_IRQHandler,
	EXTI15_10_IRQHandler,
	RTC_Alarm_IRQHandler,
	OTG_FS_WKUP_IRQHandler,
	TIM8_BRK_TIM12_IRQHandler,
	TIM8_UP_TIM13_IRQHandler,
	TIM8_TRG_COM_TIM14_IRQHandler,
	TIM8_CC_IRQHandler,
	DMA1_Stream7_IRQHandler,
	FMC_IRQHandler,
	SDMMC1_IRQHandler,
	TIM5_IRQHandler,
	SPI3_IRQHandler,
	UART4_IRQHandler,
	UART5_IRQHandler,
	TIM6_DAC_IRQHandler,
	TIM7_IRQHandler,
	DMA2_Stream0_IRQHandler,
	DMA2_Stream1_IRQHandler,
	DMA2_Stream2_IRQHandler,
	DMA2_Stream3_IRQHandler,
	DMA2_Stream4_IRQHandler,
	ETH_IRQHandler,
	ETH_WKUP_IRQHandler,
	CAN2_TX_IRQHandler,
	CAN2_RX0_IRQHandler,
	CAN2_RX1_IRQHandler,
	CAN2_SCE_IRQHandler,
	OTG_FS_IRQHandler,
	DMA2_Stream5_IRQHandler,
	DMA2_Stream6_IRQHandler,
	DMA2_Stream7_IRQHandler,
	USART6_IRQHandler,
	I2C3_EV_IRQHandler,
	I2C3_ER_IRQHandler,
	OTG_HS_EP1_OUT_IRQHandler,
	OTG_HS_EP1_IN_IRQHandler,
	OTG_HS_WKUP_IRQHandler,
	OTG_HS_IRQHandler,
	DCMI_IRQHandler,
	0,
	RNG_IRQHandler,
	FPU_IRQHandler,
	UART7_IRQHandler,
	UART8_IRQHandler,
	SPI4_IRQHandler,
	SPI5_IRQHandler,
	SPI6_IRQHandler,
	SAI1_IRQHandler,
	LTDC_IRQHandler,
	LTDC_ER_IRQHandler,
	DMA2D_IRQHandler,
	SAI2_IRQHandler,
	QUADSPI_IRQHandler,
	LPTIM1_IRQHandler,
	CEC_IRQHandler,
	I2C4_EV_IRQHandler,
	I2C4_ER_IRQHandler,
	SPDIF_RX_IRQHandler,
	DSI_IRQHandler,
	DFSDM1_FLT0_IRQHandler,
	DFSDM1_FLT1_IRQHandler,
	DFSDM1_FLT2_IRQHandler,
	DFSDM1_FLT3_IRQHandler,
	SDMMC2_IRQHandler,
	CAN3_TX_IRQHandler,
	CAN3_RX0_IRQHandler,
	CAN3_RX1_IRQHandler,
	CAN3_SCE_IRQHandler,
	JPEG_IRQHandler,
	MDIOS_IRQHandler,
};

/**
  *@brief Provide weak aliases for each Exception handler to the Default_Handler.
  *       As they are weak aliases, any function with the same name will override
  *       this definition.
  */
#pragma weak Reset_Handler = Default_Reset_Handler
#pragma weak NMI_Handler = Default_Handler
#pragma weak HardFault_Handler = Default_Handler
#pragma weak MemManage_Handler = Default_Handler
#pragma weak BusFault_Handler = Default_Handler
#pragma weak UsageFault_Handler = Default_Handler
#pragma weak SVC_Handler = Default_Handler
#pragma weak DebugMon_Handler = Default_Handler
#pragma weak PendSV_Handler = Default_Handler
#pragma weak SysTick_Handler = Default_Handler

#pragma weak WWDG_IRQHandler = Default_Handler
#pragma weak PVD_IRQHandler = Default_Handler
#pragma weak TAMP_STAMP_IRQHandler = Default_Handler
#pragma weak RTC_WKUP_IRQHandler = Default_Handler
#pragma weak FLASH_IRQHandler = Default_Handler
#pragma weak RCC_IRQHandler = Default_Handler
#pragma weak EXTI0_IRQHandler = Default_Handler
#pragma weak EXTI1_IRQHandler = Default_Handler
#pragma weak EXTI2_IRQHandler = Default_Handler
#pragma weak EXTI3_IRQHandler = Default_Handler
#pragma weak EXTI4_IRQHandler = Default_Handler
#pragma weak DMA1_Stream0_IRQHandler = Default_Handler
#pragma weak DMA1_Stream1_IRQHandler = Default_Handler
#pragma weak DMA1_Stream2_IRQHandler = Default_Handler
#pragma weak DMA1_Stream3_IRQHandler = Default_Handler
#pragma weak DMA1_Stream4_IRQHandler = Default_Handler
#pragma weak DMA1_Stream5_IRQHandler = Default_Handler
#pragma weak DMA1_Stream6_IRQHandler = Default_Handler
#pragma weak ADC_IRQHandler = Default_Handler
#pragma weak CAN1_TX_IRQHandler = Default_Handler
#pragma weak CAN1_RX0_IRQHandler = Default_Handler
#pragma weak CAN1_RX1_IRQHandler = Default_Handler
#pragma weak CAN1_SCE_IRQHandler = Default_Handler
#pragma weak EXTI9_5_IRQHandler = Default_Handler
#pragma weak TIM1_BRK_TIM9_IRQHandler = Default_Handler
#pragma weak TIM1_UP_TIM10_IRQHandler = Default_Handler
#pragma weak TIM1_TRG_COM_TIM11_IRQHandler = Default_Handler
#pragma weak TIM1_CC_IRQHandler = Default_Handler
#pragma weak TIM2_IRQHandler = Default_Handler
#pragma weak TIM3_IRQHandler = Default_Handler
#pragma weak TIM4_IRQHandler = Default_Handler
#pragma weak I2C1_EV_IRQHandler = Default_Handler
#pragma weak I2C1_ER_IRQHandler = Default_Handler
#pragma weak I2C2_EV_IRQHandler = Default_Handler
#pragma weak I2C2_ER_IRQHandler = Default_Handler
#pragma weak SPI1_IRQHandler = Default_Handler
#pragma weak SPI2_IRQHandler = Default_Handler
#pragma weak USART1_IRQHandler = Default_Handler
#pragma weak USART2_IRQHandler = Default_Handler
#pragma weak USART3_IRQHandler = Default_Handler
#pragma weak EXTI15_10_IRQHandler = Default_Handler
#pragma weak RTC_Alarm_IRQHandler = Default_Handler
#pragma weak OTG_FS_WKUP_IRQHandler = Default_Handler
#pragma weak TIM8_BRK_TIM12_IRQHandler = Default_Handler
#pragma weak TIM8_UP_TIM13_IRQHandler = Default_Handler
#pragma weak TIM8_TRG_COM_TIM14_IRQHandler = Default_Handler
#pragma weak TIM8_CC_IRQHandler = Default_Handler
#pragma weak DMA1_Stream7_IRQHandler = Default_Handler
#pragma weak FMC_IRQHandler = Default_Handler
#pragma weak SDIO_IRQHandler = Default_Handler
#pragma weak TIM5_IRQHandler = Default_Handler
#pragma weak SPI3_IRQHandler = Default_Handler
#pragma weak UART4_IRQHandler = Default_Handler
#pragma weak UART5_IRQHandler = Default_Handler
#pragma weak TIM6_DAC_IRQHandler = Default_Handler
#pragma weak TIM7_IRQHandler = Default_Handler
#pragma weak DMA2_Stream0_IRQHandler = Default_Handler
#pragma weak DMA2_Stream1_IRQHandler = Default_Handler
#pragma weak DMA2_Stream2_IRQHandler = Default_Handler
#pragma weak DMA2_Stream3_IRQHandler = Default_Handler
#pragma weak DMA2_Stream4_IRQHandler = Default_Handler
#pragma weak ETH_IRQHandler = Default_Handler
#pragma weak ETH_WKUP_IRQHandler = Default_Handler
#pragma weak CAN2_TX_IRQHandler = Default_Handler
#pragma weak CAN2_RX0_IRQHandler = Default_Handler
#pragma weak CAN2_RX1_IRQHandler = Default_Handler
#pragma weak CAN2_SCE_IRQHandler = Default_Handler
#pragma weak OTG_FS_IRQHandler = Default_Handler
#pragma weak DMA2_Stream5_IRQHandler = Default_Handler
#pragma weak DMA2_Stream6_IRQHandler = Default_Handler
#pragma weak DMA2_Stream7_IRQHandler = Default_Handler
#pragma weak USART6_IRQHandler = Default_Handler
#pragma weak I2C3_EV_IRQHandler = Default_Handler
#pragma weak I2C3_ER_IRQHandler = Default_Handler
#pragma weak OTG_HS_EP1_OUT_IRQHandler = Default_Handler
#pragma weak OTG_HS_EP1_IN_IRQHandler = Default_Handler
#pragma weak OTG_HS_WKUP_IRQHandler = Default_Handler
#pragma weak OTG_HS_IRQHandler = Default_Handler
#pragma weak DCMI_IRQHandler = Default_Handler
#pragma weak CRYP_IRQHandler = Default_Handler
#pragma weak HASH_RNG_IRQHandler = Default_Handler
#pragma weak FPU_IRQHandler = Default_Handler
#pragma weak UART7_IRQHandler = Default_Handler
#pragma weak UART8_IRQHandler = Default_Handler
#pragma weak SPI4_IRQHandler = Default_Handler
#pragma weak SPI5_IRQHandler = Default_Handler
#pragma weak SPI6_IRQHandler = Default_Handler
#pragma weak SAI1_IRQHandler = Default_Handler
#pragma weak LTDC_IRQHandler = Default_Handler
#pragma weak LTDC_ER_IRQHandler = Default_Handler
#pragma weak DMA2D_IRQHandler = Default_Handler

#pragma weak SAI2_IRQHandler = Default_Handler
#pragma weak QUADSPI_IRQHandler = Default_Handler
#pragma weak LPTIM1_IRQHandler = Default_Handler
#pragma weak CEC_IRQHandler = Default_Handler
#pragma weak I2C4_EV_IRQHandler = Default_Handler
#pragma weak I2C4_ER_IRQHandler = Default_Handler
#pragma weak SPDIF_RX_IRQHandler = Default_Handler
#pragma weak DSI_IRQHandler = Default_Handler
#pragma weak DFSDM1_FLT0_IRQHandler = Default_Handler
#pragma weak DFSDM1_FLT1_IRQHandler = Default_Handler
#pragma weak DFSDM1_FLT2_IRQHandler = Default_Handler
#pragma weak DFSDM1_FLT3_IRQHandler = Default_Handler
#pragma weak SDMMC2_IRQHandler = Default_Handler
#pragma weak CAN3_TX_IRQHandler = Default_Handler
#pragma weak CAN3_RX0_IRQHandler = Default_Handler
#pragma weak CAN3_RX1_IRQHandler = Default_Handler
#pragma weak CAN3_SCE_IRQHandler = Default_Handler
#pragma weak JPEG_IRQHandler = Default_Handler
#pragma weak MDIOS_IRQHandler = Default_Handler
#pragma weak SDMMC1_IRQHandler = Default_Handler
#pragma weak RNG_IRQHandler = Default_Handler

/**
  * @brief  This is the code that gets called when the processor receives an
  *         unexpected interrupt.  This simply enters an infinite loop,
  *         preserving the system state for examination by a debugger.
  * @param  None
  * @retval None
  */

void WEAK Default_Handler (void)
{
	while (1)
	{
	}
}