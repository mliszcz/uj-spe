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

Reprezentacja powyższych wyrażej w postaci bramek logicznych przedstawiona
jest na rys. \ref{fig:3-1} oraz \ref{fig:3-2}.

\begin{figure}[H]
  \centering
  \begin{minipage}[b]{0.35\textwidth}
    \includegraphics[width=\textwidth]{images/fig-01-nand-and.png}
    \caption{Konstrukcja bramki AND.}
    \label{fig:3-1}
  \end{minipage}
  \hfill
  \begin{minipage}[b]{0.35\textwidth}
    \includegraphics[width=\textwidth]{images/fig-01-nand-or.png}
    \caption{Konstrukcja bramki OR.}
    \label{fig:3-2}
  \end{minipage}
\end{figure}

Poprawność skonstruowanych układów potwierdziłem doświadczalnie.

## Wyłączna suma logiczna

Suma logiczna modulo 2 różni się od zwykłej sumy tylko jednym wpisem w tabeli
prawdy.

\begin{center}
\begin{tabular}{c|c|c|c|c}
  $a$ & $b$ & & $a + b$ & $a \oplus b$ \\
  \hline \hline
  0 & 0 & & 0 & 0 \\
  \hline
  0 & 1 & & 1 & 1 \\
  \hline
  1 & 0 & & 1 & 1 \\
  \hline
  1 & 1 & & 1 & 0 \\
\end{tabular}
\end{center}

Należy wyzerować wyjście z układu OR jeżeli oba wejścia są w stanie wysokim.
Należy to zrobić przy pomocy tylko jednej bramki (trzy z dostępnych
wykorzystane zostały do budowy OR).

W tym celu do układu OR można wpiąć dodatkową bramkę NAND z wejściami $a$ i $b$.

Jeżeli
oba będą 1, to wyjście tej bramki będzie 0. W przeciwnym przypadku będzie 1.
Wyjście z tej dodatkowej bramki należy podłączyć do wejść bramki OR.

Jeżeli dodatkowa bramka będzie 0, to obie bramki z układu OR będą 1 niezależnie
od drugiego wejścia. Końcowy NAND da wynik 0 z dwóch wejść w stanie 1.

Jeżeli dodatkowa bramka będzie 1, to obie bramki z układu OR będą odwracać
drugie wejście. Układ będzie działał tak jak układ OR.

Schemat rozwiązania przedstawiony jest na rys. \ref{fig:4-1}. Jego poprawność
zweryfikowałem eksperymentalnie w trakcie laboratorium.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.40\textwidth]{images/fig-01-nand-xor.png}
  \caption{Konstrukcja bramki XOR.}
  \label{fig:4-1}
\end{figure}

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

Należało wyznaczyć średni czas propagacji przez bramkę NAND poprzez pomiar
okresu drgań generatora zbudowanego z trzech takich bramek. Badany układ
przedstawia rys. \ref{fig:7-1}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{images/fig-71.png}
  \caption{Badany układ. (Żródło: instrukcja laboratoryjna)}
  \label{fig:7-1}
\end{figure}


Przełączenie stanu następuje w wyniku zastosowania sprzężenia zwrotnego.
Od zmiany stanu na wyjściu do powrotu do takiego stanu mija czas:

\begin{equation}
T = t_{pLH} + t_{pHL} + t_{pLH} + t_{pHL} + t_{pLH} + t_{pHL} =
3 (t_{pLH} + t_{pHL}) = 6 t_p
\end{equation}

Z oscyloskopu odczytałem okres $T = 71.09 \cdot 10^{-9} \text{s}$. Daje to
średni czas propagacji:

\begin{equation}
t_p = 11.84 \cdot 10^{-9} \text{s}
\end{equation}

Otrzymany wynik jest bardzo zbliżony do wyniku otrzymanego w poprzednim
zadaniu. Sygnał na wyjściu generatora przedstawia rys. \ref{fig:7-2}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00007.png}
  \caption{Pomiar okresu generatora.}
  \label{fig:7-2}
\end{figure}

## Przerzutnik RS

Należało zbudować przerzutnik RS z bramek NAND. We wstępie do sprawozdania
opisany opisałem przerzutnik RS zbudowany z bramek NOR (pokazany na rys.
\ref{fig:8-2}). Bramki NOR należy zastąpić bezpośrednio bramkami NAND.
Wejścia *set* i *reset* są w takim przypadku aktywne w stanie niskim. Stąd
oznacza się je czasem przez $\overline{R}$ i $\overline{S}$. Sposób kostrukcji
takiego przerzutnika przedstawia rys. \ref{fig:8-1}.

