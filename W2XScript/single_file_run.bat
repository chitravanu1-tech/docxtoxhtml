@echo off

title IDML TO WORD

cls
echo Processing..

REM set CP=\\D:\saxon\saxon9.jar;
REM set CP=C:\Users\thiruvarulr\Downloads\saxonhe9-3-0-11j\saxon9he.jar;
REM set CP=D:\saxon-he-9.3.0.5.jar;
rem set CP=\\D:\Saxon\saxon-he-9.3.0.5.jar;
rem set CP=\\C:\Saxon\saxon-he-9.3.0.5.jar;
set CP=\\C:\saxon-he-9.3.0.5.jar;
echo jar9.3


REM #################### Convertion for Bookmarks, comments, trackchanges
REM  Moving DIV inside P, to outside P in the below 03 xslt...
              java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\New Master File 1-1out.xml" "%~dp0\New Master File 1-1.xml" "%~dp0\Bookmark.xslt" 
        
echo XHTML COMPLETED
pause

        
       REM java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Chapter\word\document.xml" "%~dp0\ParaNumber\ccRemoved.xml" "%~dp0\ParaNumber\document.xslt"
       rem copy "%~dp0\ParaNumber\output\*.xml" "%~dp0\replace\"
rem rem rem REM @@@@pause
exit /b


