TITLE HTML CONVERSION - EPUB3 - Version1 (PARALLEL)

COLOR a
@echo off
cls
@echo Start time: %time%
set STARTTIME=%TIME%

set CP=C:\saxon-he-9.3.0.5.jar;
CLS

REM ======================================================
REM STEP 1: Unzip all .docx files (sequential - fast, OK)
REM ======================================================
REN *.xml *.sgml

for /R %%b IN (*.docx) DO (
  TITLE Unzipping: %%~nb.docx
  echo Unzipping: %%~nb.docx
  "C:\Strawberry\perl\bin\perl.exe" "00-UNZIP.pl" "%%b"
)

echo.
echo All files unzipped. Starting parallel transforms...
echo.

REM ======================================================
REM STEP 2: Transform all .xml files in PARALLEL
REM Each file gets its own window (start /min)
REM ======================================================
for /R %%f IN (*.xml) DO (
  echo Launching: %%~nf
  start "%%~nf" /min cmd /c "cd /d "%CD%" && call process_one.bat "%%~nf""
)

echo.
echo All jobs launched in parallel.
echo Watch the taskbar for individual windows to close when each file finishes.
echo.
pause
