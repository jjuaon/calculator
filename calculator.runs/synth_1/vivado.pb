
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:022

00:00:062	
530.6642	
198.406Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/utils_1/imports/synth_1/seven_seg_display.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2f
dC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/utils_1/imports/synth_1/seven_seg_display.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
^
Command: %s
53*	vivadotcl2-
+synth_design -top top -part xc7a35tcpg236-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7a35tZ17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7a35tZ17-349h px� 
D
Loading part %s157*device2
xc7a35tcpg236-1Z21-403h px� 
Z
$Part: %s does not have CEAM library.966*device2
xc7a35tcpg236-1Z21-9227h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
82520Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:03 . Memory (MB): peak = 1383.465 ; gain = 448.496
h px� 
�
synthesizing module '%s'%s4497*oasys2
top2
 2N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/top.v2
28@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
SegRefreshRate2
 2V
RC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/refreshrate.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
SegRefreshRate2
 2
02
12V
RC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/refreshrate.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
main2
 2X
TC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/mode_selector.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
main2
 2
02
12X
TC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/mode_selector.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
BasicCalculator2
 2O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/CALC.v2
268@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
button_debounce_calc2
 2O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/CALC.v2
48@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
button_debounce_calc2
 2
02
12O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/CALC.v2
48@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

displayDec2
 2R
NC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/display.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

BCD_UNIT2
 2S
OC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/BCD_UNIT.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

BCD_UNIT2
 2
02
12S
OC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/BCD_UNIT.v2
38@Z8-6155h px� 
�
8referenced signal '%s' should be on the sensitivity list567*oasys2
sign2R
NC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/display.v2
608@Z8-567h px� 
�
8referenced signal '%s' should be on the sensitivity list567*oasys2
Unit2R
NC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/display.v2
608@Z8-567h px� 
�
8referenced signal '%s' should be on the sensitivity list567*oasys2

bDot_BCD2R
NC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/display.v2
608@Z8-567h px� 
�
8referenced signal '%s' should be on the sensitivity list567*oasys2

aDot_BCD2R
NC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/display.v2
608@Z8-567h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

displayDec2
 2
02
12R
NC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/display.v2
38@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
led2

displayDec2
display_calc2O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/CALC.v2
838@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
display_calc2

displayDec2
112
102O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/CALC.v2
838@Z8-7023h px� 
�
-case statement is not full and has no default155*oasys2O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/CALC.v2
1708@Z8-155h px� 
�
default block is never used226*oasys2O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/CALC.v2
3578@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
BasicCalculator2
 2
02
12O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/CALC.v2
268@Z8-6155h px� 
�
9port '%s' of module '%s' is unconnected for instance '%s'4818*oasys2
sign2
BasicCalculator2
basic_calc_inst2N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/top.v2
1358@Z8-7071h px� 
�
Kinstance '%s' of module '%s' has %s connections declared, but only %s given4757*oasys2
basic_calc_inst2
BasicCalculator2
152
142N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/top.v2
1358@Z8-7023h px� 
�
synthesizing module '%s'%s4497*oasys2
Logi2
 2O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/Logi.v2
228@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
button_debounce2
 2O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/Logi.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
button_debounce2
 2
02
12O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/Logi.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

displayBin2
 2U
QC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/displayBin.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

displayBin2
 2
02
12U
QC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/displayBin.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Logi2
 2
02
12O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/Logi.v2
228@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
AgeCalculator2
 2N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/AGE.v2
268@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
button_debounce_age2
 2N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/AGE.v2
48@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
button_debounce_age2
 2
02
12N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/AGE.v2
48@Z8-6155h px� 
�
-case statement is not full and has no default155*oasys2N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/AGE.v2
1748@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
AgeCalculator2
 2
02
12N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/AGE.v2
268@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Sci2
 2N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/sci.v2
258@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
button_debounce_sci2
 2N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/sci.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
button_debounce_sci2
 2
02
12N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/sci.v2
38@Z8-6155h px� 
�
-case statement is not full and has no default155*oasys2N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/sci.v2
1688@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Sci2
 2
02
12N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/sci.v2
258@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
top2
 2
02
12N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/top.v2
28@Z8-6155h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2

debounce2

displayDec2R
NC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/display.v2
228@Z8-3848h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2

