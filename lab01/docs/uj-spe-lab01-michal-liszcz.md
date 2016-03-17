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

Ta część laboratorium polegała na konstrukcji dzielnika napięcia i
doświadczalnym wyznaczeniu zależności napięcia wyjściowego $U_\text{wy}$
od napięcia wejściowego $U_\text{we}$.

### Definicja

Dzielnik napięcia to dwójnik, pozwalający na ustalenie stosunku napięcia
wyjściowego względem wejściowego. Układ przedstawiony jest na rys.
\ref{fig:4-1}.

\begin{figure}[H]
    \centering
    \includegraphics[width=0.2\textwidth]{images/{744px-DielnikNapiecia.svg}.png}
    \caption{Dzielnik napięcia. Źródło: \texttt{pl.wikipedia.org}.}
    \label{fig:4-1}
\end{figure}

Napięcia w dzielniku pozostają w stosunku:

\begin{equation}
U_\text{wy} = \frac{R_1}{R + R_1} U_\text{we} = T \cdot U_\text{we}
\label{eq:divider}
\end{equation}

### Pomiary

Zbudowałem układ przedstawiony na rys. \ref{fig:4-1}, z elementami:

| Element | $R [\Omega]$ |
|---------|--------------|
| $R$     | 1846         |
| $R_1$   | 509          |

Na kanale wejściowym ustawiłem częstotliwość $1\text{kHz}$. Zmieniając
amplitudę Vpp na wejściu (w zakresie $0-10V$) mierzyłem amplitudę na wyjściu.
Wyniki przedstawia poniższa tabela:

$U$ generatora [Vpp] | $U_\text{we}$ [mVpp] | $U_\text{wy}$ [mVpp] | $\sigma(U_\text{wy})$ [mVpp]
---------------------|----------------------|----------------------|-----------------------------
1.0  | 984.0   | 200.0  |  18.25
2.0  | 1960.0  | 400.0  |  75.48
3.0  | 2920.0  | 677.8  |  81.30
4.0  | 3920.0  | 874.1  |  90.08
5.0  | 4920.0  | 1000.0 |  104.90
6.0  | 5880.0  | 1240.0 |  144.20
7.0  | 6920.0  | 1440.0 |  168.10
8.0  | 7840.0  | 1738.0 |  56.52
9.0  | 8800.0  | 1760.0 |  68.55
10.0 | 9760.0  | 2000.0 |  123.40

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{plots/{fig-divisor--result-divisor.txt}.png}
    \caption{Dzielnik napięcia. Regresja liniowa.}
    \label{fig:4-2}
\end{figure}

Do zmierzonych punktów dopasowałem prostą metodą regresji liniowej. Dopasowana
krzywa przedstawiona jest na rys. \ref{fig:4-2}. Otrzymałem wynik:

\begin{equation}
U_\text{wy} = T \cdot U_\text{we} = 0.2108(34) \cdot U_\text{we}
\end{equation}

Oczekiwana wartość teoretyczna obliczona na podstawie wzoru \eqref{eq:divider}
to $T = 0.216135881$.

Wynik jest zgodny bardzo zbliżony do wartości otrzymanej doświadczalnie. Nie
są jednak zgodne w granicy niepewności.

## Rezystancja wewnętrzna (wyjściowa) generatora

Oscyloskop o małym oporze wyjściowym wraz z małym obciążeniem tworzy dzielnik
napięcia. Stąd można  obliczyć opór wyjściowy generatora.

Pomiary przeprowadziłem w dwóch krokach:

1. Ustawiłem *load output* generatora na $R_w = 50 \Omega$ i obciążyłem go
   znacznie większym oporem oscyloskopu ($1 M\Omega$).

    * na generatorze ustawiłem amplitudę $1 \text{Vpp}$,
    * na oscyloskopie odczytałem amplitudę napięcia źródła
      $U_0 = 2 \text{Vpp}$.

