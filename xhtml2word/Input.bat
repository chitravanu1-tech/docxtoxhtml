@echo off

title IDML TO WORD

cls
echo Processing..

set CP=C:\Saxon\saxon-he-9.3.0.5.jar;

java -cp %CP% net.sf.saxon.Transform  -o:"%~dp0\xhtmltoxml.xml" "%~dp0\chapter.xml" "%~dp0\xhtmltoXML.xslt" 
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\out2.xml" "%~dp0\xhtmltoxml.xml" "%~dp0\2_Table_New.xslt"
pause
java -jar CssParser-1.0.jar "%~dp0\design.css" "%~dp0\"
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\2_0_1_Table.xml" "%~dp0\out2.xml" "%~dp0\2_0_1_Table_New.xslt"
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\out3.xml" "%~dp0\2_0_1_Table.xml" "%~dp0\Cellnumber.xslt"
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\sort.xml" "%~dp0\out3.xml" "%~dp0\sorting.xslt"
pause
java  -cp %CP% net.sf.saxon.Transform -o:"%~dp0\2_1_Table.xml" "%~dp0\sort.xml" "%~dp0\2_1_Table_New.xslt"
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\styles.xml" "%~dp0\cssStyles.xml" "%~dp0\xhtmlStyles.xslt"
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\rowSpan.xml" "%~dp0\2_1_Table.xml" "%~dp0\xhmtlrowSpan.xslt" 
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\xhtmlNum2.xml" "%~dp0\xhtmlNum1.xml" "%~dp0\NumCleanUP.xslt" 
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\styles.xml" "%~dp0\cssStyles.xml" "%~dp0\xhtmlStyles.xslt"
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Chapter\word\styles.xml" "%~dp0\cssStyles.xml" "%~dp0\xhtmlStyles.xslt"
pause


rem java -cp %CP% net.sf.saxon.Transform -TP:"%~dp0\Xhtml_To_Word.htm" -o:"%~dp0\Chapter\word\document.xml" "%~dp0\rowSpan.xml" "%~dp0\Xhtml_To_Word.xslt"
java -cp %CP% net.sf.saxon.Transform  -o:"%~dp0\Chapter\word\document.xml" "%~dp0\rowSpan.xml" "%~dp0\Xhtml_To_Word.xslt"

pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Chapter\word\footnotes.xml" "%~dp0\rowSpan.xml" "%~dp0\xhtmlfootnote.xslt" 
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Chapter\word\endnotes.xml" "%~dp0\rowSpan.xml" "%~dp0\xhtmlendnote.xslt" 
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\footnotes.xml" "%~dp0\rowSpan.xml" "%~dp0\xhtmlfootnote.xslt" 
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\endnotes.xml" "%~dp0\rowSpan.xml" "%~dp0\xhtmlendnote.xslt" 
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Chapter\word\comments.xml" "%~dp0\rowSpan.xml" "%~dp0\xhtmlcomments.xslt" 
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\comments.xml" "%~dp0\rowSpan.xml" "%~dp0\xhtmlcomments.xslt" 
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Chapter\word\numbering.xml" "%~dp0\xhtmlNum2.xml" "%~dp0\xhtmlNumbering.xslt" 
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\numbering.xml" "%~dp0\xhtmlNum2.xml" "%~dp0\xhtmlNumbering.xslt"
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Chapter\word\_rels\document.xml.rels" "%~dp0\rowSpan.xml" "%~dp0\WordRels.xslt" 
 pause
Echo end
exit /b


