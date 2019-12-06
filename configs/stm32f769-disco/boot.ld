OUTPUT_FORMAT ("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")

/* Internal Memory Map*/
MEMORY
{
	rom (rx)	: ORIGIN = 0x08000000, LENGTH = 1024K
	rom2 (rx)	: ORIGIN = 0x08000000, LENGTH = 1024K
	ram (rwx)   : ORIGIN = 0x20001000, LENGTH = 65k
	ram2 (rwx)  : ORIGIN = 0x2007c000, LENGTH = 8K
	shared (rw) : ORIGIN = 0x20000000, LENGTH = 1K
	heap (rw)   : ORIGIN = 0x20012000, LENGTH = 10K
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
		. = ALIGN(4);
		*(.sdram .sdram.*)
	} > sdram
	
	__user_heap_mem = .;
	.usrheap (NOLOAD) :
	{
	} > usrheap
	__user_heap_end = .;

	.usrbss (NOLOAD) :
	{
	} > usrbss

	__shared_mem = .;
	.shared (NOLOAD) :
	{
	} > shared
	__shared_end = .;

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
		*(COMMON) 
		. = ALIGN(4); 
		_ebss = . ; 
	} > ram
	
	__stack_mem = .;
	.stack (NOLOAD):
	{
		. = ALIGN(8);
		*(.stack .stack.*)
	} > stack
	__stack_end = .;

	__heap_mem = .;
	.heap (NOLOAD):
	{
		*(.heap .heap.*)
	} > heap
	__heap_end = .;
	
	. = ALIGN(4); 
	_end = . ;
}