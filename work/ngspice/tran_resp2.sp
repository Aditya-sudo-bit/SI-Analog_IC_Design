Title: transient experiment : rise, fall, delay, prriod, etc
**Parameters
.PARAM vdd_var=3.3
.CSPARAM cs_vdd_var = vdd_var

**RC Networh
R1      vin     vout    1k
C1      vout    GND     1p

*Stimuli
Vsin    vin     GND     0 PULSE(0 vdd_var 1n 1p 1p 10n 20n)

**.MEASURE TRAN v_max MAX v(vout)

**RISE/FALL 10-90%
.MEASURE TRAN tr1090 TRIG v(vout) VAL='0.1*vdd_var' RISE=1 TARG v(vout) VAL='0.9*vdd_var' RISE=1
.MEASURE TRAN tr9010 TRIG v(vout) VAL='0.9*vdd_var' FALL=1 TARG v(vout) VAL='0.1*vdd_var' FALL=1


**RISE/FALL 20-80%
.MEASURE TRAN tr2080 TRIG v(vout) VAL='0.2*vdd_var' RISE=1 TARG v(vout) VAL='0.8*vdd_var' RISE=1
.MEASURE TRAN tr8020 TRIG v(vout) VAL='0.8*vdd_var' FALL=1 TARG v(vout) VAL='0.2*vdd_var' FALL=1

**DELAY RISE/FALL
.MEASURE TRAN trrise TRIG v(vin) VAL='0.5*vdd_var' RISE=1 TARG v(vout) VAL='0.5*vdd_var' RISE=1
.MEASURE TRAN trfall TRIG v(vin) VAL='0.5*vdd_var' FALL=1 TARG v(vout) VAL='0.5*vdd_var' FALL=1

**PULSE WIDTH/PERIOD
.MEASURE TRAN period TRIG v(vout) VAL='0.5*vdd_var' RISE=1 TARG v(vout) VAL='0.5*vdd_var' RISE=2
.MEASURE TRAN pwidth TRIG v(vout) VAL='0.5*vdd_var' RISE=1 TARG v(vout) VAL='0.5*vdd_var' FALL=1

.CONTROL
	OP
	TRAN 10p 40n
	MEAS TRAN tr1090cs TRIG v(vout) VAL='0.1*cs_vdd_var' RISE=1 TARG v(vout) VAL='0.9*cs_vdd_var' RISE=1	
.ENDC

.GLOBAL GND
