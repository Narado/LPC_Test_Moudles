
REM Start Address = 0x10000000  Total Size = 16 MB  Page Size = 256 bytes  Sector Size = 4 KB

REM configure spifi
blhost -u 0x1fc9,0x01a2 -- fill-memory 0x2000b000 4 0xc0000005
blhost -u 0x1fc9,0x01a2 -- configure-memory 0xa 0x2000b000
blhost -u 0x1fc9,0x01a2 -- get-property 25 0xa
blhost -u 0x1fc9,0x01a2 -- read-memory 0x10000000 0x10


REM erase_fill_read_all
REM blhost -u 0x1fc9,0x1a2 -t 100000 -- flash-erase-all 0xa
REM blhost -u 0x1fc9,0x01a2 -t 1000000 -- fill-memory 0x10000000 0x1000000 0x12 byte
REM blhost -u 0x1fc9,0x01a2 -t 1000000 -- read-memory 0x10000000 0x100
REM blhost -u 0x1fc9,0x01a2 -t 1000000 -- read-memory 0x10ffff00 0x100

erase_write_read_all
blhost -u 0x1fc9,0x1a2 -t 100000 -- flash-erase-all 0xa
blhost -u 0x1fc9,0x01a2 -t 1000000 -- write-memory 0x10000000  0x1000000.bin
blhost -u 0x1fc9,0x01a2 -t 1000000 -- read-memory 0x10000000 0x100
blhost -u 0x1fc9,0x01a2 -t 1000000 -- read-memory 0x10fffba0 0x420
blhost -u 0x1fc9,0x01a2 -t 1000000 -- read-memory 0x10000000 0x1000000 read_0x1000000.bin



REM erase 1 sector
blhost -u 0x1fc9,0x1a2 -t 100000 -- flash-erase-region 0x10000000 0x1000
REM erase 2 sector
blhost -u 0x1fc9,0x1a2 -t 100000 -- flash-erase-region 0x10000000 0x2000
REM erase 3 sector
blhost -u 0x1fc9,0x1a2 -t 100000 -- flash-erase-region 0x10000000 0x3000
REM erase 4 sector
blhost -u 0x1fc9,0x1a2 -t 100000 -- flash-erase-region 0x10000000 0x4000

REM erase_all
blhost -u 0x1fc9,0x1a2 -t 100000 -- flash-erase-all 0xa

REM write 4kb_1b
blhost -u 0x1fc9,0x1a2 -t 100000 -- write-memory  0x10000000 write_4kb_1b.bin




REM write unalign address
blhost -u 0x1fc9,0x1a2 -t 100000 -- flash-erase-region 0x10000000 0x1000
blhost -u 0x1fc9,0x1a2 -t 100000 -- write-memory  0x10000003 "{{1 2 3}}"

REM erase unalign address
blhost -u 0x1fc9,0x1a2 -t 100000 -- flash-erase-region 0x10000001 0x1000
REM erase unalign length
blhost -u 0x1fc9,0x1a2 -t 100000 -- flash-erase-region 0x10000000 0x102




cmd