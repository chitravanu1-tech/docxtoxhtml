@echo off

title IDML TO WORD

cls
echo Processing..

set CP=\\D:\Saxon\saxon9.jar;

java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\nestedChar.xml" "%~dp0\ParaNumber\Table.xml" "%~dp0\ParaNumber\nestedChar.xslt"
          
           echo now TEST in Table.xml ...
           rem rem pause

pause
exit /b


