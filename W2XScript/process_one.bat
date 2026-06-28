@echo off
REM process_one.bat - Processes a single XML file through the full pipeline
REM Usage: process_one.bat <basename_without_extension>
REM Example: process_one.bat 08_Ch2

set f=%~1
set CP=C:\saxon-he-9.3.0.5.jar;

TITLE Processing: %f%
echo [%f%] Starting...

java -cp %CP% net.sf.saxon.Transform -t -o:"%f%-out2.xml" "%f%.xml" "Bookmark.xslt"
echo [%f%] Bookmark done

java -cp %CP% net.sf.saxon.Transform -t -o:"%f%-math.xml" "%f%-out2.xml" "omml2mathml.xsl"
echo [%f%] Math done

java -cp %CP% net.sf.saxon.Transform -t -o:"%f%-out222.xml" "%f%-out2.xml" "02-Remove-xmlns.xslt"
echo [%f%] Remove-xmlns (out222) done

java -cp %CP% net.sf.saxon.Transform -t -o:"%f%-out3.xml" "%f%-out222.xml" "01-W2H-CK.xslt"
echo [%f%] W2H-CK done

java -cp %CP% net.sf.saxon.Transform -o:"%f%-out4.xml" "%f%-out3.xml" "02-Remove-xmlns.xslt"
echo [%f%] Remove-xmlns (out4) done

java -cp %CP% net.sf.saxon.Transform -o:"%f%-out5.xml" "%f%-out4.xml" "1-LIST.xslt"
echo [%f%] 1-LIST done

java -cp %CP% net.sf.saxon.Transform -o:"%f%-idx1.xml" "%f%-out4.xml" "01-Index_Creation-1.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%f%-idx2.xml" "%f%-idx1.xml" "01-Index_Creation-2.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%f%-idx.xml"  "%f%-idx2.xml" "01-Index_Creation-3.xslt"
echo [%f%] Index done

java -cp %CP% net.sf.saxon.Transform -o:"%f%-out6.xml" "%f%-out5.xml" "2-LIST.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%f%-out7.xml" "%f%-out6.xml" "3-LIST.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%f%-out8.xml" "%f%-out7.xml" "35-LIST.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%f%-out9.xml" "%f%-out8.xml" "4-LIST.xslt"
echo [%f%] LIST 2-4 done

java -cp %CP% net.sf.saxon.Transform -t -o:"%f%-out10.xml" "%f%-out9.xml" "02-Remove-xmlns.xslt"
echo [%f%] Final remove-xmlns done

java -cp %CP% net.sf.saxon.Transform -o:"%f%.xhtml" "%f%-out10.xml" "03-Final.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%f%.xhtml" "%f%.xhtml" "join-elements.xslt"
echo [%f%] XHTML done

del "%f%-out2.xml"
del "%f%-out3.xml"
del "%f%-out4.xml"
del "%f%-out5.xml"
del "%f%-out6.xml"
del "%f%-out7.xml"
del "%f%-out8.xml"
del "%f%-out9.xml"
del "%f%-out10.xml"
del "%f%-math.xml"
del "%f%-idx1.xml"
del "%f%-idx2.xml"
del "%f%-idx.xml"

echo [%f%] FINISHED - Output: %f%.xhtml
