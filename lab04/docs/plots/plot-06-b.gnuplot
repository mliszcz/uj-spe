
set datafile separator ","
input_data = "results06b.csv"

set angles degrees

MUL_VOUT=1.0

T(x) = B*x


fit T(x) input_data using 2:(MUL_VOUT*$3) via B

fittitleT = sprintf('fit: T(u) = B*u, B = %.2f', B)

set terminal png

set xlabel "Uwe [mVpp]"
set ylabel "U_RE [mVpp]"

set title sprintf("Stosunek U_RE/Uwe, %s", input_data)

set nologscale x
set output sprintf("fig-06-b-ampl-nologscale--%s.png", input_data)
plot input_data using 2:(MUL_VOUT*$3) title input_data linestyle 1, \
    T(x) title fittitleT linestyle 3
