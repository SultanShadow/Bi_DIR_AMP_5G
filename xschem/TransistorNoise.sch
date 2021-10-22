v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -10 -120 -10 -100 { lab=GND}
N 290 -150 290 -110 { lab=GND}
N 560 -250 600 -250 { lab=GND}
N 600 -250 600 -240 { lab=GND}
N 290 -250 310 -250 { lab=VOUT}
N 290 -250 290 -200 { lab=VOUT}
N 290 -110 290 -100 { lab=GND}
N 290 -180 340 -180 { lab=GND}
N 340 -180 340 -130 { lab=GND}
N 290 -130 340 -130 { lab=GND}
N -10 -180 50 -180 { lab=#net1}
N 220 -180 220 -170 { lab=VIN}
N 220 -110 220 -100 { lab=#net2}
N 370 -250 430 -250 { lab=VOUT}
N 220 -40 220 -20 { lab=GND}
N 110 -180 130 -180 { lab=#net3}
N 190 -180 220 -180 { lab=VIN}
N 220 -180 250 -180 { lab=VIN}
N 490 -250 500 -250 { lab=#net4}
N 320 -250 370 -250 { lab=VOUT}
N 310 -250 320 -250 { lab=VOUT}
N 400 -250 400 -230 { lab=VOUT}
C {devices/code.sym} 20 -450 0 0 {name=TT_MODELS
spice_ignore=false
only_toplevel=true
format="tcleval( @value )"
value="
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt
"}
C {devices/code_shown.sym} 630 -480 0 0 {name=SPICE spice_ignore=false only_toplevel=true value="

.control
*dc VDD 0 1.8 10m VIN 0 1.8 100m



	op
	let gm1=@m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
	let gds1=@m.xm1.msky130_fd_pr__nfet_01v8_lvt[gds]
	let vth1=@m.xm1.msky130_fd_pr__nfet_01v8_lvt[vth]
	let id1=@m.xm1.msky130_fd_pr__nfet_01v8_lvt[id]



*display


	print gm1
	print gds1
	print vth1
	print id1


	set sqrnoise

	noise v(VOUT) Vsource dec 40 1G 10G
	setplot noise1
	let Fn=inoise_spectrum/(8.3e-19)
	let NFn=db(Fn) / 2
	plot NFn
	WRDATA TransNoise.csv NFn

.endc
"}
C {devices/vsource.sym} -10 -150 0 0 {name=Vsource value="0 AC 1m"}
C {devices/vsource.sym} 530 -250 3 0 {name=VD3 value=0.6}
C {devices/gnd.sym} 600 -240 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 290 -100 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} -10 -100 0 0 {name=l6 lab=GND}
C {xschem_sky130/sky130_fd_pr/nfet_01v8_lvt.sym} 270 -180 0 0 {name=M1
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
C {devices/res.sym} 80 -180 3 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 220 -140 0 0 {name=R2
value=50
footprint=1206
device=resistor
m=1}
C {devices/lab_wire.sym} 220 -180 0 0 {name=l3 sig_type=std_logic lab=VIN}
C {devices/lab_wire.sym} 290 -250 0 0 {name=l4 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} 220 -70 0 0 {name=Vg value=0.75}
C {devices/gnd.sym} 220 -20 0 0 {name=l2 lab=GND}
C {devices/capa.sym} 160 -180 3 0 {name=C1
m=1
value=1n
footprint=1206
device="ceramic capacitor"}
C {devices/ind.sym} 460 -250 3 1 {name=L1
m=1
value=10u
footprint=1206
device=inductor}
C {devices/res.sym} 400 -200 0 0 {name=R3
value=50
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 400 -170 0 0 {name=l7 lab=GND}
