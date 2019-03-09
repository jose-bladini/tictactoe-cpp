
@ECHO OFF
REM kodowanie UTF-8
chcp 1250
REM Rozpoczecie
mode con:cols=40 lines=30
title Luncher
Color 0F
CLS
Echo.
Echo   E:English 
ECHO.
Echo   P:Polski 
Choice /C EP /N
IF %ERRORLEVEL%==1 SET j=1
IF %ERRORLEVEL%==2 SET j=2
IF %j%==1 Title TIC TAC TOE
IF %j%==2 TITLE KÓ£KO i KRZY¯YK
SET rpc=M
goto  menu
:restart
CLS
goto menu

:menu
mode con:cols=40 lines=20
if %j%==1 (
ECHO ========================================
ECHO ============== TIC TAC TOE =============
ECHO ========================================
ECHO ================ v 1.5 =================
ECHO ========================================
ECHO.
ECHO Choose:
ECHO S = Singelplayer
ECHO M = Multiplayer
ECHO O = Options 
Echo Z = Changes
Echo R = Rules
ECHO Q = Exit
Echo.
ECHO ========================================
ECHO ================ To easy?  =============
Echo ================ To hard? ==============
ECHO ===  Change the difficulty level! ======
ECHO ========================================
 )
IF %j%==2 (
ECHO ========================================
ECHO ============ KÓ£KO i KRZY¯YK ===========
ECHO ========================================
ECHO ================= v1.5 =================
ECHO ========================================
ECHO.
ECHO Wybierz tryb gry:
ECHO S = Gra Jednoosobowa
ECHO M = Gra Wieloosobowa
ECHO O = Opcje
Echo R = Zasady
Echo Z = Lista zmian
ECHO Q = Wyjœæie )
Echo.
ECHO ========================================
ECHO ============== Zbyt ³atwo?  ============
Echo ============== Zbyt trudno? ============
ECHO ======= Zmieñ poziom trudnoœci! ========
ECHO ========================================
CHOICE /C SMOZQR /N
IF %ERRORLEVEL%==1 SET single=1&GOTO wp
IF %ERRORLEVEL%==2 SET single=0&GOTO wp
IF %ERRORLEVEL%==3 GOTO op
IF %ERRORLEVEL%==4 GOTO up
IF %ERRORLEVEL%==5 GOTO end
IF %ERRORLEVEL%==6 GOTO zasady

:op
CLS
if %j%==1 (
Echo=================Options=================
echo.
echo  1. Language 
echo  2. Difficulty 
echo  3. Color
Echo  4. Twórcy )
if %j%==2 (
Echo===================Opcje=================
echo.
echo  1. Jêzyk
echo  2. Poziom trudnoœci 
echo  3. Kolor
Echo  4. Credits )
echo.
IF %j%==1 Echo To go back to main menu press C
IF %j%==2 Echo Aby powróciæ do menu wpisz C
CHOICE /C 1234C /N
if %errorlevel%==1 goto lang
if %errorlevel%==2 goto wpt
if %errorlevel%==3 goto kl
if %errorlevel%==5 goto menu
IF %ERRORLEVEL%==4 GOTO cr

:wp
CLS
Echo.
IF %j%==1 ECHO Choose field size:
IF %j%==2 ECHO Wybierz rozmiar planszy:
Echo 1. 3x3
Echo 2. 4x4
Echo 3. 5x5
Echo.
IF %j%==1 Echo To go back to main menu press C
IF %j%==2 Echo Aby powróciæ do menu wpisz C
CHOICE /C 123C /N
IF %ERRORLEVEL%==4 SET cel=wp&goto menub
SET pl=%ERRORLEVEL%
GOTO mp

:lang
CLS
Echo.
IF %j%==1 (
echo Choose Language :
echo 1.English 
echo 2.Polski )
IF %j%==2 (
echo Wybierz jêzyk :
echo 1.English 
echo 2.Polski )
Echo.
IF %j%==1 Echo To go back to main menu press C
IF %j%==2 Echo Aby powróciæ do menu wpisz C
CHOICE /C 12C /N
IF %ERRORLEVEL%==3 SET cel=lang&goto menub
SET j=%ERRORLEVEL%
GOTO restart

:wpt
CLS
ECHO.
IF %j%==1 (
Echo CHoose difficulty level 
Echo 1.Easy
Echo 2.Normal
Echo 3.Hard
Echo.
Echo To go back to main menu press C )
IF %j%==2 (
Echo Wybierz poziom trudnoœci 
Echo 1.£atwy 
Echo 2.Normarny 
Echo 3.Trudny
Echo. 
Echo Aby powróciæ do menu wpisz C )
CHOICE /C 123C /N
IF %ERRORLEVEL%==1 SET rpc=E&goto op
IF %ERRORLEVEL%==2 SET rpc=M&goto op
IF %ERRORLEVEL%==3 SET rpc=H&goto op
IF %ERRORLEVEL%==4 SET cel=wpt&goto menub
 
:menub
CLS
IF %j%==1 (
ECHO Go back to main menu?
echo [Y/N])
IF %j%==2 (
ECHO Powrót do menu?
eCHO [T/N])
CHOICE /C TNY /N
IF %ERRORLEVEL%==1 GOTO restart
IF %ERRORLEVEL%==2 GOTO %cel%
IF %ERRORLEVEL%==3 GOTO restart 

:end
CLS
IF %j%==1 ( ECHO Are you sure?
eCHO [Y/N]
CHOICE /C YN /N )
IF %j%==2 ( ECHO Czy na pewno?
eCHO [T/N]
CHOICE /C TNY /N )
IF %ERRORLEVEL%==1 EXIT
IF %ERRORLEVEL%==2 GOTO restart
IF %ERRORLEVEL%==3 EXIT

:cr
CLS
ECHO ========================================
IF %j%==1 Echo =============== Creators ===============
IF %j%==2 ECHO ================ Twórcy ================
ECHO ========================================
ECHO ============== Mateusz Sz. =============
ECHO ========================================
ECHO ============= Bart³omiej K. ============
ECHO ========================================
ECHO.
IF %j%==1 Echo To go back to main menu press C
IF %j%==2 Echo Aby powróciæ do menu wpisz C
CHOICE /C C /N
IF %ERRORLEVEL%==1 GOTO restart
:kl
CLS
if %j%==1 (
echo Colors:
echo.
echo  W = White
echo  R = Red
echo  M = Magenta
echo  T = Cyan
echo  G = Green
echo  Y = Yellow
echo. 
Echo To go back to main menu press C)
IF %j%==2 (
echo Kolory:
echo.
echo  W = Bia³y
echo  R = Czerwony
echo  M = Magenta
echo  T = Turkusowy
echo  G = Zielony
echo  Y = ¯ó³ty 
echo. 
Echo Aby powróciæ do menu wpisz C)
Choice /C WRMTGYC /N
Set cel==kl
IF %ERRORLEVEL%==1 Color 0F
IF %ERRORLEVEL%==2 Color 0C
IF %ERRORLEVEL%==3 Color 0D
IF %ERRORLEVEL%==4 Color 0B
IF %ERRORLEVEL%==5 Color 0A
IF %ERRORLEVEL%==6 Color 0E
IF %ERRORLEVEL%==7 GOTO restart
GOTO op
:zasady
cls
echo.
echo 1: 3x3
echo 2: 4x4
echo 3: 5x5
echo.
echo Aby powróciæ do menu wpisz C
CHOICE /C 123C /N
IF %ERRORLEVEL%==1 Goto z3
IF %ERRORLEVEL%==2 Goto z4
IF %ERRORLEVEL%==3 Goto z5
IF %ERRORLEVEL%==4 goto restart

:z3
cls
echo.
if %j%==1 (
echo The players target it to place 3 
echo identical symbols in a row.
)
if %j%==2 (
echo Celem gracza jest umieszczenie 3 tych
echo samych znaków w jednym rzêdzie.
)
echo.
echo.
pause 
goto zasady

:z4
cls
echo.
if %j%==1 (
echo The players target it to place 4 
echo identical symbols in a row.
)
if %j%==2 (
echo Celem gracza jest umieszczenie 4 tych
echo samych znaków w jednym rzêdzie.
)
echo.
echo.
pause 
goto zasady
:z5
cls
echo.
if %j%==1 (
echo The players target it to place 5
echo identical symbols in a row.
)
if %j%==2 (
echo Celem gracza jest umieszczenie 5 tych
echo samych znaków w jednym rzêdzie.
)
echo.
echo.
pause 
goto zasady

:up
CLS
mode con:cols=70 lines=79
if %j%==1 (
echo v1.5
echo +Changed easter egg 
echo +Added windows 7 version 
echo +Fixed difficulty problem
echo +Moved  the credits into the options menu
echo.
echo v1.4 
echo +Added different difficulty levels 
echo +Added options menu 
echo +Now u can change the game language in options 
echo +Moved color change menu into optiopns 
echo.
echo v1.3
echo +Fixed setting player names
echo +3x3 Singeplayer improved 
echo +added a "Rules " tab 
echo +fixed minior bugs
echo +improved bots 
echo.
echo v1.2
echo +Adjustments
echo +Better draw detection on 3x3
echo +Debugging
echo +Improved the English version
Echo v1.1
Echo +Added English version
Echo +Now u can exit Color tab
Echo +optimalized 
echo.
echo v1.0
echo +smarter bot
echo +redone4x4 and 5x5
echo +Added 4x4 and 5x5 Singelplayer
echo +optimalized
echo +deleted info tab
echo +added easter egg 
echo.
echo v0.9
echo + ustawianie nazwy gracza
echo.
echo v0.8
echo +singleplayer 3x3
echo.
ECHO v0.7 
ECHo +Added Engslish version
Echo +Added Info tab
ECHO +CHanged the window name 
ECHO v0.6
ECHO +optimalized
ECHO +fixed clash with wrong rounds
ECHO.
Echo v0.5
echo +added sizeselect
echo +added size 4x4
echo +added size 5x5
echo +changelog added
echo +changed some stuff
echo.
echo v0.4
echo +Rounds work
echo +Added scores
echo +Fixed crash with choosing rounds
echo.
echo v0.3
echo +Winning added
echo.
echo v0.2 
echo +Collor change
echo +Added Credits
echo +fixed glitch with closing the game
echo.
echo v0.1 a.k.a. "BETA"
echo FIrst official version
echo +added main menu
echo +can select fields
echo +can't choose a field two times
echo.
echo  To go back to main menu press C
)
if %j%==2 (
echo v1.5
echo +Zmiana sekretu
echo +Wsparcie dla systemu Windows 7
echo +Pozbycei siê b³êdu zwi¹zanego z poziomem trundoœic
echo +Przeniesienie zak³adki "twórcy" do opcji
echo.
echo v1.4
echo +Dodano ró¿nie poziomy turdnoœci 
echo +Dodano menu opcji
echo +Przeniesiono zmianê kolorów do menu opcji
echo +Dodana zmianê jêzyka w opcjach
echo.
echo v1.3
echo +Poprawiono wprowadzanie nazwy graczy 
echo +Udoskonalenie gry jednoosobowej na planszy 3x3
echo +dodano zak³adkê "zasady"
echo +Poprawa SI na innych rozmiarach planszy
echo +usuwanie mniejszych b³êdów
echo.
echo v1.2
echo +ma³e poprawki
echo +polepszenie sprawdzania remisu na 3x3
echo +Debugowanie
echo +Poprawa Angielskiego t³umaczenia
echo v1.1 
echo +Dodano angliesk¹ wersjê
echo +mo¿na wyjœæ z zak³adki zmiany kolorów
echo +optymalizacja kodu
echo.
echo v1.0
echo +poprawienie iq bota
echo +poprawienie 4x4 i 5x5
echo +dodanie 4x4 i 5x5 Singelplayer
echo +optymalizacja kodu
echo +usuniêcie zak³adki info
echo +dodano easter egga
echo.
echo v0.9
echo +ustawianie nazwy gracza
echo.
echo v0.8
echo +rozgrywka jednoosobowa 3x3
echo.
Echo v0.7
Echo +dodano zak³adkê informacjê
ECHo +Zmieniono nazwê okna
ECHO +zmieniono rozmiar okna
ECHO.
ECHO v0.6
ECHO +optymalizacja kodu
ECHO +naprawiono crash gry przy wpisaniu b³êdnej liczby rund
ECHO.
Echo v0.5
echo +wybór plansz
echo +plansze 4x4
echo +plansze 5x5
echo +changelog wbudowany w grê
echo +zmieniono kilka szczegó³ów
echo.
echo v0.4
echo +rundy dzia³aj¹
echo +wprowadzono system punktacji
echo +naprawiono b³¹d z crashem gry kiedy nie okreœlimy liczby rund
echo.
echo v0.3
echo +mo¿liwoœæ wygrania
echo.
echo v0.2 
echo +zmiana kolorów
echo +opcja "twórcy"
echo +naprawiono b³¹d zwi¹zany z zamykaniem gry
echo.
echo v0.1 a.k.a. "BETA"
echo +menu g³ówne
echo +mo¿liwoœæ zaznaczania pól
echo +nie mo¿na zaznaczyæ pola dwa razy
echo.
echo Aby powróciæ do menu wpisz C
)
CHOICE /C C /N
IF %ERRORLEVEL%==1 GOTO restart


:mp
CLS
SET pX=0
SET pO=0
SET zr=0
SET los=0
IF %j%==1 Echo Choose round ammount [Options: 1, 3, 5, 10, 20, 50, 999 C to cancel]
IF %j%==2 ECHO Ile rund chcesz graæ? [Mo¿liwoœci: 1, 3, 5, 10, 20, 50, 999 C aby anulowaæ]
ECHO.
SET /P lr=? 
IF NOT DEFINED lr SET cel=mp&GOTO err
IF %lr%==C SET cel=mp&goto  menub
IF %lr%==c SET cel=mp&goto  menub
IF %lr%==1 GOTO Nazwag
IF %lr%==3 GOTO Nazwag
IF %lr%==5 GOTO Nazwag
IF %lr%==10 GOTO Nazwag
IF %lr%==20 GOTO Nazwag
IF %lr%==50 GOTO Nazwag
IF %lr%==999 IF %j%==1 (
CLS
Echo No chance!
PAUSE
GOTO mp 
)
IF %lr%==999 IF %j%==2 (
CLS
Echo Nie ma szans !
PAUSE
GOTO mp
)

:Nazwag
CLS
set ng1=
IF %j%==1 ECHO Choose player one name 
IF %j%==2 echo Podaj nazwê gracza pierwszego
echo.
SET /P ng1=? 
IF NOT DEFINED ng1 SET cel=Nazwag&GOTO err
SET G1=%ng1%
IF %single%==1 SET G2=Bot&GOTO start
GOTO Nazwag2

