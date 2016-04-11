---
title: Pracownia elektroniczna
subtitle: |
  ćw. 2: Czwórniki, linia długa.\
  prowadzący: dr hab. Janusz Brzychczyk\
author: Michał Liszcz
date: 18.03.2016
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

Podstawy teoretyczne związane z poszczególnymi zadaniami znajdują się w
odpowiadających im rozdziałach.

# Parametry układów

Układy elektryczne omawiane w kolejnych punktach budowałem z wykorzystaniem
płytki RLC16 zawierającej następujące elementy:

* $L = 10 \,\text{mH}$
* $C = 3.65 \,\text{nF}$
* $R = 1.775 \,\text{k}\Omega$

Stała czasowa i częstotliwość graniczna dla układów CR i RC wynosi:

\begin{equation}
\begin{aligned}
\tau &= RC = 6.479 \,\mu\text{s}\\
f_0 &= \frac{1}{2 \pi \tau} = 24565.69 \,\text{Hz}
\end{aligned}
\end{equation}

# Wykonane zadania

W ramach laboratorium wykonałem 5 ćwiczeń opisanych w instrukcji.

## Układ rózniczkujący - charakterystyki

To zadanie polegało na zbadaniu charakterystyk układu różniczkujacego.

### Wprowadzenie

Układ różniczkujący to czwórnik CR, nazywany również filtrem górnoprzepustowym.
Schemat układu przedstawia rys. \ref{fig:circCr}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{images/circuit-cr.png}
  \caption{Czwórnik CR. Układ różniczkujący. Źródło: instrukcja laboratoryjna.}
  \label{fig:circCr}
\end{figure}

Funkcja transmisji powyższego układu wynosi:

\begin{equation}
T(f) = \frac{Z_R}{Z_R+Z_C} = \frac{j\frac{f}{f_0}}{1+j\frac{f}{f_0}}
\end{equation}

Gdzie $f_0$ to częstotliwość graniczna:

\begin{equation}
f_0 = \frac{1}{2 \pi \tau}
\end{equation}

a $\tau = RC$ to stała czasowa.

Charakterystyką amplitudową nazywa się zależność $|T(f)|$:

\begin{equation}
|T(f)|=\sqrt{\frac{
  \left(\frac{f}{f_0}\right)^2
}{
  1+\left(\frac{f}{f_0}\right)^2
}}
\end{equation}

Zależność przesunięcia fazowego od częstotliwości nazywa się
charakterystyką fazową:

\begin{equation}
\Phi(f) = \arctan\left(\frac{\Im T(f)}{\Re T(f)}\right) = \arctan\left(\frac{f_0}{f}\right)
\end{equation}

### Wyznaczone charakterystyki

W celu wyznaczenia charakterystyk ustawiłem na generatorze amplitudę fali
sinusoidalnej na $4\,\text{mVpp}$ i mierzyłem amplitudy napięcia wejściowego
oraz wyjściowego i przesunięcie fazowe w szerokim zakresie częstotliwości.

Do danych pomiarowych dopasowałem krzywe teoretyczne, z parametrem $f_0$.
Otrzymałem wartości:

* charakterystyka amplitudowa: $f_0 = 29150(280) \,\text{Hz}$
* charakterystyka fazowa: $f_0 = 26190(240) \,\text{Hz}$

Druga z wartości jest bardzo zbliżona do wartości teoretycznej
$f_0 = 24565.69 \,\text{Hz}$, nie są jednak zgodne, po uwzględnieniu
niepewności. Jest to spowodowane niedokładnymi pomiarami i niedoskonałościami
przyrządów pomiarowych.

Dopasowane krzywe przedstawione są na rys. \ref{fig:crAmplNolog},
\ref{fig:crAmplLog}, \ref{fig:crPhaseNolog} oraz \ref{fig:crPhaseLog}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-cr-ampl-nologscale--results-cr-1.csv}.png}
  \caption{Czwórnik CR. Układ różniczkujący. Charakterystyka amplitudowa. Skala liniowa.}
  \label{fig:crAmplNolog}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-cr-ampl-logscale--results-cr-1.csv}.png}
  \caption{Czwórnik CR. Układ różniczkujący. Charakterystyka amplitudowa. Skala logarytmiczna.}
  \label{fig:crAmplLog}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-cr-phase-nologscale--results-cr-1.csv}.png}
  \caption{Czwórnik CR. Układ różniczkujący. Charakterystyka fazowa. Skala liniowa.}
  \label{fig:crPhaseNolog}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-cr-phase-logscale--results-cr-1.csv}.png}
  \caption{Czwórnik CR. Układ różniczkujący. Charakterystyka fazowa. Skala logarytmiczna.}
  \label{fig:crPhaseLog}
