@echo off

title IDML TO WORD

cls
echo Processing..

set CP=\\D:\Saxon\saxon9.jar;

java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\1.xml" "%~dp0\ParaNumber\designmap.xml" "%~dp0\ParaNumber\RawMap.xslt"
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\linked.xml" "%~dp0\ParaNumber\Styles.xml" "%~dp0\ParaNumber\LinkingStyles.xslt"
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\Manifest.xml" "%~dp0\ParaNumber\StoryCleanedmap.xml" "%~dp0\ParaNumber\MergeStory.xslt"
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\PnoManifest.xml" "%~dp0\ParaNumber\Manifest.xml" "%~dp0\ParaNumber\ParaNumbering.xslt"
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\splitStory.xml" "%~dp0\ParaNumber\PnoManifest.xml" "%~dp0\ParaNumber\SplitStory.xslt"
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\ReplacingStory.xml" "%~dp0\ParaNumber\splitStory.xml" "%~dp0\ParaNumber\ReplacingStory.xslt"
echo ReplacingStoryTab
rem rem pause
REM ************************************29-12-17; moved <textframe> to its after <paragraphRange> *********************************************************************
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\ReplacingStoryTab.xml" "%~dp0\ParaNumber\ReplacingStory.xml" "%~dp0\ParaNumber\ReplacingStoryTab.xslt"

java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\Table.xml" "%~dp0\ParaNumber\ReplacingStoryTab.xml" "%~dp0\ParaNumber\Table.xslt"
rem rem pause
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\nestedChar.xml" "%~dp0\ParaNumber\Table.xml" "%~dp0\ParaNumber\nestedChar.xslt"
          
           echo now TEST in Table.xml ...
           rem rem pause

java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\SpreadImageLink.xml" "%~dp0\ParaNumber\SpreadCleanedmap.xml" "%~dp0\ParaNumber\SpreadImageLink.xslt"
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\ReplacingSpread.xml" "%~dp0\ParaNumber\SpreadImageLink.xml" "%~dp0\ParaNumber\ReplacingSpread.xslt"
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\textInp.xml" "%~dp0\ParaNumber\ReplacingSpread.xml" "%~dp0\ParaNumber\textInp.xslt"
REM: Check the text frm ID in spread/story
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\styles.xml" "%~dp0\ParaNumber\linked.xml" "%~dp0\ParaNumber\Styles.xslt"
echo styles.xml generated
pause
    REM #################### Converting Drawing,content controls, pict, textboxes etc....
    REM #################### DO NOT CHANGE THIS ORDER 
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\Inp1.xml" "%~dp0\ParaNumber\nestedChar.xml" "%~dp0\ParaNumber\genxhtml-XML.xslt"
cls
echo genxhtml
pause
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\Inp.xml" "%~dp0\ParaNumber\Inp1.xml" "%~dp0\ParaNumber\genxhtml15.xslt"
cls
echo genxhtml 1.5
pause
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\Chapter\word\footnotes.xml" "%~dp0\ParaNumber\nestedChar.xml" "%~dp0\ParaNumber\Footnote.xslt"
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\footnotes.xml" "%~dp0\ParaNumber\nestedChar.xml" "%~dp0\ParaNumber\Footnote.xslt"
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\Chapter\word\comments.xml" "%~dp0\ParaNumber\nestedChar.xml" "%~dp0\ParaNumber\Comments.xslt"
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\comments.xml" "%~dp0\ParaNumber\nestedChar.xml" "%~dp0\ParaNumber\Comments.xslt"

          
REM ######################################################################################## SORTING STARTS #############################################################################################################################
cls
echo SORT STARTS; input textInp.xml
pause
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\textInpSorting.xml" "%~dp0\ParaNumber\textInp.xml" "%~dp0\ParaNumber\textInpSorting.xslt"
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\txtFrmPlacement.xslt" "%~dp0\ParaNumber\textInpSorting.xml" "%~dp0\ParaNumber\textInpPlacement.xslt"
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\txtFrmPlacement.xml" "%~dp0\ParaNumber\textInpSorting.xml" "%~dp0\ParaNumber\txtFrmPlacement.xslt"
cls
echo SORT ENDS; check txtFrmPlacement.xml
pause

REM ######################################################################################## SPREAD PROCESSING END here ##############################################################################################################################


java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\WordTB.xml" "%~dp0\ParaNumber\txtFrmPlacement.xml" "%~dp0\ParaNumber\WordTB.xslt"
REM Inp.xml is using inside WordTB.xslt above

    REM java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\StoryRels.xml" "%~dp0\ParaNumber\Table.xml" "%~dp0\ParaNumber\WordRels_Story.xslt"
    REM java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\Rels.xml" "%~dp0\ParaNumber\textInp.xml" "%~dp0\ParaNumber\WordRels.xslt"
    REM java -cp %CP% net.sf.saxon.Transform -o "%~dp0\Chapter\word\_rels\document.xml.rels" "%~dp0\ParaNumber\Rels.xml" "%~dp0\ParaNumber\RelsLink.xslt"
    REM java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\RelsLink.xml" "%~dp0\ParaNumber\Rels.xml" "%~dp0\ParaNumber\RelsLinkHelper.xslt"

