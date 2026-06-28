@echo off

title IDML TO WORD

cls

echo %~dp0\

del %~dp0\chapter\word\document.xml

del %~dp0\chapter\word\Styles.xml

del %~dp0\chapter\word\numbering.xml

del %~dp0\chapter\word\comments.xml

del %~dp0\chapter\word\footnotes.xml

del %~dp0\*.xml

for /f "delims=" %%F in (' dir /b /a-d *.xhtml') do set file=%%~nF
 (
rem del %file%.xhtml
del %~dp0\chapter\%file%.docx
@RD /S /Q "%file%"
)



rem pause
 exit /b