\end{figure}

## Układ różniczkujacy - odpowiedź dla sygnału prostokątnego

To zadanie polegało na sprawdzeniu odpowiedzi układu różniczkującego dla
impulsów prostokątnych o różnym okresie.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00066.png}
  \caption{Różniczkowanie impulsu prostokątnego. Mała częstotliwość, duży
    okres, poprawne różniczkowanie.}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00067.png}
  \caption{Różniczkowanie impulsu prostokątnego. Okres porównywalny ze stałą
    czasową.}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00068.png}
  \caption{Różniczkowanie impulsu prostokątnego. Okres dużo mniejszy od stałej
    czasowej. Powolna reakcja układu różniczkującego na zmianę sygnału.}
\end{figure}

## Układ całkujący

To zadanie polegało na zbadaniu charakterystyk układu całkującego oraz czasu
narastania impulsu wyjściowego.

### Wprowadzenie

Układ całkujący to czwórnik RC, nazywany również filtrem dolnoprzepustowym.
Schemat układu przedstawia rys. \ref{fig:circRc}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{images/circuit-rc.png}
  \caption{Czwórnik RC. Układ całkujący. Źródło: instrukcja laboratoryjna.}
  \label{fig:circRc}
\end{figure}

Funkcja transmisji powyższego układu wynosi:

\begin{equation}
T(f) = \frac{Z_C}{Z_C+Z_R} = \frac{1}{1+j\frac{f}{f_0}}
\end{equation}


Charakterystyka amplitudowa:

\begin{equation}
|T(f)|=\sqrt{\frac{1}{
  1+\left(\frac{f}{f_0}\right)^2
}}
\end{equation}

Charakterystyka fazowa:

\begin{equation}
\Phi(f) = \arctan\left(\frac{\Im T(f)}{\Re T(f)}\right) = - \arctan\left(\frac{f}{f_0}\right)
\end{equation}

### Wyznaczone charakterystyki

W celu wyznaczenia charakterystyk ustawiłem na generatorze amplitudę fali
sinusoidalnej na $4\,\text{mVpp}$ i mierzyłem amplitudy napięcia wejściowego
oraz wyjściowego i przesunięcie fazowe w szerokim zakresie częstotliwości.

Do danych pomiarowych dopasowałem krzywe teoretyczne, z parametrem $f_0$.
Otrzymałem wartości:

* charakterystyka amplitudowa: $f_0 = 25640(220) \,\text{Hz}$
* charakterystyka fazowa: $f_0 = 26580(880) \,\text{Hz}$

Jak poprzednio, otrzymane wyniki są zbliżone, jednak niezgodne z wartością
teoretyczną $f_0 = 24565.69 \,\text{Hz}$.

Dopasowane krzywe przedstawione są na rys. \ref{fig:rcAmplNolog},
\ref{fig:rcAmplLog}, \ref{fig:rcPhaseNolog} oraz \ref{fig:rcPhaseLog}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-rc-ampl-nologscale--results-rc-3.csv}.png}
  \caption{Czwórnik RC. Układ całkujący. Charakterystyka amplitudowa. Skala liniowa.}
  \label{fig:rcAmplNolog}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-rc-ampl-logscale--results-rc-3.csv}.png}
  \caption{Czwórnik RC. Układ całkujący. Charakterystyka amplitudowa. Skala logarytmiczna.}
  \label{fig:rcAmplLog}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-rc-phase-nologscale--results-rc-3.csv}.png}
  \caption{Czwórnik RC. Układ całkujący. Charakterystyka fazowa. Skala liniowa.}
  \label{fig:rcPhaseNolog}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-rc-phase-logscale--results-rc-3.csv}.png}
  \caption{Czwórnik RC. Układ całkujący. Charakterystyka fazowa. Skala logarytmiczna.}
  \label{fig:rcPhaseLog}
