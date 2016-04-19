
set datafile separator ","
input_data = "01-output-k1.csv"

# MUL_VOUT=1000 # for k=100
MUL_VOUT=1 # for k=1

set angles degrees

set terminal png

set xlabel "f [kHz]"
set ylabel "K"

set title sprintf("Wzmacniacz operacyjny, odwracający, charakterystyka amplitudowa, %s", input_data)

set logscale x
set output sprintf("fig-opamp-neg-inv-logscale--%s.png", input_data)
plot input_data using 5:(MUL_VOUT*$3/$2) title input_data linestyle 2#, \
     #T(x) title fittitleT linestyle 4

set nologscale x
set output sprintf("fig-opamp-neg-inv-nologscale--%s.png", input_data)
plot input_data every ::0::70 using 5:(MUL_VOUT*$3/$2) title input_data linestyle 2#, \
    #T(x) title fittitleT linestyle 4

# -----------------------------------------------------------------------------

set xlabel "f [kHz]"
set ylabel "Phi [deg]"

set title sprintf("Wzmacniacz operacyjny, odwracający, charakterystyka fazowa, %s", input_data)

set logscale x
set output sprintf("fig-opamp-neg-inv-phase-logscale--%s.png", input_data)
plot input_data using 5:4 title input_data linestyle 2

set nologscale x
set output sprintf("fig-opamp-neg-inv-phase-nologscale--%s.png", input_data)
plot input_data every ::0::70 using 5:4 title input_data linestyle 2
