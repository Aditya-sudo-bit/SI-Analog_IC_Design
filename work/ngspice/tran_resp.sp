Title: transient experiment : rise, fall, delay, prriod, etc

**RC Networh
R1	vin	vout	1k
C1	vout	GND	1p

*Stimuli
Vsin 	vin	GND	0 PULSE(0 5 1n 1p 1p 10n 20n)

**.MEASURE TRAN v_max MAX v(vout)

**RISE/FALL 10-90%
.MEASURE TRAN tr1090 TRIG v(vout) VAL=0.5 RISE=1 TARG v(vout) VAL=4.5 RISE=1
.MEASURE TRAN tr9010 TRIG v(vout) VAL=4.5 FALL=1 TARG v(vout) VAL=0.5 FALL=1


**RISE/FALL 20-80%
.MEASURE TRAN tr2080 TRIG v(vout) VAL=1.0 RISE=1 TARG v(vout) VAL=4.0 RISE=1
.MEASURE TRAN tr8020 TRIG v(vout) VAL=4.0 FALL=1 TARG v(vout) VAL=1 FALL=1

**DELAY RISE/FALL 
.MEASURE TRAN trrise TRIG v(vin) VAL=2.5 RISE=1 TARG v(vout) VAL=2.5 RISE=1
.MEASURE TRAN trfall TRIG v(vin) VAL=2.5 FALL=1 TARG v(vout) VAL=2.5 FALL=1

**PULSE WIDTH/PERIOD
.MEASURE TRAN pulse TRIG v(vout) VAL=2.5 RISE=1 TARG v(vout) VAL=2.5 RISE=2
.MEASURE TRAN pwidth TRIG v(vout) VAL=2.5 FALL=1 TARG v(vout) VAL=2.5 FALL=1

.CONTROL
	OP
	tran 10p 40n
.ENDC

.GLOBAL GND
