@echo off

title IDML TO WORD

cls


del /s %~dp0\ParaNumber\*.xml


for /f "delims=" %%F in (' dir /b /s /a-d *.idml') do set file=%%~nF
 (
rem del %file%.idml
@RD /S /Q "%file%"
)

del %~dp0\ParaNumber\%file%.xhtml

rem del %~dp0\Chapter\%file%.xml


rem exit /b