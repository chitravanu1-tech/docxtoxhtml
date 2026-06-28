@echo off
cls
echo.

set a=%1

set b="%a%"

chdir /D "%b%"
rem echo %b%

for /R %%b IN (*.idml) DO (
Xcopy /-y "%%b" "D:\PrakashRnD\PrakashR\10-Production-Macros\IDML-HTML\OneShotsimple\" 

chdir /D D:\PrakashRnD\PrakashR\10-Production-Macros\IDML-HTML\OneShotsimple\
call "D:\PrakashRnD\PrakashR\10-Production-Macros\IDML-HTML\OneShotsimple\IDMLtoWORD.bat"
chdir /D "%b%"

)
pause