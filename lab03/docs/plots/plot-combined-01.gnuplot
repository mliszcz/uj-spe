
set datafile separator ","
input_data1 = "01-output-k1.csv"
input_data100 = "01-output-k100.csv"

MUL_VOUT=10

set angles degrees

set terminal png

set xlabel "f [kHz]"
set ylabel "K / K0"

set title sprintf("Wzmacniacz operacyjny, odwracający, charakterystyka amplitudowa")

set logscale x
set output sprintf("fig-opamp-neg-inv--combined-logscale--%s.png", input_data1)
plot input_data1 using 5:($3/$2) title input_data1 linestyle 2, \
     input_data100 using 5:(MUL_VOUT*$3/$2) title input_data100 linestyle 3,