\end{figure}

### Czas narastania

Czas narastania impulsu zdefiniowany jest jako czas w którym wartość mierzonego
impulsu wzrasta z $0.1$ amplitudy do $0.9$ amplitudy.

W celu oszacowania czasu narastania układu RC, zgodnie z poleceniem na
generatorze ustawiłem częstotliwość odpowiadającą okresowi $T = 5\tau$,
$f \approx 30 \,\text{kHz}$. Następnie ustawiłem kursory na wartościach
zbliżonych do $0.1 \,\text{Vpp}$ oraz $0.9 \,\text{Vpp}$. Odczytany czas
narastania to $10.76 \,\mu\text{s}$.

Przebieg pomiaru przedstawia rys. \ref{fig:tek227}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00227.png}
  \caption{Pomiar czasu narastania.}
  \label{fig:tek227}
\end{figure}

### Stała czasowa

Stałą czasową układu można wyznaczyć w alternatywny sposób, korzystając z
analitycznej postaci odpowiedzi układu na sygnał prostokątny:

\begin{equation}
  u_1(t) =
    \begin{cases}
      U & \text{dla } 0 < t < t_p \\
      0 & \text{dla } t < 0, t > t_p
    \end{cases}
\end{equation}

\begin{equation}
  u_2(t) =
    \begin{cases}
      U\left(1-\mathrm{e}^{-t/\tau}\right)                      & \text{dla } 0 < t < t_p \\
      U\left(\mathrm{e}^{t_p/\tau}-1\right)\mathrm{e}^{-t/\tau} & \text{dla } t < 0, t > t_p
    \end{cases}
  \label{eq:rcu2}
\end{equation}

Dla częstotliwości $f = 10 \,\text{kHz}$ ($t_p = 50 \,\mu\text{s}$) dokonałem
pomiarów wartości $u_2(t)$ w przedziałach $[0,t_p]$ oraz $[t_p, 2t_p]$ a
następnie do danych pomiarowych dopasowałem krzywe opisane równaniami
\eqref{eq:rcu2}.

Otrzymałem wartości:

\begin{equation}
  \tau =
    \begin{cases}
      5.98(17) \,\mu\text{s} & \text{dla } 0 < t < t_p \\
      6.444(55) \,\mu\text{s} & \text{dla } t < 0, t > t_p
    \end{cases}
\end{equation}

Otrzymane wyniki są zbliżone do wartości teoretycznej
$\tau = 6.479 \,\mu\text{s}$.

Sposób pomiaru przedstawiony jest na rys. \ref{fig:tek115}, natomiast
dopasowane krzywe na rys. \ref{fig:rcrisefall}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00115.png}
  \caption{Wyznaczanie stałej $\tau$.}
  \label{fig:tek115}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-rc-tau-rise-fall--results-rc-rise-3.csv--results-rc-fall-3.csv}.png}
  \caption{Wyznaczanie stałej $\tau$. Dopasowane krzywe.}
  \label{fig:rcrisefall}
\end{figure}

## Czwórnik RLC (równoległy LC)

To zadanie polegało na badaniu charakterystyk układu RLC z cewką i
kondensatorem połączonymi równolegle. Dodatkowo wyznaczona została
częstotliwość rezonansowa.

### Wprowadzenie

Badany układ to czwórnik, gdzie szeregowo połączony jest opornik z układem
równoległej cewki i kondensatora, przedstawiony na rys. \ref{fig:circRlc}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{images/circuit-rlc.png}
  \caption{Czwórnik RLC. Źródło: instrukcja laboratoryjna.}
  \label{fig:circRlc}
\end{figure}

W takim układzie można zaobserwować rezonans prądów - prądy cewki i
kondensatora zniosą się wzajemnie, tworząc przerwę w obwodzie o nieskończonej
impedancji.

Impedancja zastępcza układu LC wynosi:

\begin{equation}
Z_{LC} = \left(\frac{1}{Z_L} + \frac{1}{Z_C}\right)^{-1} = j \frac{1}{\frac{1}{\omega L} - \omega C}
\end{equation}

