blhost -u 0x1fc9,0x01a2 -- fill-memory 0x2000b000 4 0xc0000005
blhost -u 0x1fc9,0x01a2 -- configure-memory 0xa 0x2000b000
blhost -u 0x1fc9,0x01a2 -- get-property 25 0xa
blhost -u 0x1fc9,0x01a2 -- read-memory 0x10000000 0x10

cmd