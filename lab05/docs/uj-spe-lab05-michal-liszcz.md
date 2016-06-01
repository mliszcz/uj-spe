---
title: Pracownia elektroniczna
subtitle: |
  ćw. 5: Bramka NAND j jej zastosowanie, licznik binarny TTL.\
  prowadzący: dr hab. Janusz Brzychczyk\
author: Michał Liszcz
date: 06.05.2016
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

Ćwiczenie polegało na skonstruowaniu i analizie układów cyfrowych opartych
o bramki NAND.

## Układy cyfrowe

Bramka logiczna NAND jest jednym z podstawowych elementów układów elektroniki
cyfrowej.

W układzie cyfrowym sygnały napięciowe przyjmują jeden z dwóch możliwych
poziomów:

* wysoki (H) - w logice dodatniej odpowiada wartości 1
* niski (L) - w logice dodatniej odpowiada wartości 0

W bramkach z rodziny TTL (*transistor - transistor logic*) poziom niski (L) to
napięcie od 0 do 0.8 V, natomiast poziom wysoki (H) to napięcie od 2 do 5 V.
Układ zasila się napięciem 5 V.

## Bramki logiczne

Bramki logiczne to proste układy elektroniczne realizujące *funkcje logiczne*
(funkcje boolowskie), przykładowo negację, sumę logiczną (OR) lub iloczyn
logiczny (AND).

Bramki, ich symbole oraz realizowane funkcje przedstawia tabela poniżej.

\begin{tabu} spread \linewidth {X[m]|X[m]|X[m]}\hline
  NOT  & $f = \overline{a}$ & \bigskip \centerline{\includegraphics[width=0.1\textwidth]{images/fig-01-gate-not.png}} \\
  \hline
  OR   & $f = a+b$ & \bigskip \centerline{\includegraphics[width=0.1\textwidth]{images/fig-01-gate-or.png}} \\
  \hline
  NOR  & $f = \overline{a+b}$ & \bigskip \centerline{\includegraphics[width=0.1\textwidth]{images/fig-01-gate-nor.png}} \\
  \hline
  AND  & $f = a\cdot b$ & \bigskip \centerline{\includegraphics[width=0.1\textwidth]{images/fig-01-gate-and.png}} \\
  \hline
  NAND & $f = \overline{a\cdot b}$ & \bigskip \centerline{\includegraphics[width=0.1\textwidth]{images/fig-01-gate-nand.png}} \\
  \hline
  XOR  & $f = a\oplus b$ & \bigskip \centerline{\includegraphics[width=0.1\textwidth]{images/fig-01-gate-xor.png}} \\
\end{tabu}

Bramki NAND i NOR to bramki uniwersalne, za pomocą których można przedstawić
dowolne inne bramki. Jest to omówione w ćwiczeniach 3 i 4.

## Czas propagacji

Zmiana sygnału na wyjściu bramki na skutek zmian na wejściu opóźniona jest o
stały czas propagacji sygnału. Czas przejścia ze stanu wysokiego na niski
$t_{pHL}$ może być inny niż czas przejścia ze stanu niskiego na wysoki
$t_{pLH}$. Przykładowy przebieg sygnału przedstawia rys. \ref{fig:0-1}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.3\textwidth]{images/fig-02-t-prop.png}
  \caption{Czas propagacji sygnału przez bramkę NOT.
    (Źródło: instrukcja laboratoryjna)}
  \label{fig:0-1}
\end{figure}

Średni czas propagacji zdefiniowany jest jako średnia:

\begin{equation}
t_p = \frac{t_{pLH} + t_{pHL}}{2}
\end{equation}

## Przerzutniki

Przerzutnik to układ pozwalający na zapamiętanie jednego bitu informacji.
Najprostsze przerzutniki posiadają co najmniej kilka wejść - informacyjne,
programujące i zegarowe oraz wyjście, zwracające zapamiętany stan i wyjście
komplementarne.

### Przerzutnik RS NOR

