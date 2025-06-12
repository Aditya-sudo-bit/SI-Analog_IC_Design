v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 30 -50 30 -30 {lab=vop}
N 30 -50 120 -50 {lab=vop}
N 30 30 30 60 {lab=xxx}
N 30 60 130 60 {lab=xxx}
N -60 -20 -10 -20 {lab=vip}
N -60 20 -10 20 {lab=vim}
C {vcvs.sym} 30 0 0 0 {name=E1 value=1000}
C {iopin.sym} 120 -50 0 0 {name=p1 lab=vop}
C {iopin.sym} 130 60 0 0 {name=p2 lab=vom}
C {iopin.sym} -60 20 2 0 {name=p3 lab=vim}
C {iopin.sym} -60 -20 2 0 {name=p4 lab=vip}
