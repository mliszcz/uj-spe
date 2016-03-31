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
  \caption{Czwórnik CR. Układ różniczkujący.}
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

## Układ różniczkujacy - odpowiedź dla sygnału prostokątnego

## Układ całkujący

### Charakterystyki

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

### Charakterystyki

### Rezonans prądów

## Linia długa
