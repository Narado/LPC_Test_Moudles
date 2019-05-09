elftosb.exe -f kinetis -V -c sb_load_SPIFI_1KB.bd -o sb_load_SPIFI_1KB.sb
elftosb.exe -f kinetis -V -c sb_load_SPIFI_unalign_address.bd -o sb_load_SPIFI_unalign_address.sb

blhost -u 0x1fc9,0x01a2 -t 60000 -- receive-sb-file sb_load_SPIFI_1KB.sb
blhost -u 0x1fc9,0x01a2 -t 60000  -- read-memory 0x10000000 0x400

blhost -u 0x1fc9,0x01a2 -t 60000 -- receive-sb-file sb_load_SPIFI_unalign_address.sb

pause