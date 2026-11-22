@echo off
setlocal enabledelayedexpansion

title Leetspeak Converter mit Farben
color 0A

:MAIN_MENU
cls
echo.
echo [91m====================================[0m
echo [92m      LEETSPEAK CONVERTER[0m
echo [93m    mit Groß-/Kleinschreibung[0m
echo [91m====================================[0m
echo.
echo [94m1.[0m Text zu Leetspeak kodieren
echo [94m2.[0m Leetspeak zu Text dekodieren
echo [94m3.[0m Beenden
echo.
echo [95mLeetspeak-Tabelle:[0m
echo a/A=4  e/E=3  l/L=1  o/O=0  t/T=7
echo s/S=5  z/Z=2  h/H=#  i/I=!  g/G=6
echo q/Q=9  c/C=(  x/X=*
echo.
set /p choice="Wähle eine Option (1-3): "

if "%choice%"=="1" goto ENCODE_MODE
if "%choice%"=="2" goto DECODE_MODE
if "%choice%"=="3" goto EXIT
echo [91mUngültige Option![0m
pause >nul
goto MAIN_MENU

:ENCODE_MODE
cls
echo [94m===== LEETSPEAK KODIERER =====[0m
echo.
echo [96mGib Text ein (leere Eingabe für Menü):[0m
echo.
:ENCODE_LOOP
set /p input="Text: "
if "!input!"=="" goto MAIN_MENU
call :EncodeText "!input!"
echo [92mKodiert: !result![0m
echo.
goto ENCODE_LOOP

:DECODE_MODE
cls
echo [94m===== LEETSPEAK DEKODIERER =====[0m
echo.
echo [96mGib Leetspeak ein (leere Eingabe für Menü):[0m
echo.
:DECODE_LOOP
set /p input="Leetspeak: "
if "!input!"=="" goto MAIN_MENU
call :DecodeText "!input!"
echo [92mDekodiert: !result![0m
echo.
goto DECODE_LOOP

:EXIT
cls
echo Auf Wiedersehen!
timeout /t 2 >nul
exit /b 0

:EncodeText
set "text=%~1"

:: Kleinbuchstaben ersetzen
set "text=!text:a=4!"
set "text=!text:e=3!"
set "text=!text:l=1!"
set "text=!text:o=0!"
set "text=!text:t=7!"
set "text=!text:s=5!"
set "text=!text:z=2!"
set "text=!text:h=#!"
set "text=!text:i=!!"
set "text=!text:g=6!"
set "text=!text:q=9!"
set "text=!text:c=(!"
set "text=!text:x=*!"

:: Großbuchstaben ersetzen
set "text=!text:A=4!"
set "text=!text:E=3!"
set "text=!text:L=1!"
set "text=!text:O=0!"
set "text=!text:T=7!"
set "text=!text:S=5!"
set "text=!text:Z=2!"
set "text=!text:H=#!"
set "text=!text:I=!!"
set "text=!text:G=6!"
set "text=!text:Q=9!"
set "text=!text:C=(!"
set "text=!text:X=*!"

set "result=!text!"
exit /b

:DecodeText
set "text=%~1"

:: Leetspeak zu Kleinbuchstaben
set "text=!text:4=a!"
set "text=!text:3=e!"
set "text=!text:1=l!"
set "text=!text:0=o!"
set "text=!text:7=t!"
set "text=!text:5=s!"
set "text=!text:2=z!"
set "text=!text:#=h!"
set "text=!text:!=i!"
set "text=!text:6=g!"
set "text=!text:9=q!"
set "text=!text:(=c!"
set "text=!text:*=x!"

:: Leetspeak zu Großbuchstaben
set "text=!text:4=A!"
set "text=!text:3=E!"
set "text=!text:1=L!"
set "text=!text:0=O!"
set "text=!text:7=T!"
set "text=!text:5=S!"
set "text=!text:2=Z!"
set "text=!text:#=H!"
set "text=!text:!=I!"
set "text=!text:6=G!"
set "text=!text:9=Q!"
set "text=!text:(=C!"
set "text=!text:*=X!"

set "result=!text!"
exit /b