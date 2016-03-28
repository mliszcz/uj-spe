N = 50

set datafile separator ","
input_data = "results-cr-1.csv"

set angles degrees

T(x) = ( ((x/p)**2) / (1+(x/p)**2) )**(0.5)
F(x) = atan(q/x)

fit T(x) input_data using 2:($4/$3) via p
fit F(x) input_data using 2:(-1*$5) via q

fittitleT = sprintf('fit: T(f), f0 = %.2f', p)
fittitleF = sprintf('fit: F(f), f0 = %.2f', q)

set terminal png
set output sprintf("fig-cr-ampl--%s.png", input_data)

set xlabel "f [Hz]"
set ylabel "|T|"

set logscale x

set title sprintf("Czwórnik CR, charakterystyka amplitudowa, %s", input_data)

plot input_data using 2:($4/$3) title input_data linestyle 2, \
     T(x) title fittitleT linestyle 4

# -----------------------------------------------------------------------------

set output sprintf("fig-cr-phase--%s.png", input_data)

set xlabel "f [Hz]"
set ylabel "Phi [deg]"

set logscale x

set title sprintf("Czwórnik CR, charakterystyka fazowa, %s", input_data)

# Plot
plot input_data using 2:(-1*$5) title input_data linestyle 2, \
     F(x) title fittitleF linestyle 4
