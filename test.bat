@echo off

:: Lendo variáveis de ambiente no .env
FOR /F "eol=# tokens=*" %%i IN (%~dp0.env) DO SET %%i
SET CURRENTDIR=%cd%

IF "%2" == "vbalink" GOTO vbalink
IF "%2" == "nocash" GOTO nocash
IF "%2" == "mesen" GOTO mesen
GOTO mgba

:mgba
start "" "%MGBA_PATH%" "%CURRENTDIR%\mmz1.gba"
GOTO end

:vbalink
start "" "%VBALINK_PATH%" "%CURRENTDIR%\mmz1.gba"
timeout /t 1 >nul
start "" "%VBALINK_PATH%" "%CURRENTDIR%\mmz1.gba"
GOTO end

:nocash
start "" "%NOCASHGBA_PATH%" "%CURRENTDIR%\mmz1.gba"
GOTO end

:mesen
start "" "%MESEN_PATH%" "%CURRENTDIR%\mmz1.gba"
GOTO end

:end