:Nazwag2 
CLS
set ng2=
IF %j%==1 ECHO Choose player two name 
IF %j%==2 echo Podaj nazwê gracza drugiego 
SET /P ng2=? 
IF NOT DEFINED lr SET cel=Nazwag2&GOTO err
SET G2=%ng2%
Goto start

:err
CLS
IF %j%==1 ECHO Wrong number or letter!
IF %j%==2 ECHO Nieprawid³owa liczba lub litera!
PAUSE
GOTO %cel%

:start
IF %pl%==1 GOTO init3x3
IF %pl%==2 GOTO init4x4
IF %pl%==3 GOTO init5x5

:init3x3
CLS
SET A1= 
SET A2= 
SET A3= 
SET B1= 
SET B2= 
SET B3= 
SET C1= 
SET C2= 
SET C3= 
SET wyg= 
SET pr=0
IF NOT DEFINED zacz SET zacz=x
REM losowanie kto zaczyna
IF %los%==0 ( SET los=1&SET /A zacz=%RANDOM% * 2 / 32767 ) ELSE IF %zacz%==0 ( SET zacz=1 ) ELSE SET zacz=0
SET kolej=%zacz%
REM 0=krzyzyk 1=kolko
IF %j%==1 (
IF %kolej%==0 ECHO %G1% Begins!
IF %kolej%==1 ECHO %G2% Begins!)
IF %j%==2 (
IF %kolej%==0 ECHO %G1% zaczyna!
IF %kolej%==1 ECHO %G2% zaczyna!)
ECHO.
PAUSE
GOTO plansza3x3

:zmiana
IF %kolej%==0 ( SET kolej=1 ) ELSE SET kolej=0
IF %single%==1 IF %pr%==0 IF %kolej%==1 ( SET kolej=0 ) ELSE SET kolej=1
IF %pl%==1 GOTO ruch3x3
IF %pl%==2 GOTO ruch4x4
IF %pl%==3 GOTO ruch5x5

:plansza3x3
CLS
ECHO.
ECHO ^ %G1% %pX% - %pO% %G2%
ECHO.
ECHO ^     A   B   C
ECHO ^   _____________
ECHO ^ 1 ^| %A1% ^| %B1% ^| %C1% ^|
ECHO ^   ^|---^|---^|---^|
ECHO ^ 2 ^| %A2% ^| %B2% ^| %C2% ^|
ECHO ^   ^|---^|---^|---^|
ECHO ^ 3 ^| %A3% ^| %B3% ^| %C3% ^|
ECHO ^   —————————————
ECHO.
GOTO spr3x3

:spr3x3
REM Sprawdzenie czy pierwszy ruch zosta³ wykonany
IF %pr%==0 GOTO ruch3x3
REM Sprawdzenie czy istnieje sytuacja koñcz¹ca grê
IF "%A1%"=="%B1%" IF "%B1%"=="%C1%" IF "%C1%" NEQ " " SET wyg=%kolej%
IF "%A2%"=="%B2%" IF "%B2%"=="%C2%" IF "%C2%" NEQ " " SET wyg=%kolej%
IF "%A3%"=="%B3%" IF "%B3%"=="%C3%" IF "%C3%" NEQ " " SET wyg=%kolej%
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%" NEQ " " SET wyg=%kolej%
IF "%B1%"=="%B2%" IF "%B2%"=="%B3%" IF "%B3%" NEQ " " SET wyg=%kolej%
IF "%C1%"=="%C2%" IF "%C2%"=="%C3%" IF "%C3%" NEQ " " SET wyg=%kolej%
IF "%A1%"=="%B2%" IF "%B2%"=="%C3%" IF "%C3%" NEQ " " SET wyg=%kolej%
IF "%C1%"=="%B2%" IF "%B2%"=="%A3%" IF "%A3%" NEQ " " SET wyg=%kolej%

REM Sprawdzenie remisu
IF "%A1%"=="%B2%" IF  "%B2%"=="%A3%" IF "%A3%"=="%C2%" IF NOT "%C2%"==" " SET wyg=2
IF "%A2%"=="%B2%" IF  "%B2%"=="%C3%" IF "%C3%"=="%A2%" IF NOT "%B2%"==" " SET wyg=2
IF "%B1%"=="%B2%" IF  "%B2%"=="%C3%" IF "%C3%"=="%A2%" IF NOT "%B2%"==" " SET wyg=2
IF "%A1%"=="%B2%" IF  "%B2%"=="%B3%" IF "%B3%"=="%C1%" IF NOT "%B2%"==" " SET wyg=2

IF "%C1%"=="%A2%" IF  "%B3%"=="%C3%" IF "%C3%"=="%A2%" IF NOT "%A2%"==" " SET wyg=2
IF "%A1%"=="%B3%" IF  "%B3%"=="%C1%" IF "%C1%"=="%C2%" IF NOT "%C2%"==" " SET wyg=2
IF "%A1%"=="%B1%" IF  "%B1%"=="%A3%" IF "%A3%"=="%C2%" IF NOT "%C2%"==" " SET wyg=2
IF "%A3%"=="%A2%" IF  "%A2%"=="%C3%" IF "%C3%"=="%B1%" IF NOT "%B1%"==" " SET wyg=2
IF "%C1%"=="%A2%" IF  "%B3%"=="%C1%" IF "%A1%"=="%A2%" IF NOT "%A2%"==" " SET wyg=2
IF "%A1%"=="%B3%" IF  "%B3%"=="%C2%" IF "%C2%"=="%A3%" IF NOT "%C2%"==" " SET wyg=2
IF "%A3%"=="%B1%" IF  "%B1%"=="%C3%" IF "%A3%"=="%C2%" IF NOT "%C2%"==" " SET wyg=2
IF "%C3%"=="%A2%" IF  "%A2%"=="%C1%" IF "%C1%"=="%B1%" IF NOT "%B1%"==" " SET wyg=2

IF "%C1%"=="%A2%" IF  "%B2%"=="%C1%" IF "%B3%"=="%A2%" IF NOT "%A2%"==" " SET wyg=2
IF "%A1%"=="%B3%" IF  "%B3%"=="%C2%" IF "%C2%"=="%B2%" IF NOT "%C2%"==" " SET wyg=2
IF "%A3%"=="%B1%" IF  "%B1%"=="%C2%" IF "%B2%"=="%C2%" IF NOT "%C2%"==" " SET wyg=2
IF "%C3%"=="%A2%" IF  "%A2%"=="%B1%" IF "%B2%"=="%B1%" IF NOT "%B1%"==" " SET wyg=2
IF "%wyg%"==" "  GOTO zmiana
GOTO kg

:kg
IF %j%==1 (
IF %wyg%==0 SET /A pX=%pX% + 1&ECHO %G1% Won!
IF %wyg%==1 SET /A pO=%pO% + 1&ECHO %G2% Won! 
IF %wyg%==2 ECHO Draw! )
IF %j%==2 (
IF %wyg%==0 SET /A pX=%pX% + 1&ECHO %G1% wygrywa!
IF %wyg%==1 SET /A pO=%pO% + 1&ECHO %G2% wygrywa!
IF %wyg%==2 ECHO Remis! )
ECHO.
PAUSE
REM Licznik zagranych rund
SET /A zr=%zr% + 1
REM Sprawdzenie czy rozegrano ustalon¹ iloœæ rund i czy któraœ strona ma przewagê
IF %zr%==%lr% ( IF %pX% NEQ %pO% ( GOTO wynik ) ELSE SET /A lr=%lr% + 1 )
ECHO.
IF %j%==1 Echo Do u wanna play again ?
IF %j%==2 ECHO Grasz dalej?
CHOICE /C TN
IF %ERRORLEVEL%==1 (
IF %pl%==1 GOTO init3x3
IF %pl%==2 GOTO init4x4
IF %pl%==3 GOTO init5x5 )
IF %ERRORLEVEL%==2 GOTO restart
IF %ERRORLEVEL%==3 (
IF %pl%==1 GOTO init3x3
IF %pl%==2 GOTO init4x4
IF %pl%==3 GOTO init5x5 )

:wynik
CLS
if %j%==1 (
ECHO End of the game !
IF %pO% LSS %pX% ( ECHO %G1% won the game! ) ELSE ECHO %G2% won the game!
ECHO.
ECHO Wynik: %G1% %pX% - %pO% %G2%
ECHO.
ECHO Play again?
CHOICE /C YN )
if %j%==2 (
ECHO Koniec gry!
IF %pO% LSS %pX% ( ECHO %G1% wygrywa ca³¹ rozgrywkê! ) ELSE ECHO %G2% wygrywa ca³¹ rozgrywkê!
ECHO.
ECHO Wynik: %G1% %pX% - %pO% %G2%
ECHO.
ECHO Grasz jeszcze raz?)
CHOICE /C TN
IF %ERRORLEVEL%==1 GOTO wp
IF %ERRORLEVEL%==2 GOTO restart

:pz
IF %j%==1 ECHO Field filled!
IF %j%==2 ECHO Pole zajête!
ECHO.
SET pr=0
PAUSE
IF %pl%==1 GOTO plansza3x3
IF %pl%==2 GOTO plansza4x4
IF %pl%==3 GOTO plansza5x5

:ruch3x3
IF %single%==1 IF %kolej%==1 GOTO ruchPC3x3%rpc%
IF %j%==1 (
IF %kolej%==0 ECHO %G1% Move
IF %kolej%==1 ECHO %G2% Move)
IF %j%==2 (
IF %kolej%==0 ECHO Ruch %G1%
IF %kolej%==1 ECHO Ruch %G2%)
ECHO.
if %j%==1 Echo Choose unit:
if %j%==2 ECHO Wybierz kolumnê:
CHOICE /C ABC
IF %ERRORLEVEL%==1 SET kol=A
IF %ERRORLEVEL%==2 SET kol=B
IF %ERRORLEVEL%==3 SET kol=C
ECHO.
if %j%==1 ECho Choose verse:
if %j%==2 ECHO Wybierz wiersz:
CHOICE /C 123
SET wrs=%ERRORLEVEL%
IF %kol%%wrs%==A1 IF NOT "%A1%"==" " GOTO pz
IF %kol%%wrs%==A2 IF NOT "%A2%"==" " GOTO pz
IF %kol%%wrs%==A3 IF NOT "%A3%"==" " GOTO pz
IF %kol%%wrs%==B1 IF NOT "%B1%"==" " GOTO pz
IF %kol%%wrs%==B2 IF NOT "%B2%"==" " GOTO pz
IF %kol%%wrs%==B3 IF NOT "%B3%"==" " GOTO pz
IF %kol%%wrs%==C1 IF NOT "%C1%"==" " GOTO pz
IF %kol%%wrs%==C2 IF NOT "%C2%"==" " GOTO pz
IF %kol%%wrs%==C3 IF NOT "%C3%"==" " GOTO pz
IF %kolej%==0 SET %kol%%wrs%=X
IF %kolej%==1 SET %kol%%wrs%=O
SET pr=1
GOTO plansza3x3

:init4x4
CLS
SET A1= 
SET A2= 
SET A3= 
Set A4= 
SET B1= 
SET B2= 
SET B3= 
Set B4= 
SET C1= 
SET C2= 
SET C3= 
Set C4= 
Set D1= 
set D2= 
Set D3= 
Set D4= 
SET wyg= 
SET pr=0
IF NOT DEFINED zacz SET zacz=x
REM losowanie kto zaczyna
IF %los%==0 ( SET los=1&SET /A zacz=%RANDOM% * 2 / 32767 ) ELSE IF %zacz%==0 ( SET zacz=1 ) ELSE SET zacz=0
SET kolej=%zacz%
REM 0=krzyzyk 1=kolko
IF %j%==1 (
IF %kolej%==0 ECHO %G1% Begins!
IF %kolej%==1 ECHO %G2% Begins!)
IF %j%==2 (
IF %kolej%==0 ECHO %G1% Zaczyna!
IF %kolej%==1 ECHO %G2% zaczyna!)
ECHO.
PAUSE
GOTO plansza4x4

:plansza4x4
CLS
ECHO.
ECHO ^ %G1% %pX% - %pO% %G2%
ECHO.
ECHO ^     A   B   C   D
ECHO ^   _________________
ECHO ^ 1 ^| %A1% ^| %B1% ^| %C1% ^| %D1% ^|
ECHO ^   ^|---^|---^|---^|---^|
ECHO ^ 2 ^| %A2% ^| %B2% ^| %C2% ^| %D2% ^|
ECHO ^   ^|---^|---^|---^|---^|
ECHO ^ 3 ^| %A3% ^| %B3% ^| %C3% ^| %D3% ^|
ECHO ^   ^|---^|---^|---^|---^|
ECHO ^ 4 ^| %A4% ^| %B4% ^| %C4% ^| %D4% ^|
Echo ^   —————————————————
GOTO spr4x4

:spr4x4
REM Sprawdzenie czy pierwszy ruch zosta³ wykonany
IF %pr%==0 GOTO ruch4x4
REM Sprawdzenie czy istnieje sytuacja koñcz¹ca grê
IF "%A1%"=="%B1%" IF "%B1%"=="%C1%" IF "%C1%"=="%D1%" IF "%D1%" NEQ " " SET wyg=%kolej%
IF "%A2%"=="%B2%" IF "%B2%"=="%C2%" IF "%C2%"=="%D2%" IF "%D2%" NEQ " " SET wyg=%kolej%
IF "%A3%"=="%B3%" IF "%B3%"=="%C3%" IF "%C3%"=="%D3%" IF "%D3%" NEQ " " SET wyg=%kolej%
IF "%A4%"=="%B4%" IF "%B4%"=="%C4%" IF "%C4%"=="%D4%" IF "%D4%" NEQ " " SET wyg=%kolej%
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A4%" NEQ " " SET wyg=%kolej%
IF "%B1%"=="%B2%" IF "%B2%"=="%B3%" IF "%B3%"=="%B4%" IF "%B4%" NEQ " " SET wyg=%kolej%
IF "%C1%"=="%C2%" IF "%C2%"=="%C3%" IF "%C3%"=="%C4%" IF "%C4%" NEQ " " SET wyg=%kolej%
IF "%D1%"=="%D2%" IF "%D2%"=="%D3%" IF "%D3%"=="%D4%" IF "%D4%" NEQ " " Set wyg=%kolej%
IF "%A1%"=="%B2%" IF "%B2%"=="%C3%" IF "%C3%"=="%D4%" IF "%D4%" NEQ " " SET wyg=%kolej%
IF "%D1%"=="%C2%" IF "%C2%"=="%B3%" IF "%B3%"=="%A4%" IF "%A4%" neq " " SET wyg=%kolej%
REM Sprawdzenie remisu
IF "%A1%" NEQ " " IF "%B1%" NEQ " " IF "%C1%" NEQ " " IF "%D1%" NEQ " " IF "%A2%" NEQ " " IF "%B2%" NEQ " " IF "%C2%" NEQ " " IF "%D2%" NEQ " "IF "%A3%" NEQ " " IF "%B3%" NEQ " " IF "%C3%" NEQ " " IF "%D3%" NEQ " " IF "%A4%" NEQ " " IF "%B4%" NEQ " " IF "%C4%" NEQ " " IF "%D4%" NEQ " " IF "%wyg%"==" " SET wyg=2
IF "%wyg%"==" " GOTO zmiana
GOTO kg

