---
title: Pracownia elektroniczna
subtitle: |
  ćw. 1: Obsługa oscyloskopu. Dzielnik napięcia. Badanie układów biernych.\
  prowadzący: dr hab. Janusz Brzychczyk\
author: Michał Liszcz
date: 04.03.2016
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

*TODO*

Blah blah blah.

Podstawy teoretyczne związane z poszczególnymi zadaniami znajdują się w
odpowiadających im rozdziałach.

# Wykonane zadania

W ramach laboratorium wykonałem 6 ćwiczeń opisanych w instrukcji.

## Zapoznanie się z działaniem generatora i oscyloskopu

Wykonałem kilka pomiarów amplitudy, częstotliwości i przesunięcia fazowego
między dwoma sygnałami. Pomiarów dokonałem zarówno przy pomocy kursorów
oscyloskopu, jak i funkcji automatycznego pomiaru.

Rys. \ref{fig:1-1} przedstawia przebieg z dwóch kanałów wejściowych, o
różnych amplitudach i takiej samej częstotliwości. Wartości zmierzone przez
oscyloskop oraz kursory są zgodne (w granicy błędu pomiarowego) z wartościami
ustawionymi na generatorze. W przypadku częstotliwości, kursorami mierzyłem
okres.

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00008.png}
    \caption{CH1: (2Vpp, 1MHz); CH2: (1Vpp, 1MHz).}
    \label{fig:1-1}
\end{figure}

Następnie zmieniłem częstotliwość jednego z kanałów (rys. \ref{fig:1-2}).

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00011.png}
    \caption{CH1: (2Vpp, 1MHz); CH2: (1Vpp, 2MHz).}
    \label{fig:1-2}
\end{figure}

W celu zmierzenia przesunięcia fazowego ustawiłem w oscyloskopie odległość
pomiędzy dwoma maksimami sygnału jako $360\degree$. Wykonałem pomiary zarówno
dla sygnałów przesuniętych o $90\degree$ (rys. \ref{fig:1-3}) jak i
$180\degree$ (rys. \ref{fig:1-4}). Wartości zmierzone kursorami są zgodne z
wartościami ustawionymi na generatorze. Automatyczne pomiary oscyloskopu
wykazały rozbieżność odpowiednio $1.49\degree$ oraz $2.30\degree$.
Może to być wynikiem użycia zbyt wysokich częstotliwości w tej części
ćwiczenia.

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00013.png}
    \caption{CH1: (2Vpp, 1MHz); CH2: (1Vpp, 1MHz, $90\degree$).}
    \label{fig:1-3}
\end{figure}

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00016.png}
    \caption{CH1: (2Vpp, 1MHz); CH2: (1Vpp, 1MHz, $180\degree$).}
    \label{fig:1-4}
\end{figure}

## Krzywe Lissajous

To zadanie polegało na zaobserwowaniu krzywych Lissajous na oscyloskopie.

### Definicja

Krzywa Lissajous to krzywa powstała ze złożenia dwóch prostoapdłych drgań
harmonicznych przesuniętych w fazie.

\begin{equation}
\left\{
  \begin{aligned}
    x(t) &= A\sin(at) \\
    y(t) &= B\sin(bt+\delta)
  \end{aligned}
\right.
\end{equation}

Krzywa jest zamknięta, kiedy iloraz $\frac{a}{b}$ jest liczbą wymierną.

Szczególny przypadek krzywej Lissajous to:

* okrąg, dla $A=B$, $a=b$ oraz $\delta = \frac{\pi}{2}$,
* odcinek, dla $A=B$, $a=b$ oraz $\delta = 0$.

### Pomiary

W trybie X-Y oscyloskopu złożyłem dwa drgania harmoniczne, pochodzące z dwóch
kanałów generatora. Amplitudy generowanych sygnałów ustawiłem na wartość 1Vpp.
Zmieniałem częstotliwość sygnałów (w zakresie 1-10 kHz) oraz przesunięcie
fazowe.

Rys. \ref{fig:2-1} oraz \ref{fig:2-2} przedstawiają szczególne przypadki
krzywych - okrąg i odcinek.

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00021.png}
    \caption{Krzywa Lissajous - okrąg.
      CH1: (1Vpp, 1kHz); CH2: (1Vpp, 1kHz, $90\degree$).}
    \label{fig:2-1}
\end{figure}

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00019.png}
    \caption{Krzywa Lissajous - odcinek.
      CH1: (1Vpp, 1kHz); CH2: (1Vpp, 1kHz, $0\degree$).}
    \label{fig:2-2}
\end{figure}

Dla różnych współczynników częstotliwości $\frac{a}{b}$ porównałem otrzymaną
krzywą z teoretycznym obrazem. Przykładowe wyniki znajdują się na rys.
\ref{fig:2-3} oraz \ref{fig:2-4}.

\begin{figure}[H]
\centering
\begin{subfigure}{.7\textwidth}
  \centering
  \includegraphics[width=.7\textwidth]{../screenshots/tek00028.png}
  \caption{Krzywa zmierzona}
  \label{fig:2-3-a}
\end{subfigure}%
\begin{subfigure}{.3\textwidth}
  \centering
  \includegraphics[width=.3\textwidth]{{images/600px-Lissajous_curve_3by4.svg}.png}
  \caption{Krzywa teoretyczna. Źródło: \texttt{pl.wikipedia.org}}
  \label{fig:2-3-b}
