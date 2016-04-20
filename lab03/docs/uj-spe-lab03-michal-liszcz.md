---
title: Pracownia elektroniczna
subtitle: |
  ćw. 3: Wzmacniacz operacyjny.\
  prowadzący: dr hab. Janusz Brzychczyk\
author: Michał Liszcz
date: 08.04.2016
toc: true
geometry: margin=6em
header-includes:
    - \usepackage{mathrsfs}
    - \usepackage{amssymb}
    - \usepackage{empheq}
    - \usepackage{braket}
    - \usepackage{empheq}
    - \usepackage{graphicx}
    - \usepackage{float}
    - \usepackage{color}
    - \usepackage{listings}
    - \usepackage{gensymb}
    - \usepackage{caption}
    - \usepackage{subcaption}
---

\newpage

# Wstęp

Ćwiczenie polegało na zbadaniu własności układów wykorzystujących wzmacniacz
operacyjny.

# Wykonane zadania

W ramach laboratorium wykonałem 5 ćwiczeń opisanych w instrukcji.

## Wzmacniacz odwracający fazę

Zadanie polegało na zbudowaniu wzmacniacza odwracającego fazę, w dwóch
wersjach - o wzmocnieniu $K=100$ oraz o wzmocnieniu $K=1$. Dla układu należało
wyznaczyć charakterystyki częstotliwościowe oraz, na ich podstawie,
częstotliwości graniczne.

### Wprowadzenie

Wzmacniacz operacyjny odwracający fazę przedstawiony jest na rys.
\ref{fig:opampNegInv}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.5\textwidth]{images/01-opamp-neg-inv.png}
  \caption{Wzmacniacz odwracający fazę. Źródło: instrukcja laboratoryjna.}
  \label{fig:opampNegInv}
\end{figure}

Przyjmując oznaczenia jak na rysunku oraz zakładając idealne parametry
wzmacniacza, napięcie wyjściowe dane jest przez:

\begin{equation}
U_{wy} = - \frac{R_2}{R_1} U_{we}
\end{equation}

Wzmocnienie tego układu wynosi:

\begin{equation}
K = \frac{|U_{wy}|}{|U_{we}|} = \frac{R_2}{R_1} = |T|
\end{equation}


### Układ dla K=100

Użyłem następujących rezystancji:

* $R_2 = 99.2\,\text{k}\Omega$,
* $R_1 = 0.996\,\text{k}\Omega$.

Mierzyłem stosunek amplitud i częstotliwość w zakresie od 100 Hz do 1 MHz.
Graficznie wyznaczyłem punkt, w krótym wzmocnienie osiągnęło wartość
$K\sqrt{1/2}$:

\begin{equation}
f_g \approx 8.997\,\text{kHz}
\end{equation}

Pomiary przedstawione są na rys. \ref{fig:1-1}, \ref{fig:1-2} oraz
\ref{fig:1-3}.

Otrzymany układ jest filtrem dolnoprzepustowym.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-opamp-neg-inv-logscale--01-output-k100.csv}.png}
  \caption{Wzmacniacz odwracający, $K=100$. Charakterystyka amplitudowa. Skala logarytmiczna.}
  \label{fig:1-1}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-opamp-neg-inv-nologscale--01-output-k100.csv}.png}
  \caption{Wzmacniacz odwracający, $K=100$. Charakterystyka amplitudowa. Skala liniowa.}
  \label{fig:1-2}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-opamp-neg-inv-phase-logscale--01-output-k100.csv}.png}
  \caption{Wzmacniacz odwracający, $K=100$. Charakterystyka amplitudowa. Skala logarytmiczna.}
  \label{fig:1-3}
\end{figure}

### Układ dla K=1

Podobne pomiary przeprowadziłem dla układu zbudowanego z rezystancji:

* $R_2 =0.990\,\text{k}\Omega$,
* $R_1 = 0.996\,\text{k}\Omega$.

Uśredniłem wartość częstotliwości między dwoma punktami pomiarowymi, zakładając
liniową zmianę wzmocnienia na tym odcinku ($K=0.729$, $f=540.2$),
($K=0.687$, $f=559.0$):

\begin{equation}
f_g \approx 550.0\,\text{kHz}
\end{equation}