:ruch4x4
IF %single%==1 IF %kolej%==1 GOTO ruchPC4x4%rpc%
IF %j%==1 (
IF %kolej%==0 ECHO %G1% Move
IF %kolej%==1 ECHO %G2% Move)
IF %j%==2 (
IF %kolej%==0 ECHO Ruch %G1%
IF %kolej%==1 ECHO Ruch %G2%)
ECHO.
if %j%==1 Echo Choose unit:
if %j%==2 ECHO Wybierz kolumnê:
CHOICE /C ABCD
IF %ERRORLEVEL%==1 SET kol=A
IF %ERRORLEVEL%==2 SET kol=B
IF %ERRORLEVEL%==3 SET kol=C
IF %ERRORLEVEL%==4 Set kol=D
ECHO.
if %j%==1 ECho Choose verse:
if %j%==2 ECHO Wybierz wiersz:
CHOICE /C 1234
SET wrs=%ERRORLEVEL%
IF %kol%%wrs%==A1 IF NOT "%A1%"==" " GOTO pz
IF %kol%%wrs%==A2 IF NOT "%A2%"==" " GOTO pz
IF %kol%%wrs%==A3 IF NOT "%A3%"==" " GOTO pz
IF %kol%%wrs%==A4 IF NOT "%A4%"==" " GOTO pz
IF %kol%%wrs%==B1 IF NOT "%B1%"==" " GOTO pz
IF %kol%%wrs%==B2 IF NOT "%B2%"==" " GOTO pz
IF %kol%%wrs%==B3 IF NOT "%B3%"==" " GOTO pz
IF %kol%%wrs%==B4 IF NOT "%B4%"==" " GOTO pz
IF %kol%%wrs%==C1 IF NOT "%C1%"==" " GOTO pz
IF %kol%%wrs%==C2 IF NOT "%C2%"==" " GOTO pz
IF %kol%%wrs%==C3 IF NOT "%C3%"==" " GOTO pz
IF %kol%%wrs%==C4 IF NOT "%C4%"==" " GOTO pz
IF %kol%%wrs%==D1 IF NOT "%D1%"==" " GOTO pz
IF %kol%%wrs%==D2 IF NOT "%D2%"==" " GOTO pz
IF %kol%%wrs%==D3 IF NOT "%D3%"==" " GOTO pz
IF %kol%%wrs%==D4 IF NOT "%D4%"==" " GOTO pz
IF %kolej%==0 SET %kol%%wrs%=X
IF %kolej%==1 SET %kol%%wrs%=O
SET pr=1
GOTO plansza4x4

:init5x5
CLS
SET A1= 
SET A2= 
SET A3= 
Set A4= 
Set A5= 
SET B1= 
SET B2= 
SET B3= 
Set B4= 
Set B5= 
SET C1= 
SET C2= 
SET C3= 
Set C4= 
Set C5= 
Set D1= 
set D2= 
Set D3= 
Set D4= 
Set D5= 
Set E1= 
set E2= 
set E3= 
Set E4= 
Set E5= 
SET wyg= 
SET pr=0
IF NOT DEFINED zacz SET zacz=x
REM losowanie kto zaczyna
IF %los%==0 ( SET los=1&SET /A zacz=%RANDOM% * 2 / 32767 ) ELSE IF %zacz%==0 ( SET zacz=1 ) ELSE SET zacz=0
SET kolej=%zacz%
REM 0=krzyzyk 1=kolko
IF %j%==1 (
IF %kolej%==0 ECHO %G1% begins!
IF %kolej%==1 ECHO %G2% begins!)
IF %j%==2 (
IF %kolej%==0 ECHO %G1% zaczyna!
IF %kolej%==1 ECHO %G2% zaczyna!)
ECHO.
PAUSE
GOTO plansza5x5

:plansza5x5
CLS
ECHO.
ECHO %G1% %pX% - %pO% %G2%
Echo.
ECHO ^     A   B   C   D   E
ECHO ^   _____________________
ECHO ^ 1 ^| %A1% ^| %B1% ^| %C1% ^| %D1% ^| %E1% ^|
ECHO ^   ^|---^|---^|---^|---^|---^|
ECHO ^ 2 ^| %A2% ^| %B2% ^| %C2% ^| %D2% ^| %E2% ^|
ECHO ^   ^|---^|---^|---^|---^|---^|
ECHO ^ 3 ^| %A3% ^| %B3% ^| %C3% ^| %D3% ^| %E3% ^|
ECHO ^   ^|---^|---^|---^|---^|---^|
ECHO ^ 4 ^| %A4% ^| %B4% ^| %C4% ^| %D4% ^| %E4% ^|
ECHO ^   ^|---^|---^|---^|---^|---^|
ECHO ^ 5 ^| %A5% ^| %B5% ^| %C5% ^| %D5% ^| %E5% ^|
Echo ^   —————————————————————
GOTO spr5x5

:spr5x5
REM Sprawdzenie czy pierwszy ruch zosta³ wykonany
IF %pr%==0 GOTO ruch5x5
REM Sprawdzenie czy istnieje sytuacja koñcz¹ca grê
IF "%A1%"=="%B1%" IF "%B1%"=="%C1%" IF "%C1%"=="%D1%" IF "%D1%"=="%E1%" IF "%E1%" NEQ " " SET wyg=%kolej%
IF "%A2%"=="%B2%" IF "%B2%"=="%C2%" IF "%C2%"=="%D2%" IF "%D2%"=="%E2%" IF "%E2%" NEQ " " SET wyg=%kolej%
IF "%A3%"=="%B3%" IF "%B3%"=="%C3%" IF "%C3%"=="%D3%" IF "%D3%"=="%E3%" IF "%E3%" NEQ " " Set wyg=%kolej%
IF "%A4%"=="%B4%" IF "%B4%"=="%C4%" IF "%C4%"=="%D4%" IF "%D4%"=="%E4%" IF "%E4%" NEQ " " set wyg=%kolej%
IF "%A5%"=="%B5%" IF "%B5%"=="%C5%" IF "%C5%"=="%D5%" IF "%D5%"=="%E5%" IF "%E5%" NEQ " " set wyg=%kolej%
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A4%"=="%A5%" IF "%A5%" NEQ " " SET wyg=%kolej%
IF "%B1%"=="%B2%" IF "%B2%"=="%B3%" IF "%B3%"=="%B4%" IF "%B4%"=="%B5%" IF "%B5%" NEQ " " SET wyg=%kolej%
IF "%C1%"=="%C2%" IF "%C2%"=="%C3%" IF "%C3%"=="%C4%" IF "%C4%"=="%C5%" IF "%C5%" NEQ " " SET wyg=%kolej%
IF "%D1%"=="%D2%" IF "%D2%"=="%D3%" IF "%D3%"=="%D4%" IF "%D4%"=="%D5%" IF "%D5%" NEQ " " Set wyg=%kolej%
IF "%E1%"=="%E2%" IF "%E2%"=="%E3%" IF "%E3%"=="%E4%" IF "%E4%"=="%E5%" IF "%E5%" NEQ " " Set wyg=%kolej%
IF "%A1%"=="%B2%" IF "%B2%"=="%C3%" IF "%C3%"=="%D4%" IF "%D4%"=="%E5%" IF "%E5%" NeQ " " SET wyg=%kolej%
IF "%E1%"=="%D2%" IF "%D2%"=="%C3%" IF "%C3%"=="%B4%" IF "%B4%"=="%A5%" IF "%A5%" neq " " SET wyg=%kolej%
REM Sprawdzenie remisu
IF "%A1%" NEQ " " IF "%B1%" NEQ " " IF "%C1%" NEQ " " IF "%D1%" NEQ " " IF "%E1%" NEQ " " IF "%A2%" NEQ " " IF "%B2%" NEQ " " IF "%C2%" NEQ " " IF "%D2%" NEQ " " IF "%E2%" NEQ " " IF "%A3%" NEQ " " IF "%B3%" NEQ " " IF "%C3%" NEQ " " IF "%D3%" NEQ " " IF "%E3%" NEQ " " IF "%A4%" NEQ " " IF "%B4%" NEQ " " IF "%C4%" NEQ " " IF "%D4%" NEQ " " IF "%E4%" NEQ " " IF "%A5%" NEQ " " IF "%B5%" NEQ " " IF "%C5%" NEQ " " IF "%D5%" NEQ " " IF "%E5%" NEQ " " IF "%wyg%"==" " SET wyg=2
IF "%wyg%"==" " GOTO zmiana
GOTO kg

:ruch5x5
IF %single%==1 IF %kolej%==1 GOTO ruchPC5x5%rpc%
IF %j%==1 (
IF %kolej%==0 ECHO %G1% move
IF %kolej%==1 ECHO %G2% move)
IF %j%==2 (
IF %kolej%==0 ECHO Ruch %G1%
IF %kolej%==1 ECHO Ruch %G2%)
ECHO.
if %j%==1 Echo Choose unit:
if %j%==2 ECHO Wybierz kolumnê:
CHOICE /C ABCDE
IF %ERRORLEVEL%==1 SET kol=A
IF %ERRORLEVEL%==2 SET kol=B
IF %ERRORLEVEL%==3 SET kol=C
IF %ERRORLEVEL%==4 Set kol=D
IF %ERRORLEVEL%==5 Set kol=E
ECHO.
if %j%==1 ECho Choose verse:
if %j%==2 ECHO Wybierz wiersz:
CHOICE /C 12345
SET wrs=%ERRORLEVEL%
IF %kol%%wrs%==A1 IF NOT "%A1%"==" " GOTO pz
IF %kol%%wrs%==A2 IF NOT "%A2%"==" " GOTO pz
IF %kol%%wrs%==A3 IF NOT "%A3%"==" " GOTO pz
IF %kol%%wrs%==A4 IF NOT "%A4%"==" " GOTO pz
IF %kol%%wrs%==A5 IF NOT "%A5%"==" " GOTO pz
IF %kol%%wrs%==B1 IF NOT "%B1%"==" " GOTO pz
IF %kol%%wrs%==B2 IF NOT "%B2%"==" " GOTO pz
IF %kol%%wrs%==B3 IF NOT "%B3%"==" " GOTO pz
IF %kol%%wrs%==B4 IF NOT "%B4%"==" " GOTO pz
IF %kol%%wrs%==B5 IF NOT "%B5%"==" " GOTO pz
IF %kol%%wrs%==C1 IF NOT "%C1%"==" " GOTO pz
IF %kol%%wrs%==C2 IF NOT "%C2%"==" " GOTO pz
IF %kol%%wrs%==C3 IF NOT "%C3%"==" " GOTO pz
IF %kol%%wrs%==C4 IF NOT "%C4%"==" " GOTO pz
IF %kol%%wrs%==C5 IF NOT "%C5%"==" " GOTO pz
IF %kol%%wrs%==D1 IF NOT "%D1%"==" " GOTO pz
IF %kol%%wrs%==D2 IF NOT "%D2%"==" " GOTO pz
IF %kol%%wrs%==D3 IF NOT "%D3%"==" " GOTO pz
IF %kol%%wrs%==D4 IF NOT "%D4%"==" " GOTO pz
IF %kol%%wrs%==D5 IF NOT "%D5%"==" " GOTO pz
IF %kol%%wrs%==E1 IF NOT "%E1%"==" " GOTO pz
IF %kol%%wrs%==E2 IF NOT "%E2%"==" " GOTO pz
IF %kol%%wrs%==E3 IF NOT "%E3%"==" " GOTO pz
IF %kol%%wrs%==E4 IF NOT "%E4%"==" " GOTO pz
IF %kol%%wrs%==E5 IF NOT "%E5%"==" " GOTO pz
IF %kolej%==0 SET %kol%%wrs%=X
IF %kolej%==1 SET %kol%%wrs%=O
SET pr=1
GOTO plansza5x5

REM sztuczna "yntelygencja"
:ruchPC3x3E
SET /A kol=%RANDOM% * 3 / 32767
IF %kol%==0 SET kol=A
IF %kol%==1 SET kol=B
IF %kol%==2 SET kol=C
SET /A wrs=%RANDOM% * 3 / 32767 + 1
IF %kol%%wrs%==A1 IF NOT "%A1%"==" " GOTO ruchPC3x3E
IF %kol%%wrs%==A2 IF NOT "%A2%"==" " GOTO ruchPC3x3E
IF %kol%%wrs%==A3 IF NOT "%A3%"==" " GOTO ruchPC3x3E
IF %kol%%wrs%==B1 IF NOT "%B1%"==" " GOTO ruchPC3x3E
IF %kol%%wrs%==B2 IF NOT "%B2%"==" " GOTO ruchPC3x3E
IF %kol%%wrs%==B3 IF NOT "%B3%"==" " GOTO ruchPC3x3E
IF %kol%%wrs%==C1 IF NOT "%C1%"==" " GOTO ruchPC3x3E
IF %kol%%wrs%==C2 IF NOT "%C2%"==" " GOTO ruchPC3x3E
IF %kol%%wrs%==C3 IF NOT "%C3%"==" " GOTO ruchPC3x3E
SET %kol%%wrs%=O
SET pr=1
GOTO plansza3x3