\begin{figure}[H]
  \centering
  \begin{minipage}[b]{0.35\textwidth}
    \includegraphics[width=\textwidth]{images/fig-03-rs-latch.png}
    \caption{Przerzutnik $RS\, NOR$.}
    \label{fig:8-2}
  \end{minipage}
  \hfill
  \begin{minipage}[b]{0.35\textwidth}
    \includegraphics[width=\textwidth]{images/fig-81.png}
    \caption{Przerzutnik $\overline{RS}\, NAND$.}
    \label{fig:8-1}
  \end{minipage}
\end{figure}

Przerzutnik RS NAND można potraktować jak przerzutnik sterowany poziomem
wysokim, przyjmując $R = \overline{S}$ oraz $S = \overline{R}$. W takim wypadku
niedozwolona staje się kombinacja $R = S = 0$ natomiast stan pamiętania to
$R = S = 1$.

W układzie nadal występuje problem hazardu stanów, który można zaobserwować
tym razem jeżeli oba wejścia zmienią jednocześnie stan z 0 na 1.

Tabelka przejść tego układu przedstawiona jest poniżej.

\begin{center}
\begin{tabular}{c|c|c}
  $R \text{(\~{}S na rysunku)}$ & $S \text{(\~{}R na rysunku)}$ & $Q$ \\
  \hline \hline
  1 & 1 & stan pamiętania \\
  \hline
  1 & 0 & 0 \\
  \hline
  0 & 1 & 1 \\
  \hline
  0 & 0 & stan zabroniony \\
\end{tabular}
\end{center}

Powyższą tabelkę sprawdziłem doświadczalnie w trakcie wykonywania ćwiczenia.

## Przerzutnik Schmitta

Należało wykonać dwa zadania.

### Odpowiedź bramki NAND na sygnał trójkątny

Na wejście bramki NAND (NOT) podawałem powolny sygnał trójkątny o
częstotliwośći 50 Hz, amplitudzie 5 Vpp i offsetcie 2.5 V. Obraz uzyskany na
oscyloskopie przedstawia rys. \ref{fig:9-1}. Z rysunku można odczytać przy
jakim napięciu sygnał zostaje uznany za niski lub wysoki.

Sygnał wejściowy poniżej 1.3 V to sygnał niski, dający na wyjściu bramki NOT
stan wysoki. Sygnał wejściowy większy niż 1.3 V traktowany jest jak stan wysoki
i na wyjściu bramki NOT daje stan niski.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00014.png}
  \caption{Odpowiedź bramki NOT na sygnał trójkątny. f = 50 Hz.}
  \label{fig:9-1}
\end{figure}

### Przerzutnik Schmitta

Należało skonstrować i zaobserwować działanie przerzutnika Schmitta
przedstawionego na rys. \ref{fig:9-1}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.4\textwidth]{images/fig-91.png}
  \caption{Układ Schmitta. (Żródło: instrukcja laboratoryjna).}
  \label{fig:9-1}
\end{figure}


Przerzutnik Schmitta to układ o dwóch progach przełączania (górnym i dolnym).
Służy do generacji sygnałów prostokątnych. Oczekiwany przebieg na wyjściu
przedstawia rys. \ref{fig:9-2}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.4\textwidth]{images/Forme_d_onde_symetrique.png}
  \caption{Działanie przerzutnika Schmitta. Źródło\protect\footnotemark[1].}
  \label{fig:9-2}
\end{figure}

\footnotetext[1]{\url{http://www.electronique-et-informatique.fr/anglais/Digit/Digit_6TS1.html}}

Na wejście układu podawałem sygnał prostokątny o małej częstotliwości, 150 Hz,
500 Hz i 1 kHz. W żadnym przypadku nie udało mi się uzyskać oczekiwanego
sygnału prostokątnego na wyjściu przerzutnika. Otrzymane przebiegi
przedstawione są na rys. \ref{fig:9-3} oraz \ref{fig:9-4}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00024.png}
  \caption{Przerzutnik Schmitta. f = 150 Hz.}
  \label{fig:9-3}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00025.png}
  \caption{Przerzutnik Schmitta. f = 1 kHz.}
  \label{fig:9-4}
\end{figure}

Dla częstotliwości f = 1 kHz dobrze widać że napięcia przerzutu nie leżą
symetrycznie w przedziale 0 - 5 V. Sygnał wyjściowy pozostaje w stanie wysokim
dłużej niż w stanie niskim. W układzie występuje również różniczkowanie,
mimo braku jawnej obecności pojemności (kondensatorów).

## Generator drgań prostokątnych

Zbudowałem generator drgań prostokątnych według schematu przedstawionego na
rys. \ref{fig:10-1}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.4\textwidth]{images/fig-101.png}
  \caption{Schemat układu generatora drgań prostokątnych. (Żródło: instrukcja
    laboratoryjna).}
  \label{fig:10-1}
\end{figure}

Parametry układu należało dobrać tak, by częstotliwość $f$ generatora wynosiła

\begin{equation}
f = \frac{1}{3RC} \approx 1\,\text{kHz}
\end{equation}

Wybrałem następujące elementy:

