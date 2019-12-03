OUTPUT_FORMAT ("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")

/* Internal Memory Map*/
MEMORY
{
	rom (rx)	: ORIGIN = 0x08000000, LENGTH = 2048K
	ram (rwx)   : ORIGIN = 0x20000000, LENGTH = 256K
	sdram (rwx) : ORIGIN = 0xC0000000, LENGTH = 0x01000000 /* first 300K is used as LCD frame buffer */
}

/* Section Definitions */ 
SECTIONS 
{	
	/* external SDRAM */
	.sdram (NOLOAD) :
	{
		. = ALIGN(4);
		*(.sdram .sdram.*)
	} > sdram
	
	/* program code */
	.text : 
	{ 
		KEEP(*(.isr_vector .isr_vector.*)) 
		*(.text .text.* .gnu.linkonce.t.*) 		  
		*(.glue_7t) *(.glue_7)						
		*(.rodata .rodata* .gnu.linkonce.r.*)								  
	} > rom
	
	.ARM.extab : 
	{
		*(.ARM.extab* .gnu.linkonce.armextab.*)
	} > rom

	__exidx_start = .;
	.ARM.exidx :
	{
		*(.ARM.exidx* .gnu.linkonce.armexidx.*)
	} > rom
	__exidx_end = .;

	. = ALIGN(4); 
	_etext = .;
	_sidata = .; 

	/* initialized data */
	.data : AT (_etext) 
	{
		_sdata = .; 
		*(.data .data.*) 
		. = ALIGN(4); 
		_edata = . ;
	} > ram

	/* uninitialized data */
	.bss (NOLOAD) : 
	{
		_sbss = . ; 
		*(.bss .bss.*) 
		*(COMMON) 
		. = ALIGN(4); 
		_ebss = . ; 
	} > ram
	
	/* stack section */
	.stack (NOLOAD):
	{
		. = ALIGN(8);
		*(.stack .stack.*)
	} > ram

	/* heap section */
	.heap (NOLOAD):
	{
		*(.heap .heap.*)
	} > ram
	
	. = ALIGN(4); 
	_end = . ;
}