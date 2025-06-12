v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 290 120 330 120 {lab=#net1}
N 290 60 290 120 {lab=#net1}
N 290 60 520 60 {lab=#net1}
N 520 60 520 90 {lab=#net1}
N 370 60 370 90 {lab=#net1}
N 370 150 370 200 {lab=#net2}
N 370 260 520 260 {lab=GND}
N 520 160 520 260 {lab=GND}
N 370 120 450 120 {lab=GND}
N 450 120 450 260 {lab=GND}
N 520 150 520 160 {lab=GND}
N 450 260 450 290 {lab=GND}
C {vsource.sym} 370 230 0 0 {name=Vsb value=1 savecurrent=false}
C {vsource.sym} 520 120 0 0 {name=Vds value=0 savecurrent=false}
C {gnd.sym} 450 290 0 0 {name=l1 lab=GND}
C {simulator_commands_shown.sym} -70 -20 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value=".CONTROL

save all
op
write nmos_extract2.raw
set appendwrite
DC Vds 0 1.8 0.05 Vsb 0 0.5 0.1
write nmos_extract2.raw
**
plot sqrt(2*abs(Vds#branch))
plot abs(Vds#branch)

.ENDC
"}
C {devices/code.sym} 80 270 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {sky130_fd_pr/nfet_01v8.sym} 350 120 0 0 {name=M2
L=0.15
W=1  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