* $C = 220 \, \text{nF}$,
* $R = 0.989 \, \text{k}\Omega$,
* $f \approx 1515.1515 \, \text{Hz}$.

Należy pamiętać żeby użyć oporu rzędu $1 \, \text{k}\Omega$, i odpowiednio
dużej pojemności. Inaczej układ nie będzie generował przebiegu okresowego.

Odczyt z oscyloskopu potwierdził oczekiwaną teoretyczną częstotliwość drgań
generatora. Uzyskany obraz przedstawiony jest na rys. \ref{fig:10-2}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00020.png}
  \caption{Generator drgań prostokątnych.}
  \label{fig:10-2}
\end{figure}

## Układ redukujący częstotliwość

Należało zbudować układ redukujący częstotliwość (dzielący przez dwa).

W tym celu wykorzystałem jeden licznik $T$ dostępny w badanym układzie. Wejście
*toggle* było cały czas w stanie wysokim (1). Na wejście zegarowe podawałem
sygnał prostokątny o częstotliwości $f = 1 \, \text{kHz}$. Na opadającym
zboczu sygnału zegarowego (a więc co jeden okres) następuje przełączenie
zapamiętanej wartości. Po drugim okresie sygnału zegarowego zapamiętana
wartość będzie z powrotem równa wartości początkowej. Uzyskany układ dzieli
zatem częstotliwość przez dwa. Przedstawia to rys. \ref{fig:11-1}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{images/fig-111.png}
  \caption{Dzielenie częstotliwości. (Żródło: instrukcja laboratoryjna).}
  \label{fig:11-1}
\end{figure}

Poprawność działania układu potwierdziłem obserwując przebieg sygnałów na
ekranie oscyloskopu. Odczyty przedstawia rys. \ref{fig:11-2}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{../screenshots/tek00018.png}
  \caption{Dwukrotny spadek częstotliwości na wyjściu przerzutnika $T$.}
  \label{fig:11-2}
\end{figure}

## Licznik modulo 16

Przy użyciu czterech połączonych szeregowo przerzutników $T$ należało zbudować
licznik modulo 16. Schemat układu przedstawia rys. \ref{fig:12-1}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{images/fig-06-t-counter.png}
  \caption{Licznik 4-bitowy. (Żródło: slajdy z wykładów)}
  \label{fig:12-1}
\end{figure}

Układ zlicza impulsy pojawiające się na wejściu zegarowym. Pierwszy przerzutnik
przełącza stan przy każdym impulsie (najmłodszy bit równy na przemian 0 i 1).
Każdy kolejny przerzutnik zmienia stan dwa razy rzadziej niż poprzedni
(wyjaśnione w poprzednim rozdziale).

Układ generuje sekwencję kolejnych liczb: 0000, 0001, 0010, 0011, 0100, ...,
1111, 0000. Jest to więc licznik modulo 16.

## Licznik modulo 11

Przy użyciu czterech przerzutników $T$ (i kilku bramek NAND) można zbudować
dowolny licznik modulo N, N<16.

W ćwiczeniu należało zbudować licznik modulo 11.

Każdy przerzutnik $T$ wyposażony jest w wejście programujące, pozwalające na
ustawienie jego wartości na 0 poprzez podanie stanu niskiego.

Najprostszy liczniki modulo N można zbudować poprzez reset całego układu po
osiągnięciu wartości N. Wystarczy odwrócić bity 0 i na wejścia resetujące
liczniki podać iloczyn całości.

Dla $N = 11_{10} = 1011_{2} = N_3N_2N_1N_0$ na wejścia
resetujące liczniki podajemy zatem: $AND(N_3, NOT(N_2), N_1, N_0)$.

Dysponując jedynie czterema bramkami NAND takie rozwiązanie nie zawsze jest
możliwe.

Reset wszystkich liczników układu UCY7493 odbywa się poprzez podanie stanu
wysokiego na wejścia 2 i 3. Aby zresetować licznik na wartości
$N = 11_{10} = 1011_{2} = N_3N_2N_1N_0$
wystarczy zresetować go w momencie kiedy po raz pierwszy zajdzie sytuacja
$N_3 = 1, N_1 = 1, N_0 = 1$. Jeżeli poprzednie warunki są spełnione, to
zawsze w tym liczniku będzie $N_2 = 0$, bo dla $N_2 = 1$ jest
$N = 1111_{2} = 15_{10}$, a tej liczby nigdy nie osiągniemy licząc modulo 11.

Na wejścia resetujące należy więc podać:

* wejście 2: $N_3$,
* wejście 3: $AND(N_1, N_0) = NOT(NAND(N_1, N_0)) =
  NAND(NAND(N_1, N_0), NAND(N_1, N_0))$.

Do realizacji układu wystarczą zatem dwie bramki NAND. Rozwiązanie
potwierdziłem eksperymentalnie na płytce montażowej.