:ruchPC3x3M
SET /A kol=%RANDOM% * 3 / 32767
IF %kol%==0 SET kol=A
IF %kol%==1 SET kol=B
IF %kol%==2 SET kol=C
SET /A wrs=%RANDOM% * 3 / 32767 + 1
IF %kol%%wrs%==A1 IF NOT "%A1%"==" " GOTO ruchPC3x3M
IF %kol%%wrs%==A2 IF NOT "%A2%"==" " GOTO ruchPC3x3M
IF %kol%%wrs%==A3 IF NOT "%A3%"==" " GOTO ruchPC3x3M
IF %kol%%wrs%==B1 IF NOT "%B1%"==" " GOTO ruchPC3x3M
IF %kol%%wrs%==B2 IF NOT "%B2%"==" " GOTO ruchPC3x3M
IF %kol%%wrs%==B3 IF NOT "%B3%"==" " GOTO ruchPC3x3M
IF %kol%%wrs%==C1 IF NOT "%C1%"==" " GOTO ruchPC3x3M
IF %kol%%wrs%==C2 IF NOT "%C2%"==" " GOTO ruchPC3x3M
IF %kol%%wrs%==C3 IF NOT "%C3%"==" " GOTO ruchPC3x3M
IF "%C3%"=="%B2%" IF "%C3%"=="X" IF "%A1%"==" " SET A1=O&goto plansza3x3
IF "%C1%"=="%B1%" IF "%C1%"=="X" IF "%A1%"==" " SET A1=O&goto plansza3x3
IF "%A2%"=="%A3%" IF "%A3%"=="X" IF "%A1%"==" " SET A1=O&goto plansza3x3
IF "%A1%"=="%A3%" IF "%A3%"=="X" IF "%A2%"==" " SET A2=O&goto plansza3x3
IF "%C2%"=="%B2%" IF "%C2%"=="X" IF "%A2%"==" " SET A2=O&goto plansza3x3
IF "%C3%"=="%B3%" IF "%C3%"=="X" IF "%A3%"==" " SET A3=O&goto plansza3x3
IF "%A1%"=="%A2%" IF "%A2%"=="X" IF "%A3%"==" " SET A3=O&goto plansza3x3
IF "%C1%"=="%B2%" IF "%C1%"=="X" IF "%A3%"==" " SET A3=O&goto plansza3x3
IF "%A1%"=="%C1%" IF "%A1%"=="X" IF "%B1%"==" " SET B1=O&goto plansza3x3
IF "%A3%"=="%C1%" IF "%A3%"=="X" IF "%B1%"==" " SET B1=O&goto plansza3x3
IF "%B2%"=="%B3%" IF "%B3%"=="X" IF "%B1%"==" " SET B1=O&goto plansza3x3
IF "%A2%"=="%C2%" IF "%A3%"=="X" IF "%B2%"==" " SET B2=O&goto plansza3x3
IF "%B1%"=="%B3%" IF "%B3%"=="X" IF "%B2%"==" " SET B2=O&goto plansza3x3
IF "%A1%"=="%C3%" IF "%A1%"=="X" IF "%B2%"==" " SET B2=O&goto plansza3x3
IF "%A3%"=="%C3%" IF "%A3%"=="X" IF "%B3%"==" " SET B3=O&goto plansza3x3
IF "%B1%"=="%B2%" IF "%B1%"=="X" IF "%B3%"==" " SET B3=O&goto plansza3x3
IF "%C2%"=="%C3%" IF "%C3%"=="X" IF "%C1%"==" " SET C1=O&goto plansza3x3
IF "%A1%"=="%B1%" IF "%A1%"=="X" IF "%C1%"==" " SET C1=O&goto plansza3x3
IF "%A3%"=="%B2%" IF "%A3%"=="X" IF "%C1%"==" " SET C1=O&goto plansza3x3
IF "%A2%"=="%B2%" IF "%A2%"=="X" IF "%C2%"==" " SET C2=O&goto plansza3x3
IF "%C1%"=="%C3%" IF "%C3%"=="X" IF "%C2%"==" " SET C2=O&goto plansza3x3
IF "%C1%"=="%C2%" IF "%C1%"=="X" IF "%C3%"==" " SET C3=O&goto plansza3x3
IF "%A3%"=="%B3%" IF "%A3%"=="X" IF "%C3%"==" " SET C3=O&goto plansza3x3
IF "%A1%"=="%B2%" IF "%A1%"=="X" IF "%C3%"==" " SET C3=O&goto plansza3x3
SET %kol%%wrs%=O
SET pr=1
GOTO plansza3x3

:ruchPC3x3H
SET /A kol=%RANDOM% * 3 / 32767
IF %kol%==0 SET kol=A
IF %kol%==1 SET kol=B
IF %kol%==2 SET kol=C
SET /A wrs=%RANDOM% * 3 / 32767 + 1
IF %kol%%wrs%==A1 IF NOT "%A1%"==" " GOTO ruchPC3x3H
IF %kol%%wrs%==A2 IF NOT "%A2%"==" " GOTO ruchPC3x3H
IF %kol%%wrs%==A3 IF NOT "%A3%"==" " GOTO ruchPC3x3H
IF %kol%%wrs%==B1 IF NOT "%B1%"==" " GOTO ruchPC3x3H
IF %kol%%wrs%==B2 IF NOT "%B2%"==" " GOTO ruchPC3x3H
IF %kol%%wrs%==B3 IF NOT "%B3%"==" " GOTO ruchPC3x3H
IF %kol%%wrs%==C1 IF NOT "%C1%"==" " GOTO ruchPC3x3H
IF %kol%%wrs%==C2 IF NOT "%C2%"==" " GOTO ruchPC3x3H
IF %kol%%wrs%==C3 IF NOT "%C3%"==" " GOTO ruchPC3x3H
IF "%C3%"=="%B2%" IF "%C3%"=="O" IF "%A1%"==" " SET A1=O&goto plansza3x3
IF "%C1%"=="%B1%" IF "%C1%"=="O" IF "%A1%"==" " SET A1=O&goto plansza3x3
IF "%A2%"=="%A3%" IF "%A3%"=="O" IF "%A1%"==" " SET A1=O&goto plansza3x3
IF "%A1%"=="%A3%" IF "%A3%"=="O" IF "%A2%"==" " SET A2=O&goto plansza3x3
IF "%C2%"=="%B2%" IF "%C2%"=="O" IF "%A2%"==" " SET A2=O&goto plansza3x3
IF "%C3%"=="%B3%" IF "%C3%"=="O" IF "%A3%"==" " SET A3=O&goto plansza3x3
IF "%A1%"=="%A2%" IF "%A2%"=="O" IF "%A3%"==" " SET A3=O&goto plansza3x3
IF "%C1%"=="%B2%" IF "%C1%"=="O" IF "%A3%"==" " SET A3=O&goto plansza3x3
IF "%A1%"=="%C1%" IF "%A1%"=="O" IF "%B1%"==" " SET B1=O&goto plansza3x3
IF "%A3%"=="%C1%" IF "%A3%"=="O" IF "%B1%"==" " SET B1=O&goto plansza3x3
IF "%B2%"=="%B3%" IF "%B3%"=="O" IF "%B1%"==" " SET B1=O&goto plansza3x3
IF "%A2%"=="%C2%" IF "%A3%"=="O" IF "%B2%"==" " SET B2=O&goto plansza3x3
IF "%B1%"=="%B3%" IF "%B3%"=="O" IF "%B2%"==" " SET B2=O&goto plansza3x3
IF "%A1%"=="%C3%" IF "%A1%"=="O" IF "%B2%"==" " SET B2=O&goto plansza3x3
IF "%A3%"=="%C3%" IF "%A3%"=="O" IF "%B3%"==" " SET B3=O&goto plansza3x3
IF "%B1%"=="%B2%" IF "%B1%"=="O" IF "%B3%"==" " SET B3=O&goto plansza3x3
IF "%C2%"=="%C3%" IF "%C3%"=="O" IF "%C1%"==" " SET C1=O&goto plansza3x3
IF "%A1%"=="%B1%" IF "%A1%"=="O" IF "%C1%"==" " SET C1=O&goto plansza3x3
IF "%A3%"=="%B2%" IF "%A3%"=="O" IF "%C1%"==" " SET C1=O&goto plansza3x3
IF "%A2%"=="%B2%" IF "%A2%"=="O" IF "%C2%"==" " SET C2=O&goto plansza3x3
IF "%C1%"=="%C3%" IF "%C3%"=="O" IF "%C2%"==" " SET C2=O&goto plansza3x3
IF "%C1%"=="%C2%" IF "%C1%"=="O" IF "%C3%"==" " SET C3=O&goto plansza3x3
IF "%A3%"=="%B3%" IF "%A3%"=="O" IF "%C3%"==" " SET C3=O&goto plansza3x3
IF "%A1%"=="%B2%" IF "%A1%"=="O" IF "%C3%"==" " SET C3=O&goto plansza3x3
IF "%C3%"=="%B2%" IF "%C3%"=="X" IF "%A1%"==" " SET A1=O&goto plansza3x3
IF "%C1%"=="%B1%" IF "%C1%"=="X" IF "%A1%"==" " SET A1=O&goto plansza3x3
IF "%A2%"=="%A3%" IF "%A3%"=="X" IF "%A1%"==" " SET A1=O&goto plansza3x3
IF "%A1%"=="%A3%" IF "%A3%"=="X" IF "%A2%"==" " SET A2=O&goto plansza3x3
IF "%C2%"=="%B2%" IF "%C2%"=="X" IF "%A2%"==" " SET A2=O&goto plansza3x3
IF "%C3%"=="%B3%" IF "%C3%"=="X" IF "%A3%"==" " SET A3=O&goto plansza3x3
IF "%A1%"=="%A2%" IF "%A2%"=="X" IF "%A3%"==" " SET A3=O&goto plansza3x3
IF "%C1%"=="%B2%" IF "%C1%"=="X" IF "%A3%"==" " SET A3=O&goto plansza3x3
IF "%A1%"=="%C1%" IF "%A1%"=="X" IF "%B1%"==" " SET B1=O&goto plansza3x3
IF "%A3%"=="%C1%" IF "%A3%"=="X" IF "%B1%"==" " SET B1=O&goto plansza3x3
IF "%B2%"=="%B3%" IF "%B3%"=="X" IF "%B1%"==" " SET B1=O&goto plansza3x3
IF "%A2%"=="%C2%" IF "%A3%"=="X" IF "%B2%"==" " SET B2=O&goto plansza3x3
IF "%B1%"=="%B3%" IF "%B3%"=="X" IF "%B2%"==" " SET B2=O&goto plansza3x3
IF "%A1%"=="%C3%" IF "%A1%"=="X" IF "%B2%"==" " SET B2=O&goto plansza3x3
IF "%A3%"=="%C3%" IF "%A3%"=="X" IF "%B3%"==" " SET B3=O&goto plansza3x3
IF "%B1%"=="%B2%" IF "%B1%"=="X" IF "%B3%"==" " SET B3=O&goto plansza3x3
IF "%C2%"=="%C3%" IF "%C3%"=="X" IF "%C1%"==" " SET C1=O&goto plansza3x3
IF "%A1%"=="%B1%" IF "%A1%"=="X" IF "%C1%"==" " SET C1=O&goto plansza3x3
IF "%A3%"=="%B2%" IF "%A3%"=="X" IF "%C1%"==" " SET C1=O&goto plansza3x3
IF "%A2%"=="%B2%" IF "%A2%"=="X" IF "%C2%"==" " SET C2=O&goto plansza3x3
IF "%C1%"=="%C3%" IF "%C3%"=="X" IF "%C2%"==" " SET C2=O&goto plansza3x3
IF "%C1%"=="%C2%" IF "%C1%"=="X" IF "%C3%"==" " SET C3=O&goto plansza3x3
IF "%A3%"=="%B3%" IF "%A3%"=="X" IF "%C3%"==" " SET C3=O&goto plansza3x3
IF "%A1%"=="%B2%" IF "%A1%"=="X" IF "%C3%"==" " SET C3=O&goto plansza3x3
SET %kol%%wrs%=O
SET pr=1
GOTO plansza3x3

:ruchPC4x4E
SET /A kol=%RANDOM% * 4 / 32767
IF %kol%==0 SET kol=A
IF %kol%==1 SET kol=B
IF %kol%==2 SET kol=C
IF %kol%==3 SET kol=D
SET /A wrs=%RANDOM% * 4 / 32767 + 1
IF %kol%%wrs%==A1 IF NOT "%A1%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==A2 IF NOT "%A2%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==A3 IF NOT "%A3%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==A4 IF NOT "%A4%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==B1 IF NOT "%B1%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==B2 IF NOT "%B2%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==B3 IF NOT "%B3%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==B4 IF NOT "%B4%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==C1 IF NOT "%C1%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==C2 IF NOT "%C2%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==C3 IF NOT "%C3%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==C4 IF NOT "%C4%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==D1 IF NOT "%D1%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==D2 IF NOT "%D2%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==D3 IF NOT "%D3%"==" " GOTO ruchPC4x4E
IF %kol%%wrs%==D4 IF NOT "%D4%"==" " GOTO ruchPC4x4E

SET %kol%%wrs%=O
SET pr=1
GOTO plansza4x4

