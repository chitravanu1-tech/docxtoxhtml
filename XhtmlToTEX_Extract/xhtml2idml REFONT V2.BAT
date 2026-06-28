@echo off
cls
echo.
echo ********************************************
echo       XHTML to IDML
echo ********************************************
set CP=C:\saxon-he-9.3.0.5.jar;


for /R %%b IN (*.xhtml) DO ( title IDML CONVERSION
set filename="%%~nb"
echo File: %%~nb
cls
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\equation.xml" "%~dp0\pone.0326081.xhtml" "%~dp0\1-EditedEqutionList.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\output1.xhtml" "%~dp0\equation.xml" "%~dp0\2-EditedEqutionListReUpdate.xslt"
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\out2.xml" "%~dp0\out1.xml" "%~dp0\2_Table_New.xsl"
pause
rem java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\out3.xml" "%~dp0\out2.xml" "%~dp0\Cellnumber.xsl"
rem java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\out4.xml" "%~dp0\out3.xml" "%~dp0\Cellnumber1.xsl"
rem java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\2_0_1_Table.xml" "%~dp0\out4.xml" "%~dp0\2_0_1_Table_New.xsl"
rem java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\sort.xml" "%~dp0\2_0_1_Table.xml" "%~dp0\sorting.xsl"
rem java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\2_Table.xml" "%~dp0\sort.xml" "%~dp0\2_Table.xsl"
rem java  -cp %CP% net.sf.saxon.Transform -o:"%~dp0\2_1_Table.xml" "%~dp0\sort.xml" "%~dp0\2_1_Table_New.xsl"
java  -cp %CP% net.sf.saxon.Transform -o:"%~dp0\xhtmltoXML_out.xml" "%~dp0\out2.xml" "%~dp0\xhtmltoXML.xsl"
java  -cp %CP% net.sf.saxon.Transform -o:"%~dp0\document_out4.xml" "%~dp0\xhtmltoXML_out.xml" "%~dp0\Xhtml_To_IDML_v10.xsl"

java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\document_out5.xml" "%~dp0\document_out4.xml" "%~dp0\Idml3.xsl"	
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\document_out6.xml" "%~dp0\document_out5.xml" "%~dp0\Idml4.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\document_out7.xml" "%~dp0\document_out6.xml" "%~dp0\Idml4-1.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\document_out8.xml" "%~dp0\document_out7.xml" "%~dp0\Idml4-2.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\document_out9.xml" "%~dp0\document_out8.xml" "%~dp0\Idml4-2_1.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\document_out10.xml" "%~dp0\document_out9.xml" "%~dp0\Idml4-2_2.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\document_out11.xml" "%~dp0\document_out10.xml" "%~dp0\Idml4-3.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\Story_S4C.xml" "%~dp0\document_out11.xml" "%~dp0\manualtochar.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\Styles.xml" "%~dp0\Precalculus\Resources\Styles.xml" "%~dp0\StylAttrAdd.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\Story_S4C1.xml" "%~dp0\Converted_Story\Story_S4C.xml" "%~dp0\StylChg.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\Last.xml" "%~dp0\Converted_Story\Story_S4C1.xml" "%~dp0\addnocharstyle.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\Last0.xml" "%~dp0\Converted_Story\Last.xml" "%~dp0\xmlselfid.xsl"
rem <!--Find Missing Styles-->
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\Styles1.xml" "%~dp0\Converted_Story\Styles.xml" "%~dp0\RemovingText.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\Story_S4C2.xml" "%~dp0\Converted_Story\Story_S4C1.xml" "%~dp0\RemovingText.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\Styles2.xml" "%~dp0\Converted_Story\Styles1.xml" "%~dp0\RmvDupStyl.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\Story_S4C3.xml" "%~dp0\Converted_Story\Story_S4C2.xml" "%~dp0\RmvDupStyl.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\errorlog.xml" "%~dp0\Converted_Story\Story_S4C3.xml" "%~dp0\StyleMatch.xsl"
rem <!--Find Art Missing-->
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\Artreport.txt" "%~dp0\Converted_Story\Story_S4C1.xml" "%~dp0\Art1.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\Artreport.xml" "%~dp0\Converted_Story\Story_S4C1.xml" "%~dp0\FigureCaption.xsl"
rem -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Precalculus\XML\Story_Final.xml" "%~dp0\Converted_Story\Story_S4C1.xml" "%~dp0\AddMissingStyles.xsl"
rem java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Precalculus\Resources\Styles.xml" "%~dp0\Precalculus\Resources\Styles.xml" "%~dp0\Addmismatchstyles.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\StylesManual.xml" "%~dp0\Precalculus\Resources\Styles.xml" "%~dp0\Addmismatchstyles.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\errorlog1.xml" "%~dp0\Converted_Story\errorlog.xml" "%~dp0\ProcessStatus1.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\StylesManual1.xml" "%~dp0\Converted_Story\StylesManual.xml" "%~dp0\Addmismatchstylesmanual.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\StylesManual2.xml" "%~dp0\Converted_Story\StylesManual1.xml" "%~dp0\otherattr.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Precalculus\Resources\Styles.xml" "%~dp0\Converted_Story\StylesManual2.xml" "%~dp0\Style_Apply_Ma.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\errorlog2.xml" "%~dp0\Converted_Story\errorlog1.xml" "%~dp0\ProcessStatus2.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Converted_Story\MissingStyles.txt" "%~dp0\Converted_Story\errorlog2.xml" "%~dp0\ProcessStatus.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\xml_tag.xml" "%~dp0\Converted_Story\Story_S4C1.xml" "%~dp0\XML_Tag.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Precalculus\XML\Tags.xml" "%~dp0\xml_tag.xml" "%~dp0\XML_Tag1.xslt"
rem Index Purpose{16.02.2017}
rem java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\index.xml" "%~dp0\document_out4.xml" "%~dp0\1_index.xsl"
copy "%~dp0\Precalculus\Resources\Graphic.xml" "%~dp0\"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Precalculus\Resources\Graphic.xml" "%~dp0\Graphic.xml" "%~dp0\Graphic.xsl"
copy "%~dp0\Precalculus\designmap.xml" "%~dp0\"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Precalculus\designmap.xml" "%~dp0\designmap.xml" "%~dp0\designmp.xsl"
copy "%~dp0\Precalculus\XML\BackingStory.xml" "%~dp0\"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Precalculus\XML\BackingStory.xml" "%~dp0\Converted_Story\Last0.xml" "%~dp0\BckingStry.xsl"
rem MisMatchStyle Purpose{16.02.2017}
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Precalculus\Resources\Styles.xml" "%~dp0\Precalculus\Resources\Styles.xml" "%~dp0\Addnewstyle.xsl"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Precalculus\XML\BackingStory.xml" "%~dp0\Precalculus\XML\BackingStory.xml" "%~dp0\paracondtiontext.xsl"
)
rem pause
rem @echo on