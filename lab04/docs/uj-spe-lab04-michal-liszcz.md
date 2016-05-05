---
title: Pracownia elektroniczna
subtitle: |
  ćw. 4: Wzmacniacz tranzystorowy w układzie o wspólnym emiterze.\
  prowadzący: dr hab. Janusz Brzychczyk\
author: Michał Liszcz
date: 22.04.2016
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

Ćwiczenie polegało na zbadaniu własności układu wzmacniacza tranzystorowego,
opartego o tranzystor bipolarny w układzie o wspólnym emiterze. Badany układ
przedstawiony jest na rys. \ref{fig:ampl-01}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{images/ampl-01.png}
  \caption{Wzmacniacz tranzystorowy. Źródło: instrukcja laboratoryjna.}
  \label{fig:ampl-01}
\end{figure}

We wzmacniaczu w układzie wspólnego emitera, emiter przyłączony jest do masy,
napięcie wejściowe podawane jest na obwód baza-emiter, natomiast wyjściowe
otrzymywane jest w obwodzie kolektor-emiter.

Sygnał wyjściowy to $k$-krotnie wzmocniony sygnał wejściowy, gdzie $k$ to
współczynnik wzmocnienia napięciowego (dla składowych zmiennych):

\begin{equation}
U_{wy} = k \cdot U_{we}
\end{equation}

Powyższa zależność jest prawdziwa w ograniczonym zakresie napięć wejściowych -
jest to tak zwany zakres liniowości, wyznaczony w dalszej części ćwiczenia.

Układ ma charakterystykę filtra środkowoprzepustowego, częstotliwości graniczne
wyznaczone są w dalszej części.

# Wykonane zadania

W ramach laboratorium wykonałem 5 ćwiczeń opisanych w instrukcji.

## Zmontowanie układu

Zbudowałem układ opisany w poprzednim rozdziale.

Do budowy układu wykorzystałem następujące elementy:

* $R_1 = 9.99\,\text{k}\Omega$,
* $R_2 = 2.994\,\text{k}\Omega$,
* $R_E = 2.985\,\text{k}\Omega$,
* $R_{E1} = 102.2\,\Omega$,
* $R_C = 5.590\,\text{k}\Omega$,
* $C_1 = C_2 = C_E = 47\,\mu\text{F}$.

Układ był zasilany napięciem $U_{CC} = 15\,\text{V}$.

## Wyznaczanie napięć stałych

Przy użyciu multimetra mierzyłem napięcia stałe. Otrzymałem następujące
wartości (mierząc względem masy):

* $U_B = 3.473\,\text{V}$,
* $U_E = 2.884\,\text{V}$,
* $U_C = 9.69\,\text{V}$.

Dodatkowo zmierzyłem:

* $U_{BE} = 0.628\,\text{V}$,
* $U_{CE} = 6.86\,\text{V}$.

Zgodnie z teorią napięcie $U_B$ będzie zadane przez dzielnik napięcia $R1$,
$R2$ oraz napięcie $U_{CC}$:

\begin{equation}
U_B \approx \frac{R_2}{R_1+R_2} U_{CC} \approx 3.459\,\text{V}
\end{equation}

Otrzymana wartość teoretyczna jest zgodna z wartością zmierzoną. Ponieważ
tranzystor zbudowany jest ze złącz krzemowych, $U_{BE}$ powinno wynosić około
$0.65\,\text{V}$. Pomiar potwierdza tę wartość. Napięcie $U_E$ powinno być:

\begin{equation}
U_E \approx U_B - U_{BE} = 2.809\,\text{V}
\end{equation}

Wynik znów jest bardzo zbliżony do zmierzonej wartości. W celu obliczenia
napięcia kolektora należy założyć że prąd kolektora jest w przybliżeniu równy
prądowi emitera (prąd bazy pomijalnie mały). Napięcie na kolektorze to
napięcie zasilające pomniejszone o spadek napięcia na oporniku $R_C$:

