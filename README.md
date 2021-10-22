# Inductor Less Bi-Directional Amplifier for 5G

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![CI](https://github.com/efabless/caravel_user_project_analog/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_user_project_analog/actions/workflows/user_project_ci.yml) [![Caravan Build](https://github.com/efabless/caravel_user_project_analog/actions/workflows/caravan_build.yml/badge.svg)](https://github.com/efabless/caravel_user_project_analog/actions/workflows/caravan_build.yml)

---

| :exclamation: Important Note            |
|-----------------------------------------|

## Please fill in your project documentation in this README.md file 


:warning: | Use this sample project for analog user projects. 
:---: | :---

---

Refer to docs/AMP_DOC for this project documentation in PDF.

# Table of Contents

[1 Introduction 2](#introduction)

[2 Bi-Directional Amplification Architecture
3](#bi-directional-amplification-architecture)

[2.1 State of Switches During Reception
3](#state-of-switches-during-reception)

[2.2 State of Switches During Transmission
4](#state-of-switches-during-transmission)

[3 Budget Analysis 4](#budget-analysis)

[3.1 Transmission Budget Analysis 4](#transmission-budget-analysis)

[3.2 Reception Budget Analysis 5](#reception-budget-analysis)

[4 Circuit Specifications 6](#circuit-specifications)

[5 Schematic 6](#schematic)

[5.1 Design Process 7](#design-process)

[5.2 DC Bias Point Simulations 8](#dc-bias-point-simulations)

[5.3 Two Stage Low Noise Amplifier 9](#two-stage-low-noise-amplifier)

[5.3.1 Gain 9](#gain)

[5.3.2 Input Matching 10](#input-matching)

[5.3.3 Noise Figure 10](#noise-figure)

[5.4 Complete Schematic 11](#complete-schematic)

[6 Layout 11](#layout)

[7 Post layout Simulation 14](#post-layout-simulation)

[7.1 Noise Figure 14](#noise-figure-1)

[7.2 Input Matching 15](#input-matching-1)

[7.3 Voltage Gain 15](#voltage-gain)

[8 Post layout Results Summary 17](#post-layout-results-summary)

[9 Conclusion 17](#conclusion)

Bi-Directional Amplifier Architecture for Sub-6 GHz 5G

PICO Design Contest Submission

# Introduction

  - TDD (Time division duplexing) RF front ends operate in such a manner
    that
    
      - During Transmission, Receiver side is isolated using and switch
        and power amplifier is driving the transmission antenna, as
        shown in Figure 1
    
      - During Reception, transmitter chain is isolated and the received
        signal from the antenna is fed to a low noise amplifier, as
        shown in Figure2

![A screenshot of a computer Description automatically generated with
low confidence](media/image3.png)

Figure 1 Transmitter on

![A screenshot of a computer Description automatically generated with
medium confidence](media/image4.png)

Figure 2 Receiver on

# Bi-Directional Amplification Architecture

  - The Bi-Directional Amplifier architecture aims to exploit the
    inherent TDD nature of the classical architecture.

  - At a given time, either the power amplifier (Transmission) or the
    low noise amplifier (LNA) is working.

  - Both LNA and PA occupy silicon space and have power consumption.

  - Bi-Directional architecture makes use of a single circuit that acts
    as both the power amplifier (during transmission) and the low noise
    amplifier (during reception).

  - This way we can conserve area and power, thereby, reduce cost.

Figure 3 shows the proposed architecture of bi-directional amplification
using same amplifier and a set of switches.

> ![](media/image5.emf)

Figure 3 Bi-Directional Amplifier Architecture using Switches

## State of Switches During Reception

Figure 4 shows the state of switches during the reception mode. In this
mode the amplifier acts as a low noise amplifier. The power received
from antenna is fed to the amplifier and the amplified signal is then
sent to receiver path.

![](media/image6.emf)

Figure 4 Amplification During Reception

## State of Switches During Transmission

Figure 5 shows the state of switches during transmission. In this case
the signal from transmitter is power amplified and fed to a 50\(\Omega\)
antenna.

![](media/image7.emf)

Figure 5 Amplifier during Transmission

# Budget Analysis

A simple power budget analysis was done to get the design specifications
for the circuit.

## Transmission Budget Analysis

  - Output Power at Antenna \(\geq\) 10dBm (WLAN standard)

  - Gain of Pre-Driver Circuit= 30 dB

  - Minimum input power level required from Power Source= -20 dBm (10dBm
    – 30dB)

  - The 50 Ohm buffer should have P1dB (out) \> 10 dBm

![](media/image8.emf)

## Reception Budget Analysis

  - Minimum power at the antenna\(\geq\) -80 dBm (WLAN standard)

  - Gain of LNA=30 dB

  - Power of signal after LNA=-50 dBm (-80 dBm+30dB )

  - Further amplification is usually done in the IF/Baseband domain

  - The LNA should have noise Figure \(\leq 4dB\)

![](media/image9.emf)

# Circuit Specifications

  - Since the amplifier in the loop is now acting as both the power
    amplifier and the low noise amplifier, it must have following
    characteristics

| **Specification**  | **Value**                    |
| ------------------ | ---------------------------- |
| **Gain**           | \>20 dB                      |
| **Area**           | As low as possible           |
| **Noise Figure**   | \~ 3dB                       |
| **Power**          | \~30 mW                      |
| **Linearity**      | \~-20 dBm (input referred)   |
| **Output Power**   | \~10 dBm (WLAN Applications) |
| **Input Matching** | \<-10 dB in the band         |

# Schematic

Figure 6 shows the 2-stage amplifier that is used to provide voltage
gain in the circuit. In the first stage Transistors M0 and M1 provide
transconductance. Transistor M1 also reduces current through M2 and
increases the value of Resistor and drain of M2. Due to this cascode and
current re-use technique we obtain a large voltage gain. Transistor M4
is used to provide voltage to current feedback from output to input such
that the input impedance is governed transistor M4. Transistor M5
establishes bias voltage for the gate of M0. The second stage combines
the differential output from stage 1 in such a way that the noise
contribution of transistor M4 is cancelled.

![](media/image10.emf)

Figure 6 2-Stage Low Noise Amplifier With 50 Ohm Buffer

The equations describing the above circuits are

\[A_{v1} = \frac{\left( g_{m0} + g_{m1} \right)}{\left( g_{ds0} + g_{ds1} + g_{m2} \right)}\left( g_{m2}*R \right)\text{\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Gain\ of\ First\ Stage}\]

\[Z_{\text{in}} = \frac{1}{g_{m4}(1 + A_{v1})}\text{\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Input\ Impedance\ seen\ by\ RFIN}\]

\[g_{m6} = g_{m7}*\frac{A_{v1}*\ Rs}{R_{0}}\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ Noise\ Cancel\ Condition\ for\ M4\ at\ second\ Stage\]

## Design Process

  - Optimum Size for good Noise Figure at selected bias conditions

  - Selection of feedback transistor size for input matching

  - Selection of proper size at stage two for noise cancellation

  - Output buffer to match 1/gm=50 Ohms

Figure 7 shows the schematic setup to simulate small signal noise figure
in Xschem and Ngspice. The noise response at selected size and bias is
shown in Figure 8.

![Chart Description automatically generated](media/image11.png)

Figure 7 Schematic setup to simulate small signal noise figure

![Chart, line chart Description automatically
generated](media/image12.png)

Figure 8 Noise Figure Response @200u/0.15u

Since by design this noise figure will be reduced by 3\~4 dB at first
stage this size was chosen.

## DC Bias Point Simulations

To calculate bias points an Xschem Schematic was mad with all
transistors at their bias points as shown in Figure 8.

![Diagram, schematic Description automatically
generated](media/image13.png)

Figure 9 DC Bias Point Simulation for all transistors

## Two Stage Low Noise Amplifier

![Diagram Description automatically generated](media/image14.png)

Figure 10 Xschem Schematic for two stage amplifier shown in Figure 6

### Gain

Figure 11 shows the gain vs frequency graph of 2 Stage LNA. The voltage
gain is 32 dB with the band width of 6.5 GHz.

![A picture containing graphical user interface Description
automatically generated](media/image15.png)

Figure 11 Gain vs Frequency graph of 2 stage LNA

### Input Matching

Figure 12 shows the input matching characteristic of the LNA in the form
of S11. The S11\<-10 dB in the band of interest.

![Chart Description automatically generated](media/image16.png)

Figure 12 S11 of 2-Stage LNA

### Noise Figure

Figure 13 shows the small signal noise figure graph of the 2-stage LNA.
The noise figure is estimated from ac analysis using

\[S_{11} = 20\log\left( \left| \frac{Z_{\text{in}} - 50}{Z_{\text{in}} + 50} \right| \right)\]

![Chart, line chart Description automatically
generated](media/image17.png)

Figure 13 Noise Figure of 2-Stage LNA

## Complete Schematic

![Diagram, schematic Description automatically
generated](media/image18.png)

Figure 14 Complete Schematic of Bi- Directional Amplifier Architecture

# Layout

After schematic simulations, the layout was done in Magic VLSI.
Individual modules were laid out separately with clean DRC and LVS and
then were combined together. The layouts are shown in Following Figures.

![Graphical user interface Description automatically generated with low
confidence](media/image19.png)

Figure 15 Layout of First stage of LNA

![Graphical user interface Description automatically
generated](media/image20.png)

Figure 16 Layout of Second Stage of Amplifier

![A picture containing text, writing implement, stationary, pencil
Description automatically generated](media/image21.png)

Figure 17 Layout of Switches

![Graphical user interface, diagram Description automatically
generated](media/image22.png)

Figure 18 Complete DRC, Antenna, LVS clean layout of Bidirectional
Amplifier

![Chart, treemap chart Description automatically
generated](media/image23.png)

Figure 19 GDS view of complete layout in KLayout tool

# Post layout Simulation

Netlists extracted from the magic were simulated again in xschem to
verify circuit functionality post layout. The schematic symbol is shown
in Figure 20.

![Diagram, schematic Description automatically
generated](media/image24.png)

Figure 20 Post Layout Simulation Setup in Xschem against magic extracted
netlists

## Noise Figure

The noise figure response is shown in Figure 21. Surprisingly the noise
figure has improved. This is probably due to the fact that no parasitic
resistances were calculated at the RFIN net since we were not able to
extract resistance in magic (some issue to do with **extresist** command
not working in hierarchical designs).

![A picture containing text, sky, screenshot, document Description
automatically generated](media/image25.png)

Figure 21 Post layout Noise Figure Response

## Input Matching

Figure 22 shows the matching at input in the form of S11.

![Chart, line chart Description automatically
generated](media/image26.png)

Figure 22 Post Layout S11 graph

## Voltage Gain

Figure 23 shows the voltage gain of the amplifier when the switches for
receiver path (LNA) are on. We can see that the gain is 25 dB as
compared to original 32dB. The 7dB loss is due to the buffer at the
output to drive 50\(\Omega\) test equipment. Also the LNA to PA
isolations is about 35 dB. The bandwidth is 4.5 GHz.

![Graphical user interface, application, email Description automatically
generated](media/image27.png)

Figure 23 Post Layout Voltage Gain of LNA

Figure 24 shows the voltage gain when switches for Transmitter (PA) are
on. We can see that the voltage gain is about 27dB. The isolation
between LNA and PA is still greater than 35 dB.

![Graphical user interface Description automatically generated with low
confidence](media/image28.png)

Figure 24 Post Layout small signal PA Gain

However, this is really a small signal voltage gain and does not include
compression and non-linear effects of large signal saturation. Since
Ngspice does not have a PSS/Harmonic balance simulator we were not able
to do large signal analysis. However, we did plot output vs input power
using transient analysis. The 1-dB compression graph is shown in Figure
25.

![Chart, line chart Description automatically
generated](media/image29.png)

Figure 25 Post layout Input Vs Output Power

# Post layout Results Summary

![](media/image30.png)

# Conclusion

The design is ready to be integrated in caravel chip