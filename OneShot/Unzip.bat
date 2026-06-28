@echo off
title IDML TO WORD
cls

echo Processing..

for /F "delims=" %%I IN (' dir /b /s /a-d *.idml ') DO (
    "C:\Program Files\7-Zip\7z.exe" x -y -o"%%~dpI\%%~nI" "%%I" 
)

call :treeProcess
goto :eof

:treeProcess
rem Do whatever you want here over the files of this subdir, for example:

copy *.xml "%~dp0\ParaNumber\"
rem copy *.xml "%~dp0\replace\"
rem copy *.xml "%~dp0\WOrdSpreadMap\"

for /D %%d in (*) do (
    cd %%d
    call :treeProcess
    cd ..
)


exit /b
