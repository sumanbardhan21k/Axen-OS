/* link.ld */
ENTRY(kernel_main)

SECTIONS {
  . = 0x1000;
  .text : { *(.text) }
  .data : { *(.data) }
  .bss :  { *(.bss)  }
}
