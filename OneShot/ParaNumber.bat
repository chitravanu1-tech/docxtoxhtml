@echo off

title IDML TO WORD

cls
echo Processing..

REM set CP=\\D:\saxon\saxon9.jar;
REM set CP=C:\Users\thiruvarulr\Downloads\saxonhe9-3-0-11j\saxon9he.jar;
set CP=C:\saxon-he-9.3.0.5.jar;


echo jar9.3
pause

java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\1.xml" "%~dp0\ParaNumber\designmap.xml" "%~dp0\ParaNumber\RawMap.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\linked.xml" "%~dp0\ParaNumber\Styles.xml" "%~dp0\ParaNumber\LinkingStyles.xslt"
echo MERGE STORY
rem pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\Manifest.xml" "%~dp0\ParaNumber\StoryCleanedmap.xml" "%~dp0\ParaNumber\MergeStory.xslt"
echo MERGE STORY done

java -cp %CP% net.sf.saxon.Transform -t -o:"%~dp0\ParaNumber\PnoManifest.xml" "%~dp0\ParaNumber\Manifest.xml" "%~dp0\ParaNumber\ParaNumbering.xslt"


echo pmanifest created
rem pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\splitStory.xml" "%~dp0\ParaNumber\PnoManifest.xml" "%~dp0\ParaNumber\SplitStory.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\ReplacingStory.xml" "%~dp0\ParaNumber\splitStory.xml" "%~dp0\ParaNumber\ReplacingStory.xslt"
echo ReplacingStoryTab
rem pause
REM ************************************29-12-17; moved <textframe> to its after <paragraphRange> *********************************************************************
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\ReplacingStoryTab.xml" "%~dp0\ParaNumber\ReplacingStory.xml" "%~dp0\ParaNumber\ReplacingStoryTab.xslt"
echo ReplacingStoryTab
pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\Table.xml" "%~dp0\ParaNumber\ReplacingStoryTab.xml" "%~dp0\ParaNumber\Table.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\nestedChar.xml" "%~dp0\ParaNumber\Table.xml" "%~dp0\ParaNumber\nestedChar.xslt"          
           echo now TEST in Table.xml ...
           rem rem rem pause

java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\SpreadImageLink.xml" "%~dp0\ParaNumber\SpreadCleanedmap.xml" "%~dp0\ParaNumber\SpreadImageLink.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\ReplacingSpread.xml" "%~dp0\ParaNumber\SpreadImageLink.xml" "%~dp0\ParaNumber\ReplacingSpread.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\textInp.xml" "%~dp0\ParaNumber\ReplacingSpread.xml" "%~dp0\ParaNumber\textInp.xslt"
cls
echo ***************
rem pause
REM: Check the text frm ID in spread/story
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\styles.xml" "%~dp0\ParaNumber\linked.xml" "%~dp0\ParaNumber\Styles.xslt"
echo styles.xml generated; check nestedXML
echo gen1
rem pause
REM #################### Converting Drawing,content controls, pict, textboxes etc....
REM #################### DO NOT CHANGE THIS ORDER 
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\Inp1.xml" "%~dp0\ParaNumber\nestedChar.xml" "%~dp0\ParaNumber\genxhtml.xslt"
echo genxhtml
REM @@@@rem pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\Inp.xml" "%~dp0\ParaNumber\Inp1.xml" "%~dp0\ParaNumber\genxhtml15.xslt"
echo genxhtml 1.5
echo "Inp.xml"  will called by "WordTB.xslt" later 
REM @@@@rem pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Chapter\word\footnotes.xml" "%~dp0\ParaNumber\nestedChar.xml" "%~dp0\ParaNumber\Footnote.xslt"
rem pause
echo Footnote.xslt
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\footnotes.xml" "%~dp0\ParaNumber\nestedChar.xml" "%~dp0\ParaNumber\Footnote.xslt"
echo Comments.xslt
rem pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Chapter\word\comments.xml" "%~dp0\ParaNumber\nestedChar.xml" "%~dp0\ParaNumber\Comments.xslt"
rem pause
echo Comments.xslt
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\comments.xml" "%~dp0\ParaNumber\nestedChar.xml" "%~dp0\ParaNumber\Comments.xslt"

       REM @@@@pause   
REM ######################################################################################## SORTING STARTS #############################################################################################################################
REM 1-MAR-19
echo textFrmAdjust.xslt
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\textFrmAdjust.xml" "%~dp0\ParaNumber\textInp.xml" "%~dp0\ParaNumber\textFrmAdjust.xslt"
REM 1-MAR-19
echo SORT STARTS; input textInp.xml
REM @@@@rem pause
rem pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\textInpSorting.xml" "%~dp0\ParaNumber\textFrmAdjust.xml" "%~dp0\ParaNumber\textInpSorting.xslt"
REM @@@@rem pause
echo textInpPlacement.xslt
rem pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\txtFrmPlacement.xslt" "%~dp0\ParaNumber\textInpSorting.xml" "%~dp0\ParaNumber\textInpPlacement.xslt"
REM @@@@rem pause
echo txtFrmPlacement.xslt
rem pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\txtFrmPlacement.xml" "%~dp0\ParaNumber\textInpSorting.xml" "%~dp0\ParaNumber\txtFrmPlacement.xslt"
rem pause
echo SORT ENDS; check txtFrmPlacement.xml
REM @@@@rem pause

REM ######################################################################################## SPREAD PROCESSING END here ##############################################################################################################################

