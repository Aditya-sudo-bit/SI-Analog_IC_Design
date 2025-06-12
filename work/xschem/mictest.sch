v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -80 -10 -80 30 {lab=GND}
N -80 -110 -80 -70 {lab=vnmic}
N -80 -110 -30 -110 {lab=vnmic
name = vnmic}
N 30 -110 70 -110 {lab=vn1}
N 130 -110 160 -110 {lab=vn2}
N 250 -300 250 -110 {lab=#net1}
N 250 -300 290 -300 {lab=#net1}
N 250 -220 290 -220 {lab=#net1}
N 350 -300 380 -300 {lab=vout}
N 280 30 280 70 {lab=GND}
N 520 -180 520 -160 {lab=vout}
N 520 -100 520 -70 {lab=GND}
N 460 -300 460 -100 {lab=vout}
N 380 -300 460 -300 {lab=vout}
N 350 -220 460 -220 {lab=vout}
N 460 -180 520 -180 {lab=vout}
N 360 -50 360 -20 {lab=GND}
N 280 -70 280 -30 {lab=vcm}
N 280 -130 300 -130 {lab=vcm}
N 280 -130 280 -70 {lab=vcm}
N 300 -110 300 -70 {lab=#net1}
N 220 -110 300 -110 {lab=#net1}
C {vsource.sym} -80 -40 0 0 {name=Vmic value="0 AC 1" savecurrent=false}
C {res.sym} 0 -110 3 0 {name=R2
value=380
footprint=1206
device=resistor
m=1}
C {capa.sym} 100 -110 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} 190 -110 3 0 {name=R1
value=4.7k
footprint=1206
device=resistor
m=1}
C {gnd.sym} -80 30 0 0 {name=l1 lab=GND}
C {gnd.sym} 360 -20 0 0 {name=l2 lab=GND}
C {res.sym} 320 -220 3 0 {name=R3
value=300k
footprint=1206
device=resistor
m=1}
C {capa.sym} 320 -300 3 0 {name=C2
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} 280 0 0 0 {name=V2 value=1.5 savecurrent=false}
C {gnd.sym} 280 70 0 0 {name=l3 lab=GND}
C {capa.sym} 520 -130 0 0 {name=C3
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 520 -70 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -70 -110 1 0 {name=p1 sig_type=std_logic lab=vnmic}
C {lab_pin.sym} 50 -110 1 0 {name=p2 sig_type=std_logic lab=vn1}
C {lab_pin.sym} 150 -110 1 0 {name=p3 sig_type=std_logic lab=vn2}
C {lab_pin.sym} 500 -180 1 0 {name=p4 sig_type=std_logic lab=vout}
C {lab_pin.sym} 280 -70 0 0 {name=p5 sig_type=std_logic lab=vcm}
C {simulator_commands_shown.sym} -530 -720 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL
op
	save all
	set appendfile
	trans 1n 2u
	ac dec 100 0.1 100k
plot v(vout)
set units=degrees
* Plot gain and phase
plot db(v(vout))
plot phase v(vout)

* Measure maximum gain
	MEAS AC max_gain MAX vdb(vout) FROM=0.1 TO=10e6

* Find -3dB point (from max gain)
	LET vm3db = max_gain - 3
  	MEAS AC fzero WHEN vdb(vout) = vm3db RISE=1
  	MEAS AC fpole WHEN vdb(vout) = vm3db FALL=1
	MEAS AC f_gain WHEN vdb(vout) = max_gain 
	
 
*for phase
	LET phase_deg = cph(vout)
	MEAS  AC phase_initial FIND phase_deg at=fzero
	MEAS  AC phase_initial FIND phase_deg at=fpole
	MEAS  AC phase_gain    FIND phase_deg at=f_gain
WRITE mictest.raw
.ENDC
"}
C {Simple_OpAmp_Model.sym} 220 30 0 0 {name=x1}
