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

# Przetwornik A/C (w oparciu o przetwornik C/A)

Należało przeanalizować działanie ośmiobitowego przetwornika A/C i wyznaczyć
jego rozdzielczość.

## Wprowadzenie

Przy użyciu przetwornika C/A można zbudować przetwornik analogowo-cyfrowy A/C.
Idea jego działania polega na liniowym sprawdzeniu kolejnych liczb podawanych
na wejście przetwornika C/A. Wybrana zostaje pierwsza, najmniejsza liczba
której odpowiadający sygnał analogowy jest większy niż sygnał referencyjny
(wejściowy). Uproszczony schemat takiego układu przedstawia rys. \ref{fig:2-1}.

Przetwornik ten bywa również nazywany przetwornikiem z próbkowaniem analogowym.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{images/adc_on_dac.png}
  \caption{Przetwornik A/C w oparciu o C/A.}
  \label{fig:2-1}
\end{figure}

Algorytm działania układu można opisać następującymi krokami:

1. Licznik początkowo ma wartość 0,
1. Wartość w liczniku zamieniana jest w przetworniku C/A na sygnał analogowy
   (napięcie),
1. Sygnał analogowy z C/A porównywany jest z sygnałem wejściowym:
    * jeżeli sygnał z C/A jest większy, zmianie ulega stan na wyjściu
      komparatora, co powoduje zatrzymanie generatora,
      w liczniku znajduje się wynik konwersji sygnału wejściowego na postać
      cyfrową,
    * jeżeli sygnał z C/A jest mniejszy, układ kontynuuje pracę,
1. Generator zegarowy powoduje inkrementację licznika, cały proces startuje od
   początku,
1. Jeżeli licznik osiągnął maksimum, odliczanie zaczyna się od początku a
   napięcie wejściowe jest większe od maksymalnego napięcia obsługiwanego
   przez przetwornik C/A.

Rozdzielczość układu zależy od ilości bitów w liczniku i przetworniku oraz
sygnału wzorcowego $U_\text{max}$ (wyjście z C/A dla wszystkich bitów w stanie
wysokim) i wynosi $\Delta U = U_\text{max} / 2^N$.

Rozdzielczość czasowa zależy od częstotliwości generatora.

## Rozdzielczość przetwornika

Ćwiczenie przeprowadzałem z użyciem gotowego układu ośmiobitowego przetwornika
A/C. Zakres pracy był ustawiony na $5\,V$. Dostępne były cztery częstotliwości
pracy generatora zegarowego.

Wybrałem napięcie większe niż dopuszczalny zakres, przy którym generator nie
był zatrzymywany. Na oscyloskopie można w ten sposób zaobserwować okresowo
rosnący poziom stałego sygnału będący wyjściem z przetwornika C/A. Odpowiednie
ustawiene wyzwalania pozwala zaobserwować przebieg piłokształtny przedstawiony
na rys. \ref{fig:2-2}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{../screenshots/tek00042.png}
  \caption{Przetwornik A/C, sygnał piłokształtny na wyjściu z przetwornika C/A.}
  \label{fig:2-2}
\end{figure}

W dalszej kolejności na oscyloskopie można zobaczyć skokową zmianę napięcia
na zboczach narastających sygnału piłokształtnego. Przykładowy obraz z
oscyloskopu przedstawia rys. \ref{fig:2-3}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{../screenshots/tek00051.png}
  \caption{Przetwornik A/C, rozdzielczość.}
  \label{fig:2-3}
\end{figure}

Z powyższego obrazu można odczytać rozdzielczość napięciową i czasową (zależną
od ustawionej częstotliwości generatora):

\begin{equation}
\begin{aligned}
\Delta T &= 10.20 \, \text{ms} \\
\Delta U &= 19.80 \, \text{mV}
\end{aligned}
\end{equation}

Oczekiwana teoretyczna rozdzielczość napięciowa to $\Delta U = 5.0 \, \text{V}
/ 255 \approx 19.61$. Widać że zmierzona wartość jest zgodna z oczekiwaną.

## Częstotliwość pracy

Należało wyznaczyć maksymalną i minimalną częstotliwość pracy przetwornika.
W tym celu zmierzyłem okres generowanych przebiegów piłokształtnych dla dwóch
ustawień zworek kontrolujących generator zegarowy:

* 00 - częstotliwość minimalna,
* 11 - częstotliwość maksymalna (według dokumentacji układu jest 512x
  większa od częstotliwości minimalnej).

