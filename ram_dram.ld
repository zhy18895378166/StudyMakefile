MEMORY
{
	ram	: ORIGIN = 0x00000000, LENGTH = 0x00001000
	dram	: ORIGIN = 0x00004000, LENGTH = 0x00001000
}

ENTRY(_start)

SECTIONS
{
	.text : {
		/* EXCLUDE_FILE (build_in_dram.o) *(.text) */
		*(EXCLUDE_FILE (build_in_dram.o) .text)
	} > ram

	.data : {
		*(.data)
	} > ram

	.bss : {
		*(.bss)
	} > ram
	
	.dram : {
		build_in_dram.o (.text)
		build_in_dram.o (.rodata)
	} > dram

}
