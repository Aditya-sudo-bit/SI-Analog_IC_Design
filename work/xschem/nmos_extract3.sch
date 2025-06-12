v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 390 150 430 150 {lab=#net1}
N 390 90 390 150 {lab=#net1}
N 390 90 620 90 {lab=#net1}
N 620 90 620 120 {lab=#net1}
N 470 90 470 120 {lab=#net1}
N 470 180 470 230 {lab=#net2}
N 470 290 620 290 {lab=GND}
N 620 190 620 290 {lab=GND}
N 470 150 550 150 {lab=GND}
N 550 150 550 290 {lab=GND}
N 620 180 620 190 {lab=GND}
N 550 290 550 320 {lab=GND}
C {vsource.sym} 470 260 0 0 {name=Vsb value=1 savecurrent=false}
C {vsource.sym} 620 150 0 0 {name=Vds value=0 savecurrent=false}
C {gnd.sym} 550 320 0 0 {name=l1 lab=GND}
C {simulator_commands_shown.sym} 30 10 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value=".CONTROL

save all
op
write nmos_extract3.raw
set appendwrite
DC Vds 0 1.8 0.05 Vsb 0 0.5 0.1
write nmos_extract3.raw
**
plot sqrt(2*abs(Vds#branch))
plot abs(Vds#branch)

.ENDC
"}
C {devices/code.sym} 180 300 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {sky130_fd_pr/nfet_03v3_nvt.sym} 450 150 0 0 {name=M3
L=0.5
W=1
nf=1 mult=1
model=nfet_03v3_nvt
spiceprefix=X
}