Pomiary przedstawione są na rys. \ref{fig:1-4}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-opamp-neg-inv-logscale--01-output-k1.csv}.png}
  \caption{Wzmacniacz odwracający, $K=1$. Charakterystyka amplitudowa. Skala logarytmiczna.}
  \label{fig:1-4}
\end{figure}

Rys. \ref{fig:1-5} przedstawia graficzne porównanie wzmacniaczy o dwóch
różnych parametrach $K$.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-opamp-neg-inv--combined-logscale--01-output-k1.csv}.png}
  \caption{Wzmacniacz odwracający. Zielony $K=1$, niebieski $K=100$.}
  \label{fig:1-5}
\end{figure}

## Wtórnik napięciowy

Zadanie polegało na zmierzeniu rezystancji wejściowej i charakterystyki
wtórnika napięcia.

### Wprowadzenie

Wtórnik napięciowy, przedstawiony na rys. \ref{fig:2-0} to szczególny
przypadek wzmacniacza nieodwracającego.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.5\textwidth]{images/02-opamp-neg-noninv.png}
  \caption{Wtórnik napięciowy. Źródło: instrukcja laboratoryjna.}
  \label{fig:2-0}
\end{figure}

Napięcie wyjściowe idealnego wtórnika jest równe napięciu wejściowemu:

\begin{equation}
U_{wy} = U_{we}
\end{equation}

### Charakterystyka K(f)

Mierzyłem wzmocnienie wtórnika w funkcji częstotliwości. Wyniki pomiarów
przedstawione są na rys. \ref{fig:2-1}. Widać, że wtórnik ma szerokie
pasmo przenoszenia, aż do $f_g \approx 1\,\text{MHz}$.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-opamp-neg-noninv-logscale--02-output-woR1.csv}.png}
  \caption{Wzmocnienie wtórnika napięciowego.}
  \label{fig:2-1}
\end{figure}

### Opór wewnętrzny

W celu pomiaru wewnętrznego oporu wejściowego $R_{we}$ wtórnika, na wejściu
odwracającym włączyłem opornik $R_3 = 10.04\,\text{M}\Omega$.

Z powstałego dzielnika napięcia widać że:

\begin{equation}
\frac{U_{we}'}{U_{we}} = \frac{R_{we}}{R_3 + R_{we}}
\end{equation}

Napięcie $U_{we}'$ to napięcie między opornikiem $R_3$ a wejściem odwracającym
wzmacniacza - jest równe $U_{wy}$.

Z powyższej zależności wynika:

\begin{equation}
R_{we} = \frac{K}{1-K} R_3
\end{equation}

Należało wyznaczyć opór przy częstotliwości $f=5\,\text{kHz}$. Z pomiarów
otrzymałem $K=0.701$, co daje:

\begin{equation}
R_{we} \approx 23.58\,\text{M}\Omega
\end{equation}

Pomiary dla różnych częstotliwości przedstawia rys. \ref{fig:2-2}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-opamp-neg-noninv-inimp-logscale--02-output-wR1R3.csv}.png}
  \caption{Opór wewnętrzny wtórnika napięciowego.}
  \label{fig:2-2}
\end{figure}

## Wzmacniacz różniczkująco - całkujący

Zadanie polegało na wyznaczeniu charakterystyki częstotliwościowej wzmacniacza
różniczkująco - całkującego, wyznaczeniu częstotliwości granicznych oraz
porównaniu ich z wartościami teoretycznymi.

## Wprowadzenie

Wzmacniacz różniczkująco - całkujący przedstawiony jest na rys.
\ref{fig:3-0}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.5\textwidth]{images/03-opamp-neg-intdiff.png}
  \caption{Wzmacniacz różniczkująco-całkujący. Źródło: instrukcja laboratoryjna.}
  \label{fig:3-0}
\end{figure}

Funkcja transmisji wyraża się przez zespolone impedancje zastępcze par
opornik-kondensator:

\begin{equation}
T(\omega) = \frac{U_{wy}}{U_{we}} = -\frac{Z_2}{Z_1}
\end{equation}

Charakterystyka amplitudowa:

\begin{equation}
|T(\omega)| = \sqrt{TT*} = \frac{f/f_0}{ \sqrt{(1+(f/f_1)^2)(1+(f/f_2)^2)} }
\end{equation}

gdzie:

\begin{equation}
f_0 = \frac{1}{2\pi R_2 C_1}, \qquad
f_1 = \frac{1}{2\pi R_1 C_1}, \qquad
f_2 = \frac{1}{2\pi R_2 C_2}
\end{equation}

