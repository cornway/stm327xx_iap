OUTPUT_FORMAT ("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")

/* Internal Memory Map*/
MEMORY
{
	rom (rx)	: ORIGIN = 0x08000000, LENGTH = 1024K
	rom2 (rx)	: ORIGIN = 0x08000000, LENGTH = 1024K
	shared (rw) : ORIGIN = 0x20000000, LENGTH = 1K
	ram (rwx)   : ORIGIN = 0x20001000, LENGTH = 79k
	ram2 (rwx)  : ORIGIN = 0x20015000, LENGTH = 4K
	stack (rw)  : ORIGIN = 0x2001C000, LENGTH = 16K
	
	usrbss (rwx) : ORIGIN = 0x20020000, LENGTH = 348K
	usrheap (rwx): ORIGIN = 0xC0000000, LENGTH = 16M

	sdram (rw)  : ORIGIN = 0xC0000000, LENGTH = 16M
}

/* Section Definitions */ 
SECTIONS 
{
	.sdram (NOLOAD) :
	{
		__sdram_mem = .;
		. = ALIGN(4);
		*(.sdram .sdram.*)
		__sdram_end = .;
	} > sdram
	
	.usrheap (OVERLAY) :
	{
		__user_heap_mem = .;
		*(.usrheap .usrheap.*)
		__user_heap_end = .;
	} > usrheap

	.usrbss (NOLOAD) :
	{
		__user_bss_mem = .;
		*(.usrbss .usrbss.*)
		__user_bss_end = .;
	} > usrbss

	.shared (NOLOAD) :
	{
		__shared_mem = .;
		*(.shared .shared.*)
		__shared_end = .;
	} > shared

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

	.data : AT (_etext)
	{
		_sdata = .; 
		*(.data .data.*) 
		. = ALIGN(4); 
		_edata = . ;
	} > ram2

	.bss (NOLOAD) : 
	{
		_sbss = . ; 
		*(.bss .bss.*)
		__heap_mem = .;
		*(COMMON .heap .heap.*) 
		__heap_end = .;
		. = ALIGN(4); 
		_ebss = . ; 
	} > ram
	
	.stack (NOLOAD):
	{
		__stack_mem = .;
		. = ALIGN(8);
		*(.stack .stack.*)
		__stack_end = .;
	} > stack

	. = ALIGN(4); 
	_end = . ;
}