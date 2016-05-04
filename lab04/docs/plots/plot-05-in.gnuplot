
set datafile separator ","
input_data = "results05in.csv"

set angles degrees

MUL_VOUT=1.0
R=1982

T(x) = (Rwe/(R+Rwe))*x


fit T(x) input_data using 2:(MUL_VOUT*$3) via Rwe

fittitleT = sprintf('fit: T(u) = (Rwe/(R+Rwe))*u, Rwe = %.2f', Rwe)

set terminal png

set xlabel "Uwe1 [mVpp]"
set ylabel "Uwe2 [mVpp]"

set title sprintf("Opór wejściowy, %s", input_data)

set nologscale x
set output sprintf("fig-05-in-ampl-nologscale--%s.png", input_data)
plot input_data using 2:(MUL_VOUT*$3) title input_data linestyle 1, \
    T(x) title fittitleT linestyle 3
