@echo off
title IDML TO WORD
cls

echo Processing..
call "%~dp0\removeSpacesInFname.bat"
call "%~dp0\Unzip.bat"

call "%~dp0\ParaNumber-Exit.bat"


#to rename out.html
rem call "%~dp0\nameHTML.bat"

rem call "%~dp0\replace.bat"
rem call "%~dp0\Input.bat"
rem call "%~dp0\Zip.bat"
call "%~dp0\name.bat"
cls
echo completed...
pause
call "%~dp0\DelXML.bat"

rem pause
