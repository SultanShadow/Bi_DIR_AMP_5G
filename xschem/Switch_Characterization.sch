v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 170 -340 230 -340 { lab=#net1}
N -20 -260 -20 -240 { lab=GND}
N -20 -340 -20 -320 { lab=Vin}
N -20 -340 0 -340 { lab=Vin}
N 240 -340 310 -340 { lab=#net1}
N 230 -340 240 -340 { lab=#net1}
N 340 -440 340 -380 { lab=Vg}
N 340 -490 340 -440 { lab=Vg}
N 310 -490 340 -490 { lab=Vg}
N 210 -490 250 -490 { lab=GND}
N 210 -490 210 -460 { lab=GND}
N 340 -340 340 -320 { lab=GND}
N 370 -340 480 -340 { lab=VL}
N 270 -340 270 -270 { lab=#net1}
N 80 -180 120 -180 { lab=GND}
N 80 -180 80 -150 { lab=GND}
N 180 -240 180 -180 { lab=Vg2}
N 180 -240 230 -240 { lab=Vg2}
N 270 -240 300 -240 { lab=GND}
N -0 -340 70 -340 { lab=Vin}
N 130 -340 170 -340 { lab=#net1}
N 180 -420 180 -400 { lab=#net2}
N 180 -490 180 -480 { lab=GND}
N 180 -490 210 -490 { lab=GND}
N 480 -340 540 -340 { lab=VL}
C {xschem_sky130/sky130_fd_pr/nfet_01v8_lvt.sym} 340 -360 3 1 {name=M11
L=0.15
W=6
nf=1
mult=25
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {devices/gnd.sym} 340 -320 0 0 {name=l37 lab=GND}
C {devices/code.sym} -30 -600 0 0 {name=TT_MODELS
spice_ignore=false
only_toplevel=true
format="tcleval( @value )"
value="
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt
"}
C {devices/code_shown.sym} 650 -690 0 0 {name=SPICE spice_ignore=false only_toplevel=true value="

.control
	ac dec 80 500M 10G
	let TransferFunction= db(v(vl)/v(vin))
	plot TransferFunction
	WRDATA SwitchTF.csv TransferFunction

.endc
"}
C {devices/vsource.sym} -20 -290 0 0 {name=V1 value="0 AC 1m"}
C {devices/gnd.sym} -20 -240 0 0 {name=l1 lab=GND}
C {devices/lab_wire.sym} -20 -340 0 0 {name=l2 sig_type=std_logic lab=Vin}
C {devices/lab_wire.sym} 510 -340 0 0 {name=l4 sig_type=std_logic lab=VL
}
C {devices/res.sym} 540 -250 0 0 {name=R2
value=50
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 540 -220 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 540 -310 0 0 {name=V2 value=0}
C {devices/vsource.sym} 280 -490 1 0 {name=V3 value=0
}
C {devices/gnd.sym} 210 -460 0 0 {name=l3 lab=GND}
C {devices/lab_wire.sym} 340 -410 0 0 {name=l5 sig_type=std_logic lab=Vg
}
C {xschem_sky130/sky130_fd_pr/nfet_01v8_lvt.sym} 250 -240 0 0 {name=M1
L=0.15
W=6
nf=1
mult=25
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {devices/res.sym} 270 -180 0 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 270 -150 0 0 {name=l7 lab=GND}
C {devices/vsource.sym} 150 -180 1 0 {name=V4 value=1.8}
C {devices/gnd.sym} 80 -150 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 300 -240 0 0 {name=l9 lab=GND}
C {devices/lab_wire.sym} 190 -240 0 0 {name=l10 sig_type=std_logic lab=Vg2
}
C {devices/capa.sym} 100 -340 3 0 {name=C1
m=1
value=1n
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 180 -370 0 0 {name=R3
value=10k
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} 180 -450 2 0 {name=V5 value=1}