\end{subfigure}
\caption{Krzywa Lissajous - $a/b = 4/3$, $\delta = 90\degree$.}
\label{fig:2-3}
\end{figure}

\begin{figure}[H]
\centering
\begin{subfigure}{.7\textwidth}
  \centering
  \includegraphics[width=.7\textwidth]{../screenshots/tek00022.png}
  \caption{Krzywa zmierzona}
  \label{fig:2-4-a}
\end{subfigure}%
\begin{subfigure}{.3\textwidth}
  \centering
  \includegraphics[width=.3\textwidth]{{images/600px-Lissajous_curve_5by4.svg}.png}
  \caption{Krzywa teoretyczna. Źródło: \texttt{pl.wikipedia.org}}
  \label{fig:2-4-b}
\end{subfigure}
\caption{Krzywa Lissajous - $a/b = 5/4$, $\delta = 0\degree$.}
\label{fig:2-4}
\end{figure}

Przypadek z przesunięciem fazowym niebędącym wielokrotnością $\pi/2$
przedstawia rys. \ref{fig:2-5}.

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00026.png}
    \caption{Krzywa Lissajous - $a/b = 4/5$, $\delta = 100\degree$.}
    \label{fig:2-5}
\end{figure}

## Dudnienia

To zadanie polegało na zaobserwowaniu zjawiska dudnień oraz wyznaczeniu
częstotliowści dudnień i modulacji amplitudy.

### Definicja

Dla dwóch drgań harmonicznych o zerowej fazie początkowej, takich samych
amplitudach i różnych częstościach:

\begin{equation}
\left\{
  \begin{aligned}
    x_1(t) &= A\sin(\omega_1t) \\
    x_2(t) &= A\sin(\omega_2t)
  \end{aligned}
\right.
\end{equation}

ich złożenie daje:

\begin{equation}
\begin{aligned}
  x(t) &= x_1(t) + x_2(t) = ... = 2A\cos(\omega_mt)\sin(\omega_wt)
    = B(t)\sin(\omega_wt) \\
  B(t) &= 2A\cos(\omega_mt) \\
  \omega_m &= \frac{\omega_1 - \omega_2}{2} \\
  \omega_w &= \frac{\omega_1 + \omega_2}{2}
\end{aligned}
\end{equation}

Jeżeli częstotści $\omega_1$ oraz $\omega_2$ będą do siebie zbliżone, to
powyższe równanie można interpretować jako drganie harmoniczne z częstością
wypadkową $\omega_w$, o zmiennej amplitudzie modulowanej okresowo z przez
$B(t)$. Modulacja amplitudy zmienia się jak $|B(t)|$, a więc z częstością
$\omega_d = 2 \omega_m = \omega_1 - \omega_2$, nazywanej częstością dudnień.

Przykład złożenia dwóch drgań przedstawia rys. \ref{fig:3-1}.

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00031.png}
    \caption{CH1: 1000 Hz; CH2: 1050 Hz. Brak fazy początkowej (błędny odczyt).}
    \label{fig:3-1}
\end{figure}

### Pomiary

Częstość wypadkową i częstość dudnień zmierzyłem przy użyciu kursorów.
Sposób pomiaru przedstawiony jest na rys. \ref{fig:3-2} oraz \ref{fig:3-3}.

Złożyłem drgania o częstotliwościach $f_1 = 1000 \text{Hz}$ oraz
$f_2 = 1050 \text{Hz}$. Daje to następujące teoretyczne częstości:

\begin{equation}
\begin{aligned}
  \omega_1 &= 2 \pi f_1\\
  \omega_2 &= 2 \pi f_2\\
  \omega_w &= 2 \pi \frac{f_2 + f_1}{2} = 2050 \pi \cdot s^{-1}\\
  \omega_m &= 2 \pi \frac{f_2 - f_1}{2} = 50 \pi \cdot s^{-1}\\
  \omega_d &= 2 \omega_m = 100 \pi \cdot s^{-1}
\end{aligned}
\end{equation}

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00033.png}
    \caption{Pomiar częstości wypadkowej.}
    \label{fig:3-2}
\end{figure}

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00034.png}
    \caption{Pomiar częstości dudnień.}
    \label{fig:3-3}
\end{figure}

#### Częstość wypadkowa

Zmierzony czas 6 okresów to $6T_w = 5.840 \text{ms}$. Zakładam że odczyt ten
nie jest obarczony niepewnością pomiarową.

Korzystając z zależności $\omega = 2 \pi f = \frac{2 \pi}{T}$, otrzymałem
częstość wypadkową równą:

\begin{equation}
\omega_w = \frac{12 \pi}{6T_w} \approx 2054.78 \pi \cdot s^{-1}
\end{equation}

Wynik jest bardzo zbliżony do teoretycznej wartości $2050 \pi \cdot s^{-1}$.

#### Częstość dudnień

Zmierzony okres dudnień to $T_d$ = 19.96 \text{ms}$. Daje to częstość:

\begin{equation}
\omega_d = \frac{2 \pi}{T_d} \approx 100.20 \pi \cdot s^{-1}
\end{equation}

Wynik jest bardzo zbliżony do teoretycznej wartości $100 \pi \cdot s^{-1}$.

## Dzielnik napięcia