bin2_reg2O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/Logi.v2
1238@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
calculated_age_reg2N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/AGE.v2
1478@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
btnC_prev_reg2N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/top.v2
548@Z8-6014h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2

seg_disp2
top2N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/top.v2
198@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
dpFlag2
top2N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/top.v2
188@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2	
an_disp2
top2N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/top.v2
208@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2	
dp_disp2
top2N
JC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/top.v2
218@Z8-3848h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
dpFlag2

displayDecZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
clk2

displayBinZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
btnL2

displayBinZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
btnR2

displayBinZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:05 . Memory (MB): peak = 1526.840 ; gain = 591.871
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:02 ; elapsed = 00:00:05 . Memory (MB): peak = 1526.840 ; gain = 591.871
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:02 ; elapsed = 00:00:05 . Memory (MB): peak = 1526.840 ; gain = 591.871
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0352

1526.8402
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2
sw[0]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
128@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
128@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[0]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
138@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
138@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[1]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
148@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
148@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[1]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
158@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
158@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[2]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
168@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
168@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[2]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
178@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
178@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[3]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
188@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
188@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[3]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
198@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
198@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[4]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
208@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
208@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[4]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
218@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
218@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[5]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
228@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
228@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[5]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
238@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
238@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[6]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
248@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
248@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[6]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
258@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
258@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[7]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
268@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
268@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[7]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
278@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
278@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[8]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
288@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
288@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[8]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
298@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
298@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[9]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
308@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
308@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[9]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
318@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
318@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[10]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
328@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
328@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[10]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
338@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
338@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[11]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
348@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
348@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[11]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
358@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
358@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[12]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
368@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
368@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[12]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
378@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
378@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[13]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
388@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
388@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[13]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
398@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
398@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[14]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
408@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
408@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[14]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
418@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
418@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[15]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
428@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
428@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
sw[15]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
438@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
438@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[0]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1268@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1268@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[0]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1278@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1278@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[1]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1298@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1298@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[1]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1308@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1308@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[2]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1328@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1328@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[2]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1338@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1338@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[3]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1358@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1358@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[3]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1368@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1368@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[4]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1388@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1388@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[4]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1398@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1398@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[5]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1418@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1418@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[5]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1428@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1428@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[6]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1448@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1448@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[6]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1458@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1458@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[7]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1478@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1478@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JA[7]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1488@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1488@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[0]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1548@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1548@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[0]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1558@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1558@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[1]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1578@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1578@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[1]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1588@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1588@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[2]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1608@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1608@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[2]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1618@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1618@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[3]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1638@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1638@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[3]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1648@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1648@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[4]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1668@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1668@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[4]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1678@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1678@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[5]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1698@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1698@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[5]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1708@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1708@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[6]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1728@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1728@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[6]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1738@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1738@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[7]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1758@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1758@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JB[7]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1768@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1768@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[0]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1828@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1828@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[0]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1838@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1838@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[1]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1858@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1858@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[1]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1868@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1868@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[2]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1888@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1888@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[2]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1898@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1898@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[3]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1918@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1918@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[3]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1928@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1928@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[4]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1948@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1948@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[4]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1958@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1958@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[5]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1978@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1978@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[5]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1988@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
1988@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[6]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2008@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2008@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[6]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2018@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2018@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[7]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2038@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2038@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
JC[7]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2048@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2048@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[0]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2098@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2098@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[0]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2108@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2108@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[1]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2128@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2128@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[1]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2138@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2138@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[2]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2158@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2158@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[2]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2168@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2168@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[3]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2188@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2188@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[3]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2198@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2198@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[4]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2218@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2218@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[4]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2228@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2228@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[5]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2248@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2248@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[5]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2258@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2258@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[6]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2278@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2278@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[6]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2288@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2288@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[7]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2308@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2308@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

JXADC[7]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2318@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2318@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	vgaRed[0]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2368@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2368@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	vgaRed[0]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2378@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2378@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	vgaRed[1]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2388@Z12-584h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2388@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	vgaRed[1]2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2398@Z12-584h px�
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Vivado 12-5842
1002q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2398@Z17-14h px�
�
"'%s' expects at least one object.
55*common2
set_property2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
2398@Z17-55h px�
�
Finished Parsing XDC File [%s]
178*designutils2q
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2o
mC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/constrs_1/imports/calculator/basys_calculator_proj.xdc2
.Xil/top_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1627.1722
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0092

