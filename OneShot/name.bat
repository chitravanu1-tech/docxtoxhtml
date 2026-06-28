@echo off
echo.

for /f "delims=" %%F in (' dir /b /s /a-d *.idml') do set filename=%%~nF
(
REM ren %~dp0\ParaNumber\out.xhtml %filename%.xhtml
REM ren %~dp0\ParaNumber\PnoManifest.xml %filename%.xml
)

copy "%~dp0\ParaNumber\%filename%.xhtml" "%~dp0\Output\"
copy "%~dp0\ParaNumber\%filename%.xml" "%~dp0\Output\"

@echo on
rem exit /b