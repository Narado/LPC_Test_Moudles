elftosb.exe -f kinetis -V -c jump_app.bd -o jump_app.sb




blhost -u 0x1fc9,0x01a2 -t 60000 -- receive-sb-file jump_app.sb

pause