:ruchPC4x4M
SET /A kol=%RANDOM% * 4 / 32767
IF %kol%==0 SET kol=A
IF %kol%==1 SET kol=B
IF %kol%==2 SET kol=C
IF %kol%==3 SET kol=D
SET /A wrs=%RANDOM% * 4 / 32767 + 1
IF %kol%%wrs%==A1 IF NOT "%A1%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==A2 IF NOT "%A2%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==A3 IF NOT "%A3%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==A4 IF NOT "%A4%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==B1 IF NOT "%B1%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==B2 IF NOT "%B2%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==B3 IF NOT "%B3%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==B4 IF NOT "%B4%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==C1 IF NOT "%C1%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==C2 IF NOT "%C2%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==C3 IF NOT "%C3%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==C4 IF NOT "%C4%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==D1 IF NOT "%D1%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==D2 IF NOT "%D2%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==D3 IF NOT "%D3%"==" " GOTO ruchPC4x4M
IF %kol%%wrs%==D4 IF NOT "%D4%"==" " GOTO ruchPC4x4M
IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A2%"=="X " IF "%A1%"==" " SET A1=O&goto plansza4x4
IF "%A1%"=="%A3%" IF "%A3%"=="%A4%" IF "%A1%"=="X " IF "%A2%"==" " SET A2=O&goto plansza4x4
IF "%A1%"=="%A2%" IF "%A2%"=="%A4%" IF "%A1%"=="X " IF "%A3%"==" " SET A3=O&goto plansza4x4
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A1%"=="X " IF "%A4%"==" " SET A4=O&goto plansza4x4
IF "%B2%"=="%B3%" IF "%B3%"=="%B4%" IF "%B2%"=="X " IF "%B1%"==" " SET B1=O&goto plansza4x4
IF "%B1%"=="%B3%" IF "%B3%"=="%B4%" IF "%B1%"=="X " IF "%B2%"==" " SET B2=O&goto plansza4x4
IF "%B1%"=="%B2%" IF "%B2%"=="%B4%" IF "%B1%"=="X " IF "%B3%"==" " SET B3=O&goto plansza4x4
IF "%B1%"=="%B2%" IF "%B2%"=="%B3%" IF "%B1%"=="X " IF "%B4%"==" " SET B4=O&goto plansza4x4
IF "%C2%"=="%C3%" IF "%C3%"=="%C4%" IF "%C2%"=="X " IF "%C1%"==" " SET C1=O&goto plansza4x4
IF "%C1%"=="%C3%" IF "%C3%"=="%C4%" IF "%C1%"=="X " IF "%C2%"==" " SET C2=O&goto plansza4x4
IF "%C1%"=="%C2%" IF "%C2%"=="%C4%" IF "%C1%"=="X " IF "%C3%"==" " SET C3=O&goto plansza4x4
IF "%C1%"=="%C2%" IF "%C2%"=="%C3%" IF "%C1%"=="X " IF "%C4%"==" " SET C4=O&goto plansza4x4
IF "%D2%"=="%D3%" IF "%D3%"=="%D4%" IF "%D2%"=="X " IF "%D1%"==" " SET D1=O&goto plansza4x4
IF "%D1%"=="%D3%" IF "%D3%"=="%D4%" IF "%D1%"=="X " IF "%D2%"==" " SET D2=O&goto plansza4x4
IF "%D1%"=="%D2%" IF "%D2%"=="%D4%" IF "%D1%"=="X " IF "%D3%"==" " SET D3=O&goto plansza4x4
IF "%D1%"=="%D2%" IF "%D2%"=="%D3%" IF "%D1%"=="X " IF "%D4%"==" " SET D4=O&goto plansza4x4
IF "%B1%"=="%C1%" IF "%C1%"=="%D1%" IF "%B1%"=="X " IF "%A1%"==" " SET A1=O&goto plansza4x4
IF "%A1%"=="%C1%" IF "%C1%"=="%D1%" IF "%A1%"=="X " IF "%B1%"==" " SET B1=O&goto plansza4x4
IF "%A1%"=="%B1%" IF "%B1%"=="%D1%" IF "%A1%"=="X " IF "%C1%"==" " SET C1=O&goto plansza4x4
IF "%A1%"=="%B1%" IF "%B1%"=="%C1%" IF "%A1%"=="X " IF "%D1%"==" " SET D1=O&goto plansza4x4
IF "%B2%"=="%C2%" IF "%C2%"=="%D2%" IF "%B2%"=="X " IF "%A2%"==" " SET A2=O&goto plansza4x4
IF "%A2%"=="%C2%" IF "%C2%"=="%D2%" IF "%A2%"=="X " IF "%B2%"==" " SET B2=O&goto plansza4x4
IF "%A2%"=="%B2%" IF "%B2%"=="%D2%" IF "%A2%"=="X " IF "%C2%"==" " SET C2=O&goto plansza4x4
IF "%A2%"=="%B2%" IF "%B2%"=="%C2%" IF "%A2%"=="X " IF "%D2%"==" " SET D2=O&goto plansza4x4
IF "%B3%"=="%C3%" IF "%C3%"=="%D3%" IF "%B3%"=="X " IF "%A3%"==" " SET A3=O&goto plansza4x4
IF "%A3%"=="%C3%" IF "%C3%"=="%D3%" IF "%A3%"=="X " IF "%B3%"==" " SET B3=O&goto plansza4x4
IF "%A3%"=="%B3%" IF "%B3%"=="%D3%" IF "%A3%"=="X " IF "%C3%"==" " SET C3=O&goto plansza4x4
IF "%A3%"=="%B3%" IF "%B3%"=="%C3%" IF "%A3%"=="X " IF "%D3%"==" " SET D3=O&goto plansza4x4
IF "%B4%"=="%C4%" IF "%C4%"=="%D4%" IF "%B4%"=="X " IF "%A4%"==" " SET A4=O&goto plansza4x4
IF "%A4%"=="%C4%" IF "%C4%"=="%D4%" IF "%A4%"=="X " IF "%B4%"==" " SET B4=O&goto plansza4x4
IF "%A4%"=="%B4%" IF "%B4%"=="%D4%" IF "%A4%"=="X " IF "%C4%"==" " SET C4=O&goto plansza4x4
IF "%A4%"=="%B4%" IF "%b4%"=="%C4%" IF "%A4%"=="X " IF "%D4%"==" " SET D4=O&goto plansza4x4
IF "%B2%"=="%C3%" IF "%C3%"=="%D4%" IF "%B2%"=="X " IF "%A1%"==" " SET A1=O&goto plansza4x4
IF "%A1%"=="%C3%" IF "%C3%"=="%D4%" IF "%A1%"=="X " IF "%B2%"==" " SET B2=O&goto plansza4x4
IF "%A1%"=="%B2%" IF "%B2%"=="%D4%" IF "%A1%"=="X " IF "%C3%"==" " SET C3=O&goto plansza4x4
IF "%A1%"=="%B2%" IF "%B2%"=="%C3%" IF "%A1%"=="X " IF "%D4%"==" " SET D4=O&goto plansza4x4
IF "%B3%"=="%C2%" IF "%C2%"=="%D1%" IF "%B3%"=="X " IF "%A4%"==" " SET A4=O&goto plansza4x4
IF "%A4%"=="%C2%" IF "%C2%"=="%D1%" IF "%A4%"=="X " IF "%B3%"==" " SET B3=O&goto plansza4x4
IF "%A4%"=="%B3%" IF "%B3%"=="%D1%" IF "%A4%"=="X " IF "%C2%"==" " SET C2=O&goto plansza4x4
IF "%A4%"=="%B3%" IF "%B3%"=="%C2%" IF "%A4%"=="X " IF "%D1%"==" " SET D1=O&goto plansza4x4
SET %kol%%wrs%=O
SET pr=1
GOTO plansza4x4

:ruchPC4x4H
SET /A kol=%RANDOM% * 4 / 32767
IF %kol%==0 SET kol=A
IF %kol%==1 SET kol=B
IF %kol%==2 SET kol=C
IF %kol%==3 SET kol=D
SET /A wrs=%RANDOM% * 4 / 32767 + 1
IF %kol%%wrs%==A1 IF NOT "%A1%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==A2 IF NOT "%A2%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==A3 IF NOT "%A3%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==A4 IF NOT "%A4%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==B1 IF NOT "%B1%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==B2 IF NOT "%B2%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==B3 IF NOT "%B3%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==B4 IF NOT "%B4%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==C1 IF NOT "%C1%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==C2 IF NOT "%C2%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==C3 IF NOT "%C3%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==C4 IF NOT "%C4%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==D1 IF NOT "%D1%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==D2 IF NOT "%D2%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==D3 IF NOT "%D3%"==" " GOTO ruchPC4x4H
IF %kol%%wrs%==D4 IF NOT "%D4%"==" " GOTO ruchPC4x4H
IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A2%"=="O " IF "%A1%"==" " SET A1=O&goto plansza4x4
IF "%A1%"=="%A3%" IF "%A3%"=="%A4%" IF "%A1%"=="O " IF "%A2%"==" " SET A2=O&goto plansza4x4
IF "%A1%"=="%A2%" IF "%A2%"=="%A4%" IF "%A1%"=="O " IF "%A3%"==" " SET A3=O&goto plansza4x4
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A1%"=="O " IF "%A4%"==" " SET A4=O&goto plansza4x4
IF "%B2%"=="%B3%" IF "%B3%"=="%B4%" IF "%B2%"=="O " IF "%B1%"==" " SET B1=O&goto plansza4x4
IF "%B1%"=="%B3%" IF "%B3%"=="%B4%" IF "%B1%"=="O " IF "%B2%"==" " SET B2=O&goto plansza4x4
IF "%B1%"=="%B2%" IF "%B2%"=="%B4%" IF "%B1%"=="O " IF "%B3%"==" " SET B3=O&goto plansza4x4
IF "%B1%"=="%B2%" IF "%B2%"=="%B3%" IF "%B1%"=="O " IF "%B4%"==" " SET B4=O&goto plansza4x4
IF "%C2%"=="%C3%" IF "%C3%"=="%C4%" IF "%C2%"=="O " IF "%C1%"==" " SET C1=O&goto plansza4x4
IF "%C1%"=="%C3%" IF "%C3%"=="%C4%" IF "%C1%"=="O " IF "%C2%"==" " SET C2=O&goto plansza4x4
IF "%C1%"=="%C2%" IF "%C2%"=="%C4%" IF "%C1%"=="O " IF "%C3%"==" " SET C3=O&goto plansza4x4
IF "%C1%"=="%C2%" IF "%C2%"=="%C3%" IF "%C1%"=="O " IF "%C4%"==" " SET C4=O&goto plansza4x4
IF "%D2%"=="%D3%" IF "%D3%"=="%D4%" IF "%D2%"=="O " IF "%D1%"==" " SET D1=O&goto plansza4x4
IF "%D1%"=="%D3%" IF "%D3%"=="%D4%" IF "%D1%"=="O " IF "%D2%"==" " SET D2=O&goto plansza4x4
IF "%D1%"=="%D2%" IF "%D2%"=="%D4%" IF "%D1%"=="O " IF "%D3%"==" " SET D3=O&goto plansza4x4
IF "%D1%"=="%D2%" IF "%D2%"=="%D3%" IF "%D1%"=="O " IF "%D4%"==" " SET D4=O&goto plansza4x4
IF "%B1%"=="%C1%" IF "%C1%"=="%D1%" IF "%B1%"=="O " IF "%A1%"==" " SET A1=O&goto plansza4x4
IF "%A1%"=="%C1%" IF "%C1%"=="%D1%" IF "%A1%"=="O " IF "%B1%"==" " SET B1=O&goto plansza4x4
IF "%A1%"=="%B1%" IF "%B1%"=="%D1%" IF "%A1%"=="O " IF "%C1%"==" " SET C1=O&goto plansza4x4
IF "%A1%"=="%B1%" IF "%B1%"=="%C1%" IF "%A1%"=="O " IF "%D1%"==" " SET D1=O&goto plansza4x4
IF "%B2%"=="%C2%" IF "%C2%"=="%D2%" IF "%B2%"=="O " IF "%A2%"==" " SET A2=O&goto plansza4x4
IF "%A2%"=="%C2%" IF "%C2%"=="%D2%" IF "%A2%"=="O " IF "%B2%"==" " SET B2=O&goto plansza4x4
IF "%A2%"=="%B2%" IF "%B2%"=="%D2%" IF "%A2%"=="O " IF "%C2%"==" " SET C2=O&goto plansza4x4
IF "%A2%"=="%B2%" IF "%B2%"=="%C2%" IF "%A2%"=="O " IF "%D2%"==" " SET D2=O&goto plansza4x4
IF "%B3%"=="%C3%" IF "%C3%"=="%D3%" IF "%B3%"=="O " IF "%A3%"==" " SET A3=O&goto plansza4x4
IF "%A3%"=="%C3%" IF "%C3%"=="%D3%" IF "%A3%"=="O " IF "%B3%"==" " SET B3=O&goto plansza4x4
IF "%A3%"=="%B3%" IF "%B3%"=="%D3%" IF "%A3%"=="O " IF "%C3%"==" " SET C3=O&goto plansza4x4
IF "%A3%"=="%B3%" IF "%B3%"=="%C3%" IF "%A3%"=="O " IF "%D3%"==" " SET D3=O&goto plansza4x4
IF "%B4%"=="%C4%" IF "%C4%"=="%D4%" IF "%B4%"=="O " IF "%A4%"==" " SET A4=O&goto plansza4x4
IF "%A4%"=="%C4%" IF "%C4%"=="%D4%" IF "%A4%"=="O " IF "%B4%"==" " SET B4=O&goto plansza4x4
IF "%A4%"=="%B4%" IF "%B4%"=="%D4%" IF "%A4%"=="O " IF "%C4%"==" " SET C4=O&goto plansza4x4
IF "%A4%"=="%B4%" IF "%b4%"=="%C4%" IF "%A4%"=="O " IF "%D4%"==" " SET D4=O&goto plansza4x4
IF "%B2%"=="%C3%" IF "%C3%"=="%D4%" IF "%B2%"=="O " IF "%A1%"==" " SET A1=O&goto plansza4x4
IF "%A1%"=="%C3%" IF "%C3%"=="%D4%" IF "%A1%"=="O " IF "%B2%"==" " SET B2=O&goto plansza4x4
IF "%A1%"=="%B2%" IF "%B2%"=="%D4%" IF "%A1%"=="O " IF "%C3%"==" " SET C3=O&goto plansza4x4
IF "%A1%"=="%B2%" IF "%B2%"=="%C3%" IF "%A1%"=="O " IF "%D4%"==" " SET D4=O&goto plansza4x4
IF "%B3%"=="%C2%" IF "%C2%"=="%D1%" IF "%B3%"=="O " IF "%A4%"==" " SET A4=O&goto plansza4x4
IF "%A4%"=="%C2%" IF "%C2%"=="%D1%" IF "%A4%"=="O " IF "%B3%"==" " SET B3=O&goto plansza4x4
IF "%A4%"=="%B3%" IF "%B3%"=="%D1%" IF "%A4%"=="O " IF "%C2%"==" " SET C2=O&goto plansza4x4
IF "%A4%"=="%B3%" IF "%B3%"=="%C2%" IF "%A4%"=="O " IF "%D1%"==" " SET D1=O&goto plansza4x4
IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A2%"=="X " IF "%A1%"==" " SET A1=O&goto plansza4x4
IF "%A1%"=="%A3%" IF "%A3%"=="%A4%" IF "%A1%"=="X " IF "%A2%"==" " SET A2=O&goto plansza4x4
IF "%A1%"=="%A2%" IF "%A2%"=="%A4%" IF "%A1%"=="X " IF "%A3%"==" " SET A3=O&goto plansza4x4
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A1%"=="X " IF "%A4%"==" " SET A4=O&goto plansza4x4
IF "%B2%"=="%B3%" IF "%B3%"=="%B4%" IF "%B2%"=="X " IF "%B1%"==" " SET B1=O&goto plansza4x4
IF "%B1%"=="%B3%" IF "%B3%"=="%B4%" IF "%B1%"=="X " IF "%B2%"==" " SET B2=O&goto plansza4x4
IF "%B1%"=="%B2%" IF "%B2%"=="%B4%" IF "%B1%"=="X " IF "%B3%"==" " SET B3=O&goto plansza4x4
IF "%B1%"=="%B2%" IF "%B2%"=="%B3%" IF "%B1%"=="X " IF "%B4%"==" " SET B4=O&goto plansza4x4
IF "%C2%"=="%C3%" IF "%C3%"=="%C4%" IF "%C2%"=="X " IF "%C1%"==" " SET C1=O&goto plansza4x4
IF "%C1%"=="%C3%" IF "%C3%"=="%C4%" IF "%C1%"=="X " IF "%C2%"==" " SET C2=O&goto plansza4x4
IF "%C1%"=="%C2%" IF "%C2%"=="%C4%" IF "%C1%"=="X " IF "%C3%"==" " SET C3=O&goto plansza4x4
IF "%C1%"=="%C2%" IF "%C2%"=="%C3%" IF "%C1%"=="X " IF "%C4%"==" " SET C4=O&goto plansza4x4
IF "%D2%"=="%D3%" IF "%D3%"=="%D4%" IF "%D2%"=="X " IF "%D1%"==" " SET D1=O&goto plansza4x4
IF "%D1%"=="%D3%" IF "%D3%"=="%D4%" IF "%D1%"=="X " IF "%D2%"==" " SET D2=O&goto plansza4x4
IF "%D1%"=="%D2%" IF "%D2%"=="%D4%" IF "%D1%"=="X " IF "%D3%"==" " SET D3=O&goto plansza4x4
IF "%D1%"=="%D2%" IF "%D2%"=="%D3%" IF "%D1%"=="X " IF "%D4%"==" " SET D4=O&goto plansza4x4
IF "%B1%"=="%C1%" IF "%C1%"=="%D1%" IF "%B1%"=="X " IF "%A1%"==" " SET A1=O&goto plansza4x4
IF "%A1%"=="%C1%" IF "%C1%"=="%D1%" IF "%A1%"=="X " IF "%B1%"==" " SET B1=O&goto plansza4x4
IF "%A1%"=="%B1%" IF "%B1%"=="%D1%" IF "%A1%"=="X " IF "%C1%"==" " SET C1=O&goto plansza4x4
IF "%A1%"=="%B1%" IF "%B1%"=="%C1%" IF "%A1%"=="X " IF "%D1%"==" " SET D1=O&goto plansza4x4
IF "%B2%"=="%C2%" IF "%C2%"=="%D2%" IF "%B2%"=="X " IF "%A2%"==" " SET A2=O&goto plansza4x4
IF "%A2%"=="%C2%" IF "%C2%"=="%D2%" IF "%A2%"=="X " IF "%B2%"==" " SET B2=O&goto plansza4x4
IF "%A2%"=="%B2%" IF "%B2%"=="%D2%" IF "%A2%"=="X " IF "%C2%"==" " SET C2=O&goto plansza4x4
IF "%A2%"=="%B2%" IF "%B2%"=="%C2%" IF "%A2%"=="X " IF "%D2%"==" " SET D2=O&goto plansza4x4
IF "%B3%"=="%C3%" IF "%C3%"=="%D3%" IF "%B3%"=="X " IF "%A3%"==" " SET A3=O&goto plansza4x4
IF "%A3%"=="%C3%" IF "%C3%"=="%D3%" IF "%A3%"=="X " IF "%B3%"==" " SET B3=O&goto plansza4x4
IF "%A3%"=="%B3%" IF "%B3%"=="%D3%" IF "%A3%"=="X " IF "%C3%"==" " SET C3=O&goto plansza4x4
IF "%A3%"=="%B3%" IF "%B3%"=="%C3%" IF "%A3%"=="X " IF "%D3%"==" " SET D3=O&goto plansza4x4
IF "%B4%"=="%C4%" IF "%C4%"=="%D4%" IF "%B4%"=="X " IF "%A4%"==" " SET A4=O&goto plansza4x4
IF "%A4%"=="%C4%" IF "%C4%"=="%D4%" IF "%A4%"=="X " IF "%B4%"==" " SET B4=O&goto plansza4x4
IF "%A4%"=="%B4%" IF "%B4%"=="%D4%" IF "%A4%"=="X " IF "%C4%"==" " SET C4=O&goto plansza4x4
IF "%A4%"=="%B4%" IF "%b4%"=="%C4%" IF "%A4%"=="X " IF "%D4%"==" " SET D4=O&goto plansza4x4
IF "%B2%"=="%C3%" IF "%C3%"=="%D4%" IF "%B2%"=="X " IF "%A1%"==" " SET A1=O&goto plansza4x4
IF "%A1%"=="%C3%" IF "%C3%"=="%D4%" IF "%A1%"=="X " IF "%B2%"==" " SET B2=O&goto plansza4x4
IF "%A1%"=="%B2%" IF "%B2%"=="%D4%" IF "%A1%"=="X " IF "%C3%"==" " SET C3=O&goto plansza4x4
IF "%A1%"=="%B2%" IF "%B2%"=="%C3%" IF "%A1%"=="X " IF "%D4%"==" " SET D4=O&goto plansza4x4
IF "%B3%"=="%C2%" IF "%C2%"=="%D1%" IF "%B3%"=="X " IF "%A4%"==" " SET A4=O&goto plansza4x4
IF "%A4%"=="%C2%" IF "%C2%"=="%D1%" IF "%A4%"=="X " IF "%B3%"==" " SET B3=O&goto plansza4x4
IF "%A4%"=="%B3%" IF "%B3%"=="%D1%" IF "%A4%"=="X " IF "%C2%"==" " SET C2=O&goto plansza4x4
IF "%A4%"=="%B3%" IF "%B3%"=="%C2%" IF "%A4%"=="X " IF "%D1%"==" " SET D1=O&goto plansza4x4
SET %kol%%wrs%=O
SET pr=1
GOTO plansza4x4

