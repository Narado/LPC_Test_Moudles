REM  test_get_bootloader_version 
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 1

REM test_get_available_peripherals
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 2

REM test_get_flash_start_address
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 3

REM test_get_flash_size
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 4

REM test_get_flash_sector_size
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 5

REM test_get_flash_blocks
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 6

REM test_get_available_commands
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 7

REM test_get_crc_check_status
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 8

REM test_get_verify_write_flag
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 10

REM test_get_max_supported_packet_size
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 11

REM test_get_reserved_regions
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 12

REM test_get_
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 13

REM test_get_ram_start_address
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 14

REM test_get_ram_size
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 15

REM test_get_system_device_id
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 16

REM test_get_flash_security_state
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 17

REM test_get_unique_device_id
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 18

REM test_get_FAC_support_flag
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 19

REM test_get_FAC_segment_size
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 20

REM test_get_FAC_segment_count
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 21

REM test_get_read_margin_level_of_pflash
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 22

REM test_get_QSPI_init_status
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 23

REM test_get_target_version
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 24

REM test_get_external_memory_attributes,if config qspi, this command will show the qspi flash's memory message;if not config, return unknown property
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 25 1 

REM test_get_invalid_property
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 9
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 13
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 30

REM test_set_verify_write_flag;Use "set-property 10 0" to turn off the flag.Use "set-property 10 1" to turn on the flag
blhost -u 0x1fc9,0x01a2 -t 10000 -- set-property 10 1
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 10
blhost -u 0x1fc9,0x01a2 -t 10000 -- set-property 10 0
blhost -u 0x1fc9,0x01a2 -t 10000 -- get-property 10

pause





