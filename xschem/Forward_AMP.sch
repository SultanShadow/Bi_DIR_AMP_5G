v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1490 -950 1530 -950 { lab=GND}
N 1530 -950 1530 -900 { lab=GND}
N 1490 -900 1530 -900 { lab=GND}
N 1490 -920 1490 -900 { lab=GND}
N 1490 -1040 1490 -980 { lab=#net1}
N 1410 -950 1450 -950 { lab=Vi}
N 1490 -1070 1580 -1070 { lab=GND}
N 1580 -1070 1580 -1040 { lab=GND}
N 1410 -1070 1450 -1070 { lab=#net2}
N 1490 -1130 1490 -1100 { lab=Vo}
N 1490 -1160 1490 -1130 { lab=Vo}
N 1370 -1070 1410 -1070 { lab=#net2}
N 1350 -950 1410 -950 { lab=Vi}
N 1370 -1010 1370 -1000 { lab=GND}
N 1350 -890 1350 -870 { lab=GND}
N 1340 -1260 1380 -1260 { lab=#net3}
N 1340 -1200 1340 -1190 { lab=GND}
N 1490 -1260 1490 -1220 { lab=#net3}
N 1380 -1260 1490 -1260 { lab=#net3}
N 1450 -1130 1490 -1130 { lab=Vo}
N 1760 -1040 1760 -1000 { lab=#net1}
N 1490 -1000 1760 -1000 { lab=#net1}
N 1890 -1120 1930 -1120 { lab=#net4}
N 1930 -1060 1930 -1050 { lab=GND}
N 1760 -1120 1760 -1100 { lab=#net4}
N 1760 -1120 1890 -1120 { lab=#net4}
N 1800 -1070 1830 -1070 { lab=Vi}
N 1440 -950 1440 -820 { lab=Vi}
N 1440 -820 1830 -820 { lab=Vi}
N 1830 -1070 1830 -820 { lab=Vi}
N 1690 -1070 1760 -1070 { lab=#net4}
N 1690 -1120 1690 -1070 { lab=#net4}
N 1690 -1120 1770 -1120 { lab=#net4}
N 1520 -1190 1520 -1070 { lab=GND}
N 1510 -1190 1520 -1190 { lab=GND}
C {devices/code.sym} 1070 -1300 0 0 {name=TT_MODELS
spice_ignore=false
only_toplevel=true
format="tcleval( @value )"
value="
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt
"}
C {devices/code_shown.sym} 2150 -1350 0 0 {name=SPICE spice_ignore=false only_toplevel=true value="

.control
op
	let gm1=@m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
	let id1=@m.xm1.msky130_fd_pr__nfet_01v8_lvt[id]
	let gm2=@m.xm2.msky130_fd_pr__pfet_01v8[gm]
	let id2=@m.xm2.msky130_fd_pr__pfet_01v8[id]
	let gm3=@m.xm3.msky130_fd_pr__nfet_01v8_lvt[gm]
	let id3=@m.xm3.msky130_fd_pr__nfet_01v8_lvt[id]
	
	print id1 gm1
	print id2 gm2
	print id3 gm3

*save all
ac dec 40 0.1G 10G

let Gain=v(Vo)/v(Vi);
let phase=(180/pi)*ph(v(Vo)/v(Vi));
*write ForwardAmp_ac.raw
plot db(Gain)
plot phase
.endc
"}
C {devices/gnd.sym} 1490 -900 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 1580 -1040 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 1350 -920 0 0 {name=VIN value="0.75 AC 1"}
C {devices/vsource.sym} 1370 -1040 0 0 {name=Vcasc value=1.4}
C {devices/gnd.sym} 1350 -870 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 1370 -1000 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 1340 -1230 0 0 {name=VDD value=1.8}
C {devices/gnd.sym} 1340 -1190 0 0 {name=l5 lab=GND}
C {devices/lab_wire.sym} 1450 -1130 0 0 {name=l6 sig_type=std_logic lab=Vo}
C {devices/lab_wire.sym} 1420 -950 0 0 {name=l7 sig_type=std_logic lab=Vi}
C {devices/vsource.sym} 1930 -1090 0 1 {name=VDD1 value=1.8}
C {devices/gnd.sym} 1930 -1050 0 1 {name=l8 lab=GND}
C {xschem_sky130/sky130_fd_pr/nfet_01v8_lvt.sym} 1470 -950 0 0 {name=M1
L=0.15
W=200
nf=20
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {xschem_sky130/sky130_fd_pr/nfet_01v8_lvt.sym} 1470 -1070 0 0 {name=M3
L=0.15
W=100
nf=10
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {xschem_sky130/sky130_fd_pr/pfet_01v8.sym} 1780 -1070 0 1 {name=M2
L=0.15
W=110
nf=11
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {xschem_sky130/sky130_fd_pr/res_high_po_0p69.sym} 1490 -1190 0 1 {name=R1
W=0.69
L=0.69
model=res_high_po_0p69
spiceprefix=X
mult=4}
