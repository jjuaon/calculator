
U
Command: %s
1870*	planAhead2 
open_checkpoint top_routed.dcpZ12-2866h px� 
L

Starting %s Task
103*constraints2
open_checkpointZ18-103h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.033 . Memory (MB): peak = 345.242 ; gain = 5.320h px� 
D
Loading part %s157*device2
xc7a35tcpg236-1Z21-403h px� 
Z
$Part: %s does not have CEAM library.966*device2
xc7a35tcpg236-1Z21-9227h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0192	
936.5902
0.000Z17-268h px� 
U
-Analyzing %s Unisim elements for replacement
17*netlist2
544Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
T
Netlist was created with %s %s291*project2
Vivado2
2024.1Z1-479h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Read ShapeDB Complete: 2

00:00:002
00:00:00.0062

1029.4452
0.672Z17-268h px� 
L
*Restoring timing data from binary archive.264*timingZ38-478h px� 
F
$Binary timing data restore complete.265*timingZ38-479h px� 
L
*Restoring constraints from binary archive.481*projectZ1-856h px� 
E
#Binary constraint restore complete.478*projectZ1-853h px� 
K
!Start Reading Physical Databases.35885*designutilsZ20-5722h px� 
:
Reading placement.
206*designutilsZ20-206h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Read Netlist Cache: 2

00:00:002
00:00:00.0032

1594.7502
0.000Z17-268h px� 
D
Reading placer database...
1602*designutilsZ20-1892h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Read Device Cache: 2

00:00:002
00:00:00.0072

1594.7502
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Read PlaceDB: 2

00:00:002
00:00:00.1172

1594.7502
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Read PulsedLatchDB: 2

00:00:002

00:00:002

1594.7502
0.000Z17-268h px� 
8
Reading routing.
207*designutilsZ20-207h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Read RouteStorage: 2

00:00:002
00:00:00.0472

1594.7502
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Read Physdb Files: 2

00:00:002
00:00:00.1822

1594.7502
0.000Z17-268h px� 
x
7Restored from archive | CPU: %s secs | Memory: %s MB |
1612*designutils2

0.0000002

0.000000Z20-1924h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Finished XDEF File Restore: 2

00:00:002
00:00:00.2202

1594.7502
8.145Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1594.7502
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
o
'Checkpoint was created with %s build %s378*project2
Vivado v2024.1 (64-bit)2	
5076996Z1-604h px� 
�
�Critical violations of the methodology design rules detected. Critical violations may contribute to timing failures or cause functional issues in hardware. Run report_methodology for more information.10702*	planAheadZ12-23575h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
open_checkpoint: 2

00:00:052

00:00:142

1594.7502

1265.590Z17-268h px� 
Q
Command: %s
53*	vivadotcl2 
write_bitstream -force top.bitZ4-113h px� 

@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
Implementation2	
xc7a35tZ17-347h px� 
o
0Got license for feature '%s' and/or device '%s'
310*common2
Implementation2	
xc7a35tZ17-349h px� 
f
,Running DRC as a precondition to command %s
1349*	planAhead2
write_bitstreamZ12-1349h px� 
>
Refreshing IP repositories
234*coregenZ19-234h px� 
G
"No user IP repositories specified
1154*coregenZ19-1704h px� 
j
"Loaded Vivado IP repository '%s'.
1332*coregen2!
C:/Xilinx/Vivado/2024.1/data/ipZ19-2313h px� 
>
Running DRC with %s threads
24*drc2
2Z23-27h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2B
 ">
basic_calc_inst/decoder_out0	basic_calc_inst/decoder_out02L
 "H
$basic_calc_inst/decoder_out0/A[29:0]basic_calc_inst/decoder_out0/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E18ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2B
 ">
basic_calc_inst/decoder_out0	basic_calc_inst/decoder_out02L
 "H
$basic_calc_inst/decoder_out0/B[17:0]basic_calc_inst/decoder_out0/B2+
 %DRC|Netlist|Instance|Pipeline|DSP48E18ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2:
 "6
sci_calc_inst/trig_calc3	sci_calc_inst/trig_calc32D
 "@
 sci_calc_inst/trig_calc3/A[29:0]sci_calc_inst/trig_calc3/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E18ZDPIP-1h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2B
 ">
basic_calc_inst/decoder_out0	basic_calc_inst/decoder_out02L
 "H
$basic_calc_inst/decoder_out0/P[47:0]basic_calc_inst/decoder_out0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E18ZDPOP-1h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC28
 "4
basic_calc_inst/result0	basic_calc_inst/result02B
 ">
basic_calc_inst/result0/P[47:0]basic_calc_inst/result0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E18ZDPOP-1h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2>
 ":
basic_calc_inst/result0__0	basic_calc_inst/result0__02H
 "D
