#!/usr/bin/perl
#/****************************************************************************/
#/*                      Copyright (c) 2007, Freescale.                      */
#/*                    Freescale Confidential Proprietary                    */
#/****************************************************************************/

###############################################################################
#                                                                             #
#  FILE NAME: bin2hex.pl                                                      #
#                                                                             #
#  PURPOSE:  convert image .bin file to .hex file                             #
#            which can be loaded by memory device(denali or non_denali format)#
#                                                                             #
#  ARGUMENTS:                                                      #
#                                                                             #
#  AUTHOR:         Joey Zhou                                                  #
#  AOUTOR'S EMAIL: Joey.zhou@freescale.com                                    #
#                                                                             #
#                                                                             #
###############################################################################
# Version  Date      Note                                                     #
#-----------------------------------------------------------------------------#
# 1.0      14-Apr-08 Created for Boot Verification                            #
#                                                                             #
###############################################################################

print "Welcome to Script for converting bin to hex for boot!\n";

if(@ARGV < 2)
{
	 print "====================================  USAGE   ===================================================\n";
     print "Please Set Proper Parameter as follows:\n";
     print "./bin2hex.pl input_file output_file format [offset] [swap_start, swap_end]\n";
	 print " [swap_start, swap_end] - valid if format = addr_dw1_swap only, and offset must be provisoned even zeor\n";
	 print "if 'format' == denali, the output_file can be loded by denali memory model.\n";
	 print "if 'format' == verilog_dw4, the output_file can be loded by common memory device with 4-bytes width.\n";
	 print "if 'format' == weim, the output_file can be loded by 16-bit NOR flash model.\n";
	 print "if 'format' == addr_dw1, the output_file with the format \"\@addr byte0 byte1 byte2 bytes3\"\n";
	 print "if 'format' == addr_dw1_swap, the output_file with the format \"\@addr byte1 byte0 byte3 bytes2\"\n";
	 print "if 'format' == addr_dw2, the output_file with the format \"\@addr half_word1 half_word2\"\n";
	 print "if 'format' == addr_dw4, the output_file with the format \"\@addr data1 data2\"\n";
	 print "if 'format' not specified, the output_file can be loded by common memory device with 1-byte width.\n";
	 print "\n";
	 print "'offset' will be added to the \"\@addr if provisioned, valid if 'format' == addr_dw4";
	 print "=================================================================================================\n";
    exit(1);
}

($in,  $out , $format, $offset, $swap_start, $swap_end) = @ARGV;
die "Missing input file name.\n" unless $in;
die "Missing output file name.\n" unless $out;
$byteCount = 0;
open(IN, "< $in");
binmode(IN);
open(OUT, "> bin2hex.tmp");
while (read(IN,$b,32)) {
   $n = length($b);
   $byteCount += $n;
   $s = 2*$n;
   print (OUT unpack("H$s", $b), "\n");
}
close(IN);
close(OUT);
print "Number of bytes converted = $byteCount\n";

open(IN, "< bin2hex.tmp");
open(OUT, "> $out");

while (<IN>) {
   chomp;
   
   $temp = $_;  
   $i = 0;

   while ( $i<64 ) {
	$b0 = substr($temp,$i,2);
	$b1 = substr($temp,$i+2,2);
	$b2 = substr($temp,$i+4,2);
	$b3 = substr($temp,$i+6,2);
	$b4 = substr($temp,$i+8,2);
	$b5 = substr($temp,$i+10,2);
	$b6 = substr($temp,$i+12,2);
	$b7 = substr($temp,$i+14,2);
        $b8 = substr($temp,$i+16,2);
	$b9 = substr($temp,$i+18,2);
	$b10 = substr($temp,$i+20,2);
	$b11 = substr($temp,$i+22,2);
	$b12 = substr($temp,$i+24,2);
	$b13 = substr($temp,$i+26,2);
	$b14 = substr($temp,$i+28,2);
	$b15 = substr($temp,$i+30,2);
    
	print OUT "0x$b0,0x$b1,0x$b2,0x$b3,0x$b4,0x$b5,0x$b6,0x$b7,0x$b8,0x$b9,0x$b10,0x$b11,0x$b12,0x$b13,0x$b14,0x$b15,\n";              

         $i = $i+32;

   }
}
   
close(IN);
close(OUT);
print "Converting finished\n";
exit;
