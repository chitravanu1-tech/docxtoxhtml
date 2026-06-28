@echo off
echo.

for /f "delims=" %%F in (' dir /b /s /a-d *.idml') do set filename=%%~nF
(
ren %~dp0\out.xhtml %filename%.xhtml
ren %~dp0\Chapter\PnoManifest.xml %filename%.xml
)

copy "%~dp0\%filename%.xhtml" "%~dp0\Output\"


@echo on
exit /b