Przerzutnik typu RS NOR ma dwa wejścia, $R$ (*reset*) i $S$ (*set*) oraz dwa
wyjścia, $Q$ i $\overline{Q}$. Symbol przerzutnika RS przedstawia rys.
\ref{fig:0-3}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.3\textwidth]{images/fig-04-rs-latch.png}
  \caption{Przerzutnik RS. (Źródło: slajdy z wykładów)}
  \label{fig:0-3}
\end{figure}

Podanie stanu wysokiego na wejście $S$ ustawia pamiętaną wartość na 1.
Podanie stanu wysokiego na wejście $R$ resetuje pamiętaną wartość do 0.
Sposób działania przerzutnika przedstawia tabela poniżej.

\begin{center}
\begin{tabular}{c|c|c}
  R & S & Q \\
  \hline \hline
  0 & 0 & zapamiętana wartość (stan pamiętania) \\
  \hline
  0 & 1 & 1 \\
  \hline
  1 & 0 & 0 \\
  \hline
  1 & 1 & stan zabroniony \\
\end{tabular}
\end{center}

Jednoczesne przejście wejść $R$ i $S$ ze stanu wysokiego na niski prowadzi do
zapamiętania w liczniki nieokreślonej wartości, zależnej od czasów propagacji
sygnałów w obwodzie i jego fizycznej realizacji.

Przerzutnik RS można zrealizować w oparciu o bramki NOR lub NAND ze sprzężeniem
zwrotnym. Schemat takiego układu przedstawiony jest na rysunku \ref{fig:0-2}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.3\textwidth]{images/fig-03-rs-latch.png}
  \caption{Schemat przerzutnika RS NOR.}
  \label{fig:0-2}
\end{figure}

Przerzutnik RS może występować w wersjach asynchronicznej (opisanej powyżej)
oraz synchronicznej, gdzie zastosowane jest dodatkowe wejście zegarowe ($C$).
Zmiana stanu następuje jedynie przy zmianie sygnału na wejsciu zegarowym
(wyzwalanie zboczem narastającym lub opadającym).

### Przerzutnik T

Przerzutnik typu T ma jedno wejście informacyjne, T (*toggle*), oraz wejście
zegarowe. W trakcie impulsu zegarowego następuje przełączenie zapamiętanego
stanu, jeżeli wejście $T$ jest w statnei wysokim. W przeciwnym razie pamiętany
stan pozostaje bez zmian.

Przerzutnik typu T posiada często również wejście programujące, pozwalające
na reset zapamiętanego stanu do wartości 0.

Symbol przerzutnika T przedstawia rys. \ref{fig:0-4}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.3\textwidth]{images/fig-05-t-latch.png}
  \caption{Przerzutnik T. (Źródło: slajdy z wykładów)}
  \label{fig:0-4}
\end{figure}

## Licznik

Łącząc szeregowo przerzutniki typu T można skonstruować N-bitowy licznik.
Układ taki przedstawia rys. \ref{fig:0-5}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{images/fig-06-t-counter.png}
  \caption{Licznik N-bitowy. (Żródło: slajdy z wykładów)}
  \label{fig:0-5}
\end{figure}

Na wejście należy podać sygnał zegarowy o częstotliwości $f$. Każdy kolejny
licznik zmienia swoją wartość z częstotliwością mniejszą o połowę. Przerzutniki
wyzwalane są zboczem opadającym.

# Wykonane zadania