1. Zmieniłem opór oscyloskopu na zbliżony do generatora ($R = 50 \Omega$).

    * na oscyloskopie odczytałem amplitudę napięcia na obciążeniu
      $U = 0.960 \text{Vpp}$.

Zmierzone wartości są ze sobą związane zależnością:

\begin{equation}
\frac{R}{R_w + R} = \frac{U}{U_0}
\label{eq:inner}
\end{equation}

Rozwiązanie równania \eqref{eq:inner} (z założeniem że $R_w$ jest szukane)
daje $R_w = (U_0 R - U R)/U \approx 54.17 \Omega$. Jest to zgodne z
ustawieniami generatora ($R_w = 50 \Omega$).

## Dwójnik szeregowy RC

Celem zadania jest zbadanie dwójnika szeregowego RC.

### Definicja

Dwójnik szeregowy RC to układ połączonych szeregowo kondensatora i opornika.
Przykład przedstawiony jest na rys. \ref{fig:6-1}.

\begin{figure}[H]
    \centering
    \includegraphics[width=0.2\textwidth]{{images/circuit-CR}.png}
    \caption{Dwójnik szeregowy RC. Źródło: \textit{instrukcja laboratoryjna}.}
    \label{fig:6-1}
\end{figure}

Funkcja odpowiedzi takiego układu to:

\begin{equation}
\frac{U_R}{U} = \frac{Z_R}{Z_C + Z_R} = \frac{R}{\frac{1}{j\omega C} + R}
\label{eq:circCR}
\end{equation}

Impedancja zastępcza wynosi:

\begin{equation}
Z = Z_R + Z_C = R + \frac{1}{j\omega C} = R - \frac{j}{\omega C}
\end{equation}

Impedancję można umieścić na wykresie wskazowym:

\begin{equation}
\begin{aligned}
Z &= |Z| e^{j\Phi}\\
|Z| &= \sqrt{R^2 + \left(\frac{1}{\omega C}\right)^2}\\
\Phi &= \arctan\left(\frac{-1}{\omega RC}\right)
\end{aligned}
\end{equation}

### Pomiary

Zbudowałem układ RC z elementów:

* kondensator: $C = 4.25 \text{nF}$,
* opornik: $R = 509 \Omega$.

Wyznaczyłem stałą $f_0$:

\begin{equation}
f_0 = \frac{1}{2 \pi RC} \approx 73.609 \text{kHz}
\end{equation}

Następnie dla częstotliwości $f$ równych $0.5 f_0$, $f_0$ oraz $2f_0$ wykonałem
pomiary amplitud i przesunięcia fazowego między sygnałem wejściowym i
wyjściowym. Pomiary są przedstawione na kolejnych rysunkach \ref{fig:6-2},
\ref{fig:6-3} oraz \ref{fig:6-4}. Wyniki zebrane są w tabeli poniżej:

$f$ [Hz]  | $U$ [Vpp] | $U_R$ [Vpp] | $\varphi$ [$\degree$]
----------|-----------|------------ | ---------------------
$0.5 f_0$ | 9.760     | 4.080       | -64.65
$1.0 f_0$ | 9.520     | 6.400       | -44.96
$2.0 f_0$ | 9.200     | 7.920       | -27.22

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00057.png}
    \caption{Układ RC. Częstotliwość $f = 0.5 f_0$.}
    \label{fig:6-2}
\end{figure}

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00056.png}
    \caption{Układ RC. Częstotliwość $f = 1.0 f_0$.}
    \label{fig:6-3}
\end{figure}

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00058.png}
    \caption{Układ RC. Częstotliwość $f = 2.0 f_0$.}
    \label{fig:6-4}
\end{figure}

Widać, że dla dużych częstotliwości $f \gg f_0$ amplituda wyjściowa zbliża
się do wejściowej, natomiast zmniejsza się przesunięcie fazowe.

#### Wykresy wskazowe - impedancja zastępcza

Narysowałem impedancję zastępczą układu w zależności od częstotliwości $f$.
Diagramy wskazowe są przedstawione na kolejnych wykresach \ref{fig:6-5},
\ref{fig:6-6} oraz \ref{fig:6-7}.

