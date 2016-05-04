
set datafile separator ","
input_data = "results05out-combined.csv"

set angles degrees

MUL_VOUT=1.0
R=5850

T(x) = (R/(R+Rwy))*x

fit T(x) input_data using 3:(MUL_VOUT*$2) via Rwy

fittitleT = sprintf("fit: Uwy = (R/(R+Rwy))*Uwy', Rwy = %.2f", Rwy)

set terminal png

set xlabel "Uwy' [Vpp]"
set ylabel "Uwy [Vpp]"

set title sprintf("Opór wyjściowy, %s", input_data)

set nologscale x
set output sprintf("fig-05-out-ampl-nologscale--%s.png", input_data)
plot input_data using 3:(MUL_VOUT*$2) title input_data linestyle 1, \
    T(x) title fittitleT linestyle 3
