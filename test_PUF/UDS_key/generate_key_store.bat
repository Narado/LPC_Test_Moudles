REM generate activation code into key store
blhost.exe  -u 0x1fc9,0x01a2 -t 1000000 -- key-provisioning enroll

REM generate  UDS; UDS key type = 2, key.bin is hex file with our key that we encrypt  and then decrypt using this example, key size = 32
blhost.exe  -u 0x1fc9,0x01a2 -t 1000000 -- key-provisioning set_user_key 2 key.bin,32



REM upload the key store in to the PC; key_store.bin will contain activation code and UDS key code

blhost.exe  -u 0x1fc9,0x01a2 -t 1000000 -- key-provisioning read_key_store key_store.bin


cmd