\begin{figure}[H]
    \centering
    \includegraphics[width=0.4\textwidth]{images/zad6-imp-zast-05f.png}
    \caption{Impedancja zastępcza. $Z_R$ - niebieski, $Z_C$ - zielony,
      $Z_z$ - czerwony. Częstotliwość $f = 0.5 f_0$.}
    \label{fig:6-5}
\end{figure}

\begin{figure}[H]
    \centering
    \includegraphics[width=0.4\textwidth]{images/zad6-imp-zast-1f.png}
    \caption{Impedancja zastępcza. $Z_R$ - niebieski, $Z_C$ - zielony,
      $Z_z$ - czerwony. Częstotliwość $f = 1.0 f_0$.}
    \label{fig:6-6}
\end{figure}

\begin{figure}[H]
    \centering
    \includegraphics[width=0.4\textwidth]{images/zad6-imp-zast-2f.png}
    \caption{Impedancja zastępcza. $Z_R$ - niebieski, $Z_C$ - zielony,
      $Z_z$ - czerwony. Częstotliwość $f = 2.0 f_0$.}
    \label{fig:6-7}
\end{figure}

#### Wykresy wskazowe - napięcie

Napięcie na oporniku ($U_R$) jest proporcjonalne do płynącego prądu
$I = U_R/R$. Na jednym wykresie można narysować dwa wskazy: $U$ oraz $U_R$.

Dla każdej z badanych częstotliwości założyłem że faza początkowa $U$ jest
zerowa, natomiast amplituda - zgodna ze wskazaniem oscyloskopu. Zgodnie z
zależnością \eqref{eq:circCR}, napięcie na oporniku powinno teoretycznie być
równe:

\begin{equation}
U_R = \frac{Z_R}{Z_C + Z_R} U
\end{equation}

Porównałem tę teoretyczną zależność z danymi pomiarowymi oraz narysowałem
wykresy wskazowe:

$f$ [Hz]  | $U$ [Vpp] | $U_R$ - pom. [Vpp] | $\varphi$ - pom. [$\degree$] | $U_R$ - teor. [Vpp] | $\varphi$ -teor. [$\degree$]
----------|-----------|------------ | ----------------------|---------------------|-----------------------------
$0.5 f_0$ | 9.760 | 4.080 | 64.65  | 4.366 | 63.423
$1.0 f_0$ | 9.520 | 6.400 | 44.96  | 6.733 | 44.986
$2.0 f_0$ | 9.200 | 7.920 | 27.22  | 8.229 | 26.554

Widać że zmierzone wartości są zbliżone do teoretycznych. Diagramy wskazowe
są przedstawione na kolejnych wykresach \ref{fig:6-8}, \ref{fig:6-9} oraz
\ref{fig:6-10}.

\begin{figure}[H]
    \centering
    \includegraphics[width=0.4\textwidth]{images/zad6-ampl-05f.png}
    \caption{Amplituda. $U$ - niebieski, $U_R$ - zielony.
      Częstotliwość $f = 0.5 f_0$.}
    \label{fig:6-8}
\end{figure}

\begin{figure}[H]
    \centering
    \includegraphics[width=0.4\textwidth]{images/zad6-ampl-1f.png}
    \caption{Amplituda. $U$ - niebieski, $U_R$ - zielony.
      Częstotliwość $f = 1.0 f_0$.}
    \label{fig:6-9}
\end{figure}

\begin{figure}[H]
    \centering
    \includegraphics[width=0.4\textwidth]{images/zad6-ampl-2f.png}
    \caption{Amplituda. $U$ - niebieski, $U_R$ - zielony.
      Częstotliwość $f = 2.0 f_0$.}
    \label{fig:6-10}
\end{figure}

## Dwójnik szeregowy RLC

Ostatnie zadanie to badanie rezonansu napięć w dwójniku RLC.

### Definicja

