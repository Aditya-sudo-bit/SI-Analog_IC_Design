v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 410 250 520 250 {lab=vg}
N 410 310 780 310 {lab=GND}
N 780 280 780 310 {lab=GND}
N 560 280 560 310 {lab=GND}
N 560 250 590 250 {lab=GND}
N 590 250 590 290 {lab=GND}
N 560 290 590 290 {lab=GND}
N 560 310 560 330 {lab=GND}
N 560 180 560 220 {lab=vd}
N 560 180 780 180 {lab=vd}
N 780 180 780 220 {lab=vd}
C {vsource.sym} 410 280 0 0 {name=Vgs value=1 savecurrent=false}
C {vsource.sym} 780 250 0 0 {name=Vds value=0 savecurrent=false}
C {gnd.sym} 560 330 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 450 250 1 0 {name=p1 sig_type=std_logic lab=vg}
C {lab_pin.sym} 760 180 1 0 {name=p2 sig_type=std_logic lab=vd}
C {simulator_commands_shown.sym} 70 0 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.CONTROL
save all
write appendwrite
DC Vds 0 1.8 0.1 Vgs 0.4 1.0 0.1
write nmos3.raw

plot vds#branch
plot abs(vds#branch)
.ENDC
"}
C {devices/code.sym} 220 330 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {sky130_fd_pr/nfet_03v3_nvt.sym} 540 250 0 0 {name=M3
L=0.5
W=1
nf=1 mult=1
model=nfet_03v3_nvt
spiceprefix=X
}