Obu pomiarów dokonałem przy pomocy oscyloskopu, z różną podstawą czasową.
Przykład odczytu przedstawia rys. \ref{fig:2-4}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{../screenshots/tek00056.png}
  \caption{Przetwornik A/C, pomiar minimalnej częstotliwości pracy generatora.}
  \label{fig:2-4}
\end{figure}

W ciągu jednego okresu generator generuje 255 impulsów zegarowych. Odczytane
wartości należy podzielić przez tę liczbę. Ich odwrotność będzie
częstotliwością pracy zegara. W celu dodatkowej weryfikacji pomiar
częstotliwości maksymalnej przeprowadziłem również na mniejszym odcinku.
Otrzymane wyniki:

\begin{equation}
\begin{aligned}
\Delta f_\text{max,1} &= 1/(40.80 \,\text{ms} / 255) \approx 6375.00 \,\text{Hz} \\
\Delta f_\text{max,2} &= 1/(798.0 \,\mu\text{s} / 5) \approx 6265.66 \,\text{Hz} \\
\Delta f_\text{min} &= 1/(41.70 \,\text{s} / 255) \approx 6.12 \,\text{Hz}
\end{aligned}
\end{equation}

Z otrzymanych częstotliwości wynika, że częstotliwość maksymalna jest nie 512x,
ale 1024x większa od częstotliwości minimalnej. Nie udało mi się ustalić co
jest powodem tej dwukrotnej rozbieżności. Przy pomiarze częstotliwości
minimalnej zwarłem oba dolne piny, natomiast przy pomiarze częstotliwości
maksymalnej - oba górne.

# Przetwornik A/C (typu FLASH)

Należało przeanalizować działanie przetwornika A/C typu FLASH.

## Wprowadzenie

Przetwornik A/C typu FLASH to przetwornik wykorzystujący bezpośrednie
porównanie napięcia wejściowego z szeregiem napięć odniesienia. Wszystkie
porównania następują jednocześnie, przy użyciu wielu komparatorów. Wyjścia
komparatorów wyprowadzone są na transkoder, który po odpowiednim
zaprogramowaniu przekształca je na naturalny kod binarny. Ogólny, uproszczony
schemat układu przedstawia rys. \ref{fig:3-1}. Na rysunku dodatkowo dołączony
jest przetwornik C/A, który konwertuje otrzymany sygnał z powrotem na sygnał
analogowy.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.5\textwidth]{images/spe-ac-flash-full.png}
  \caption{Przetwornik A/C, układ wykorzystywany w trakcie ćwiczenia.}
  \label{fig:3-1}
\end{figure}

Przetwornik typu FLASH jest znacznie szybszy od przetwornika z próbkowaniem
i działa w czasie stałym względem mierzonego napięcia.
Jego konstrukcja jest jednak bardziej skomplikowana a rozdzielczość mniejsza
(N-bitowy przetwornik pozwala na odczyt N poziomów napięcia).

**Moduł komparatorów**. Służy do zamiany sygnału analogowego na kod
*linijkowy* (liczba $n<N$ reprezentowana jest przez $n$ pierwszych bitów
w stanie wysokim w rejestrze). Użyty w ćwiczeniu moduł pozwala na pomiar
napięcia z zakresu 0 do 10 V i konwersję go na wartość liczbową od 0 do 15
(zapisaną na 16 bitach).

Schemat układu przedstawia rys. \ref{fig:3-2}.

**Transkoder**. Służy do konwersji kodu *linijkowego* na kod czterobitowy,
zgodnie z zaprogramowanymi regułami. Kod linijkowy jest bardzo nieefektywny
pamięciowo - do jednoznacznej reprezentacji $N$-bitowego kodu linijkowego
wystarczy $\log_2 N$ bitów (binarnego kodu naturalnego lub kodu Graya).

Pierwszym etapem konwersji jest zamiana kodu linijkowego na standardowy kod
"1 z $N$". Każda z $N$ linii wyjsciowych konwersji na "1 z $N$" jest
wprowadzona na 4 przełączniki *dip-switch*. Przy ich pomocy można ustawić
kombinację 4 bitów odpowiadających danemu kodowi "1 z $N$". Wyjścia z
*dip-switchy* są wyprowadzane na wyjście układu transkodera.

**Przetwornik C/A**. Pozwala na ponowną konwersję sygnału cyfrowego na
analogowy. Można go wykorzystać do weryfikacji działania układu.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.2\textwidth]{images/spe-ac-flash-comp.png}
  \caption{Moduł komparatorów przetwornika FLASH. Uproszczony fragment schematu
    z drabinką rezystorową i szeregiem komparatorów.
    Wyjścia z komparatorów to kolejne bity kodu linijkowego.}
  \label{fig:3-2}