Z powyższego wzoru, częstość rezonansowa $\omega_0$ wynosi:

\begin{equation}
\omega_0 = \frac{1}{\sqrt{LC}}
\end{equation}

Teoretyczna częstotliwość rezonansowa to $f_0 = \frac{1}{2 \pi \sqrt{LC}}
\approx 26343.51 \,\text{Hz}$.

Dla układu RLC można również zdefiniować charakterystykę amplitudową i fazową:

\begin{equation}
\begin{aligned}
|T(f)| &= \left|\frac{Z_R}{Z_R + Z_{LC}}\right| = \sqrt{\frac{R^2}{
  R^2 + \left(\frac{1}{\frac{1}{2 \pi f L} - 2 \pi f C}\right)^2
}} \\
\Phi(f) &= \arctan\left(\frac{\Im T(f)}{\Re T(f)}\right) =
\arctan\left(\frac{-1}{R\left(\frac{1}{2 \pi f L} - 2 \pi f C\right)}\right)
\end{aligned}
\end{equation}

### Charakterystyki i rezonans

W celu wykreślenia charakterystyk i wyznaczenia częstotliwości rezonansowej,
wykonałem w jej pobliżu pomiary amplitudy oraz przesunięcia fazowego w układzie.

Do wyników pomiarów dopasowałem krzywe teoretyczne, z parametrami $L$ i $C$.
Wartość $R$ była ustalona, zgodnie z wartością zmierzoną. Otrzymałem wyniki
zgodne z wartością teoretyczną:

* charakterystyka amplitudowa: $f_0 = 26321.70 \,\text{Hz}$
* charakterystyka fazowa: $f_0 = 26340.00 \,\text{Hz}$.

Dopasowane krzywe przedstawione są na rys. \ref{fig:rlcAmplFit} oraz
\ref{fig:rlcPhaseFit}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-mathematica-rlc-4-ampl-filtered}.png}
  \caption{Charakterystyka amplitudowa. Krzywa dopasowana.}
  \label{fig:rlcAmplFit}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{{plots/fig-mathematica-rlc-4-phase-filtered}.png}
  \caption{Charakterystyka fazowa. Zielony - krzywa teoretyczna, niebieski - krzywa dopasowana.}
  \label{fig:rlcPhaseFit}
\end{figure}

## Linia długa

Ostatnie zadanie polegało na zbadaniu lini długiej bez strat, będącej
idealizacją lini transmisyjnej o długości porównywalnej z długością fali
przebiegu elektrycznego.

### Wprowadzenie

Propagację sygnału w linii długiej opisuje para równań:

\begin{equation}
\begin{aligned}
\frac{\partial u(x,t)}{\partial x} &= L \frac{\partial i(x,t)}{\partial t} + R i(x,t) \\
\frac{\partial i(x,t)}{\partial x} &= C \frac{\partial u(x,t)}{\partial t} + G u(x,t)
\end{aligned}
\end{equation}

Gdzie $R, G, L, C$ to stałe parametry linii, wyrażone na jednostkę długości.

Dla sygnału sinusoidalnego na wejściu, rozwiązanie to złożenie fali
biegnącej i odbitej:

\begin{equation}
\begin{aligned}
u(x,t) &= \left(A_1 \mathrm{e}^{\gamma x} + A_2 \mathrm{e}^{-\gamma x}\right) \mathrm{e}^{j\omega t} \\
i(x,t) &= \frac{1}{Z_0} \left(A_1 \mathrm{e}^{\gamma x} - A_2 \mathrm{e}^{-\gamma x}\right) \mathrm{e}^{j\omega t} \\
\end{aligned}
\end{equation}

Stała $Z_0$ to impedancja charakterystyczna linii:

\begin{equation}
Z_0 = \sqrt{\frac{R+j\omega L}{G + j\omega C}}
\end{equation}

W linii bez strat przyjmujemy $R = G = 0$, co daje $Z_0 =
\sqrt{\frac{L}{C}}$, a fala biegnąca i odbita porusza się z prędkością $v_f = \frac{1}{\sqrt{LC}}$.