### Charakterystyka amplitudowa

Do budowy układu wykorzystałem następujące elementy:

* $C_1 = 93.2\,\text{nF}$,
* $R_1 = 1475.0\,\Omega$,
* $C_2 = 8.53\,\text{nF}$,
* $R_2 = 156.4\,\Omega$.

Daje to teoretyczne częstotliwości graniczne:

* $f_1 = 1.157\,\text{kHz}$,
* $f_2 = 119.3\,\text{kHz}$.

Napięcie wejściowe ustawiłem na $V_1=1\,\text{mVpp}$.

W celu ich potwierdzenia eksperymentalnego, do danych pomiarowych dopasowałem
funkcję transmisji przedstawioną w poprzednim punkcie. Otrzymane parametry
dopasowania to:

* $f_0 = 9.60(25)\,\text{kHz}$,
* $f_1 = 0.955(27)\,\text{kHz}$,
* $f_2 = 169.5(4.7)\,\text{kHz}$.

Widać że dolna częstotliwość graniczna jest bardzo zbliżona do wartości
teoretycznej. Otrzymana wartość górna jest natomiast istotnie większa.

Dopasowaną krzywa przedstawia rys. \ref{fig:3-1}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-opamp-diffint-ampl-logscale--03-output-1Vpp.csv}.png}
  \caption{Charakterystyka amplitudowa wzmacniacza różniczkująco-całkującego.}
  \label{fig:3-1}
\end{figure}

Charakterystyka fazowa tego układu przedstawiona jest na rys. \ref{fig:3-2}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-opamp-diffint-phase-logscale--03-output-1Vpp.csv}.png}
  \caption{Charakterystyka fazowa wzmacniacza różniczkująco-całkującego.}
  \label{fig:3-2}
\end{figure}


## Przerzutnik Schmidta

Zadanie polegało na skonstruowaniu przerzutnika Schmidta i zaobserwowaniu jego
właściwości.

### Wprowadzenie

Przerzutnik Schmidta to wzmacniacz operacyjny z dodatnią pętlą sprzężenia
zwrotnego, przedstawiony na rys. \ref{fig:4-0}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.3\textwidth]{images/04-opamp-latch-schmidt.png}
  \caption{Przerzutnik Schmidta. Źródło: instrukcja laboratoryjna.}
  \label{fig:4-0}
\end{figure}

Napięcie na wejściu "+" wynosi:

\begin{equation}
U_{+} = \frac{R_2}{R_1+R_2} U_{wy} = U_{p}
\end{equation}

Napięcie to nazywane jest napięciem przerzuti, ponieważ jeżeli $|U_{we}|$
przekroczy tę wartość, $U_{wy}$ zmienia znak na przeciwny.

Ponieważ wzmocnienie idealnego wzmacniacza jest nieskończone, $|U_{wy}|$ jest
ograniczone przez napięcie $E$ zasilające wzmacniacz.

### Napięcie przerzutu

Do budowy układu wykorzystałem elementy:

* $R_1=9.96\,\text{k}\Omega$,
* $R_2=0.990\,\text{k}\Omega$.

Dla sygnału wejściowego $U_{we} = 2\,\text{Vpp} = 1\,\text{V}$ daje to
teoretyczne napięcie przerzutu:

\begin{equation}
U_{p} \approx 0.9 U_{we} = 0.90\,\text{V}
\end{equation}

Zaobserwowany przebieg dla sygnału sinusoidalnego z $f=10\,\text{kHz}$
przedstawiony jest na rys. \ref{fig:4-1}. Analogiczny przebieg dla
$f=2\,\text{kHz}$ przedstawiony jest na rys. \ref{fig:4-2}. Nieznaczne
zmniejszenie napięcia powoduje zanik efektu przerzutów (rys. \ref{fig:4-3}).
Odczytane napięcie przerzutu to $U_p=2.049\,\text{Vpp} \approx 1.0\,\text{V}$.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{plots/tek00708.png}
  \caption{Przerzutnik Schmidta, $f=10\,\text{kHz}$.}
  \label{fig:4-1}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{plots/tek00713.png}
  \caption{Przerzutnik Schmidta, $f=2\,\text{kHz}$.}
  \label{fig:4-2}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{plots/tek00712.png}
  \caption{Przerzutnik Schmidta, $f=2\,\text{kHz}$. Napięcie przerzutu.}
  \label{fig:4-3}
