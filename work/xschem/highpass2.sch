v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -90 50 -60 50 {lab=#net1}
N -180 50 -150 50 {lab=vin}
N -180 50 -180 120 {lab=vin}
N -180 180 -180 210 {lab=GND}
N 0 110 0 130 {lab=vcm}
N 0 190 0 210 {lab=GND}
N 150 130 150 180 {lab=GND}
N 30 -50 80 -50 {lab=#net2}
N 30 -50 30 50 {lab=#net2}
N 140 -50 280 -50 {lab=vout}
N 280 -50 280 80 {lab=vout}
N 0 50 40 50 {lab=#net2}
N 0 110 80 110 {lab=vcm}
N 40 50 80 50 {lab=#net2}
N 230 80 340 80 {lab=vout}
C {vsource.sym} -180 150 0 0 {name=V1 value="0 AC 1" savecurrent=false}
C {res.sym} -30 50 3 0 {name=R1
value=5k
footprint=1206
device=resistor
m=1}
C {capa.sym} -120 50 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} 0 160 0 0 {name=V2 value=1.5 savecurrent=false}
C {res.sym} 110 -50 3 0 {name=R2
value=5k
footprint=1206
device=resistor
m=1}
C {gnd.sym} -180 210 0 0 {name=l1 lab=GND}
C {gnd.sym} 0 210 0 0 {name=l2 lab=GND}
C {gnd.sym} 150 180 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 340 80 2 0 {name=p1 sig_type=std_logic lab=vout}
C {lab_pin.sym} -180 50 0 0 {name=p2 sig_type=std_logic lab=vin}
C {lab_pin.sym} 0 110 0 0 {name=p3 sig_type=std_logic lab=vcm}
C {buf_Opamp.sym} 30 270 0 0 {name=x1}
C {simulator_commands_shown.sym} -350 -250 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.CONTROL
op
ac dec 100 0.1 10e6
save all
set appendfile
plot vdb(vout)
write highpass2.raw
.ENDC
"}
