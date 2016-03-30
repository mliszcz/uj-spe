
set datafile separator ","
input_data = "results-rlc-4.csv"

R = 1776
L = 10*10**(-3) * 6.28
C = 3.65*10**(-9) * 6.28

set angles degrees

T(x) = R/(R+(abs( 1 / ( 1/(exp(x)*L) - exp(x)*C ) ) ))

# fit T(x) input_data using 2:($4/$3) via L,C

fittitleT = sprintf("fit")

set terminal png
set output sprintf("fig-rlc-ampl--%s.png", input_data)

set xlabel "f [Hz]"
set ylabel "|T|"

set title sprintf("Czwórnik RLC (równoległy LC), charakterystyka amplitudowa, %s", input_data)

plot [x=00000:73000] input_data using 2:($4/$3) title input_data linestyle 2, \
     T(x) title fittitleT linestyle 4

# -----------------------------------------------------------------------------