\begin{equation}
\begin{aligned}
I_C &\approx I_E = \frac{U_E}{R_E} \approx 0.941\,\text{mA}\\
U_C &= U_{CC} - R_C I_C \approx 9.740\,\text{V}
\end{aligned}
\end{equation}

Wynik znów jest zgodny ze zmierzoną wartością.

## Wzmocnienie i zakres liniowości wzmacniacza

Dla częstotliwości $f = 1\,\text{kHz}$ należało zmierzyć wzmocnienie oraz
wyznaczyć zakres liniowości wzmacniacza.

Teoretyczne wzmocnienie napięciowe powinno wynosić:

\begin{equation}
k = \frac{U_{wy}}{U_{we}} \approx - \frac{R_C}{r_e + R_{E1}}
\end{equation}

Oznaczenia jak na rysunku układu. $r_e$ to rezystancja dynamiczna złącza
emiterowego i należy tutaj przyjąć $r_e \approx 26\,\text{mV}/I_E$:

\begin{equation}
k \approx - \frac{R_C}{26\,\text{mV} \cdot R_E/U_E + R_{E1}} \approx -43.296
\end{equation}

Wzmocnienie jest ujemne, ponieważ sygnał wyjściowy jest przesunięty w fazie o
$180\degree$.

W celu eksperymentalnego pomiaru wzmocnienia, dla napięć wejściowych z zakresu
$50-300\,\text{mVpp}$ mierzyłem napięcie wyjściowe. Do danych pomiarowych
dopasowałem funkcję (z pominięciem znaku -):

\begin{equation}
U_{wy}(U_{we}) = k U_{we}
\end{equation}

Dopasowywałem kolejne punkty powyżej $U_{we} = 200\,\text{mVpp}$ dopóki błąd
dopasowania nie osiągnął globalnego minimum. Otrzymałem wartość współczynika
$k$:

\begin{equation}
k = 41.50(19)
\end{equation}

Otrzymany wynik jest zgodny z wartością wyliczoną teoretycznie. W ten sposób
ustaliłem też zakres liniowości wzmacniacza - ostatnia akceptowalna wartość
$U_{wy}$ była dla:

\begin{equation}
U_{we}^{\text{max}} = 220.0\,\text{mVpp}
\end{equation}

Dopasowana prosta przedstawiona jest na rys. \ref{fig:3-0}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{plots/{fig-03-ampl-nologscale--results03.csv}.png}
  \caption{Pomiar wzmocnienia napięciowego.}
  \label{fig:3-0}
\end{figure}

## Pasmo przenoszenia

Należało zbadać pasmo przenoszenia wzmacniacza. W tym celu wyznaczyłem
charakerystyki amplitudową i fazową, przy napięciu wejściowym wynoszącym
$U_{we} = 80.0,\text{mVpp}$.

Częstotliwość graniczna to częstotliwość, gdzie wzmocnienie układu spada o
$-3\,\text{dB}$ w stosunku do wartości maksymalnej (równoważne spadkowi o
połowę). Wiąże się to ze spadkiem amplitudy do $0.707$ wartości maksymalnej
($-3\,\text{[dB]} \approx 20 \log(0.707))$.


Wyniki pomiarów przedstawiłem na rys. \ref{fig:4-0} oraz \ref{fig:4-1}.
Przyjmując że średnie maksymalne wzmocnienie wynosi około $41.50$, wzmocnienie
graniczne to około $29.00$. Odczytałem następujące wartości częstotliwości
graniczne:

* $f_d \approx 30\,\text{Hz}$,
* $f_g \approx 185000\,\text{Hz}$.

Teoretyczna zależność dolnej częstotliwości granicznej od parametrów układu to:

\begin{equation}
\begin{aligned}
f_d &= 1 / (2\pi R_t C_E)\\
R_t &= r_e + R_{E1}
\end{aligned}
\end{equation}

Podstawiając, otrzymałem wartość zgodną z wartością wyznaczoną pomiarami:

\begin{equation}
f_d \approx 26.23\,\text{Hz}
\end{equation}

