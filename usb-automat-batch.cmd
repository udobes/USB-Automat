@ECHO OFF
REM USB Automat
REM 13.10.2011 - Besenreuther
REM 

SET datum=%Date%
SET tag=%Datum:~0,2%
SET mon=%Datum:~3,2%
SET jahr=%Datum:~6,4%

SET RUMPF=%1
SET PFAD=%2
SET ZIEL=%3
	
SET QUELLE=%RUMPF%\%PFAD%
SET LOGFILE=usb-automat-%ZIEL:~0,1%-%PFAD%.log
ECHO .
ECHO Aktueller Datumspfad:  %QUELLE%
ECHO Aktuelles USB-Laufwerk %ZIEL%

for /L %%N IN (1, 1, 10000) do (
	if exist %ZIEL%\ (

		ECHO USB-Stick erkannt >>%LOGFILE%
		date >>%LOGFILE% <RET
		time >>%LOGFILE% <RET
		vol %ZIEL% >>%LOGFILE%

		ECHO .
		ECHO %ZIEL%\ vorhanden
		ECHO Pfad %ZIEL%\%PFAD% anlegen
		if not exist %ZIEL%\%PFAD% (
			mkdir %ZIEL%\%PFAD%
		)

		ECHO Kopiere von: %QUELLE%
		ECHO        nach: %ZIEL%\%PFAD%
		ECHO .

		if exist %ZIEL%\vm-intern-mp3 (
			ECHO vm-intern-mp3 gefunden
			ECHO . 
			ECHO xcopy %QUELLE%\* %ZIEL%\%PFAD% /V /F /Y /S
			ECHO xcopy %QUELLE%\* %ZIEL%\%PFAD% /V /F /Y /S >>%LOGFILE%
				  xcopy %QUELLE%\* %ZIEL%\%PFAD% /V /F /Y /S
		) ELSE (
			ECHO xcopy %QUELLE%\* %ZIEL%\%PFAD% /V /F /Y
			ECHO xcopy %QUELLE%\* %ZIEL%\%PFAD% /V /F /Y >>%LOGFILE%
				  xcopy %QUELLE%\* %ZIEL%\%PFAD% /V /F /Y

		   if exist %ZIEL%\vm-lobpreis-mp3 (
				ECHO .
				ECHO Pfad %ZIEL%\%PFAD%\intern anlegen
				if not exist %ZIEL%\%PFAD%\intern (
					mkdir %ZIEL%\%PFAD%\intern
				)
				ECHO xcopy %QUELLE%\intern\*lobp*.* %ZIEL%\%PFAD%\intern /V /F /Y
				ECHO xcopy %QUELLE%\intern\*lobp*.* %ZIEL%\%PFAD%\intern /V /F /Y >>%LOGFILE%
					  xcopy %QUELLE%\intern\*lobp*.* %ZIEL%\%PFAD%\intern /V /F /Y
			)
		)
		ECHO Kopiervorgang beendet >>%LOGFILE%
		dir /S %ZIEL%\%PFAD%\ >>%LOGFILE%
		time >>%LOGFILE% <RET
		ECHO ======================================================================= >>usb-automat.log
		ECHO . >>%LOGFILE%
		
		RemoveDrive %ZIEL% -L -w:4000 -b -i 
		
	) ELSE (
		ECHO .
		ECHO Aktueller Datumspfad:  %PFAD%
		ECHO Aktuelles USB-Laufwerk %ZIEL%
		ECHO .
		ECHO bitte USB %ZIEL% einstecken
	)
	ECHO %%N: 5 Sekunden Pause
	PING -n 5 localhost >nul
)