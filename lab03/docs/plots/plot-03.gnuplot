
set datafile separator ","
input_data = "03-output-1Vpp.csv"

set angles degrees

MUL_VOUT=1.0 # for 1Vpp
# MUL_VOUT=0.001 # for 10Vpp

T(x) = (x/f0) / ( (1+(x/f1)**2) * (1+(x/f2)**2) )**(0.5)


fit T(x) input_data using 5:(MUL_VOUT*$3/$2) via f0, f1, f2

fittitleT = sprintf('fit: T(f), f0 = %.2f, f1 = %.2f, f2 = %.2f', f0, f1, f2)


set terminal png

set xlabel "f [kHz]"
set ylabel "|T|"

set title sprintf("Wzmacniacz całkująco-różniczkujący, charakterystyka amplitudowa, %s", input_data)

set logscale x
set output sprintf("fig-opamp-diffint-ampl-logscale--%s.png", input_data)
plot input_data using 5:(MUL_VOUT*$3/$2) title input_data linestyle 2, \
     T(x) title fittitleT linestyle 4

set nologscale x
set output sprintf("fig-opamp-diffint-ampl-nologscale--%s.png", input_data)
plot input_data using 5:(MUL_VOUT*$3/$2) title input_data linestyle 2, \
    T(x) title fittitleT linestyle 4

# -----------------------------------------------------------------------------

set xlabel "f [kHz]"
set ylabel "Phi [deg]"

set title sprintf("Wzmacniacz całkująco-różniczkujący, charakterystyka fazowa, %s", input_data)

set logscale x
set output sprintf("fig-opamp-diffint-phase-logscale--%s.png", input_data)
plot input_data using 5:4 title input_data linestyle 2

set nologscale x
set output sprintf("fig-opamp-diffint-phase-nologscale--%s.png", input_data)
plot input_data using 5:4 title input_data linestyle 2
