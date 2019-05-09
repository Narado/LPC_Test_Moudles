

blhost.exe -u 0x1fc9,0x01a2 -t 60000 -- write-memory 0x20010000 led_blinky.bin
blhost.exe -u 0x1fc9,0x01a2 -t 60000 -- call 0x20010d81 0 


pause