Dwójnik szeregowy RLC to układ połączonych ze sobą szeregowo cewki,
kondensatora i opornika. Układ taki przedstawiony jest na rys. \ref{fig:7-1}.

\begin{figure}[H]
    \centering
    \includegraphics[width=0.2\textwidth]{{images/circuit-LCR}.png}
    \caption{Dwójnik szeregowy RLC. Źródło: \textit{instrukcja laboratoryjna}.}
    \label{fig:7-1}
\end{figure}

Impedancja zastępcza tego układu to:

\begin{equation}
\begin{aligned}
Z_z &= Z_R + Z_L + Z_C = R + j \omega L - \frac{j}{\omega C}
  = R + j \left(\omega L - \frac{1}{\omega C}\right)\\
|Z_z| &= \sqrt{R^2 \left(\omega L - \frac{1}{\omega C}\right)}\\
\Phi &= \arctan{\left(\frac{\omega L - \frac{1}{\omega C}}{R}\right)}
\end{aligned}
\end{equation}

### Rezonans napięć

Impedancja zastępcza układu jest najmniejsza, gdy występuje tylko składowa
pochodząca od opornika. Spadek napięcia jest w tym wypadku najmniejszy,
ponieważ spadek napięcia na cewce jest przeciwny spadkowi napięcia na
kondensatorze.

W rezonansie występuje zerowe przesunięcie fazy pomiędzy napięciem $U$
a prądem $I$ ($I = U_R/R$).

Częstotliwość rezonansową można otrzymać z warunku:

\begin{equation}
\omega_0 L - \frac{1}{\omega_0 C} = 0 \qquad \leftarrow \qquad
\omega_0 = \frac{1}{\sqrt{LC}}
\end{equation}

### Pomiary

Pomiary polegały na znalezeniu częstotliwości rezonansowej na trzy sposoby:

* poprzez obserwowanie dwóch przebiegów na osi czasowej
* poprzez obserwowanie przebiegów w trybie X-Y
* poprzez obserwowanie funkcji różnicy $U_{LC} = U - U_R$.

Teoretyczna częstotliwość rezonansowa powinna wynosić:

\begin{equation}
f_0 = \frac{1}{2\pi\sqrt{LC}} \approx 31.517 \text{kHz}
\end{equation}

Wartość jaką znalazłem doświadczalnie jest zgodna z wartością teoretyczną
i wynosi:

\begin{equation}
f_0 = 31.980 \text{kHz}
\end{equation}

Rezonans przedstawiony jest na kolejnych rzutach ekranu na rys. \ref{fig:7-2},
\ref{fig:7-3}, \ref{fig:7-4} oraz \ref{fig:7-5}.

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00068.png}
    \caption{Rezonans napięć.}
    \label{fig:7-2}
\end{figure}

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00069.png}
    \caption{Rezonans napięć. Tryb X-Y.}
    \label{fig:7-3}
\end{figure}

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00072.png}
    \caption{Rezonans napięć. Różnica sygnałów. 1.}
    \label{fig:7-4}
\end{figure}

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00075.png}
    \caption{Rezonans napięć. Różnica sygnałów. 2.}
    \label{fig:7-5}
\end{figure}

##### Poza częstotliwością rezonansową

Zmierzyłem amplitudy sygnałów dla częstotliwości $f_1 \ll f_0$
($f_1 = 1 \text{kHz}$) oraz dla częstotliwości $f_2 \gg f_0$
($f_2 = 1 \text{MHz}$). W obu przypadkach impedancja układu powinna być bardzo
duża. Taka sytuacja przedstawiona jest na rys. \ref{fig:7-6} i \ref{fig:7-7}.

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00077.png}
    \caption{Brak rezonansu napięć. $f_1 \ll f_0$.}
    \label{fig:7-6}
\end{figure}

\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{../screenshots/tek00078.png}
    \caption{Brak rezonansu napięć. $f_2 \gg f_0$.}
    \label{fig:7-7}
\end{figure}
