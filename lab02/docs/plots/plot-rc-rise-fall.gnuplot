
set datafile separator ","
input_rise_data = "results-rc-rise-3.csv"
input_fall_data = "results-rc-fall-3.csv"

set angles degrees

U = 3920
s = 50

R(x) = U*(1-exp(-x/p))
F(x) = U*(exp(s/q)-1)*exp(-x/q)

fit R(x) input_rise_data using 2:($3+2000) via p
fit F(x) input_fall_data using 2:($3+2000) via q

fittitleR = sprintf('fit: (1) u2(t), tau = %.2f', p)
fittitleF = sprintf('fit: (2) u2(t), tau = %.2f', q)

set terminal png
set output sprintf("fig-rc-tau-rise-fall--%s--%s.png", input_rise_data, input_fall_data)

set xlabel "t [us]"
set ylabel "V [mVpp]"

set title sprintf("Czwórnik RC, impuls prostokątny, %s, %s", input_rise_data, input_fall_data)

plot [x=0:100] input_rise_data using 2:($3+2000) title input_rise_data linestyle 2, \
               input_fall_data using 2:($3+2000) title input_fall_data linestyle 3, \
               (x < 50 ? R(x) : 1/0) title fittitleR linestyle 4, \
               (x > 50 ? F(x) : 1/0) title fittitleF linestyle 5
