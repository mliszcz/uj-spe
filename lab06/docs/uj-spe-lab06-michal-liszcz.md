---
title: Pracownia elektroniczna
subtitle: |
  ćw. 6: Przetworniki cyfrowo analogowe C/A i analogowo cyfrowe A/C.\
  prowadzący: dr hab. Janusz Brzychczyk\
author: Michał Liszcz
date: 03.06.2016
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
    - \usepackage{tabu}
    - >
      \providecommand{\subtitle}[1]{%
        \usepackage{titling}
        \posttitle{%
          \par\large#1\end{center}}
      }
---

\newpage

# Wstęp

Ćwiczenie polegało na analizie układów przetworników C/A i A/C.

# Przetwornik C/A

W zadaniu należało skonstruować trzybitowy przetwornik C/A i zweryfikować
jego działanie.

## Wprowadzenie

Przetwornik cyfrowo analogowy to prosty sumator zbudowany w oparciu o
wzmacniacz operacyjny. Schemat trzybitowego układu przedstawia rys.
\ref{fig:1-1}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{images/dac.png}
  \caption{Przetwornik C/A. (Żródło: instrukcja laboratoryjna.)}
  \label{fig:1-1}
\end{figure}

Na wejściu do przetwornika podaje się sygnał cyfrowy, w postaci $N$ linii
sygnałowych na których panuje napięcie $0$ (stan niski) lub $U$ (stan wysoki).
Zasada działania układu polega na sumowaniu tych napięć z odpowiednimi wagami
tak, by dla wejścia $x \in \{0, 1, 2, ..., 2^N-1\}$ uzyskać na wyjściu napięcie
proporcjonalne do $x$:

\begin{equation}
U_{wy} = U_{\text{max}} \cdot \frac{x}{2^N-1}
\end{equation}

Niech $b_n=0$ jeżeli na wejściu $n$ jest stan niski i $b_n = 1$
jeżeli jest stan wysoki. Wtedy $U_n = b_n U$.

Na wejście wzmacniacza wpływa prąd $I$ będący sumą prądów $I_n$ na gałęziach
wejściowych. Na wejściach wzmacniacza panuje napięcie $0$, więc
$I_n = U_n / R_n$. Ponieważ opór wejściowy jest nieskończony, cały prąd
popłynie przez pętlę sprzężenia zwrotnego. Napięcie wyjściowe $U_{wy}$ jest
efektem spadku napięcia na rezystorze $R$.

Ponadto żądamy aby wagi kolejnych wejść były wielokrotnościami $2$. Stąd
$R_n / R_{n+1} = 2$, więc:

\begin{equation}
R_2 = R_1 / 2, \qquad R_3 = R_2 / 2 = R_1 / 4
\end{equation}

Można zapisać napięcie wyjściowe:

\begin{equation}
\begin{aligned}
U_{wy} &= - R I
\\  &= - R \left( \frac{U_1}{R_1} + \frac{U_2}{R_2} + \frac{U_3}{R_3} \right)
\\  &= - U R \left( \frac{b_1}{R_1} + \frac{b_2}{R_2} + \frac{b_3}{R_3} \right)
\\  &= - U R \left( \frac{b_1}{R_1} + \frac{b_2}{R_1} \cdot 2 + \frac{b_3}{R_1} \cdot 4 \right)
\\  &= - U \frac{R}{R_1} \left( b_1 \cdot 2^0 + b_2 \cdot 2^1 + b_3 \cdot 2^2 \right)
\end{aligned}
\label{eq:1-1}
\end{equation}

Powyższy wzór można uogólnić dla dowolnego N.

## Analiza układu

Dla potrzeb dalszej analizy, wyżej przedstawione równania można wyrazić przez
$R_3$:

\begin{equation}
R_1 = 2^2 \cdot R_3 = 4 R_3, \qquad R_2 = 2^1 \cdot R_3 = 2 R_3
\end{equation}

\begin{equation}
U_{wy} = - U \frac{R}{R_3} \left( b_1 \cdot 2^{-2} + b_2 \cdot 2^{-1} + b_3 \cdot 2^0 \right)
\end{equation}

Można usunąć czynnik normalizacyjny, wybierając $R$ = $R_3$.

W oparciu o płytkę montażową ze wzmacniaczem operacyjnym zbudowałem przetwornik
C/A z następującymi elementami:

* $R = 0.990 \, \text{k}\Omega$,
* $R_3 = 0.991 \, \text{k}\Omega$,
* $R_2 = 1.974 \, \text{k}\Omega \, (1+1)$,
* $R_1 = 3.999 \, \text{k}\Omega \, (3+1)$.

Maksymalne napięcie wyjściowe dla wszystkich bitów w stanie wysokim powinno
wynosić:

\begin{equation}
U_\text{max} = -(5 + 2.5 + 1.25)\,V = - \,8.75 V
\end{equation}

W celu weryfikacji działania układu mierzyłem napięcie wyjściowe dla kolejnych
liczb podawanych na wejście:

\begin{center}
\begin{tabular}{c|c|c|c}
  $b_3 b_2 b_1$ & $U_{wy} [V]$ (pomiar) & $U_{wy} - 0.8\,V$ & wartość oczekiwana \\
  \hline \hline
  000 & 0.8 & 0.0 & 0.00 \\
  \hline
  001 & -0.4 & -1.2 & -1.25 \\
  \hline
  010 & -1.6 & -2.4 & -2.50 \\
  \hline
  011 & -3.0 & -3.8 & -3.75 \\
  \hline
  100 & -4.2 & -5.0 & -5.00 \\
  \hline
  101 & -5.6 & -6.4 & -6.25 \\
  \hline
  110 & -6.8 & -7.6 & -7.50 \\
  \hline
  111 & -8.0 & -8.8 & -8.75 \\
\end{tabular}
\end{center}

Wyniki otrzymane z pomiarów są zgodne z oczekiwanymi wartościami. Na wyjściu
układu dla wejścia 000 pomiar napięcia wskazywał $0.8\,V$. Przyjąłem więc tę
wartość jako poziom zerowy, stąd przesunięcie w tabeli.

Efekt ten może być spowodowany nieidealnością zastosowanego wzmacniacza.