REM @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
REM This "WordTB.xslt" XSLT is merging my Inp.xml generated by "genxhtml15.xslt" previously
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\WordTB.xml" "%~dp0\ParaNumber\txtFrmPlacement.xml" "%~dp0\ParaNumber\WordTB.xslt"
rem pause
echo WORDtb.xml; check txtFrmPlacement.xml
REM @@@@rem pause
REM Inp.xml is using inside WordTB.xslt above
REM @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

echo WordRels_Story.xslt
    REM java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\StoryRels.xml" "%~dp0\ParaNumber\Table.xml" "%~dp0\ParaNumber\WordRels_Story.xslt"
    REM java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\Rels.xml" "%~dp0\ParaNumber\textInp.xml" "%~dp0\ParaNumber\WordRels.xslt"
    REM java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Chapter\word\_rels\document.xml.rels" "%~dp0\ParaNumber\Rels.xml" "%~dp0\ParaNumber\RelsLink.xslt"
    REM java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\RelsLink.xml" "%~dp0\ParaNumber\Rels.xml" "%~dp0\ParaNumber\RelsLinkHelper.xslt"

REM ################# In the below i'm removing DIV which is not having the "class" and "data-type="textbox"" #################
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\MergedSpreads.xml" "%~dp0\ParaNumber\WordTB.xml" "%~dp0\ParaNumber\MergeSpread.xslt" 
rem pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\SortBy.xml" "%~dp0\ParaNumber\MergedSpreads.xml" "%~dp0\ParaNumber\SortBy.xslt"

REM /////////////////////////////////// LIST Conveersion starts here /////////////////////////////////////////////////////////////////////////////////////////////
cls
echo LIST conversion
echo 1list
REM @@@@rem pause
           java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\L1.xml" "%~dp0\ParaNumber\SortBy.xml" "%~dp0\ParaNumber\1-LIST-IDML.xslt" 
echo 2 list
REM @@@@rem pause

           java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\L1.xml" "%~dp0\ParaNumber\L1.xml" "%~dp0\ParaNumber\15-LIST-IDML.xslt" 
echo 1list
REM @@@@rem pause

           java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\L2.xml" "%~dp0\ParaNumber\L1.xml" "%~dp0\ParaNumber\2-LIST-IDML.xslt" 
echo 1list
REM @@@@rem pause

           java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\L3.xml" "%~dp0\ParaNumber\L2.xml" "%~dp0\ParaNumber\3-LIST-IDML.xslt" 
echo 1list
REM @@@@rem pause

           java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\L35.xml" "%~dp0\ParaNumber\L3.xml" "%~dp0\ParaNumber\35-LIST-IDML.xslt" 
cls
echo L35
REM @@@@rem pause
           java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\L4.xml" "%~dp0\ParaNumber\L35.xml" "%~dp0\ParaNumber\4-LIST-IDML.xslt" 

REM /////////////////////////////////// LIST Conveersion starts here /////////////////////////////////////////////////////////////////////////////////////////////

echo L4
rem REM @@@@rem pause
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\SortByPage.xml" "%~dp0\ParaNumber\L4.xml" "%~dp0\ParaNumber\SortBypage.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\MergedSpreads1.xml" "%~dp0\ParaNumber\SortByPage.xml" "%~dp0\ParaNumber\RemovingDubplicate.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\ccRemoved.xml" "%~dp0\ParaNumber\MergedSpreads1.xml" "%~dp0\ParaNumber\ccRemover.xslt"

REM by RTP
REM #################### Merging Stles.footnotes,etc.. xml 
           java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\Inp2.xml" "%~dp0\ParaNumber\ccRemoved.xml" "%~dp0\ParaNumber\00-MergeIDML.xslt" 
REM #################### Creating HTML tags and CSS 
REM Removing DIV for Figure and Table captions
cls
echo gen2
REM @@@@rem pause

           java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\1.xml" "%~dp0\ParaNumber\Inp2.xml" "%~dp0\ParaNumber\genxhtml2.xslt" 
REM #################### Removing unwanted w: tags here
           java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\2.xml" "%~dp0\ParaNumber\1.xml" "%~dp0\ParaNumber\02-Remove-xmlns-IDML.xslt" 
echo gen 2 finish
REM @@@@rem pause

echo Final
REM @@@@rem pause
pause
REM #################### Convertion for Bookmarks, comments, trackchanges
REM  Moving DIV inside P, to outside P in the below 03 xslt...
              java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\out.xml" "%~dp0\ParaNumber\2.xml" "%~dp0\ParaNumber\03-Final-IDML.xslt" 
echo before 03-FINAL
REM @@@@rem pause
pause
REM in the below XSLT, i moving DIV inside P, to outside P
           java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\out.xhtml" "%~dp0\ParaNumber\out.xml" "%~dp0\ParaNumber\04-Final-IDML.xslt"
java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\ParaNumber\out.xhtml" "%~dp0\ParaNumber\out.xhtml" "%~dp0\ParaNumber\entitize.xsl" 
echo before 04-FINAL
rem pause
       REM java -cp %CP% net.sf.saxon.Transform -o:"%~dp0\Chapter\word\document.xml" "%~dp0\ParaNumber\ccRemoved.xml" "%~dp0\ParaNumber\document.xslt"
       rem copy "%~dp0\ParaNumber\output\*.xml" "%~dp0\replace\"
rem rem rem REM @@@@rem pause
exit /b