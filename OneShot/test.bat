@echo off

title IDML TO WORD

cls
echo Processing..

REM set CP=\\D:\Saxon\saxon9.jar;
REM set CP=C:\Users\thiruvarulr\Downloads\saxonhe9-3-0-11j\saxon9he.jar;
set cp=D:\saxon-he-9.3.0.5.jar;

java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\textInpSorting.xml" "%~dp0\ParaNumber\textInp.xml" "%~dp0\ParaNumber\textInpSorting.xslt"
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\txtFrmPlacement.xslt" "%~dp0\ParaNumber\textInpSorting.xml" "%~dp0\ParaNumber\textInpPlacement.xslt"
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\txtFrmPlacement.xml" "%~dp0\ParaNumber\textInpSorting.xml" "%~dp0\ParaNumber\txtFrmPlacement.xslt"
pause
cls
echo SORT ENDS; check txtFrmPlacement.xml
