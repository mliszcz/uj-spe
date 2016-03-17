N = 50

input_data = "result-divisor.txt"

f(x) = a * x

fit f(x) input_data using 2:3:4 via a

fittitle = sprintf('fit: T(x) = %.2f x', a)

set terminal png
set output sprintf("fig-divisor--%s.png", input_data)

set xlabel "U_we [mVpp]"
set ylabel "U_wy [mVpp]"

set title sprintf("U_wy(U_we), %s", input_data)

# Plot
plot input_data using 2:3:4 title input_data with yerrorbars linestyle 2, \
     f(x) title fittitle linestyle 4