\end{figure}

## Programowanie transkodera RPP-S

Transkoder RPP-S to opisany wcześniej transkoder wykorzystujący ręczne
przełączniki.

W celu weryfikacji działania układu, zaprogramowałem go tak, by kolejnym
liczbom kodu linijkowego odpowiadały kolejne liczby naturalnego kodu binarnego.
Po tej operacji i ponownej kowersji na sygnał analogowy, sygnał wyjściowy
powinien być skwantowany, o 16 dyskretnych poziomach napięcia. Uzyskany
obraz na oscyloskopie przedstawia rys. \ref{fig:3-3}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{../screenshots/tek00061.png}
  \caption{Przetwornik A/C FLASH, konwersja na postać cyfrową i odtworzenie
    sygnału.}
  \label{fig:3-3}
\end{figure}

Przełączniki były ustawione w następujący sposób:

\begin{equation}
(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
\end{equation}

Rozdzielczość napięciowa tego konwertera wynosi około $0.625\,\text{V}$, jest
znacznie niższa niż 8-bitowego przetwornika z próbkowaniem analizowanego w
poprzedniej części ćwiczenia.

## Inwersja sygnału

Układ można przeprogramować tak, by dokonywał inwersji sygnału. W tym celu
dla wejściowego sygnału odpowiadającego liczbie $n$ należy ustalić wyjście jako
$N-1-n$. Odpowiednie ustawienie przełączników to:

\begin{equation}
(15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0)
\end{equation}

Otrzymany obraz na oscyloskopie przedstawiają rys. \ref{fig:3-4} oraz
\ref{fig:3-5}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{../screenshots/tek00062.png}
  \caption{Przetwornik A/C FLASH, inwersja sygnału sinusoidalnego.}
  \label{fig:3-4}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{../screenshots/tek00064.png}
  \caption{Przetwornik A/C FLASH, inwersja sygnału trójkątnego.}
  \label{fig:3-5}
\end{figure}

## Zmiana częstotliwości

Aby podzielić częstotliwość przez dwa, należy tak zaprogramować układ, aby dla
liczby $n=N/2$ osiągnąć generować maksymalną wartość, a następnie generować
kolejne liczby w kierunku 0. Ustawienie przełączników:

\begin{equation}
(0,2,4,6,8,10,12,16,16,12,10,8,6,4,2,0)
\end{equation}

Uzyskany schemat można połączyć dodatkowo z inwersją, jak pokazuje rys.
\ref{fig:3-6}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{../screenshots/tek00065.png}
  \caption{Przetwornik A/C FLASH, inwersja i zmiana częstotliwości.}
  \label{fig:3-6}
\end{figure}

## Zakres częstotliwości pracy

Na wejście układu podawałem sygnał trójkątny, zwiększając jego częstotliwość.

Powyżej częstotliwości $f_\text{max} = 2\,\text{kHz}$ w obrazie pojawiały
się już przekłamania, przedstawione na rys. \ref{fig:3-7}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{../screenshots/tek00071.png}
  \caption{Przetwornik A/C FLASH, maksymalna częstotliwość pracy.}
  \label{fig:3-7}
\end{figure}

Układ pracował dobrze przy najmniejszych możliwych do ustawienia
częstotliwościach.

## Pamięć RPP-SRAM

Dodatkowym elementem zestawu ćwiczeniowego była alternatywna implementacja
transkodera, zbudowana w oparciu o ulotną pamięć SRAM. W celu jego
przetestowania, zaprogramowałem układ tak, by po osiągnięciu połowy
maksymalnej wartości sygnał był odwrócony. Zaprogramowałem następujący schemat:

\begin{equation}
(0,1,2,3,4,5,6,7,8,7,6,5,4,3,2,1)
\end{equation}

Otrzymane wyniki przedstawione są na rys. \ref{fig:3-8} oraz \ref{fig:3-9}.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{../screenshots/tek00077.png}
  \caption{Przetwornik A/C FLASH, test transkodera RPP-SRAM, sygnał sinusoidalny.}
  \label{fig:3-8}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{../screenshots/tek00076.png}
  \caption{Przetwornik A/C FLASH, test transkodera RPP-SRAM, sygnał trójkątny.}
  \label{fig:3-9}
\end{figure}
