
set datafile separator ","
input_data = "02-output-wR1R3.csv"

MUL_VOUT=0.001

set angles degrees

R_IN=10.04*10**6

set terminal png

set xlabel "f [kHz]"
set ylabel "K"

set title sprintf("Wzmacniacz operacyjny, nieodwracający, charakterystyka amplitudowa, %s", input_data)

set y2tics
set y2label "Rwe [M Ohm]"
set logscale x
set output sprintf("fig-opamp-neg-noninv-inimp-logscale--%s.png", input_data)
plot input_data using 5:(MUL_VOUT*$3/$2) title input_data linestyle 2, \
     input_data using 5:( R_IN * (MUL_VOUT*$3/$2) / ( 1 - (MUL_VOUT*$3/$2) ) / (10**6) ) title 'Rwe(f)' linestyle 3 axes x1y2

# -----------------------------------------------------------------------------

set xlabel "f [kHz]"
set ylabel "Phi [deg]"

set title sprintf("Wzmacniacz operacyjny, nieodwracający, charakterystyka fazowa, %s", input_data)

set logscale x
set output sprintf("fig-opamp-neg-noninv-phase-inimp-logscale--%s.png", input_data)
plot input_data using 5:4 title input_data linestyle 2