:ruchPC5x5E
SET /A kol=%RANDOM% * 5 / 32767
IF %kol%==0 SET kol=A
IF %kol%==1 SET kol=B
IF %kol%==2 SET kol=C
IF %kol%==3 SET kol=D
IF %kol%==4 set kol=E
SET /A wrs=%RANDOM% * 5 / 32767 + 1
IF %kol%%wrs%==A1 IF NOT "%A1%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==A2 IF NOT "%A2%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==A3 IF NOT "%A3%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==A4 IF NOT "%A4%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==A5 IF NOT "%A5%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==B1 IF NOT "%B1%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==B2 IF NOT "%B2%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==B3 IF NOT "%B3%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==B4 IF NOT "%B4%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==B5 IF NOT "%B5%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==C1 IF NOT "%C1%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==C2 IF NOT "%C2%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==C3 IF NOT "%C3%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==C4 IF NOT "%C4%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==C5 IF NOT "%C5%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==D1 IF NOT "%D1%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==D2 IF NOT "%D2%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==D3 IF NOT "%D3%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==D4 IF NOT "%D4%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==D5 IF NOT "%D5%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==E1 IF NOT "%E1%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==E2 IF NOT "%E2%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==E3 IF NOT "%E3%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==E4 IF NOT "%E4%"==" " GOTO ruchPC5x5E
IF %kol%%wrs%==E5 IF NOT "%E5%"==" " GOTO ruchPC5x5E
set %kol%%wrs%=O
SET pr=1
GOTO plansza5x5

:ruchPC5x5M
SET /A kol=%RANDOM% * 5 / 32767
IF %kol%==0 SET kol=A
IF %kol%==1 SET kol=B
IF %kol%==2 SET kol=C
IF %kol%==3 SET kol=D
IF %kol%==4 set kol=E
SET /A wrs=%RANDOM% * 5 / 32767 + 1
IF %kol%%wrs%==A1 IF NOT "%A1%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==A2 IF NOT "%A2%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==A3 IF NOT "%A3%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==A4 IF NOT "%A4%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==A5 IF NOT "%A5%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==B1 IF NOT "%B1%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==B2 IF NOT "%B2%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==B3 IF NOT "%B3%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==B4 IF NOT "%B4%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==B5 IF NOT "%B5%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==C1 IF NOT "%C1%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==C2 IF NOT "%C2%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==C3 IF NOT "%C3%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==C4 IF NOT "%C4%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==C5 IF NOT "%C5%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==D1 IF NOT "%D1%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==D2 IF NOT "%D2%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==D3 IF NOT "%D3%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==D4 IF NOT "%D4%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==D5 IF NOT "%D5%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==E1 IF NOT "%E1%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==E2 IF NOT "%E2%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==E3 IF NOT "%E3%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==E4 IF NOT "%E4%"==" " GOTO ruchPC5x5M
IF %kol%%wrs%==E5 IF NOT "%E5%"==" " GOTO ruchPC5x5M
IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A4%"=="%A5%" IF "%A2%"=="X" IF "%A1%"==" " SET A1=O&goto plansza5x5
IF "%A1%"=="%A3%" IF "%A3%"=="%A4%" IF "%A4%"=="%A5%" IF "%A1%"=="X" IF "%A2%"==" " SET A2=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A4%" IF "%A4%"=="%A5%" IF "%A1%"=="X" IF "%A3%"==" " SET A3=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%"=="%A5%" IF "%A1%"=="X" IF "%A4%"==" " SET A4=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A1%"=="X" IF "%A5%"==" " SET A5=O&goto plansza5x5
IF "%B2%"=="%B3%" IF "%B3%"=="%B4%" IF "%B4%"=="%B5%" IF "%B2%"=="X" IF "%B1%"==" " SET B1=O&goto plansza5x5
IF "%B1%"=="%B3%" IF "%B3%"=="%B4%" IF "%B4%"=="%B5%" IF "%B1%"=="X" IF "%B2%"==" " SET B2=O&goto plansza5x5
IF "%B1%"=="%B2%" IF "%B2%"=="%B4%" IF "%B4%"=="%B5%" IF "%B1%"=="X" IF "%B3%"==" " SET B3=O&goto plansza5x5
IF "%B1%"=="%B2%" IF "%B2%"=="%B3%" IF "%B3%"=="%B5%" IF "%B1%"=="X" IF "%B4%"==" " SET B4=O&goto plansza5x5
IF "%B1%"=="%B2%" IF "%B2%"=="%B3%" IF "%B3%"=="%B4%" IF "%B1%"=="X" IF "%B5%"==" " SET B5=O&goto plansza5x5
IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A4%"=="%A5%" IF "%A2%"=="X" IF "%A1%"==" " SET C1=O&goto plansza5x5
IF "%A1%"=="%A3%" IF "%A3%"=="%A4%" IF "%A4%"=="%A5%" IF "%A1%"=="X" IF "%A2%"==" " SET C2=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A4%" IF "%A4%"=="%A5%" IF "%A1%"=="X" IF "%A3%"==" " SET C3=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%"=="%A5%" IF "%A1%"=="X" IF "%A4%"==" " SET C4=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A1%"=="X" IF "%A5%"==" " SET C5=O&goto plansza5x5
IF "%D2%"=="%D3%" IF "%D3%"=="%D4%" IF "%D4%"=="%D5%" IF "%D2%"=="X" IF "%D1%"==" " SET D1=O&goto plansza5x5
IF "%D1%"=="%D3%" IF "%D3%"=="%D4%" IF "%D4%"=="%D5%" IF "%D1%"=="X" IF "%D2%"==" " SET D2=O&goto plansza5x5
IF "%D1%"=="%D2%" IF "%D2%"=="%D4%" IF "%D4%"=="%D5%" IF "%D1%"=="X" IF "%D3%"==" " SET D3=O&goto plansza5x5
IF "%D1%"=="%D2%" IF "%D2%"=="%D3%" IF "%D3%"=="%D5%" IF "%D1%"=="X" IF "%D4%"==" " SET D4=O&goto plansza5x5
IF "%D1%"=="%D2%" IF "%D2%"=="%D3%" IF "%D3%"=="%D4%" IF "%D1%"=="X" IF "%D5%"==" " SET D5=O&goto plansza5x5
IF "%E2%"=="%E3%" IF "%E3%"=="%E4%" IF "%E4%"=="%E5%" IF "%E2%"=="X" IF "%E1%"==" " SET E1=O&goto plansza5x5
IF "%E1%"=="%E3%" IF "%E3%"=="%E4%" IF "%E4%"=="%E5%" IF "%E1%"=="X" IF "%E2%"==" " SET E2=O&goto plansza5x5
IF "%E1%"=="%E2%" IF "%E2%"=="%E4%" IF "%E4%"=="%E5%" IF "%E1%"=="X" IF "%E3%"==" " SET E3=O&goto plansza5x5
IF "%E1%"=="%E2%" IF "%E2%"=="%E3%" IF "%E3%"=="%E5%" IF "%E1%"=="X" IF "%E4%"==" " SET E4=O&goto plansza5x5
IF "%E1%"=="%E2%" IF "%E2%"=="%E3%" IF "%E3%"=="%E4%" IF "%E1%"=="X" IF "%E5%"==" " SET E5=O&goto plansza5x5
IF "%B1%"=="%C1%" IF "%C1%"=="%D1%" IF "%D1%"=="%E1%" IF "%B1%"=="X" IF "%A1%"==" " SET A1=O&goto plansza5x5
IF "%A1%"=="%C1%" IF "%C1%"=="%D1%" IF "%D1%"=="%E1%" IF "%A1%"=="X" IF "%B1%"==" " SET B1=O&goto plansza5x5
IF "%A1%"=="%B1%" IF "%B1%"=="%D1%" IF "%D1%"=="%E1%" IF "%A1%"=="X" IF "%C1%"==" " SET C1=O&goto plansza5x5
IF "%A1%"=="%B1%" IF "%B1%"=="%C1%" IF "%C1%"=="%E1%" IF "%A1%"=="X" IF "%D1%"==" " SET D1=O&goto plansza5x5
IF "%A1%"=="%B1%" IF "%B1%"=="%C1%" IF "%C1%"=="%D1%" IF "%A1%"=="X" IF "%E1%"==" " SET E1=O&goto plansza5x5
IF "%B2%"=="%C2%" IF "%C2%"=="%D2%" IF "%D2%"=="%E2%" IF "%B2%"=="X" IF "%A2%"==" " SET A2=O&goto plansza5x5
IF "%A2%"=="%C2%" IF "%C2%"=="%D2%" IF "%D2%"=="%E2%" IF "%A2%"=="X" IF "%B2%"==" " SET B2=O&goto plansza5x5
IF "%A2%"=="%B2%" IF "%B2%"=="%D2%" IF "%D2%"=="%E2%" IF "%A2%"=="X" IF "%C2%"==" " SET C2=O&goto plansza5x5
IF "%A2%"=="%B2%" IF "%B2%"=="%C2%" IF "%C2%"=="%E2%" IF "%A2%"=="X" IF "%D2%"==" " SET D2=O&goto plansza5x5
IF "%A2%"=="%B2%" IF "%B2%"=="%C2%" IF "%C2%"=="%D2%" IF "%A2%"=="X" IF "%E2%"==" " SET E2=O&goto plansza5x5
IF "%B3%"=="%C3%" IF "%C3%"=="%D3%" IF "%D3%"=="%E3%" IF "%B3%"=="X" IF "%A3%"==" " SET A3=O&goto plansza5x5
IF "%A3%"=="%C3%" IF "%C3%"=="%D3%" IF "%D3%"=="%E3%" IF "%A3%"=="X" IF "%B3%"==" " SET B3=O&goto plansza5x5
IF "%A3%"=="%B3%" IF "%B3%"=="%D3%" IF "%D3%"=="%E3%" IF "%A3%"=="X" IF "%C3%"==" " SET C3=O&goto plansza5x5
IF "%A3%"=="%B3%" IF "%B3%"=="%C3%" IF "%C3%"=="%E3%" IF "%A3%"=="X" IF "%D3%"==" " SET D3=O&goto plansza5x5
IF "%A3%"=="%B3%" IF "%B3%"=="%C3%" IF "%C3%"=="%D3%" IF "%A3%"=="X" IF "%E3%"==" " SET E3=O&goto plansza5x5
IF "%B4%"=="%C4%" IF "%C4%"=="%D4%" IF "%D4%"=="%E4%" IF "%B4%"=="X" IF "%A4%"==" " SET A4=O&goto plansza5x5
IF "%A4%"=="%C4%" IF "%C4%"=="%D4%" IF "%D4%"=="%E4%" IF "%A4%"=="X" IF "%B4%"==" " SET B4=O&goto plansza5x5
IF "%A4%"=="%B4%" IF "%B4%"=="%D4%" IF "%D4%"=="%E4%" IF "%A4%"=="X" IF "%C4%"==" " SET C4=O&goto plansza5x5
IF "%A4%"=="%B4%" IF "%B4%"=="%C4%" IF "%C4%"=="%E4%" IF "%A4%"=="X" IF "%D4%"==" " SET D4=O&goto plansza5x5
IF "%A4%"=="%B4%" IF "%B4%"=="%C4%" IF "%C4%"=="%D4%" IF "%A4%"=="X" IF "%E4%"==" " SET E4=O&goto plansza5x5
IF "%B5%"=="%C5%" IF "%C5%"=="%D5%" IF "%D5%"=="%E5%" IF "%B5%"=="X" IF "%A5%"==" " SET A5=O&goto plansza5x5
IF "%A5%"=="%C5%" IF "%C5%"=="%D5%" IF "%D5%"=="%E5%" IF "%A5%"=="X" IF "%B5%"==" " SET B5=O&goto plansza5x5
IF "%A5%"=="%B5%" IF "%B5%"=="%D5%" IF "%D5%"=="%E5%" IF "%A5%"=="X" IF "%C5%"==" " SET C5=O&goto plansza5x5
IF "%A5%"=="%B5%" IF "%B5%"=="%C5%" IF "%C5%"=="%E5%" IF "%A5%"=="X" IF "%D5%"==" " SET D5=O&goto plansza5x5
IF "%A5%"=="%B5%" IF "%B5%"=="%C5%" IF "%C5%"=="%D5%" IF "%A5%"=="X" IF "%E5%"==" " SET E5=O&goto plansza5x5
IF "%B2%"=="%C3%" IF "%C3%"=="%D4%" IF "%D4%"=="%E5%" IF "%B2%"=="X" IF "%A1%"==" " SET A1=O&goto plansza5x5
IF "%A1%"=="%C3%" IF "%C3%"=="%D4%" IF "%D4%"=="%E5%" IF "%A1%"=="X" IF "%B2%"==" " SET B2=O&goto plansza5x5
IF "%A1%"=="%B2%" IF "%B2%"=="%D4%" IF "%D4%"=="%E5%" IF "%A1%"=="X" IF "%C3%"==" " SET C3=O&goto plansza5x5
IF "%A1%"=="%B2%" IF "%B2%"=="%C3%" IF "%C3%"=="%E5%" IF "%A1%"=="X" IF "%D4%"==" " SET D4=O&goto plansza5x5
IF "%A1%"=="%B2%" IF "%B2%"=="%C3%" IF "%C3%"=="%D4%" IF "%A1%"=="X" IF "%E5%"==" " SET E5=O&goto plansza5x5
IF "%B4%"=="%C3%" IF "%C3%"=="%D2%" IF "%D2%"=="%E1%" IF "%B4%"=="X" IF "%A5%"==" " SET A5=O&goto plansza5x5
IF "%A5%"=="%C3%" IF "%C3%"=="%D2%" IF "%D2%"=="%E1%" IF "%A5%"=="X" IF "%B4%"==" " SET B4=O&goto plansza5x5
IF "%A5%"=="%B4%" IF "%B4%"=="%D2%" IF "%D2%"=="%E1%" IF "%A5%"=="X" IF "%C3%"==" " SET C3=O&goto plansza5x5
IF "%A5%"=="%B4%" IF "%B4%"=="%C3%" IF "%C3%"=="%E1%" IF "%A5%"=="X" IF "%D2%"==" " SET D2=O&goto plansza5x5
IF "%A5%"=="%B4%" IF "%B4%"=="%C3%" IF "%C3%"=="%D2%" IF "%A5%"=="X" IF "%E1%"==" " SET E1=O&goto plansza5x5
set %kol%%wrs%=O
SET pr=1
GOTO plansza5x5

