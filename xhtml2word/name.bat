@echo off
echo.

for /f "delims=" %%F in (' dir /b /a-d *.xhtml') do set filename=%%~nF
(
ren %~dp0\Chapter\Chapter.docx %filename%.docx

)

copy "%~dp0\Chapter\%filename%.docx" "%~dp0\Output\"


@echo on
exit /b