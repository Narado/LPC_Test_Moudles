set sramx_base_addr=0x00000000
set sram0_base_addr=0x20000000
set sram0_nonreserv_addr=0x2000A458
set sram1_base_addr=0x20010000
set sram2_base_addr=0x20018000
set sram3_base_addr=0x20020000

REM fill-read_SRAMX_4KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  fill-memory 0x0 0x1000 0x12 byte
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x0 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0xf00 0x100
REM fill-read_SRAM0_4KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  fill-memory %sram0_nonreserv_addr% 0x1000 0x12 byte 
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory %sram0_nonreserv_addr% 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x2000b358 0x100
REM fill-read_SRAM1_4KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  fill-memory 0x20010000 0x1000 0x12 byte 
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20010000 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20010f00 0x100
REM fill-read_SRAM2_4KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  fill-memory 0x20018000 0x1000 0x12 byte 
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20018000 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20018f00 0x100
REM fill-read_SRAM3_4KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  fill-memory 0x20020000 0x1000 0x12 byte 
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20020000 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20020f00 0x100


REM fill-read_SRAMX_all_192KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  fill-memory 0x0 0x30000 0x66 byte
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x0 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x2ff00 0x100
REM fill-read_SRAM0_all_25KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  fill-memory %sram0_nonreserv_addr% 0x5BA8 0x66 byte 
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory %sram0_nonreserv_addr% 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x2000ff00 0x100
REM fill-read_SRAM1_ALL_32KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  fill-memory 0x20010000 0x8000 0x66 byte 
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20010000 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20017f00 0x100
REM fill-read_SRAM2_ALL_32KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  fill-memory 0x20018000 0x8000 0x66 byte 
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20018000 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x2001ff00 0x100
REM fill-read_SRAM3_ALL_32KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  fill-memory 0x20020000 0x8000 0x66 byte 
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20020000 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20027f00 0x100


REM write-read_SRAMX_all_192KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  write-memory 0x0 0x30000.bin
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x0 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x2ff00 0x100
REM write-read_SRAM0_all_25KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  write-memory %sram0_nonreserv_addr% 0x5BA8.bin 
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory %sram0_nonreserv_addr% 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x2000ff00 0x100
REM write-read_SRAM1_ALL_32KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  write-memory 0x20010000 0x8000.bin 
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20010000 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20017f00 0x100
REM write-read_SRAM2_ALL_32KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  write-memory 0x20018000 0x8000.bin
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20018000 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x2001ff00 0x100
REM write-read_SRAM3_ALL_32KB
blhost -u 0x1fc9,0x01a2 -t 10000 --  write-memory 0x20020000 0x8000.bin
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20020000 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20027f00 0x100






cmd