:ruchPC5x5H
SET /A kol=%RANDOM% * 5 / 32767
IF %kol%==0 SET kol=A
IF %kol%==1 SET kol=B
IF %kol%==2 SET kol=C
IF %kol%==3 SET kol=D
IF %kol%==4 set kol=E
SET /A wrs=%RANDOM% * 5 / 32767 + 1
IF %kol%%wrs%==A1 IF NOT "%A1%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==A2 IF NOT "%A2%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==A3 IF NOT "%A3%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==A4 IF NOT "%A4%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==A5 IF NOT "%A5%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==B1 IF NOT "%B1%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==B2 IF NOT "%B2%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==B3 IF NOT "%B3%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==B4 IF NOT "%B4%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==B5 IF NOT "%B5%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==C1 IF NOT "%C1%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==C2 IF NOT "%C2%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==C3 IF NOT "%C3%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==C4 IF NOT "%C4%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==C5 IF NOT "%C5%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==D1 IF NOT "%D1%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==D2 IF NOT "%D2%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==D3 IF NOT "%D3%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==D4 IF NOT "%D4%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==D5 IF NOT "%D5%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==E1 IF NOT "%E1%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==E2 IF NOT "%E2%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==E3 IF NOT "%E3%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==E4 IF NOT "%E4%"==" " GOTO ruchPC5x5H
IF %kol%%wrs%==E5 IF NOT "%E5%"==" " GOTO ruchPC5x5H
IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A4%"=="%A5%" IF "%A2%"=="O" IF "%A1%"==" " SET A1=O&goto plansza5x5
IF "%A1%"=="%A3%" IF "%A3%"=="%A4%" IF "%A4%"=="%A5%" IF "%A1%"=="O" IF "%A2%"==" " SET A2=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A4%" IF "%A4%"=="%A5%" IF "%A1%"=="O" IF "%A3%"==" " SET A3=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%"=="%A5%" IF "%A1%"=="O" IF "%A4%"==" " SET A4=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A1%"=="O" IF "%A5%"==" " SET A5=O&goto plansza5x5
IF "%B2%"=="%B3%" IF "%B3%"=="%B4%" IF "%B4%"=="%B5%" IF "%B2%"=="O" IF "%B1%"==" " SET B1=O&goto plansza5x5
IF "%B1%"=="%B3%" IF "%B3%"=="%B4%" IF "%B4%"=="%B5%" IF "%B1%"=="O" IF "%B2%"==" " SET B2=O&goto plansza5x5
IF "%B1%"=="%B2%" IF "%B2%"=="%B4%" IF "%B4%"=="%B5%" IF "%B1%"=="O" IF "%B3%"==" " SET B3=O&goto plansza5x5
IF "%B1%"=="%B2%" IF "%B2%"=="%B3%" IF "%B3%"=="%B5%" IF "%B1%"=="O" IF "%B4%"==" " SET B4=O&goto plansza5x5
IF "%B1%"=="%B2%" IF "%B2%"=="%B3%" IF "%B3%"=="%B4%" IF "%B1%"=="O" IF "%B5%"==" " SET B5=O&goto plansza5x5
IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A4%"=="%A5%" IF "%A2%"=="O" IF "%A1%"==" " SET C1=O&goto plansza5x5
IF "%A1%"=="%A3%" IF "%A3%"=="%A4%" IF "%A4%"=="%A5%" IF "%A1%"=="O" IF "%A2%"==" " SET C2=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A4%" IF "%A4%"=="%A5%" IF "%A1%"=="O" IF "%A3%"==" " SET C3=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%"=="%A5%" IF "%A1%"=="O" IF "%A4%"==" " SET C4=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A1%"=="O" IF "%A5%"==" " SET C5=O&goto plansza5x5
IF "%D2%"=="%D3%" IF "%D3%"=="%D4%" IF "%D4%"=="%D5%" IF "%D2%"=="O" IF "%D1%"==" " SET D1=O&goto plansza5x5
IF "%D1%"=="%D3%" IF "%D3%"=="%D4%" IF "%D4%"=="%D5%" IF "%D1%"=="O" IF "%D2%"==" " SET D2=O&goto plansza5x5
IF "%D1%"=="%D2%" IF "%D2%"=="%D4%" IF "%D4%"=="%D5%" IF "%D1%"=="O" IF "%D3%"==" " SET D3=O&goto plansza5x5
IF "%D1%"=="%D2%" IF "%D2%"=="%D3%" IF "%D3%"=="%D5%" IF "%D1%"=="O" IF "%D4%"==" " SET D4=O&goto plansza5x5
IF "%D1%"=="%D2%" IF "%D2%"=="%D3%" IF "%D3%"=="%D4%" IF "%D1%"=="O" IF "%D5%"==" " SET D5=O&goto plansza5x5
IF "%E2%"=="%E3%" IF "%E3%"=="%E4%" IF "%E4%"=="%E5%" IF "%E2%"=="O" IF "%E1%"==" " SET E1=O&goto plansza5x5
IF "%E1%"=="%E3%" IF "%E3%"=="%E4%" IF "%E4%"=="%E5%" IF "%E1%"=="O" IF "%E2%"==" " SET E2=O&goto plansza5x5
IF "%E1%"=="%E2%" IF "%E2%"=="%E4%" IF "%E4%"=="%E5%" IF "%E1%"=="O" IF "%E3%"==" " SET E3=O&goto plansza5x5
IF "%E1%"=="%E2%" IF "%E2%"=="%E3%" IF "%E3%"=="%E5%" IF "%E1%"=="O" IF "%E4%"==" " SET E4=O&goto plansza5x5
IF "%E1%"=="%E2%" IF "%E2%"=="%E3%" IF "%E3%"=="%E4%" IF "%E1%"=="O" IF "%E5%"==" " SET E5=O&goto plansza5x5
IF "%B1%"=="%C1%" IF "%C1%"=="%D1%" IF "%D1%"=="%E1%" IF "%B1%"=="O" IF "%A1%"==" " SET A1=O&goto plansza5x5
IF "%A1%"=="%C1%" IF "%C1%"=="%D1%" IF "%D1%"=="%E1%" IF "%A1%"=="O" IF "%B1%"==" " SET B1=O&goto plansza5x5
IF "%A1%"=="%B1%" IF "%B1%"=="%D1%" IF "%D1%"=="%E1%" IF "%A1%"=="O" IF "%C1%"==" " SET C1=O&goto plansza5x5
IF "%A1%"=="%B1%" IF "%B1%"=="%C1%" IF "%C1%"=="%E1%" IF "%A1%"=="O" IF "%D1%"==" " SET D1=O&goto plansza5x5
IF "%A1%"=="%B1%" IF "%B1%"=="%C1%" IF "%C1%"=="%D1%" IF "%A1%"=="O" IF "%E1%"==" " SET E1=O&goto plansza5x5
IF "%B2%"=="%C2%" IF "%C2%"=="%D2%" IF "%D2%"=="%E2%" IF "%B2%"=="O" IF "%A2%"==" " SET A2=O&goto plansza5x5
IF "%A2%"=="%C2%" IF "%C2%"=="%D2%" IF "%D2%"=="%E2%" IF "%A2%"=="O" IF "%B2%"==" " SET B2=O&goto plansza5x5
IF "%A2%"=="%B2%" IF "%B2%"=="%D2%" IF "%D2%"=="%E2%" IF "%A2%"=="O" IF "%C2%"==" " SET C2=O&goto plansza5x5
IF "%A2%"=="%B2%" IF "%B2%"=="%C2%" IF "%C2%"=="%E2%" IF "%A2%"=="O" IF "%D2%"==" " SET D2=O&goto plansza5x5
IF "%A2%"=="%B2%" IF "%B2%"=="%C2%" IF "%C2%"=="%D2%" IF "%A2%"=="O" IF "%E2%"==" " SET E2=O&goto plansza5x5
IF "%B3%"=="%C3%" IF "%C3%"=="%D3%" IF "%D3%"=="%E3%" IF "%B3%"=="O" IF "%A3%"==" " SET A3=O&goto plansza5x5
IF "%A3%"=="%C3%" IF "%C3%"=="%D3%" IF "%D3%"=="%E3%" IF "%A3%"=="O" IF "%B3%"==" " SET B3=O&goto plansza5x5
IF "%A3%"=="%B3%" IF "%B3%"=="%D3%" IF "%D3%"=="%E3%" IF "%A3%"=="O" IF "%C3%"==" " SET C3=O&goto plansza5x5
IF "%A3%"=="%B3%" IF "%B3%"=="%C3%" IF "%C3%"=="%E3%" IF "%A3%"=="O" IF "%D3%"==" " SET D3=O&goto plansza5x5
IF "%A3%"=="%B3%" IF "%B3%"=="%C3%" IF "%C3%"=="%D3%" IF "%A3%"=="O" IF "%E3%"==" " SET E3=O&goto plansza5x5
IF "%B4%"=="%C4%" IF "%C4%"=="%D4%" IF "%D4%"=="%E4%" IF "%B4%"=="O" IF "%A4%"==" " SET A4=O&goto plansza5x5
IF "%A4%"=="%C4%" IF "%C4%"=="%D4%" IF "%D4%"=="%E4%" IF "%A4%"=="O" IF "%B4%"==" " SET B4=O&goto plansza5x5
IF "%A4%"=="%B4%" IF "%B4%"=="%D4%" IF "%D4%"=="%E4%" IF "%A4%"=="O" IF "%C4%"==" " SET C4=O&goto plansza5x5
IF "%A4%"=="%B4%" IF "%B4%"=="%C4%" IF "%C4%"=="%E4%" IF "%A4%"=="O" IF "%D4%"==" " SET D4=O&goto plansza5x5
IF "%A4%"=="%B4%" IF "%B4%"=="%C4%" IF "%C4%"=="%D4%" IF "%A4%"=="O" IF "%E4%"==" " SET E4=O&goto plansza5x5
IF "%B5%"=="%C5%" IF "%C5%"=="%D5%" IF "%D5%"=="%E5%" IF "%B5%"=="O" IF "%A5%"==" " SET A5=O&goto plansza5x5
IF "%A5%"=="%C5%" IF "%C5%"=="%D5%" IF "%D5%"=="%E5%" IF "%A5%"=="O" IF "%B5%"==" " SET B5=O&goto plansza5x5
IF "%A5%"=="%B5%" IF "%B5%"=="%D5%" IF "%D5%"=="%E5%" IF "%A5%"=="O" IF "%C5%"==" " SET C5=O&goto plansza5x5
IF "%A5%"=="%B5%" IF "%B5%"=="%C5%" IF "%C5%"=="%E5%" IF "%A5%"=="O" IF "%D5%"==" " SET D5=O&goto plansza5x5
IF "%A5%"=="%B5%" IF "%B5%"=="%C5%" IF "%C5%"=="%D5%" IF "%A5%"=="O" IF "%E5%"==" " SET E5=O&goto plansza5x5
IF "%B2%"=="%C3%" IF "%C3%"=="%D4%" IF "%D4%"=="%E5%" IF "%B2%"=="O" IF "%A1%"==" " SET A1=O&goto plansza5x5
IF "%A1%"=="%C3%" IF "%C3%"=="%D4%" IF "%D4%"=="%E5%" IF "%A1%"=="O" IF "%B2%"==" " SET B2=O&goto plansza5x5
IF "%A1%"=="%B2%" IF "%B2%"=="%D4%" IF "%D4%"=="%E5%" IF "%A1%"=="O" IF "%C3%"==" " SET C3=O&goto plansza5x5
IF "%A1%"=="%B2%" IF "%B2%"=="%C3%" IF "%C3%"=="%E5%" IF "%A1%"=="O" IF "%D4%"==" " SET D4=O&goto plansza5x5
IF "%A1%"=="%B2%" IF "%B2%"=="%C3%" IF "%C3%"=="%D4%" IF "%A1%"=="O" IF "%E5%"==" " SET E5=O&goto plansza5x5
IF "%B4%"=="%C3%" IF "%C3%"=="%D2%" IF "%D2%"=="%E1%" IF "%B4%"=="O" IF "%A5%"==" " SET A5=O&goto plansza5x5
IF "%A5%"=="%C3%" IF "%C3%"=="%D2%" IF "%D2%"=="%E1%" IF "%A5%"=="O" IF "%B4%"==" " SET B4=O&goto plansza5x5
IF "%A5%"=="%B4%" IF "%B4%"=="%D2%" IF "%D2%"=="%E1%" IF "%A5%"=="O" IF "%C3%"==" " SET C3=O&goto plansza5x5
IF "%A5%"=="%B4%" IF "%B4%"=="%C3%" IF "%C3%"=="%E1%" IF "%A5%"=="O" IF "%D2%"==" " SET D2=O&goto plansza5x5
IF "%A5%"=="%B4%" IF "%B4%"=="%C3%" IF "%C3%"=="%D2%" IF "%A5%"=="O" IF "%E1%"==" " SET E1=O&goto plansza5x5
IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A4%"=="%A5%" IF "%A2%"=="X" IF "%A1%"==" " SET A1=O&goto plansza5x5
IF "%A1%"=="%A3%" IF "%A3%"=="%A4%" IF "%A4%"=="%A5%" IF "%A1%"=="X" IF "%A2%"==" " SET A2=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A4%" IF "%A4%"=="%A5%" IF "%A1%"=="X" IF "%A3%"==" " SET A3=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%"=="%A5%" IF "%A1%"=="X" IF "%A4%"==" " SET A4=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A1%"=="X" IF "%A5%"==" " SET A5=O&goto plansza5x5
IF "%B2%"=="%B3%" IF "%B3%"=="%B4%" IF "%B4%"=="%B5%" IF "%B2%"=="X" IF "%B1%"==" " SET B1=O&goto plansza5x5
IF "%B1%"=="%B3%" IF "%B3%"=="%B4%" IF "%B4%"=="%B5%" IF "%B1%"=="X" IF "%B2%"==" " SET B2=O&goto plansza5x5
IF "%B1%"=="%B2%" IF "%B2%"=="%B4%" IF "%B4%"=="%B5%" IF "%B1%"=="X" IF "%B3%"==" " SET B3=O&goto plansza5x5
IF "%B1%"=="%B2%" IF "%B2%"=="%B3%" IF "%B3%"=="%B5%" IF "%B1%"=="X" IF "%B4%"==" " SET B4=O&goto plansza5x5
IF "%B1%"=="%B2%" IF "%B2%"=="%B3%" IF "%B3%"=="%B4%" IF "%B1%"=="X" IF "%B5%"==" " SET B5=O&goto plansza5x5
IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A4%"=="%A5%" IF "%A2%"=="X" IF "%A1%"==" " SET C1=O&goto plansza5x5
IF "%A1%"=="%A3%" IF "%A3%"=="%A4%" IF "%A4%"=="%A5%" IF "%A1%"=="X" IF "%A2%"==" " SET C2=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A4%" IF "%A4%"=="%A5%" IF "%A1%"=="X" IF "%A3%"==" " SET C3=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%"=="%A5%" IF "%A1%"=="X" IF "%A4%"==" " SET C4=O&goto plansza5x5
IF "%A1%"=="%A2%" IF "%A2%"=="%A3%" IF "%A3%"=="%A4%" IF "%A1%"=="X" IF "%A5%"==" " SET C5=O&goto plansza5x5
IF "%D2%"=="%D3%" IF "%D3%"=="%D4%" IF "%D4%"=="%D5%" IF "%D2%"=="X" IF "%D1%"==" " SET D1=O&goto plansza5x5
IF "%D1%"=="%D3%" IF "%D3%"=="%D4%" IF "%D4%"=="%D5%" IF "%D1%"=="X" IF "%D2%"==" " SET D2=O&goto plansza5x5
IF "%D1%"=="%D2%" IF "%D2%"=="%D4%" IF "%D4%"=="%D5%" IF "%D1%"=="X" IF "%D3%"==" " SET D3=O&goto plansza5x5
IF "%D1%"=="%D2%" IF "%D2%"=="%D3%" IF "%D3%"=="%D5%" IF "%D1%"=="X" IF "%D4%"==" " SET D4=O&goto plansza5x5
IF "%D1%"=="%D2%" IF "%D2%"=="%D3%" IF "%D3%"=="%D4%" IF "%D1%"=="X" IF "%D5%"==" " SET D5=O&goto plansza5x5
IF "%E2%"=="%E3%" IF "%E3%"=="%E4%" IF "%E4%"=="%E5%" IF "%E2%"=="X" IF "%E1%"==" " SET E1=O&goto plansza5x5
IF "%E1%"=="%E3%" IF "%E3%"=="%E4%" IF "%E4%"=="%E5%" IF "%E1%"=="X" IF "%E2%"==" " SET E2=O&goto plansza5x5
IF "%E1%"=="%E2%" IF "%E2%"=="%E4%" IF "%E4%"=="%E5%" IF "%E1%"=="X" IF "%E3%"==" " SET E3=O&goto plansza5x5
IF "%E1%"=="%E2%" IF "%E2%"=="%E3%" IF "%E3%"=="%E5%" IF "%E1%"=="X" IF "%E4%"==" " SET E4=O&goto plansza5x5
IF "%E1%"=="%E2%" IF "%E2%"=="%E3%" IF "%E3%"=="%E4%" IF "%E1%"=="X" IF "%E5%"==" " SET E5=O&goto plansza5x5
IF "%B1%"=="%C1%" IF "%C1%"=="%D1%" IF "%D1%"=="%E1%" IF "%B1%"=="X" IF "%A1%"==" " SET A1=O&goto plansza5x5
IF "%A1%"=="%C1%" IF "%C1%"=="%D1%" IF "%D1%"=="%E1%" IF "%A1%"=="X" IF "%B1%"==" " SET B1=O&goto plansza5x5
IF "%A1%"=="%B1%" IF "%B1%"=="%D1%" IF "%D1%"=="%E1%" IF "%A1%"=="X" IF "%C1%"==" " SET C1=O&goto plansza5x5
IF "%A1%"=="%B1%" IF "%B1%"=="%C1%" IF "%C1%"=="%E1%" IF "%A1%"=="X" IF "%D1%"==" " SET D1=O&goto plansza5x5
IF "%A1%"=="%B1%" IF "%B1%"=="%C1%" IF "%C1%"=="%D1%" IF "%A1%"=="X" IF "%E1%"==" " SET E1=O&goto plansza5x5
IF "%B2%"=="%C2%" IF "%C2%"=="%D2%" IF "%D2%"=="%E2%" IF "%B2%"=="X" IF "%A2%"==" " SET A2=O&goto plansza5x5
IF "%A2%"=="%C2%" IF "%C2%"=="%D2%" IF "%D2%"=="%E2%" IF "%A2%"=="X" IF "%B2%"==" " SET B2=O&goto plansza5x5
IF "%A2%"=="%B2%" IF "%B2%"=="%D2%" IF "%D2%"=="%E2%" IF "%A2%"=="X" IF "%C2%"==" " SET C2=O&goto plansza5x5
IF "%A2%"=="%B2%" IF "%B2%"=="%C2%" IF "%C2%"=="%E2%" IF "%A2%"=="X" IF "%D2%"==" " SET D2=O&goto plansza5x5
IF "%A2%"=="%B2%" IF "%B2%"=="%C2%" IF "%C2%"=="%D2%" IF "%A2%"=="X" IF "%E2%"==" " SET E2=O&goto plansza5x5
IF "%B3%"=="%C3%" IF "%C3%"=="%D3%" IF "%D3%"=="%E3%" IF "%B3%"=="X" IF "%A3%"==" " SET A3=O&goto plansza5x5
IF "%A3%"=="%C3%" IF "%C3%"=="%D3%" IF "%D3%"=="%E3%" IF "%A3%"=="X" IF "%B3%"==" " SET B3=O&goto plansza5x5
IF "%A3%"=="%B3%" IF "%B3%"=="%D3%" IF "%D3%"=="%E3%" IF "%A3%"=="X" IF "%C3%"==" " SET C3=O&goto plansza5x5
IF "%A3%"=="%B3%" IF "%B3%"=="%C3%" IF "%C3%"=="%E3%" IF "%A3%"=="X" IF "%D3%"==" " SET D3=O&goto plansza5x5
IF "%A3%"=="%B3%" IF "%B3%"=="%C3%" IF "%C3%"=="%D3%" IF "%A3%"=="X" IF "%E3%"==" " SET E3=O&goto plansza5x5
IF "%B4%"=="%C4%" IF "%C4%"=="%D4%" IF "%D4%"=="%E4%" IF "%B4%"=="X" IF "%A4%"==" " SET A4=O&goto plansza5x5
IF "%A4%"=="%C4%" IF "%C4%"=="%D4%" IF "%D4%"=="%E4%" IF "%A4%"=="X" IF "%B4%"==" " SET B4=O&goto plansza5x5
IF "%A4%"=="%B4%" IF "%B4%"=="%D4%" IF "%D4%"=="%E4%" IF "%A4%"=="X" IF "%C4%"==" " SET C4=O&goto plansza5x5
IF "%A4%"=="%B4%" IF "%B4%"=="%C4%" IF "%C4%"=="%E4%" IF "%A4%"=="X" IF "%D4%"==" " SET D4=O&goto plansza5x5
IF "%A4%"=="%B4%" IF "%B4%"=="%C4%" IF "%C4%"=="%D4%" IF "%A4%"=="X" IF "%E4%"==" " SET E4=O&goto plansza5x5
IF "%B5%"=="%C5%" IF "%C5%"=="%D5%" IF "%D5%"=="%E5%" IF "%B5%"=="X" IF "%A5%"==" " SET A5=O&goto plansza5x5
IF "%A5%"=="%C5%" IF "%C5%"=="%D5%" IF "%D5%"=="%E5%" IF "%A5%"=="X" IF "%B5%"==" " SET B5=O&goto plansza5x5
IF "%A5%"=="%B5%" IF "%B5%"=="%D5%" IF "%D5%"=="%E5%" IF "%A5%"=="X" IF "%C5%"==" " SET C5=O&goto plansza5x5
IF "%A5%"=="%B5%" IF "%B5%"=="%C5%" IF "%C5%"=="%E5%" IF "%A5%"=="X" IF "%D5%"==" " SET D5=O&goto plansza5x5
IF "%A5%"=="%B5%" IF "%B5%"=="%C5%" IF "%C5%"=="%D5%" IF "%A5%"=="X" IF "%E5%"==" " SET E5=O&goto plansza5x5
IF "%B2%"=="%C3%" IF "%C3%"=="%D4%" IF "%D4%"=="%E5%" IF "%B2%"=="X" IF "%A1%"==" " SET A1=O&goto plansza5x5
IF "%A1%"=="%C3%" IF "%C3%"=="%D4%" IF "%D4%"=="%E5%" IF "%A1%"=="X" IF "%B2%"==" " SET B2=O&goto plansza5x5
IF "%A1%"=="%B2%" IF "%B2%"=="%D4%" IF "%D4%"=="%E5%" IF "%A1%"=="X" IF "%C3%"==" " SET C3=O&goto plansza5x5
IF "%A1%"=="%B2%" IF "%B2%"=="%C3%" IF "%C3%"=="%E5%" IF "%A1%"=="X" IF "%D4%"==" " SET D4=O&goto plansza5x5
IF "%A1%"=="%B2%" IF "%B2%"=="%C3%" IF "%C3%"=="%D4%" IF "%A1%"=="X" IF "%E5%"==" " SET E5=O&goto plansza5x5
IF "%B4%"=="%C3%" IF "%C3%"=="%D2%" IF "%D2%"=="%E1%" IF "%B4%"=="X" IF "%A5%"==" " SET A5=O&goto plansza5x5
IF "%A5%"=="%C3%" IF "%C3%"=="%D2%" IF "%D2%"=="%E1%" IF "%A5%"=="X" IF "%B4%"==" " SET B4=O&goto plansza5x5
IF "%A5%"=="%B4%" IF "%B4%"=="%D2%" IF "%D2%"=="%E1%" IF "%A5%"=="X" IF "%C3%"==" " SET C3=O&goto plansza5x5
IF "%A5%"=="%B4%" IF "%B4%"=="%C3%" IF "%C3%"=="%E1%" IF "%A5%"=="X" IF "%D2%"==" " SET D2=O&goto plansza5x5
IF "%A5%"=="%B4%" IF "%B4%"=="%C3%" IF "%C3%"=="%D2%" IF "%A5%"=="X" IF "%E1%"==" " SET E1=O&goto plansza5x5
set %kol%%wrs%=O
SET pr=1
GOTO plansza5x5
