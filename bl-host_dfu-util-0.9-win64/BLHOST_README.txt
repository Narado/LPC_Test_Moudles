1. Using dfu-util download the “flashloader.bin” file.
After download if you check the USB list you should see following VID/PID 0x1FC9 0x01A2. (Commands are in bold red)

$ dfu-util.exe  -D flashloader.bin
dfu-util 0.9

Copyright 2005-2009 Weston Schmidt, Harald Welte and OpenMoko Inc.
Copyright 2010-2016 Tormod Volden and Stefan Schmidt
This program is Free Software and has ABSOLUTELY NO WARRANTY
Please report bugs to http://sourceforge.net/p/dfu-util/tickets/

Invalid DFU suffix signature
A valid DFU suffix will be required in a future dfu-util release!!!
Opening DFU capable USB device...
ID 1fc9:001f
Run-time device DFU version 0110
Claiming USB DFU Interface...
Setting Alternate Setting #0 ...
Determining device status: state = dfuIDLE, status = 0
dfuIDLE, continuing
DFU mode device DFU version 0110
Device returned transfer size 512
Copying data from PC to DFU device
Download        [=========================] 100%        47712 bytes
Download done.
state(8) = dfuMANIFEST-WAIT-RESET, status(0) = No error condition is present
Done!

nxp68779@NXL40813 /C/Users/nxp68779/Desktop/dfu-util-0.9-win64
$ dfu-util.exe  -l
dfu-util 0.9

Copyright 2005-2009 Weston Schmidt, Harald Welte and OpenMoko Inc.
Copyright 2010-2016 Tormod Volden and Stefan Schmidt
This program is Free Software and has ABSOLUTELY NO WARRANTY
Please report bugs to http://sourceforge.net/p/dfu-util/tickets/

Found Runtime: [1fc9:01a2] ver=0101, devnum=15, cfg=1, intf=0, path="2-1.1.1.3", alt=0, name="UNKNOWN", serial="UNKNOWN"


2. Then Using blhost command line utility follow the below commands to program Quad SPI device. Blinky.bin is a simple blinky application I used to test it. GPIO P2_2 toggles.

Step 1: Fill the flash option to RAM, the option definition is as follows

BITS	SYMBOL						DESCRIPTION		
--------------------------------------------------
[31:28]	TAG 							0x0C

[27:24]	Option size						Size in bytes = (Option Size + 1) * 4

[23:20]	Device Detection Type			0 - Read SFDP for SDR commands

[19:16]	Query CMD pad(s)				0 - 1

[15:12]	CMD pad(s)						0 - 1

[11 :8]	Quad Mode Entry Setting			0 - Not configure
										1 - Set bit 6 in Status Register 1
										2 - Set bit 1 in Status Register 2
										3 - Set bit 7 in Status Register 2
										4 -  Set bit 1 in Status Register 2 vis 0x31 command
										Note: This field will be effective only if device is compliant with JESD216 only (9 longword SDFP table)	

[7:4]	Misc. mode						0 - Not enabled 

[3:0]   Max Freq						Device specific, On Aruba FL Flashloader:
										1 – 24MHz
										2 – 48MHz
										3 – 60MHz
										4 – 80MHz
										5 – 96MHz

	

$ ./blhost.exe -u 0x1fc9,0x01a2 -- fill-memory 0x2000b000 4 0xc0000004 
Inject command 'fill-memory'
Successful generic response to command 'fill-memory'
Response status = 0 (0x0) Success.

Step 2: Configure SPIFI using Flash option filled in step 1, 0xA is the memory ID for SPIFI
$ ./blhost.exe -u 0x1fc9,0x01a2 -- configure-memory 0xa 0x2000b000
Inject command 'configure-memory'
Successful generic response to command 'configure-memory'
Response status = 0 (0x0) Success.

Step 3: Check QSPI FLASH info via get-property command (optional)
$ ./blhost.exe -u 0x1fc9,0x01a2 -- get-property 25 10
Inject command 'get-property'
Response status = 0 (0x0) Success.
Response word 1 = 15 (0xf)
Response word 2 = 268435456 (0x10000000)
Response word 3 = 16384 (0x4000)
Response word 4 = 256 (0x100)
Response word 5 = 65536 (0x10000)
Response word 6 = 0 (0x0)
UNKNOWN Attributes: Start Address = 0x10000000  Total Size = 16 MB  Page Size =                                                                               256 bytes  Sector Size = 64 KB

Step 4: Erase QSPI FLASH before programming
$ ./blhost.exe -u 0x1fc9,0x01a2 -t 100000 -- flash-erase-region 0x10000000 0x100000
Inject command 'flash-erase-region'
Successful generic response to command 'flash-erase-region'
Response status = 0 (0x0) Success.

Step 5:Program data to QSPI FLASH
$ ./blhost.exe -u 0x1fc9,0x01a2 -t 100000 -- write-memory 0x10000000 blinky.bin
Inject command 'write-memory'
Preparing to send 12392 (0x3068) bytes to the target.
Successful generic response to command 'write-memory'
(1/1)100% Completed!
Successful generic response to command 'write-memory'
Response status = 0 (0x0) Success.
Wrote 12392 of 12392 bytes.

3. The folder also contains a PDF master  document "KBLHOSTUG.PDF" that contains all the commands for BL Host tool. 
