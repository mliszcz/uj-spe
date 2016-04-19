
set datafile separator ","
input_data = "02-output-woR1.csv"

MUL_VOUT=1

set angles degrees

set terminal png

set xlabel "f [kHz]"
set ylabel "K"

set title sprintf("Wzmacniacz operacyjny, nieodwracający, charakterystyka amplitudowa, %s", input_data)

set logscale x
set output sprintf("fig-opamp-neg-noninv-logscale--%s.png", input_data)
plot input_data using 5:(MUL_VOUT*$3/$2) title input_data linestyle 2

# -----------------------------------------------------------------------------

set xlabel "f [kHz]"
set ylabel "Phi [deg]"

set title sprintf("Wzmacniacz operacyjny, nieodwracający, charakterystyka fazowa, %s", input_data)

set logscale x
set output sprintf("fig-opamp-neg-noninv-phase-logscale--%s.png", input_data)
plot input_data using 5:4 title input_data linestyle 2
