v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 60 -90 60 -80 { lab=GND}
N 120 -50 120 -40 { lab=GND}
N 60 -150 180 -150 { lab=VCASC1}
N 180 -150 180 -140 { lab=VCASC1}
N 120 -110 180 -110 { lab=VCASC2}
N 270 -230 270 -220 { lab=GND}
N 490 -210 490 -200 { lab=GND}
N 490 -290 490 -270 { lab=VSWP}
N 410 -290 490 -290 { lab=VSWP}
N 410 -290 410 -170 { lab=VSWP}
N 350 -290 350 -210 { lab=VDD}
N 270 -290 350 -290 { lab=VDD}
N -220 70 -220 90 { lab=GND}
N -220 0 -220 10 { lab=#net1}
N -40 -0 180 -0 { lab=VI}
N 50 110 50 120 { lab=GND}
N 100 150 100 160 { lab=GND}
N 140 180 140 190 { lab=GND}
N 180 220 180 230 { lab=GND}
N 180 90 180 160 { lab=VBIAS4}
N 140 70 140 120 { lab=VBIAS3}
N 140 70 180 70 { lab=VBIAS3}
N 100 50 100 90 { lab=VBIAS2}
N 100 50 180 50 { lab=VBIAS2}
N 50 30 180 30 { lab=VBIAS1}
N 50 30 50 50 { lab=VBIAS1}
N 350 180 350 200 { lab=GND}
N 410 240 410 250 { lab=GND}
N 410 150 410 180 { lab=VSWN}
N 800 -30 800 -10 { lab=VLNA}
N 750 -30 800 -30 { lab=VLNA}
N 800 50 800 70 { lab=GND}
N 760 20 760 40 { lab=VPA}
N 710 20 760 20 { lab=VPA}
N 760 100 760 120 { lab=GND}
N 640 -30 690 -30 { lab=VLNA_O}
N 640 20 650 20 { lab=VPA_O}
N -220 -0 -190 -0 { lab=#net1}
C {Xschem Schematics/Top_PostLayout.sym} 120 0 0 0 {name=XBIAMP1}
C {devices/code.sym} -200 -260 0 0 {name=TT_MODELS1
spice_ignore=false
only_toplevel=true
format="tcleval( @value )"
value="
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt
"}
C {devices/code_shown.sym} 880 -400 0 0 {name=SPICE1 spice_ignore=false only_toplevel=true value="
*.include /home/shahid/Desktop/Layout/PICO/MAGIC/PostLayout/TopModule.spice
.control
save all
op
let pdc=mag(v(VDD) * -i(VDD))
print pdc

ac dec 80 0.1G 10G

let Zo=50;
let Zin=v(vi)/-i(VIN1)
Let S11=mag( (Zin-Zo)/(Zin+Zo) )
plot db(S11)
WRDATA S11.csv db(S11)
plot mag(Zin);



let GLNA=db(v(VLNA)/v(Vi))
let GPA=db(v(VPA)/v(Vi))

plot GLNA GPA

set sqrnoise

noise v(VLNA) VIN1 dec 40 1G 10G
setplot noise1
let Fn=inoise_spectrum/(8.3e-19)
let NFn=db(Fn) / 2
plot NFn

.endc
"}
C {devices/vsource.sym} 60 -120 0 1 {name=VCASC1 value=1.4}
C {devices/gnd.sym} 60 -80 0 1 {name=l37 lab=GND}
C {devices/vsource.sym} 120 -80 0 1 {name=VCASC2 value=0.6}
C {devices/gnd.sym} 120 -40 0 1 {name=l1 lab=GND}
C {devices/vsource.sym} 270 -260 0 1 {name=VDD value=1.8}
C {devices/gnd.sym} 270 -220 0 1 {name=l2 lab=GND}
C {devices/vsource.sym} 490 -240 0 1 {name=VSWP value=1.8}
C {devices/gnd.sym} 490 -200 0 1 {name=l3 lab=GND}
C {devices/vsource.sym} -220 40 0 0 {name=VIN1 value="0 AC 1m"}
C {devices/gnd.sym} -220 90 0 0 {name=l25 lab=GND}
C {devices/vsource.sym} 50 80 0 1 {name=VBIAS1 value=0.75}
C {devices/gnd.sym} 50 120 0 1 {name=l4 lab=GND}
C {devices/vsource.sym} 100 120 0 1 {name=VBIAS2 value=1.55}
C {devices/gnd.sym} 100 160 0 1 {name=l5 lab=GND}
C {devices/vsource.sym} 140 150 0 1 {name=VBIAS3 value=0.9}
C {devices/gnd.sym} 140 190 0 1 {name=l6 lab=GND}
C {devices/vsource.sym} 180 190 0 1 {name=VBIAS4 value=0.9}
C {devices/gnd.sym} 180 230 0 1 {name=l7 lab=GND}
C {devices/lab_wire.sym} 350 -290 0 0 {name=l35 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 410 -290 0 0 {name=l8 sig_type=std_logic lab=VSWP}
C {devices/gnd.sym} 350 200 0 1 {name=l9 lab=GND}
C {devices/vsource.sym} 410 210 0 1 {name=VSWN value=0}
C {devices/gnd.sym} 410 250 0 1 {name=l10 lab=GND}
C {devices/lab_wire.sym} 410 160 0 0 {name=l11 sig_type=std_logic lab=VSWN}
C {devices/capa.sym} 720 -30 3 0 {name=C1
m=1
value=1n
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 800 20 0 0 {name=R8
value=50
footprint=1206
device=resistor
m=1}
C {devices/lab_wire.sym} 800 -30 0 0 {name=l12 sig_type=std_logic lab=VLNA}
C {devices/capa.sym} 680 20 3 0 {name=C2
m=1
value=1n
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 760 70 0 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
C {devices/lab_wire.sym} 760 20 0 0 {name=l13 sig_type=std_logic lab=VPA}
C {devices/lab_wire.sym} 650 20 0 0 {name=l14 sig_type=std_logic lab=VPA_O}
C {devices/lab_wire.sym} 670 -30 0 0 {name=l15 sig_type=std_logic lab=VLNA_O}
C {devices/gnd.sym} 760 120 0 1 {name=l16 lab=GND}
C {devices/gnd.sym} 800 70 0 1 {name=l17 lab=GND}
C {devices/lab_wire.sym} 120 -150 0 0 {name=l18 sig_type=std_logic lab=VCASC1}
C {devices/lab_wire.sym} 160 -110 0 0 {name=l19 sig_type=std_logic lab=VCASC2}
C {devices/lab_wire.sym} 70 0 0 0 {name=l20 sig_type=std_logic lab=VI}
C {devices/lab_wire.sym} 100 30 0 0 {name=l21 sig_type=std_logic lab=VBIAS1}
C {devices/lab_wire.sym} 120 50 0 0 {name=l22 sig_type=std_logic lab=VBIAS2}
C {devices/lab_wire.sym} 140 70 0 0 {name=l23 sig_type=std_logic lab=VBIAS3}
C {devices/lab_wire.sym} 180 120 0 0 {name=l24 sig_type=std_logic lab=VBIAS4}
