
set datafile separator ","
input_data = "results03.csv"

set angles degrees

MUL_VOUT=1000.0

T(x) = B*x


fit T(x) input_data every ::0::36 using 2:(MUL_VOUT*$3) via B

fittitleT = sprintf('fit: T(u) = B*u, B = %.2f', B)

set terminal png

set xlabel "Uwe [mVpp]"
set ylabel "Uwy [mVpp]"

set title sprintf("Wzmocnienie, %s", input_data)

set logscale x
set output sprintf("fig-03-ampl--%s.png", input_data)
plot input_data using 2:(MUL_VOUT*$3) title input_data linestyle 1, \
     T(x) title fittitleT linestyle 3

set nologscale x
set output sprintf("fig-03-ampl-nologscale--%s.png", input_data)
plot input_data using 2:(MUL_VOUT*$3) title input_data linestyle 1, \
    T(x) title fittitleT linestyle 3