Stosunek amplitudy fali padającej i odbitej jest zależny od
impedancji charakterystycznej oraz impedancji obciążenia:

\begin{equation}
\rho = \frac{A_2}{A_1} = \frac{Z_\text{obc}-Z_0}{Z_\text{obc}+Z_0}
\end{equation}

Można wyróżnić trzy szczególne przypadki:

* $Z_\text{obc} = Z_0 \quad \Rightarrow \rho = 0 \quad$ - linia prawidłowo
  zwarta - brak odbić;
* $Z_\text{obc} = \infty \quad \Rightarrow \rho = 1 \quad$ - linia rozwarta -
  sygnał odbity z taką samą amplitudą;
* $Z_\text{obc} = 0 \quad \Rightarrow \rho = -1 \quad$ - linia krótko zwarta -
  odbicie sygnału z inwersją.

### Pomiary

Celem zadania było wyznaczenie stałych parametrów $L$ i $C$ linii, przy pomocy
równań przedstawionych w poprzednim paragrafie.

Dla linii rozwartej i krótko zwartej wyznaczyłem prędkość sygnału na podstawie
pomiaru czasu przesunięcia fali odbitej. Dla linii prawidłowo obciążonej
dobrałem taki opór obciążenia, przy którym nie było fali odbitej. Opór ten jest
równy $Z_0$. Długość linii wynosiła $d = 16.2 \,\text{m}$.

Pomiary dla linii rozwartej:

$t1\,\text{[ns]}$ | $t2\,\text{[ns]}$ | $v_f\,\text{[10**8 m/s]}$
------------------|-------------------|------------------------
$746$ | $376$ | $1.75$
$722$ | $378$ | $1.88$
$832$ | $488$ | $1.88$

Prędkość $v_f$ wyliczyłem z zależności $v_f = \frac{2d}{\Delta t}$, natomiast
$\Delta t = (t_1-t_2)/2$.

Pomiary dla linii zwartej:

$\Delta t \,\text{[ns]}$ | $v_f\,\text{[10**8 m/s]}$
-------------------------|--------------------------
$154$ | $2.10$
$160$ | $2.03$

Średnia prędkość sygnału w linii długiej:

\begin{equation}
v_f = 1.93 \cdot 10^8 \,\text{m/s}
\end{equation}

Sposoby pomiaru przedstawione są na rys. \ref{fig:tek00231} oraz
\ref{fig:tek00236}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00231.png}
  \caption{Linia długa. Rozwarta. Pomiar opóźnienia (1).}
  \label{fig:tek00231}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00236.png}
  \caption{Linia długa. Krótko zwarta. Pomiar opóźnienia (2).}
  \label{fig:tek00236}
\end{figure}

Znaleziony opór obciążenia, dla którego nie było fali odbitej:

\begin{equation}
Z_\text{obc} = Z_0 = 42.8 \Omega
\end{equation}

Przekształcając zależności $Z_0 = \sqrt{\frac{L}{C}}$ oraz $v_f =
\frac{1}{\sqrt{LC}}$, otrzymałem:

\begin{equation}
\begin{aligned}
L &= \frac{Z_0}{v_f} = 2.22 \cdot 10^{-7} \,\text{H/m} \\
C &= \frac{1}{Z_0 v_f} = 1.21 \cdot 10^{-10} \,\text{F/m}
\end{aligned}
\end{equation}

Ostatnim etapem tego zadania było podłączenie linii na drugi kanał oscyloskopu
i pomiar opóźnienia linii na trzeci sposób. Długość linii w takim układzie to
długość pierwotna pomniejszona o krótki kabel, $s = 1 \,\text{m}$. Zmierzone
opóźnienie wynosiło $\Delta t = 76.40 \,\text{ns}$. Daje to prędkość sygnału:

\begin{equation}
v_f = \frac{d-s}{\Delta t} = 1.99 \cdot 10^8 \, \text{m/s}
\end{equation}

Otrzymany wynik jest zbliżony do poprzednich. Sposób pomiaru przedstawia rys.
\ref{fig:tek00242}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00242.png}
  \caption{Linia długa. Pomiar opóźnienia (3).}
  \label{fig:tek00242}
\end{figure}
