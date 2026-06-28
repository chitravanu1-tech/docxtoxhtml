@echo off

title IDML TO WORD

cls
echo Processing..

set CP=C:\Saxon\saxon-he-9.3.0.5.jar;


for /f "delims=" %%F in (' dir /b /a-d *.xhtml') do set filename=%%~nF
(
echo %filename%
copy "%~dp0\%filename%.xhtml" "%~dp0\chapter.xml"
)



exit /b
rem pause


