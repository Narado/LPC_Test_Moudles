elftosb -f kinetis -V -c write_sram.bd -o write_sram.sb
blhost -u 0x1fc9,0x01a2 -t 100000 -- receive-sb-file write_sram.sb

REM write-read_SRAMX_all_192KB
REM blhost -u 0x1fc9,0x01a2 -t 10000 --  write-memory 0x0 0x30000.bin
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x0 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x2ff00 0x100
REM write-read_SRAM0_all_25KB
REM blhost -u 0x1fc9,0x01a2 -t 10000 --  write-memory 0x20009c00 0x6400.bin 
REM blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20009c00 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x2000A458 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x2000ff00 0x100
REM write-read_SRAM1_ALL_32KB
REM blhost -u 0x1fc9,0x01a2 -t 10000 --  write-memory 0x20010000 0x8000.bin 
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20010000 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20017f00 0x100
REM write-read_SRAM2_ALL_32KB
REM blhost -u 0x1fc9,0x01a2 -t 10000 --  write-memory 0x20018000 0x8000.bin
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20018000 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x2001ff00 0x100
REM write-read_SRAM3_ALL_32KB
REM blhost -u 0x1fc9,0x01a2 -t 10000 --  write-memory 0x20020000 0x8000.bin
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20020000 0x100
blhost -u 0x1fc9,0x01a2 -t 10000 --  read-memory 0x20027f00 0x100

cmd