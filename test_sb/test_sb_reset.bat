elftosb.exe -f kinetis -V -c reset.bd -o reset.sb



blhost -u 0x1fc9,0x01a2 -t 60000 -- receive-sb-file reset.sb
blhost -u 0x1fc9,0x01a2 -t 60000 -- get-property 1

pause