REM ################# In the below i'm removing DIV which is not having the "class" and "data-type="textbox"" #################
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\MergedSpreads.xml" "%~dp0\ParaNumber\WordTB.xml" "%~dp0\ParaNumber\MergeSpread.xslt" 
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\SortBy.xml" "%~dp0\ParaNumber\MergedSpreads.xml" "%~dp0\ParaNumber\SortBy.xslt"

REM /////////////////////////////////// LIST Conveersion starts here /////////////////////////////////////////////////////////////////////////////////////////////
echo LIST conversion
pause
           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\L1.xml" "%~dp0\ParaNumber\SortBy.xml" "%~dp0\ParaNumber\1-LIST-IDML.xslt" 
           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\L1.xml" "%~dp0\ParaNumber\L1.xml" "%~dp0\ParaNumber\15-LIST-IDML.xslt" 
           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\L2.xml" "%~dp0\ParaNumber\L1.xml" "%~dp0\ParaNumber\2-LIST-IDML.xslt" 
           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\L3.xml" "%~dp0\ParaNumber\L2.xml" "%~dp0\ParaNumber\3-LIST-IDML.xslt" 
           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\L35.xml" "%~dp0\ParaNumber\L3.xml" "%~dp0\ParaNumber\35-LIST-IDML.xslt" 
           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\L4.xml" "%~dp0\ParaNumber\L35.xml" "%~dp0\ParaNumber\4-LIST-IDML.xslt" 

REM /////////////////////////////////// LIST Conveersion starts here /////////////////////////////////////////////////////////////////////////////////////////////

echo L4
pause
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\SortByPage.xml" "%~dp0\ParaNumber\L4.xml" "%~dp0\ParaNumber\SortBypage.xslt"
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\MergedSpreads1.xml" "%~dp0\ParaNumber\SortByPage.xml" "%~dp0\ParaNumber\RemovingDubplicate.xslt"
java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\ccRemoved.xml" "%~dp0\ParaNumber\MergedSpreads1.xml" "%~dp0\ParaNumber\ccRemover.xslt"

REM by RTP
REM #################### Merging Stles.footnotes,etc.. xml 
           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\Inp2.xml" "%~dp0\ParaNumber\ccRemoved.xml" "%~dp0\ParaNumber\00-MergeIDML.xslt" 
REM #################### Creating HTML tags and CSS 
REM Removing DIV for Figure and Table captions
           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\1.xml" "%~dp0\ParaNumber\Inp2.xml" "%~dp0\ParaNumber\genxhtml2.xslt" 
REM #################### Removing unwanted w: tags here
           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\2.xml" "%~dp0\ParaNumber\1.xml" "%~dp0\ParaNumber\02-Remove-xmlns-IDML.xslt" 

REM #################### LIST convertions starts
REM echo LIST conversion
REM rem rem pause
REM           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\L1.xml" "%~dp0\ParaNumber\2.xml" "%~dp0\ParaNumber\1-LIST-IDML.xslt" 
REM           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\L1.xml" "%~dp0\ParaNumber\L1.xml" "%~dp0\ParaNumber\15-LIST-IDML.xslt" 
REM           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\L2.xml" "%~dp0\ParaNumber\L1.xml" "%~dp0\ParaNumber\2-LIST-IDML.xslt" 
REM           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\L3.xml" "%~dp0\ParaNumber\L2.xml" "%~dp0\ParaNumber\3-LIST-IDML.xslt" 
REM           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\L35.xml" "%~dp0\ParaNumber\L3.xml" "%~dp0\ParaNumber\35-LIST-IDML.xslt" 
REM           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\L4.xml" "%~dp0\ParaNumber\L35.xml" "%~dp0\ParaNumber\4-LIST-IDML.xslt" 
REM #################### LIST convertions ENDs


REM #################### Convertion for Bookmarks, comments, trackchanges
REM  Moving DIV inside P, to outside P in the below 03 xslt...
              java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\out.xml" "%~dp0\ParaNumber\2.xml" "%~dp0\ParaNumber\03-Final-IDML.xslt" 
REM for /f "delims=" %%F in (' dir /b /s /a-d *.idml') do set filename=%%~nF
REM (
REM ren %~dp0\ParaNumber\out.xml %filename%.xml
REM )
echo before FINAL
pause
REM in the below XSLT, i moving DIV inside P, to outside P
           java -cp %CP% net.sf.saxon.Transform -o "%~dp0\ParaNumber\out.xhtml" "%~dp0\ParaNumber\out.xml" "%~dp0\ParaNumber\04-Final-IDML.xslt" 
echo before FINAL
pause
       REM java -cp %CP% net.sf.saxon.Transform -o "%~dp0\Chapter\word\document.xml" "%~dp0\ParaNumber\ccRemoved.xml" "%~dp0\ParaNumber\document.xslt"
       rem copy "%~dp0\ParaNumber\output\*.xml" "%~dp0\replace\"
rem rem rem pause
exit /b


