@echo off
title XHTML TO WORD
cls

echo Processing..

call "%~dp0\removeSpacesInFname.bat"

call "%~dp0\rename.bat"

call "%~dp0\Input.bat"

call "%~dp0\Zip.bat"

call "%~dp0\name.bat"

rem call "%~dp0\DelXML.bat"

rem pause
