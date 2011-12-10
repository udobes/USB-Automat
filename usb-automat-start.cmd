@ECHO OFF
REM USB Automat Startskript
REM 30.10.2011 - Besenreuther
REM 

SET datum=%Date%
SET tag=%Datum:~0,2%
SET mon=%Datum:~3,2%
SET jahr=%Datum:~6,4%

SET PFAD=%jahr%-%mon%-%tag%
SET RUMPF=d:\Aufnahme\Archiv_%jahr%
	
ECHO .
ECHO Aktueller Rumpfpfad: %RUMPF%
SET /p RUMPF=Rumpfpfad eingeben (%RUMPF%): 
ECHO .
ECHO Aktueller Datumspfad: %PFAD%
SET /p PFAD=Datum eingeben (%PFAD%): 
ECHO .
ECHO Öffne USB-Automat für G: H: I: J:
ECHO .

REM DOS-Fenster sichtbar starten
START "USB-G" usb-automat-batch.cmd %RUMPF% %PFAD% g:
START "USB-H" usb-automat-batch.cmd %RUMPF% %PFAD% h:
START "USB-I" usb-automat-batch.cmd %RUMPF% %PFAD% i:
START "USB-J" usb-automat-batch.cmd %RUMPF% %PFAD% j:

REM DOS-Fenster minimiert starten
REM START "USB-G" /MIN usb-automat-batch.cmd %RUMPF% %PFAD% g:
REM START "USB-H" /MIN usb-automat-batch.cmd %RUMPF% %PFAD% h:
REM START "USB-I" /MIN usb-automat-batch.cmd %RUMPF% %PFAD% i:
REM START "USB-J" /MIN usb-automat-batch.cmd %RUMPF% %PFAD% j:



ECHO **** 4 USB-Automaten gestartet ****
pause
