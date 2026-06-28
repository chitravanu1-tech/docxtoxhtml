@echo off
title IDML TO WORD
cls

echo Processing..
call "%~dp0\Unzip.bat"
call "%~dp0\ParaNumberALL.bat"
#to rename out.html
rem call "%~dp0\nameHTML.bat"
rem call "%~dp0\replace.bat"
rem call "%~dp0\Input.bat"
rem call "%~dp0\Zip.bat"
call "%~dp0\name.bat"
call "%~dp0\DelXML.bat"

rem pause