\end{figure}

### Sygnał trójkątny

Należało zaobserwować wyjście z układu dla sygnału trójkątnego. Przedstawia
je rys. \ref{fig:4-4}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{plots/tek00729.png}
  \caption{Przerzutnik Schmidta, $f=4\,\text{kHz}$. Sygnał trójkątny.}
  \label{fig:4-4}
\end{figure}

### Pętla histerezy

Pętla histerezy układu przedstawiona jest na rys. \ref{fig:4-5}. Kursorami
mierzyłem wysokość oraz szerokość pętli. Otrzymane wartości to:

* $U_x = 2.09\,\text{V}$,
* $U_y = 21.0\,\text{V}$.

Zgodnie z teorią pierwsza z wartości powinna wynosić $2 V_p$, natomiast druga
$2 E$. W układzie $V_p \approx 1\,\text{V}$, a napięcie zasilające $E \approx
12\,\text{V}$. Wyniki są więc zgodne z wartościami teoretycznymi.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{plots/tek00723.png}
  \caption{Przerzutnik Schmidta, $f=2\,\text{kHz}$. Pętla histerezy.}
  \label{fig:4-5}
\end{figure}

## Multiwibrator astabliny

Zadanie polegało na badaniu cech multiwibratora astabilnego.

### Wprowadzenie

Multiwibrator astabilny to wzmacniacz operacyjny, niewymagający doprowadzenia
zewnętrznego napięcia wejściowego, dzięki wykorzystaniu kondensatora ładowanego
naprzemian ładunkiem o przeciwnym znaku.

Układ przedstawiony jest na rys. \ref{fig:5-0}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.3\textwidth]{images/05-opamp-latch-nonstable.png}
  \caption{Multiwibrator astabilny. Źródło: instrukcja laboratoryjna.}
  \label{fig:5-0}
\end{figure}

Napięcie oznaczone punktem (1) nazywa się napięciem wejściowym $U_{we}$. Jest
zadane przez napięcie na okładkach kondensatora.

### Przebieg impulsów

Należało zaobserwować przebieg impulsów w układzie. Napięcie wejściowe (1) oraz
wyjściowe przedstawia rys. \ref{fig:5-1}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{plots/tek00733.png}
  \caption{Multiwibrator astabilny.}
  \label{fig:5-1}
\end{figure}

### Okres przerzutów

Okres przerzutów multiwibratora astabilnego wynosi (oznaczenia jak na rys
\ref{fig:5-0}):

\begin{equation}
\begin{aligned}
T &= 2 C R \ln\left(\frac{1+\gamma}{1-\gamma}\right)\\
\gamma &= \frac{R_2}{R_1+R_2}
\end{aligned}
\end{equation}

W zadaniu należało wyznaczyć okres przerzutów dla kilku różnych wartości
iloczynu $CR$ oraz kilku różnych wartości współczynnika $\gamma$.

Przy pomocy kursorów mierzyłem połowę okresu przebiegu wejściowego. Dodatkowo,
w oscyloskopie włączyłem automatyczny pomiar częstotliwości, aby zweryfikować
odczytany okres.

Pomiary wraz z parametrami układu zebrałem w tabelce:

tek | $C [\text{nF}]$ | $R_f [\text{k}\Omega]$ | $R_1 [\text{k}\Omega]$ | $R_2 [\text{k}\Omega]$ | $f [\text{Hz}]$ | $\gamma$ | $T [\text{ms}]$ | $T\, \text{(pomiar)}$
--- | ------ | ------ | ------ | ------ | ------ | --------- | -------- | ----------
736 | 93.0 | 10.06 | 9.90 | 9.90   | 461  | 0.5          | 2.0556794 | 2.200
737 | 9.11 | 10.06 | 9.90 | 9.90   | 4026 | 0.5          | 0.2013682 | 0.2472
738 | 93.0 | 10.06 | 9.90 | 46.20  | 218  | 0.8235294118 | 4.3698601 | 4.520
739 | 93.0 | 10.06 | 9.90 | 19.920 | 317  | 0.6680080483 | 3.0205662 | 3.072

Wartości wyznaczone przez pomiar kursorami są zgodne z wartościami wyliczonymi
z teoretycznej zależności.