1627.1722
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:04 ; elapsed = 00:00:11 . Memory (MB): peak = 1627.172 ; gain = 692.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7a35tcpg236-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:04 ; elapsed = 00:00:11 . Memory (MB): peak = 1627.172 ; gain = 692.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:04 ; elapsed = 00:00:11 . Memory (MB): peak = 1627.172 ; gain = 692.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
{
3inferred FSM for state register '%s' in module '%s'802*oasys2
current_state_reg2
BasicCalculatorZ8-802h px� 
p
3inferred FSM for state register '%s' in module '%s'802*oasys2
current_state_reg2
LogiZ8-802h px� 
y
3inferred FSM for state register '%s' in module '%s'802*oasys2
current_state_reg2
AgeCalculatorZ8-802h px� 
o
3inferred FSM for state register '%s' in module '%s'802*oasys2
current_state_reg2
SciZ8-802h px� 
�
!inferring latch for variable '%s'327*oasys2

Unit_reg2S
OC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/BCD_UNIT.v2
618@Z8-327h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_        STATE_INPUT_NUM1 |                            00001 |                              000
h p
x
� 
y
%s
*synth2a
_          STATE_INPUT_OP |                            00010 |                              001
h p
x
� 
y
%s
*synth2a
_        STATE_INPUT_NUM2 |                            00100 |                              010
h p
x
� 
y
%s
*synth2a
_         STATE_CALCULATE |                            01000 |                              011
h p
x
� 
y
%s
*synth2a
_           STATE_DISPLAY |                            10000 |                              100
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
current_state_reg2	
one-hot2
BasicCalculatorZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_            STATE_INPUT1 |                               00 |                               00
h p
x
� 
y
%s
*synth2a
_          STATE_INPUT_OP |                               01 |                               01
h p
x
� 
y
%s
*synth2a
_            STATE_INPUT2 |                               10 |                               10
h p
x
� 
y
%s
*synth2a
_           STATE_DISPLAY |                               11 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
current_state_reg2

sequential2
LogiZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_             STATE_INPUT |                              001 |                               00
h p
x
� 
y
%s
*synth2a
_         STATE_CALCULATE |                              010 |                               01
h p
x
� 
y
%s
*synth2a
_           STATE_DISPLAY |                              100 |                               10
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
current_state_reg2	
one-hot2
AgeCalculatorZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_          STATE_FUNC_SEL |                              001 |                               00
h p
x
� 
y
%s
*synth2a
_             STATE_INPUT |                              010 |                               01
h p
x
� 
y
%s
*synth2a
_            STATE_RESULT |                              100 |                               10
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
current_state_reg2	
one-hot2
SciZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:13 . Memory (MB): peak = 1627.172 ; gain = 692.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   29 Bit       Adders := 3     
h p
x
� 
F
%s
*synth2.
,	   3 Input   29 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   28 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input   16 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 302   
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit       Adders := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit       Adders := 18    
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input      4 Bit         XORs := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               48 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               29 Bit    Registers := 7     
h p
x
� 
H
%s
*synth20
.	               28 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               18 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               13 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                7 Bit    Registers := 7     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 23    
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 13    
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 86    
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   4 Input   29 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   29 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   5 Input   29 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   3 Input   29 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 9     
h p
x
� 
F
%s
*synth2.
,	   4 Input   16 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   3 Input   16 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   3 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   7 Input    7 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   4 Input    7 Bit        Muxes := 6     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   8 Input    7 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   6 Input    7 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   3 Input    7 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    4 Bit        Muxes := 15    
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 336   
h p
x
� 
F
%s
*synth2.
,	   5 Input    4 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   3 Input    4 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   6 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 15    
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 21    
h p
x
� 
F
%s
*synth2.
,	   5 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 83    
h p
x
� 
F
%s
*synth2.
,	   7 Input    1 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   6 Input    1 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 9     
h p
x
� 
F
%s
*synth2.
,	   5 Input    1 Bit        Muxes := 18    
h p
x
� 
F
%s
*synth2.
,	   3 Input    1 Bit        Muxes := 16    
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
p
%s
*synth2X
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2
decoder_out_reg2
482
122O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/CALC.v2
2008@Z8-3936h px� 
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2
decoder_out_reg2
482
172O
KC:/Users/sosolitary/.Xilinx/calculator/calculator.srcs/sources_1/new/CALC.v2
2008@Z8-3936h px� 
[
%s
*synth2C
ADSP Report: Generating DSP decoder_out0, operation Mode is: A*B.
h p
x
� 
_
%s
*synth2G
EDSP Report: operator decoder_out0 is absorbed into DSP decoder_out0.
h p
x
� 
_
%s
*synth2G
EDSP Report: operator decoder_out0 is absorbed into DSP decoder_out0.
h p
x
� 
X
%s
*synth2@
>DSP Report: Generating DSP result0, operation Mode is: A2*B2.
h p
x
� 
V
%s
*synth2>
<DSP Report: register num1_reg is absorbed into DSP result0.
h p
x
� 
U
%s
*synth2=
;DSP Report: register result0 is absorbed into DSP result0.
h p
x
� 
U
%s
*synth2=
;DSP Report: operator result0 is absorbed into DSP result0.
h p
x
� 
U
%s
*synth2=
;DSP Report: operator result0 is absorbed into DSP result0.
h p
x
� 
X
%s
*synth2@
>DSP Report: Generating DSP result0, operation Mode is: A2*B2.
h p
x
� 
U
%s
*synth2=
;DSP Report: register result0 is absorbed into DSP result0.
h p
x
� 
U
%s
*synth2=
;DSP Report: register result0 is absorbed into DSP result0.
h p
x
� 
U
%s
*synth2=
;DSP Report: operator result0 is absorbed into DSP result0.
h p
x
� 
U
%s
*synth2=
;DSP Report: operator result0 is absorbed into DSP result0.
h p
x
� 
c
%s
*synth2K
IDSP Report: Generating DSP result0, operation Mode is: (PCIN>>17)+A2*B2.
h p
x
� 
V
%s
*synth2>
<DSP Report: register num2_reg is absorbed into DSP result0.
h p
x
� 
U
%s
*synth2=
;DSP Report: register result0 is absorbed into DSP result0.
h p
x
� 
U
%s
*synth2=
;DSP Report: operator result0 is absorbed into DSP result0.
h p
x
� 
U
%s
*synth2=
;DSP Report: operator result0 is absorbed into DSP result0.
h p
x
� 
a
%s
*synth2I
GDSP Report: Generating DSP trig_calc3, operation Mode is: A*(B:0x13a).
h p
x
� 
[
%s
*synth2C
ADSP Report: operator trig_calc3 is absorbed into DSP trig_calc3.
h p
x
� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
dpFlag2

displayDecZ8-7129h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:11 ; elapsed = 00:00:36 . Memory (MB): peak = 1627.172 ; gain = 692.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
U
%s
*synth2=
; Sort Area is  result0_2 : 0 0 : 2737 3855 : Used 1 time 0
h p
x
� 
U
%s
*synth2=
; Sort Area is  result0_2 : 0 1 : 1118 3855 : Used 1 time 0
h p
x
� 
Z
%s
*synth2B
@ Sort Area is  decoder_out0_0 : 0 0 : 2588 2588 : Used 1 time 0
h p
x
� 
U
%s
*synth2=
; Sort Area is  result0_5 : 0 0 : 1879 1879 : Used 1 time 0
h p
x
� 
V
%s
*synth2>
< Sort Area is  trig_calc3_7 : 0 0 : 434 434 : Used 1 time 0
h p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
v
%s*synth2^
\
DSP: Preliminary Mapping Report (see note below. The ' indicates corresponding REG is set)
h px� 
�
%s*synth2�
�+----------------+------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h px� 
�
%s*synth2�
�|Module Name     | DSP Mapping      | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
h px� 
�
%s*synth2�
�+----------------+------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h px� 
�
%s*synth2�
�|BasicCalculator | A*B              | 18     | 17     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|BasicCalculator | A2*B2            | 18     | 13     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|BasicCalculator | A2*B2            | 18     | 18     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|BasicCalculator | (PCIN>>17)+A2*B2 | 12     | 12     | -      | -      | 12     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|Sci             | A*(B:0x13a)      | 16     | 9      | -      | -      | 25     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�+----------------+------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

h px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the DSPs inferred at the current stage of the synthesis flow. Some DSP may be reimplemented as non DSP primitives later in the synthesis flow. Multiple instantiated DSPs are reported only once.
h px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:14 ; elapsed = 00:00:42 . Memory (MB): peak = 1627.172 ; gain = 692.203
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:15 ; elapsed = 00:00:47 . Memory (MB): peak = 1639.520 ; gain = 704.551
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:16 ; elapsed = 00:00:49 . Memory (MB): peak = 1777.762 ; gain = 842.793
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:17 ; elapsed = 00:00:52 . Memory (MB): peak = 1792.504 ; gain = 857.535
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:17 ; elapsed = 00:00:52 . Memory (MB): peak = 1792.504 ; gain = 857.535
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:17 ; elapsed = 00:00:52 . Memory (MB): peak = 1792.504 ; gain = 857.535
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:17 ; elapsed = 00:00:52 . Memory (MB): peak = 1792.504 ; gain = 857.535
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:17 ; elapsed = 00:00:52 . Memory (MB): peak = 1792.504 ; gain = 857.535
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:17 ; elapsed = 00:00:52 . Memory (MB): peak = 1792.504 ; gain = 857.535
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
W
%s
*synth2?
=
DSP Final Report (the ' indicates corresponding REG is set)
h p
x
� 
�
%s
*synth2�
�+----------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h p
x
� 
�
%s
*synth2�
�|Module Name     | DSP Mapping    | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
h p
x
� 
�
%s
*synth2�
�+----------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h p
x
� 
�
%s
*synth2�
�|BasicCalculator | A*B            | 17     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|BasicCalculator | A'*B'          | 17     | 12     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|BasicCalculator | A'*B'          | 17     | 17     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|BasicCalculator | PCIN>>17+A'*B' | 12     | 12     | -      | -      | 12     | 1    | 1    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�|Sci             | A*B            | 16     | 9      | -      | -      | 25     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
�+----------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
3
%s*synth2
+------+--------+------+
h px� 
3
%s*synth2
|      |Cell    |Count |
h px� 
3
%s*synth2
+------+--------+------+
h px� 
3
%s*synth2
|1     |BUFG    |     2|
h px� 
3
%s*synth2
|2     |CARRY4  |   521|
h px� 
3
%s*synth2
|3     |DSP48E1 |     5|
h px� 
3
%s*synth2
|5     |LUT1    |   126|
h px� 
3
%s*synth2
|6     |LUT2    |   425|
h px� 
3
%s*synth2
|7     |LUT3    |  1062|
h px� 
3
%s*synth2
|8     |LUT4    |   241|
h px� 
3
%s*synth2
|9     |LUT5    |   301|
h px� 
3
%s*synth2
|10    |LUT6    |   806|
h px� 
3
%s*synth2
|11    |MUXF7   |    19|
h px� 
3
%s*synth2
|12    |MUXF8   |     1|
h px� 
3
%s*synth2
|13    |FDRE    |   976|
h px� 
3
%s*synth2
|14    |FDSE    |    12|
h px� 
3
%s*synth2
|15    |LD      |     8|
h px� 
3
%s*synth2
|16    |IBUF    |     6|
h px� 
3
%s*synth2
|17    |OBUF    |    28|
h px� 
3
%s*synth2
+------+--------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:17 ; elapsed = 00:00:52 . Memory (MB): peak = 1792.504 ; gain = 857.535
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 5 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:14 ; elapsed = 00:00:51 . Memory (MB): peak = 1792.504 ; gain = 757.203
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:17 ; elapsed = 00:00:52 . Memory (MB): peak = 1792.504 ; gain = 857.535
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0322

1792.5042
0.000Z17-268h px� 
U
-Analyzing %s Unisim elements for replacement
17*netlist2
554Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1792.5042
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2G
E  A total of 8 instances were transformed.
  LD => LDCE: 8 instances
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

3e040ea5Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
632
1252
1002
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:192

00:00:572

1792.5042

1257.477Z17-268h px� 
c
%s6*runtcl2G
ESynthesis results are not added to the cache due to CRITICAL_WARNING
h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0062

1792.5042
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2H
FC:/Users/sosolitary/.Xilinx/calculator/calculator.runs/synth_1/top.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2Q
Oreport_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Mon Dec  9 06:25:10 2024Z17-206h px� 


End Record