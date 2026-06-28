@echo off
cls
echo.

cd Chapter

"c:\Program Files\7-Zip\7z.exe" a  Chapter.docx 

cd..

copy "%~dp0\ParaNumber\PnoManifest.xml" "%~dp0\Chapter\"

@echo on
 exit /b
