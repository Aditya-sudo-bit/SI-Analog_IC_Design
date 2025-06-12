v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -190 -0 -80 -0 {lab=vg}
N -190 60 180 60 {lab=GND}
N 180 30 180 60 {lab=GND}
N -40 30 -40 60 {lab=GND}
N -40 -0 -10 -0 {lab=GND}
N -10 -0 -10 40 {lab=GND}
N -40 40 -10 40 {lab=GND}
N -40 60 -40 80 {lab=GND}
N -40 -70 -40 -30 {lab=vd}
N -40 -70 180 -70 {lab=vd}
N 180 -70 180 -30 {lab=vd}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -60 0 0 0 {name=M1
L=0.15
W=1
nf=1 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {vsource.sym} -190 30 0 0 {name=Vgs value=1 savecurrent=false}
C {vsource.sym} 180 0 0 0 {name=Vds value=0 savecurrent=false}
C {gnd.sym} -40 80 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -150 0 1 0 {name=p1 sig_type=std_logic lab=vg}
C {lab_pin.sym} 160 -70 1 0 {name=p2 sig_type=std_logic lab=vd}
C {simulator_commands_shown.sym} -530 -250 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.CONTROL
save all
write appendwrite
DC Vds 0 1.8 0.1 Vgs 0.4 1.0 0.1
write nmos1.raw

plot vds#branch
plot abs(vds#branch)
.ENDC
"}
C {devices/code.sym} -380 80 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
