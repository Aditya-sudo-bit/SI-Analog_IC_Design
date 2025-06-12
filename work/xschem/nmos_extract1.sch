v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -90 0 -50 0 {lab=#net1}
N -90 -60 -90 0 {lab=#net1}
N -90 -60 140 -60 {lab=#net1}
N 140 -60 140 -30 {lab=#net1}
N -10 -60 -10 -30 {lab=#net1}
N -10 30 -10 80 {lab=#net2}
N -10 140 140 140 {lab=GND}
N 140 40 140 140 {lab=GND}
N -10 -0 70 -0 {lab=GND}
N 70 -0 70 140 {lab=GND}
N 140 30 140 40 {lab=GND}
N 70 140 70 170 {lab=GND}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -30 0 0 0 {name=M1
L=1
W=4
nf=1 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {vsource.sym} -10 110 0 0 {name=Vsb value=1 savecurrent=false}
C {vsource.sym} 140 0 0 0 {name=Vds value=0 savecurrent=false}
C {gnd.sym} 70 170 0 0 {name=l1 lab=GND}
C {simulator_commands_shown.sym} -460 -160 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value=".CONTROL

save all
op
write nmos_extract1.raw
set appendwrite
DC Vds 0 1.8 0.05 Vsb 0 0.5 0.1
write nmos_extract1.raw
plot log(abs(vds#branch))
**
plot sqrt(2*abs(Vds#branch))
plot abs(Vds#branch)

.ENDC
"}
C {devices/code.sym} -300 150 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
