
set datafile separator ","
input_data = "results04.csv"

set angles degrees

MUL_VOUT=1000.0

set terminal png

set xlabel "f [Hz]"
set ylabel "k"

set title sprintf("Charakterystyka amplitudowa, %s", input_data)

set logscale x
set output sprintf("fig-04-ampl-logscale--%s.png", input_data)
plot input_data using 5:(MUL_VOUT*$3/$2) title input_data linestyle 1

# -----------------------------------------------------------------------------

set xlabel "f [Hz]"
set ylabel "Phi [deg]"

set title sprintf("Charakterystyka fazowa, %s", input_data)

set logscale x
set output sprintf("fig-04-phase-logscale--%s.png", input_data)
plot input_data using 5:4 title input_data linestyle 1
