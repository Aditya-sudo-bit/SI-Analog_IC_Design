v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -320 -30 -230 -30 {lab=vip}
N -320 10 -230 10 {lab=vim}
N -0 -60 -0 -30 {lab=#net1}
N -0 -30 10 -30 {lab=#net1}
N -190 20 -190 30 {lab=GND}
N -190 30 -10 30 {lab=GND}
N -10 30 0 30 {lab=GND}
N 0 10 0 30 {lab=GND}
N 0 10 10 10 {lab=GND}
N -80 -60 0 -60 {lab=#net1}
N -60 -60 -60 -40 {lab=#net1}
N -60 20 -60 30 {lab=GND}
N 50 -60 50 -40 {lab=vop}
N 50 -60 110 -60 {lab=vop}
N 50 20 50 30 {lab=vom}
N 50 30 110 30 {lab=vom}
N -190 -60 -190 -40 {lab=#net2}
N -190 -60 -140 -60 {lab=#net2}
N -60 30 -60 60 {lab=GND}
C {vcvs.sym} -190 -10 0 0 {name=E1 value=1000
}
C {vcvs.sym} 50 -10 0 0 {name=E2 value=1}
C {res.sym} -110 -60 3 0 {name=R1
value=15.9k
footprint=1206
device=resistor
m=1}
C {capa.sym} -60 -10 0 0 {name=C1
m=1
value=10n
footprint=1206
device="ceramic capacitor"}
C {iopin.sym} 110 -60 0 0 {name=p1 lab=vop}
C {iopin.sym} 110 30 0 0 {name=p2 lab=vom}
C {iopin.sym} -320 10 2 0 {name=p3 lab=vim}
C {iopin.sym} -320 -30 2 0 {name=p4 lab=vip}
C {gnd.sym} -60 60 0 0 {name=l1 lab=GND}