Dalej opisane są zadania wykonane w trakcie laboratorium. Zdjęcia zbudowanych
układów dostępne są pod adresem^[<https://github.com/mliszcz/uj-spe/tree/master/lab05/photos>].

## Zapoznanie się z płytką montażową

Ćwiczenia wykonywałem na płytce montażowej wyposażonej w układy:

* UCY7400 - cztery bramki NAND
* UCY7493 - czterobitowy licznik (T)

Płytka była wyposażona w zestaw diod LED umożliwiających obserwację poziomu
sygnału w dowolnym miejscu układu.

## Tablica logiczna dla pojedynczej bramki NAND

Podawałem możliwe kombinacje sygnałów wejściowych na wejścia pojedynczej
bramki NAND w celu weryfikacji zależności:

\begin{equation}
f = \overline{a\cdot b}
\end{equation}

Otrzymane wyniki prezentuje tabela poniżej.

\begin{center}
\begin{tabular}{c|c|c}
  $a$ & $b$ & $\overline{a\cdot b}$ \\
  \hline \hline
  0 & 0 & 1 \\
  \hline
  0 & 1 & 1 \\
  \hline
  1 & 0 & 1 \\
  \hline
  1 & 1 & 0 \\
\end{tabular}
\end{center}

Zaobserwowane wyniki potwierdziły sposób działania bramki NAND i były zgodne
z oczekiwaniami.

## Iloczyn logiczny i suma logiczna

Przy użyciu bramek NAND należało zbudować układy realizujące iloczyn logiczny
i sumę logiczną. Oczekiwane tablice logiczne przedstawione są poniżej:

\begin{center}
\begin{tabular}{c|c|c|c|c|c}
  $a$ & $b$ & & $\overline{a\cdot b}$ & $a \cdot b$ & $a + b$ \\
  \hline \hline
  0 & 0 & & 1 & 0 & 0 \\
  \hline
  0 & 1 & & 1 & 0 & 1 \\
  \hline
  1 & 0 & & 1 & 0 & 1 \\
  \hline
  1 & 1 & & 0 & 1 & 1 \\
\end{tabular}
\end{center}

Z tabeli prawdy widać od razu, że aby otrzymać AND, należy zanegować wyjście
bramki NAND. Potrzebny NOT można skonstruować podając na oba wejścia NAND tę
samą wartość ($\overline{x}=\overline{x \cdot x}$).

\begin{equation}
a \cdot b = \overline{\overline{a \cdot b}} =
\overline{ \overline{ a \cdot b} \cdot \overline{ a \cdot b} }
\end{equation}

Do zbudowania OR można wykorzystać prawo *De Morgana*, $\overline{a+b} =
\overline{a} \cdot \overline{b}$, oraz zdefiniowany wcześniej operator NOT:

\begin{equation}
a + b = \overline{\overline{a \cdot b}} =
\overline{ \overline{a} \cdot \overline{b} } =
\overline{ \overline{a \cdot a} \cdot \overline{b \cdot b} }
\end{equation}

Poprawność skonstruowanych układów potwierdziłem doświadczalnie.

TODO dodac schematy

## Wyłączna suma logiczna

TODO

## -

*Zadania nie należało wykonywać*.

## Czas propagacji impulsu

Należało skonstruować układ jak na rys. \ref{fig:6-1}. Na wejście układu
podawałem sygnał prostokątny o częstotliwości 200 kHz.
Na oscyloskopie sprawdzałem jak sygnał wyjściowy opóźniony jest względem
sygnału wejściowego.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{images/fig-61.png}
  \caption{Badany układ. (Żródło: instrukcja laboratoryjna)}
  \label{fig:6-1}
\end{figure}

W układzie sygnał będzie poddawany dwukrotnej negacji. Przesunięcie czasowe
między sygnałem wejściowym a wyjściowym to zatem:

\begin{equation}
t = 2 t_p = t_{pLH} + t_{pHL}
\end{equation}

Przykładowy obraz obserwowany na oscyloskopie przedstawia rys. \ref{fig:6-2}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00010.png}
  \caption{Pomiar przesunięcia fazowego. Sygnał prostokątny, f = 200 kHz.}
  \label{fig:6-2}
\end{figure}

Z wykresów odczytałem:

\begin{equation}
\begin{aligned}
2 t_p = 24.60 \cdot 10^{-9} \text{s} \qquad \Rightarrow
t_p = 12.30 \cdot 10^{-9} \text{s}
\end{aligned}
\end{equation}

Czas propagacji sygnału w bramce NAND wykonanej w technologii TTL powinien
mieścić się w zakresie 15 - 20 ns. Wartość ta będzie różna dla różnych bramek,
wynika to z ich wewnętrznej budowy. Otrzymany wynik zatem jest akceptowalny.

## Czas propagacji w generatorze
