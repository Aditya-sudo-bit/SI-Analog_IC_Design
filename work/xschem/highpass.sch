v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -120 60 -90 60 {lab=#net1}
N -210 60 -180 60 {lab=vin}
N -210 60 -210 130 {lab=vin}
N -210 190 -210 220 {lab=GND}
N -30 120 -30 140 {lab=vcm}
N -30 200 -30 220 {lab=GND}
N 100 140 100 190 {lab=GND}
N 200 90 310 90 {lab=vout}
N 0 -40 50 -40 {lab=#net2}
N 0 -40 0 60 {lab=#net2}
N 110 -40 250 -40 {lab=vout}
N 250 -40 250 90 {lab=vout}
N 40 60 40 100 {lab=vcm}
N -30 100 40 100 {lab=vcm}
N -30 100 -30 120 {lab=vcm}
N 10 120 40 120 {lab=#net2}
N 10 60 10 120 {lab=#net2}
N -30 60 10 60 {lab=#net2}
C {Simple_OpAmp_Model.sym} -40 220 0 0 {name=x1}
C {vsource.sym} -210 160 0 0 {name=V1 value="0 AC 1" savecurrent=false}
C {res.sym} -60 60 3 0 {name=R1
value=5k
footprint=1206
device=resistor
m=1}
C {capa.sym} -150 60 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -30 170 0 0 {name=V2 value=1.5 savecurrent=false}
C {res.sym} 80 -40 3 0 {name=R2
value=5k
footprint=1206
device=resistor
m=1}
C {gnd.sym} -210 220 0 0 {name=l1 lab=GND}
C {gnd.sym} -30 220 0 0 {name=l2 lab=GND}
C {gnd.sym} 100 190 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 310 90 2 0 {name=p1 sig_type=std_logic lab=vout}
C {lab_pin.sym} -210 60 0 0 {name=p2 sig_type=std_logic lab=vin}
C {lab_pin.sym} -30 120 0 0 {name=p3 sig_type=std_logic lab=vcm}
C {simulator_commands_shown.sym} -790 -570 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.CONTROL
op
	save all
	set appendfile

	tran 1n 2u
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
	MEAS AC f_gain WHEN vdb(vout) = max_gain 
	
 
*for phase
	LET phase_deg = cph(vout)
	MEAS  AC phase_initial FIND phase_deg at=fzero
	
	MEAS  AC phase_gain    FIND phase_deg at=f_gain
WRITE highpass.raw
.ENDC
"}