"basic_calc_inst/result0__0/P[47:0]basic_calc_inst/result0__0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E18ZDPOP-1h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2>
 ":
basic_calc_inst/result0__1	basic_calc_inst/result0__12H
 "D
"basic_calc_inst/result0__1/P[47:0]basic_calc_inst/result0__1/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E18ZDPOP-1h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2:
 "6
sci_calc_inst/trig_calc3	sci_calc_inst/trig_calc32D
 "@
 sci_calc_inst/trig_calc3/P[47:0]sci_calc_inst/trig_calc3/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E18ZDPOP-1h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2B
 ">
basic_calc_inst/decoder_out0	basic_calc_inst/decoder_out02L
 "H
$basic_calc_inst/decoder_out0/P[47:0]basic_calc_inst/decoder_out0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E18ZDPOP-2h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC28
 "4
basic_calc_inst/result0	basic_calc_inst/result02B
 ">
basic_calc_inst/result0/P[47:0]basic_calc_inst/result0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E18ZDPOP-2h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2>
 ":
basic_calc_inst/result0__0	basic_calc_inst/result0__02H
 "D
"basic_calc_inst/result0__0/P[47:0]basic_calc_inst/result0__0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E18ZDPOP-2h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2>
 ":
basic_calc_inst/result0__1	basic_calc_inst/result0__12H
 "D
"basic_calc_inst/result0__1/P[47:0]basic_calc_inst/result0__1/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E18ZDPOP-2h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2:
 "6
sci_calc_inst/trig_calc3	sci_calc_inst/trig_calc32D
 "@
 sci_calc_inst/trig_calc3/P[47:0]sci_calc_inst/trig_calc3/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E18ZDPOP-2h px� 
�
�Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2�
 "�
>age_calc_inst/display_age/bcd_unit_inst/Unit_reg[3]_i_2__0_n_0>age_calc_inst/display_age/bcd_unit_inst/Unit_reg[3]_i_2__0_n_02�
 "~
<age_calc_inst/display_age/bcd_unit_inst/Unit_reg[3]_i_2__0/O<age_calc_inst/display_age/bcd_unit_inst/Unit_reg[3]_i_2__0/O2~
 "z
:age_calc_inst/display_age/bcd_unit_inst/Unit_reg[3]_i_2__0	:age_calc_inst/display_age/bcd_unit_inst/Unit_reg[3]_i_2__02+
 %DRC|Physical Configuration|Chip Level8ZPDRC-153h px� 
�
�Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2�
 "�
>basic_calc_inst/display_calc/bcd_unit_inst/Unit_reg[3]_i_2_n_0>basic_calc_inst/display_calc/bcd_unit_inst/Unit_reg[3]_i_2_n_02�
 "~
<basic_calc_inst/display_calc/bcd_unit_inst/Unit_reg[3]_i_2/O<basic_calc_inst/display_calc/bcd_unit_inst/Unit_reg[3]_i_2/O2~
 "z
:basic_calc_inst/display_calc/bcd_unit_inst/Unit_reg[3]_i_2	:basic_calc_inst/display_calc/bcd_unit_inst/Unit_reg[3]_i_22+
 %DRC|Physical Configuration|Chip Level8ZPDRC-153h px� 
�
�Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2
 "

gen_rr/CLK
gen_rr/CLK2H
 "D
gen_rr/refresh_counter[1]_i_2/Ogen_rr/refresh_counter[1]_i_2/O2D
 "@
gen_rr/refresh_counter[1]_i_2	gen_rr/refresh_counter[1]_i_22+
 %DRC|Physical Configuration|Chip Level8ZPDRC-153h px� 
�
�Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 2 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2D
 "@
gen_rr/refresh_counter[1]_i_2	gen_rr/refresh_counter[1]_i_22�
 "p
5logic_calc_inst/result_display/refresh_counter_reg[0]	5logic_calc_inst/result_display/refresh_counter_reg[0]"p
5logic_calc_inst/result_display/refresh_counter_reg[1]	5logic_calc_inst/result_display/refresh_counter_reg[1]2/
 )DRC|Implementation|Placement|DesignChecks8ZPLHOLDVIO-2h px� 
U
DRC finished with %s
1905*	planAhead2
0 Errors, 17 WarningsZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
W
)Running write_bitstream with %s threads.
1750*designutils2
2Z20-2272h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
H
Writing bitstream %s...
11*	bitstream2
	./top.bitZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
�
�WebTalk data collection is mandatory when using a ULT device. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.698*projectZ1-1876h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
242
182
02
0Z4-41h px� 
O
%s completed successfully
29*	vivadotcl2
write_bitstreamZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
write_bitstream: 2

00:00:042

00:00:072

2101.6952	
506.945Z17-268h px� 


End Record