Otrzymana wartość jest zgodna z wartością odczytaną z wykresu. Górnej
częstotliwości granicznej nie można w prosty sposób wyliczyć teoretycznie.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{plots/{fig-04-ampl-logscale--results04.csv}.png}
  \caption{Pomiar wzmocnienia w funkcji częstotliwości.}
  \label{fig:4-0}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{plots/{fig-04-phase-logscale--results04.csv}.png}
  \caption{Pomiar przesunięcia fazowego w funkcji częstotliwości.}
  \label{fig:4-1}
\end{figure}

## Oporność wejściowa i wyjściowa

Zadanie polegało na pomiarze oporności wejściowej i wyjściowej.

### Oporność wejściowa

Oporność wejściową należy mierzyć dołączając na wejście znany opór $R$, tak
jak to przedstawia rys. \ref{fig:imp-in-01}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.3\textwidth]{images/imp-in-01.png}
  \caption{Pomiar oporu wejściowego. Źródło: instrukcja laboratoryjna.}
  \label{fig:imp-in-01}
\end{figure}

Opór $R$ wraz z oporem wejściowym $R_{we}$ utworzy dzielnik napięcia:

\begin{equation}
U_{we}' = \frac{R_{we}}{R+R_{we}} U_{we}
\end{equation}

Dokonałem kilkukrotnego pomiaru napięć i do zmierzonych wartości dopasowałem
funkcję przedstawioną powyżej. Otrzymałem opór wejściowy:

\begin{equation}
R_{we} = 2109(60)\,\Omega
\end{equation}

Dopasowaną prostą przedstawia rys. \ref{fig:5-0}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{plots/{fig-05-in-ampl-nologscale--results05in.csv}.png}
  \caption{Pomiar rezystancji wejściowej.}
  \label{fig:5-0}
\end{figure}

Rezystancję wejściową można obliczyć korzystając z teoretycznych zależności:

\begin{equation}
\begin{aligned}
R_{we} &= \left( \frac{1}{R_B} + \frac{1}{\beta(r_e+R_{E1})} \right)^{-1} \\
R_B &= \left( \frac{1}{R_1} + \frac{1}{R_2} \right)^{-1}
\end{aligned}
\end{equation}

Przyjąłem $\beta = 160$, otrzymując teoretyczny opór wejściowy:
\begin{equation}
R_{we} \approx 2019\,\Omega
\end{equation}

Po uwzględnieniu niepewności pomiarowych wynik ten jest bardzo zbliżony do
wartości wyznaczonej doświadczalnie.

### Oporność wyjściowa

Analogicznie obliczyłem oporność wyjściową. Układ pomiarowy przedstawia rys.
\ref{fig:imp-out-01}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.45\textwidth]{images/imp-out-01.png}
  \caption{Pomiar oporu wyjściowego. Źródło: instrukcja laboratoryjna.}
  \label{fig:imp-out-01}
\end{figure}

Podając na wejście $U_{we}$
mierzyłem $U_{wy}$ nieobciążonego wzmacniacza. $U_{wy} = k U_{we}$.
Następnie dołączałem obciążenie o znanym oporze $R_{obc}$ i mierzyłem spadek
napięcia na tym oporze:

\begin{equation}
U_{wy}' = \frac{R_{obc}}{R_{obc} + R_{wy}} k U_{we} =
\frac{R_{obc}}{R_{obc} + R_{wy}} U_{wy}
\end{equation}

Do wyników pomiarów dopasowałem prostą przedstawioną zależnością powyżej.
Otrzymałem parametr:

\begin{equation}
R_{wy} \approx 5941(50)\,\Omega
\end{equation}

Oczekiwana oporność wyjściowa powinna być zbliżona do $R_C = 5590\,\Omega$.
Udało mi się potwierdzić ten wynik. Dopasowana prosta przedstawiona jest na
rys. \ref{fig:5-1}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{plots/{fig-05-out-ampl-nologscale--results05out-combined.csv}.png}
  \caption{Pomiar rezystancji wyjściowej.}
  \label{fig:5-1}
\end{figure}
