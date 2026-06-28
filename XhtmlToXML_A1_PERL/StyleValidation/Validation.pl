use strict;
use warnings;
use Cwd;
use Cwd 'abs_path';
use File::Basename;
use File::Copy;
use POSIX qw(strftime);
use File::BOM qw( :all );
use File::Find;
no warnings;
my $Year1 = strftime "%H%M%S", localtime;
my $Year = strftime "%Y", localtime;

my ($XML_File,$TXT_File,$ART_Name,$Tmp,$FileName,$ENT,$Thin,$Thin1,$Element_File,$Element);

#$TXT_File="/home/pagemajik/Documents/PERL_PostscriptImage/XhtmlToXML_A1_PERL/PONE.111111/Word/pbio.3003095.xhtml";
#$XML_File="/home/pagemajik/Documents/PERL_PostscriptImage/XhtmlToXML_A1_PERL/PONE.111111/Word/pbio.3003095_.xhtml";

$TXT_File=$ARGV[0];
$XML_File=$ARGV[1];


my $File_Path=abs_path($0);

$File_Path=~s{\/style_extract.exe}{}gsi;

$File_Path=~s{\\style_extract.exe}{}gsi;

$File_Path=~s{\/style_extract.pl}{}gsi;

$File_Path=~s{\\Style_extract.pl}{}gsi;

my $Doc_File=$ARGV[0];

my $Source_Dir=$ARGV[2];
my $Client_Name;
my $Journal_Name;
my $Jats;


	$Client_Name="PLOS";
	$Journal_Name="PONE";
	$Jats="jats";
	



open (TXT, $TXT_File) || die "Can't open file '$TXT_File': $!\n";
{ local $/; $_=<TXT>; $Tmp=$_; }
close(TXT);

my $Body_Tmp=$Tmp;



if($Body_Tmp=~m{<body([^\>]*)\>(.*?)<\/body>}gsi)
{
	$Tmp="<body xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\">$2<\/body>";
}

#Cleanup



$Tmp=~s{<div ([^\>]+)\>(.*?)<\/div>}{$2}gsi;

$Tmp=~s{<div ([^\>]+)\>(.*?)<\/div>}{$2}gsi;

$Tmp=&SecLevel($Tmp);

$Tmp=&DelLevel($Tmp);


$Tmp=~s{<del(\d+) ([^\>]+)\>(.*?)<\/del\1>}{}gsi;

$Tmp=~s{<span(\d+) data\-bkmark=\"para([^\"]+)\"></span\1>}{\[para$2\]}gsi;




$Tmp=~s{<li class=\"Reference\"([^\>]+)\>(.*?)<\/li>}{<p class=\"Reference\"$1>$2<\/p>}gsi;


$Tmp=~s{<li class=\"([^\"]+)\" data\-label=\"\†OL(\d+)\"([^\>]*)\>(.*?)<\/li>}{<p class=\"OL$2\">$4<\/p>}gsi;

$Tmp=~s{<ol>(.*?)<\/ol>}{$1}gsi;

$Tmp=~s{class=\"DACorrespondingauthorIndicator\"}{class=\"AffXref\"}gsi;

$Tmp=~s{class=\"CorrespondingauthorIndicator\"}{class=\"AffXref\"}gsi;

$Tmp=~s{class=\"Currentaddress_Indicator\"}{class=\"AffXref\"}gsi;

$Tmp=~s{class=\"DACurrentaddressIndicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{class=\"HeadingNumber\"}{class=\"label\"}gsi;

$Tmp=~s{data\-name=\"DA_Correspondingauthor_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DACurrentaddressIndicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DA_CurrentaddressIndicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"Correspondingauthor_Indicator\"}{data\-name=\"AffXref\"}gsi;



$Tmp=~s{data\-name=\"Deceasedauthor_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DA_Deceasedauthor_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"Equalauthorship_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DA_Equalauthorship_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"Equalcontribution_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"Groupauthorship_Collab_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DA_Groupauthorship_Collab_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DA_Equalcontribution_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"HeadingNumber\"}{data\-name=\"label\"}gsi;

$Tmp=~s{class=\"DA_Equalcontribution_Indicator\"}{class=\"AffXref\"}gsi;


$Tmp=~s{<p ([^\>]+)\>(.*?)<\/p>}{&Para_Style($2,$1)}gesi;



$Tmp=~s{<span7 ([^\>]+)\>(.*?)<\/span7>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span6 ([^\>]+)\>(.*?)<\/span6>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span5 ([^\>]+)\>(.*?)<\/span5>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span4 ([^\>]+)\>(.*?)<\/span4>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span3 ([^\>]+)\>(.*?)<\/span3>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span2 ([^\>]+)\>(.*?)<\/span2>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span1 ([^\>]+)\>(.*?)<\/span1>}{&Character_Style($2,$1)}gesi;

$Tmp=~s{<span7>(.*?)<\/span7>}{$1}gsi;
$Tmp=~s{<span6>(.*?)<\/span6>}{$1}gsi;
$Tmp=~s{<span5>(.*?)<\/span5>}{$1}gsi;
$Tmp=~s{<span4>(.*?)<\/span4>}{$1}gsi;
$Tmp=~s{<span3>(.*?)<\/span3>}{$1}gsi;
$Tmp=~s{<span2>(.*?)<\/span2>}{$1}gsi;
$Tmp=~s{<span1>(.*?)<\/span1>}{$1}gsi;




$Tmp=~s{<ins ([^\>]+)\>(.*?)<\/ins>}{$2}gsi;

$Tmp=~s{<a ([^\>]+)\>(.*?)<\/a>}{$2}gsi;

$Tmp=~s{<a>(.*?)<\/a>}{$1}gsi;

$Tmp=~s{<table ([^\>]+)\>}{<table $1>}gsi;

$Tmp=~s{<\/table>}{<\/table>}gsi;

$Tmp=~s{<commentreference ([^\>]+)\>(.*?)<\/commentreference>}{}gsi;

#$Tmp=~s{<(\w[^\>]+)\>\[para([^\>]+)\]}{<para$2><$1>}gsi;

$Tmp=~s{<mark ([^\>]+)\>(.*?)<\/mark>}{$2}gsi;

$Tmp=~s{\&\#x200C\;}{}gsi;

print $Tmp."\n";

$Tmp=~s{(.*?)<body>}{<body>}gsi;




#$Tmp=~s{\[para([^\>]+)\]}{}gsi;



#$Tmp=~s{(<w\:bookmarkStart w\:id=\"([^\"]+)\" w\:name=\"para([^\"]+)\"(.*?)<w\:t>)}{$1\[Supppara$3\]}gsi;

#$Tmp=~s{(<w\:bookmarkStart w\:id=\"([^\"]+)\" w\:name=\"para([^\"]+)\"(.*?)<w\:t ([^\>]+)\>)}{$1\[Supppara$3\]}gsi;

$Tmp=~s{\n{1,}}{\n}gsi;

$Tmp=~s{ {1,}}{ }gsi;


open (XML, ">$XML_File") || die "Can't create XML file '$XML_File': $!\n";
{
 
       
    print XML $Tmp;
}
close(XML);

my $File_Path=abs_path($0);

my $Journal;

if($ARGV[0]=~m{\\OUP\_Journals\-L\\Production\\(\w+)}gsi)
{
	$Journal=$1;
}

if($ARGV[0]=~m{\\Data_OUPJOURNALS\\Production\\(\w+)}gsi)
{
	$Journal=$1;
}


if($ARGV[0]=~m{\\JData\\LWW\\PRINT\\JAWS\\(\w+)}gsi)
{
	$Journal=$1;
}

if($ARGV[0]=~m{\\LWW\\Production\\(\w+)}gsi)
{
	$Journal=$1;
}

if($ARGV[0]=~m{\\\\j-fs03\\JData_NEW\\LWW\\PRINT\\JAWS\\(.*?)\\}gsi)
{
	$Journal=$1;
}


$Journal="PONE";


$File_Path=~s{\/Style_conversion.exe}{}si;

$File_Path=~s{\\Style_conversion.exe}{}si;

$File_Path=~s{\/Style_conversion.pl}{}si;

$File_Path=~s{\\Style_conversion.pl}{}si;

$File_Path=~s{\/}{\\}gsi;

$TXT_File=$ARGV[1];

my $Log_File=$ARGV[1];

$Log_File=~s{\.xhtml}{\.log}gsi;






#my $DTD_Element="\\\\j-fs01\\OUP_Journals-L\\Production\\01_Tools\\Jaws_Conversion\\Style_Validation\\Elements.ini";

my $DTD_Element=$ARGV[1];


open(DTD,$DTD_Element) || die "Can't open file '$DTD_Element': $!\n";
{ local $/; $_=<DTD>; $Element=$_; }

close(DTD);

my @Element_array=split("\n",$Element);

open(DTD,$DTD_Element) || die "Can't open file '$DTD_Element': $!\n";
{ local $/; $_=<DTD>; $Element=$_; }

close(DTD);


my $S_ARGV=$ARGV[0];

my $Art_Type;



if($S_ARGV=~m{(OUP\_Journals\-L|Data_OUPJOURNALS)}gsi)
{



my $Subject_Types="\\\\j-fs01\\OUP_Journals-L\\Production\\01_Tools\\Jaws_Conversion\\Style_validation.ini";

if(-e "$Subject_Types")
{

open(DTD,$Subject_Types) || die "Can't open file '$Subject_Types': $!\n";
{ local $/; $_=<DTD>; $Art_Type=$_; }

close(DTD);
}

}

elsif($S_ARGV=~m{\\LWW}gsi)
{



my $Subject_Types="\\\\j-fs02\\JData\\LWW\\PRINT\\JAWS\\01_TOOLS\\Jaws_Conversion\\Style_validation.ini";

open(DTD,$Subject_Types) || die "Can't open file '$Subject_Types': $!\n";
{ local $/; $_=<DTD>; $Art_Type=$_; }

close(DTD);
}





#$Log_File=~s{\\word}{\\XML}gsi;

open (TXT, $TXT_File) || die "Can't open file '$TXT_File': $!\n";
{ local $/; $_=<TXT>; $Tmp=$_; }
close(TXT);




$Tmp=~s{<br ([^\>]+)\>}{<br\/>}gsi;
$Tmp=~s{<br\/>}{\n}gsi;


$Tmp=~s{\"\&\#x2020;}{\"}gsi;

$Tmp=~s{\"\&\#x2021;}{\"}gsi;

$Tmp=~s{<\&\#x2020;}{<}gsi;

$Tmp=~s{<\&\#x2021;}{<}gsi;

$Tmp=~s{<\/\&\#x2020;}{<\/}gsi;

$Tmp=~s{<\/\&\#x2021;}{<\/}gsi;

$Tmp=~s{<\?xml ([^\>]+)\>\n*}{}gsi;

$Tmp=~s{<body ([^\>]+)\>\n*}{}gsi;

$Tmp=~s{<\/body>}{}gsi;

$Tmp=~s{<tab\/>}{ }gsi;

$Tmp=~s{<\/del><del>}{}gsi;

$Tmp=~s{(<([^\>]+)\><del>(.*?)<\/del><\/\2>)}{&Delete_Para($1)}gesi;

$Tmp=~s{\n{1,}}{\n}gsi;

$Tmp=~s{<affxrefonline>(.*?)<\/affxrefonline>}{<AffXref>$1<\/AffXref>}gsi;

$Tmp=~s{<Hyperlink>(.*?)<\/Hyperlink>}{$1}gsi;

$Tmp=~s{<extension>(.*?)<\/extension>}{$1}gsi;




$Tmp=~s{<del>(.*?)<\/del>}{}gsi;

$Tmp=~s{<del1>(.*?)<\/del1>}{}gsi;

$Tmp=~s{<del\/>}{}gsi;

$Tmp=~s{\[\[\[ins\]\]\]}{<ins>}gsi;

$Tmp=~s{\[\[\[\/ins\]\]\]}{<\/ins>}gsi;

$Tmp=~s{<b>}{<bold>}gsi;

$Tmp=~s{<u>}{<underline>}gsi;

$Tmp=~s{<i>}{<italic>}gsi;

$Tmp=~s{<b ([^\>]+)\>}{<bold>}gsi;

$Tmp=~s{<u ([^\>]+)\>}{<underline>}gsi;

$Tmp=~s{<sup ([^\>]+)\>}{<sup>}gsi;

$Tmp=~s{<sub ([^\>]+)\>}{<sub>}gsi;

$Tmp=~s{<i ([^\>]+)\>}{<italic>}gsi;

$Tmp=~s{<\/b>}{<\/bold>}gsi;

$Tmp=~s{<\/u>}{<\/underline>}gsi;

$Tmp=~s{<\/i>}{<\/italic>}gsi;

$Tmp=~s{<ins>(.*?)<\/ins>}{$1}gsi;

$Tmp=~s{<ins ([^\>]+)\>(.*?)<\/ins>}{$2}gsi;

$Tmp=~s{<ins\/>}{}gsi;

$Tmp=~s{<rule ([^\>]+)\>}{}gsi;

$Tmp=~s{<\/rule>}{}gsi;

$Tmp=~s{<review ([^\>]+)\>}{}gsi;

$Tmp=~s{<\/review>}{}gsi;

$Tmp=~s{<CJKCharacters>}{}gsi;

$Tmp=~s{<\/CJKCharacters>}{}gsi;



$Tmp=~s{<mark ([^\>]+)\>(.*?)<\/mark>}{$2}gsi;

$Tmp=~s{<mark>(.*?)<\/mark>}{$1}gsi;

$Tmp=~s{<Math>(.*?)<\/Math>}{}gsi;

$Tmp=~s{<Math ([^\>]+)\>(.*?)<\/Math>}{}gsi;

$Tmp=~s{<Math([^\>]+)\>(.*?)<\/Math\1>}{}gsi;

$Tmp=~s{<GreekCharacters>(.*?)<\/GreekCharacters>}{$1}gsi;

$Tmp=~s{<figurepart>(.*?)<\/figurepart>}{$1}gsi;

$Tmp=~s{<img ([^\>]+)\>}{}gsi;


$Tmp=~s{<figxrefc>}{<figxref>}gsi;

$Tmp=~s{<\/figxrefc>}{<\/figxref>}gsi;

$Tmp=~s{<tabxrefc>}{<tabxref>}gsi;

$Tmp=~s{<\/tabxrefc>}{<\/tabxref>}gsi;

$Tmp=~s{\&\#xA0;}{ }gsi;

$Tmp=~s{\&\#x(\w\w)\;}{\&\#x00$1;}gsi;

$Tmp=~s{\&\#x(\w)\;}{\&\#x000$1;}gsi;







$Tmp=~s{<table frame="all" orient="port"/>\n<tgroup colsep="0" rowsep="1" cols="2"/>\n<colspec ([^\>]+)\>\n<colspec ([^\>]+)\>\n<tbody>\n<row>\n<entry ([^\>]+)\><NormalWeb><bold>Full affiliations</bold>(.*?)$}{}gsi;

$Tmp=~s{<NormalWeb><bold>Full affiliations</bold>(.*?)$}{}gsi;

$Tmp=~s{<DACorrespondingauthorIndicator>(.*?)<\/DACorrespondingauthorIndicator>}{<affxref>$1<\/affxref>}gsi;

$Tmp=~s{<CurrentaddressIndicator>(.*?)<\/CurrentaddressIndicator>}{<affxref>$1<\/affxref>}gsi;

$Tmp=~s{<CorrespondingauthorIndicator>(.*?)<\/CorrespondingauthorIndicator>}{<affxref>$1<\/affxref>}gsi;

$Tmp=~s{<figure>(.*?)<\/figure>}{$1}gsi;



$Tmp=~s{<figurecitation>(.*?)<\/figurecitation>}{$1}gsi;

$Tmp=~s{<italicsuperscript>(.*?)<\/italicsuperscript>}{$1}gsi;

$Tmp=~s{<allcaps>(.*?)<\/allcaps>}{$1}gsi;

$Tmp=~s{<font ([^\>]+)\>(.*?)<\/font>}{$2}gsi;



$Tmp=~s{<figcaption ([^\>]+)\>(.*?)<\/figcaption>}{<figurecaption>$2<\/figurecaption>}gsi;

$Tmp=~s{<figureCaption>\n*\[([^\>]+)\]}{\[$1\]<figureCaption>}gsi;


#$Tmp=~s{<li ([^\>]+)\>(.*?)<\/li>}{<p $1>$2<\/p>}gsi;

$Tmp=~s{<li class=\"Reference([^\>]+)\>(.*?)<\/li>}{<Reference>$2<\/Reference>}gsi;

$Tmp=~s{<li class=\"\†Reference([^\>]+)\>(.*?)<\/li>}{<Reference>$2<\/Reference>}gsi;

$Tmp=~s{<li data\-alias=\"Reference([^\>]+)\>(.*?)<\/li>}{<Reference>$2<\/Reference>}gsi;

$Tmp=~s{<li class=\"Heading([^\>]+)\>(.*?)<\/li>}{$2}gsi;



$Tmp=~s{<tr>(.*?)<\/tr>}{$1}gsi;

$Tmp=~s{<tr ([^\>]+)\>(.*?)<\/tr>}{$2}gsi;

$Tmp=~s{<td ([^\>]+)\>(.*?)<\/td>}{$2}gsi;

$Tmp=~s{<table ([^\>]+)\>(.*?)<\/table>}{$2}gsi;

$Tmp=~s{<tbody ([^\>]+)\>(.*?)<\/tbody>}{$2}gsi;

$Tmp=~s{<colgroup ([^\>]+)\>(.*?)<\/colgroup>}{}gsi;

$Tmp=~s{<ItalicSubscript>(.*?)<\/ItalicSubscript>}{$1}gsi;

$Tmp=~s{<Subscript>(.*?)<\/Subscript>}{$1}gsi;

$Tmp=~s{<url> }{<url>}gsi;

$Tmp=~s{<refurl> }{<refurl>}gsi;


$Tmp=~s{ <\/url>}{<\/url>}gsi;

$Tmp=~s{<\/refurl>}{<\/refurl>}gsi;


$Tmp=~s{(\n<Abbreviation>(.*?)<\/Abbreviation>)}{&Abbreviation($1)}ges;

$Tmp=~s{\&\#xA0;}{ }gsi;





$Tmp=~s{<(AbstractHeading|Acknowledgements|AcronymHead|allcaps|ArabicCharacters|AuthorSummary|boldallcaps|boldHLC|bolditalicHLC|bolditalics|bolditalicunderlineHLC|boldsmallcaps|boldstrikethrough|boldsubscript|boldsuperscript|BoxPMI|ChapterNumber|ChapterWord|CherokeeCharacters|Cited|CJK_Characters|DocumentAuthor|Document_Author_Suffix|Editor|EgyptianCopticCharacters|EquationName|EthicalApproval|ExhibitCitation|ExhibitNumber|ExhibitPMI|ExternalBoxCitation|ExternalExhibitCitation|ExternalFigCitation|ExternalImageCitation|ExternalMultiBoxCitation|ExternalMultiExhibitCitation|ExternalMulti|FigureCitation|ExternalMultiImageCitation|ExternalMultiPhotoCitation|ExternalMultiSchemeCitation|ExternalMultiStructureCitation|ExternalMultiTableCitation|ExternalPhotoCitation|ExternalSchemeCitation|ExternalStructureCitation|ExternalSupplFigureCitation|ExternalSupplMultiFigureCitation|ExternalSupplMultiTableCitation|ExternalSupplTableCitation|ExternalTableCitation|Fax_Format|FigurePMI|GreekCharacters|HeadingNumber|HebrewCharacters|Ibid|IllustrationCitation|IllustrationNumber|Illustration_PMI|ImageCitation|ImageNumber|ImagePMI|InPress|InternetResource|italicallcaps|italicHLC|italicsmallcaps|italicstrikethrough|italicsubscript|italicsuperscript|italicunderlineHLC|KeyTermHead|LearnObjHeading|LongDash|Malayalam_Characters|ManualBodyList|MapCitation|MapNumber|MapPMI|Math|MathB|MathBI|MathBISub|MathBISup|MathBSub|MathBSup|MathI|MathISub|MathISup|MathSub|MathSup|MN|MovieCitation|MovieNumber|MoviePMI|OthersTitle|PartNumber|PartWord|PhotoCitation|PhotoNumber|PhotoPMI|PresentationTitle|Publication_Number|QuestionNumber|Retraction|Retrieved_Date|RunningHead|SchemeCitation|SchemeNumber|SchemePMI|SectionNumber|SectionWord|ShortTitleHead|singleunderline|SocialMediaReferenceTitle|strikethrough|StructureCitation|StructureNumber|StructurePMI|sub|sup|SupplBoxCitation|SupplBoxNumber|SupplExhibitCitation|SupplExhibitNumber|SupplIllustrationCitation|SupplIllustrationNumber|SupplImageCitation|SupplImageNumber|SupplMovieNumber|SupplMultiBoxCitation|SupplMultiExhibitCitation|SupplMultiFigureCitation|SupplMultiIllustrationCitation|SupplMultiImageCitation|SupplMultiMovieCitation|SupplMultiPhotoCitation|SupplMultiSchemeCitation|SupplMultiStructureCitation|SupplMultiTableCitation|SupplPhotoCitation|SupplPhotoNumber|SupplSchemeCitation|SupplSchemeNumber|SupplStructureCitation|SupplStructureNumber|Symbol|SymbolB|SymbolBI|SymbolBISub|SymbolBISup|SymbolBSub|SymbolBSup|SymbolI|SymbolISub|SymbolISup|SymbolSub|SymbolSup|TablePMI|Tag|Time|TitleHead|TrialRegistration|underlineboldHLC|underlineHLC|UnfigCaption|UnFigurePMI|UnitNumber|UnitWord|Untag|Updated|subscript|figurepart|SupplMaterialCitation|TableCitation|BulletManualBodyList|AbbreviationExpansion|abbreviation|FigureCitation)>}{}gsi;

$Tmp=~s{<\/(AbstractHeading|Acknowledgements|AcronymHead|allcaps|ArabicCharacters|AuthorSummary|boldallcaps|boldHLC|bolditalicHLC|bolditalics|bolditalicunderlineHLC|boldsmallcaps|boldstrikethrough|boldsubscript|boldsuperscript|BoxPMI|ChapterNumber|ChapterWord|CherokeeCharacters|Cited|CJK_Characters|DocumentAuthor|Document_Author_Suffix|Editor|EgyptianCopticCharacters|EquationName|EthicalApproval|ExhibitCitation|ExhibitNumber|ExhibitPMI|ExternalBoxCitation|ExternalExhibitCitation|ExternalFigCitation|ExternalImageCitation|ExternalMultiBoxCitation|ExternalMultiExhibitCitation|ExternalMultiFigureCitation|ExternalMultiImageCitation|ExternalMultiPhotoCitation|ExternalMultiSchemeCitation|ExternalMultiStructureCitation|ExternalMultiTableCitation|ExternalPhotoCitation|ExternalSchemeCitation|ExternalStructureCitation|ExternalSupplFigureCitation|ExternalSupplMultiFigureCitation|ExternalSupplMultiTableCitation|ExternalSupplTableCitation|ExternalTableCitation|Fax_Format|FigurePMI|GreekCharacters|HeadingNumber|HebrewCharacters|Ibid|IllustrationCitation|IllustrationNumber|Illustration_PMI|ImageCitation|ImageNumber|ImagePMI|InPress|InternetResource|italicallcaps|italicHLC|italicsmallcaps|italicstrikethrough|italicsubscript|italicsuperscript|italicunderlineHLC|KeyTermHead|LearnObjHeading|LongDash|Malayalam_Characters|ManualBodyList|MapCitation|MapNumber|MapPMI|Math|MathB|MathBI|MathBISub|MathBISup|MathBSub|MathBSup|MathI|MathISub|MathISup|MathSub|MathSup|MN|MovieCitation|MovieNumber|MoviePMI|OthersTitle|PartNumber|PartWord|PhotoCitation|PhotoNumber|PhotoPMI|PresentationTitle|Publication_Number|QuestionNumber|Retraction|Retrieved_Date|RunningHead|SchemeCitation|SchemeNumber|SchemePMI|SectionNumber|SectionWord|ShortTitleHead|singleunderline|SocialMediaReferenceTitle|strikethrough|StructureCitation|StructureNumber|StructurePMI|sub|sup|SupplBoxCitation|SupplBoxNumber|SupplExhibitCitation|SupplExhibitNumber|SupplIllustrationCitation|SupplIllustrationNumber|SupplImageCitation|SupplImageNumber|SupplMovieNumber|SupplMultiBoxCitation|SupplMultiExhibitCitation|SupplMultiFigureCitation|SupplMultiIllustrationCitation|SupplMultiImageCitation|SupplMultiMovieCitation|SupplMultiPhotoCitation|SupplMultiSchemeCitation|SupplMultiStructureCitation|SupplMultiTableCitation|SupplPhotoCitation|SupplPhotoNumber|SupplSchemeCitation|SupplSchemeNumber|SupplStructureCitation|SupplStructureNumber|Symbol|SymbolB|SymbolBI|SymbolBISub|SymbolBISup|SymbolBSub|SymbolBSup|SymbolI|SymbolISub|SymbolISup|SymbolSub|SymbolSup|TablePMI|Tag|Time|TitleHead|TrialRegistration|underlineboldHLC|underlineHLC|UnfigCaption|UnFigurePMI|UnitNumber|UnitWord|Untag|Updated|subscript|figurepart|SupplMaterialCitation|TableCitation|AbbreviationExpansion|abbreviation|BulletManualBodyList|AbbreviationExpansion|abbreviation|FigureCitation)>}{}gsi;


$Tmp=~s{<(AbstractHeading|Acknowledgements|AcronymHead|allcaps|ArabicCharacters|AuthorSummary|boldallcaps|boldHLC|bolditalicHLC|bolditalics|bolditalicunderlineHLC|boldsmallcaps|boldstrikethrough|boldsubscript|boldsuperscript|BoxPMI|ChapterNumber|ChapterWord|CherokeeCharacters|Cited|CJK_Characters|DocumentAuthor|Document_Author_Suffix|Editor|EgyptianCopticCharacters|EquationName|EthicalApproval|ExhibitCitation|ExhibitNumber|ExhibitPMI|ExternalBoxCitation|ExternalExhibitCitation|ExternalFigCitation|ExternalImageCitation|ExternalMultiBoxCitation|ExternalMultiExhibitCitation|ExternalMultiFigureCitation|ExternalMultiImageCitation|ExternalMultiPhotoCitation|ExternalMultiSchemeCitation|ExternalMultiStructureCitation|ExternalMultiTableCitation|ExternalPhotoCitation|ExternalSchemeCitation|ExternalStructureCitation|ExternalSupplFigureCitation|ExternalSupplMultiFigureCitation|ExternalSupplMultiTableCitation|ExternalSupplTableCitation|ExternalTableCitation|Fax_Format|FigurePMI|GreekCharacters|HeadingNumber|HebrewCharacters|Ibid|IllustrationCitation|IllustrationNumber|Illustration_PMI|ImageCitation|ImageNumber|ImagePMI|InPress|InternetResource|italicallcaps|italicHLC|italicsmallcaps|italicstrikethrough|italicsubscript|italicsuperscript|italicunderlineHLC|KeyTermHead|LearnObjHeading|LongDash|Malayalam_Characters|ManualBodyList|MapCitation|MapNumber|MapPMI|Math|MathB|MathBI|MathBISub|MathBISup|MathBSub|MathBSup|MathI|MathISub|MathISup|MathSub|MathSup|MN|MovieCitation|MovieNumber|MoviePMI|OthersTitle|PartNumber|PartWord|PhotoCitation|PhotoNumber|PhotoPMI|PresentationTitle|Publication_Number|QuestionNumber|Retraction|Retrieved_Date|RunningHead|SchemeCitation|SchemeNumber|SchemePMI|SectionNumber|SectionWord|ShortTitleHead|singleunderline|SocialMediaReferenceTitle|strikethrough|StructureCitation|StructureNumber|StructurePMI|sub|sup|SupplBoxCitation|SupplBoxNumber|SupplExhibitCitation|SupplExhibitNumber|SupplIllustrationCitation|SupplIllustrationNumber|SupplImageCitation|SupplImageNumber|SupplMovieNumber|SupplMultiBoxCitation|SupplMultiExhibitCitation|SupplMultiFigureCitation|SupplMultiIllustrationCitation|SupplMultiImageCitation|SupplMultiMovieCitation|SupplMultiPhotoCitation|SupplMultiSchemeCitation|SupplMultiStructureCitation|SupplMultiTableCitation|SupplPhotoCitation|SupplPhotoNumber|SupplSchemeCitation|SupplSchemeNumber|SupplStructureCitation|SupplStructureNumber|Symbol|SymbolB|SymbolBI|SymbolBISub|SymbolBISup|SymbolBSub|SymbolBSup|SymbolI|SymbolISub|SymbolISup|SymbolSub|SymbolSup|TablePMI|Tag|Time|TitleHead|TrialRegistration|underlineboldHLC|underlineHLC|UnfigCaption|UnFigurePMI|UnitNumber|UnitWord|Untag|Updated|subscript|figurepart|SupplMaterialCitation|TableCitation|BulletManualBodyList|AbbreviationExpansion|abbreviation|FigureCitation)\/>}{}gsi;



$Tmp=~s{<cegAbbreviationExpansion>}{<AbbreviationExpansion>}gsi;

$Tmp=~s{<\/cegAbbreviationExpansion>}{<\/AbbreviationExpansion>}gsi;

$Tmp=~s{<cegAbbreviation>}{<Abbreviation>}gsi;

$Tmp=~s{<\/cegAbbreviation>}{<\/Abbreviation>}gsi;

$Tmp=~s{<refnumber>\[(\d+)\]}{<refnumber>$1}gsi;



$Tmp=~s{\<(\w)([^\>]+)\>\[(para\w+)\]}{<$3><$1$2>}gsi;

$Tmp=~s{\<(\w)([^\>]+)\>\[(para\w+)\_(\w+)\]}{<$3\_$4><$1$2>}gsi;

$Tmp=~s{\[(\w+)\]<\/(\w)([^\>]+)\>}{<\/$2$3>}gsi;

$Tmp=~s{\[(\w+)\_(\w+)\]<\/(\w)([^\>]+)\>}{<\/$3$4>}gsi;

$Tmp=~s{\<(\w)([^\>]+)\>\[(para\w+)\]}{<$1$2>}gsi;

$Tmp=~s{\<(\w)([^\>]+)\><para(\w+)\_(\w+)>}{<para$3\_$4><$1$2>}gsi;

$Tmp=~s{\<(\w)([^\>]+)\><para(\w+)\_(\w+)>}{<para$3\_$4><$1$2>}gsi;


$Tmp=~s{<para(\w+)\_(\w+)><\/(\w)([^\>]+)\>}{<\/$3$4>}gsi;




my $Ref_no=$Tmp;


my $Tab_Tmp=$Tmp;



$Tmp=~s{<table frame=\"(\w+)\" orient=\"port\"\/>(.*?)<table\/>}{&Table($2)}gesi;

$Tmp=~s{\n{1,}}{\n}gsi;

my $Line_Count="1";
my $Para_Count="1";



$Tmp=~s{^(.*?)$}{&CleanUp($1)}gesi;



$Tmp=~s{<normal\/>\n}{}gsi;

$Tmp=~s{<normal>(\s?)<\/normal>\n$}{}gsi;







my @Line=split("\n",$Tmp);



my @Lines;



foreach my $Value(@Line)
{
	#$Value="<$Para_Count>$Value";

	$Value="$Value";

	push(@Lines,"$Value");

	$Para_Count++;
}


my $Final_Line=join("\n",@Lines);


$Tmp=$Final_Line;



my $Equ_Tmp=$Tmp;

my $Equ_Tmp1=$Tmp;

my $Equ_Tmp2=$Tmp;

my $Equ_Tmp3=$Tmp;

my $Equ_Tmp4=$Tmp;

$Tmp=~s{<object\/>}{}gsi;

my $Ref_Tmp=$Tmp;

my $Bib_Xref_Tmp=$Tmp;

my $Online_Bib_Xref_Tmp=$Tmp;

my $Online_Bib_Xref_Tmp1=$Tmp;

my $Fig_Xref_Tmp=$Tmp;

my $Tab_Xref_Tmp=$Tmp;

my $Entity_Tmp=$Tmp;

my $Bi_Tmp=$Tmp;


$Tmp=~s{<err ([^\>]+)\>}{}gsi;


#$Tmp=~s{<BibXrefonline\/>}{}gsi;

#$Tmp=~s{<BibXrefonline>}{}gsi;

#$Tmp=~s{<\/BibXrefonline>}{}gsi;

#$Tmp=~s{<OnlineBibxref\/>}{}gsi;

$Tmp=~s{<OnlineBibxref>}{}gsi;

$Tmp=~s{<\/OnlineBibxref>}{}gsi;





my $Citation_Tmp=$Tmp;



$Tmp=~s{<citationref\/>}{}gsi;

$Tmp=~s{<citationref>(.*?)<\/citationref>}{}gsi;





$Tmp=~s{<(\d+)><([^\>]+)\>(.*?)<\/\2>}{\[$1\]\[$2\]$3\[\/$2\]}gsi;

$Tmp=~s{<(\d+)><(\w+)\/>\n}{\[$1\]\[$2\/\]\n}gsi;




foreach my $E_tag(@Element_array)
{

	
	$Tmp=~s{<$E_tag>}{<\$E_tag>}gsi;
	$Tmp=~s{<$E_tag ([^\>]*)\>}{<\$E_tag $1>}gsi;
	$Tmp=~s{<\/$E_tag>}{<\/\$E_tag>}gsi;
	$Tmp=~s{<$E_tag\/>}{<\$E_tag\/>}gsi;
	
}


my $Err="0";

my $Math_Tmp=$Tmp;







$Tmp=~s{<math\/>}{}gsi;


#$Tmp=~s{<CommentReference(\d+)>}{<\CommentReference$1\/>}gsi;
#$Tmp=~s{<CommentReference\/>}{<\CommentReference\/>}gsi;
#$Tmp=~s{<CommentReference(\d+)/>}{<\CommentReference$1\/>}gsi;

#$Tmp=~s{(\<(\w+)([^\>]*)\>)<\bold>}{$1}gsi;
#$Tmp=~s{<\/\bold>(\<\/(\w+)([^\>]*)\>)}{$1}gsi;

#$Tmp=~s{(\<(\w+)([^\>]*)\>)<\italic>}{$1}gsi;
#$Tmp=~s{<\/\italic>(\<\/(\w+)([^\>]*)\>)}{$1}gsi;



#$Tmp=~s{\<(\w+)([^\>]*)\>}{}gsi;
#$Tmp=~s{\<\/(\w+)([^\>]*)\>}{}gsi;


$Tmp=~s{\<\}{<}gsi;
$Tmp=~s{\<\/\}{<\/}gsi;

$Tmp=~s{\[(\d+)\]\[([^\]]+)\](.*?)\[\/\2\]}{<$1><$2>$3<\/$2>}gsi;
$Tmp=~s{\[(\d+)\]\[([^\]]+)\]\n}{<$1><$2>\n}gsi;



$Tmp=~s{<(AbstractHeading|Acknowledgements|AcronymHead|allcaps|ArabicCharacters|AuthorSummary|boldallcaps|boldHLC|bolditalicHLC|bolditalics|bolditalicunderlineHLC|boldsmallcaps|boldstrikethrough|boldsubscript|boldsuperscript|BoxPMI|ChapterNumber|ChapterWord|CherokeeCharacters|Cited|CJK_Characters|DocumentAuthor|Document_Author_Suffix|Editor|EgyptianCopticCharacters|EquationName|EthicalApproval|ExhibitCitation|ExhibitNumber|ExhibitPMI|ExternalBoxCitation|ExternalExhibitCitation|ExternalFigCitation|ExternalImageCitation|ExternalMultiBoxCitation|ExternalMultiExhibitCitation|ExternalMultiFigureCitation|ExternalMultiImageCitation|ExternalMultiPhotoCitation|ExternalMultiSchemeCitation|ExternalMultiStructureCitation|ExternalMultiTableCitation|ExternalPhotoCitation|ExternalSchemeCitation|ExternalStructureCitation|ExternalSupplFigureCitation|ExternalSupplMultiFigureCitation|ExternalSupplMultiTableCitation|ExternalSupplTableCitation|ExternalTableCitation|Fax_Format|FigurePMI|GreekCharacters|HeadingNumber|HebrewCharacters|Ibid|IllustrationCitation|IllustrationNumber|Illustration_PMI|ImageCitation|ImageNumber|ImagePMI|InPress|InternetResource|italicallcaps|italicHLC|italicsmallcaps|italicstrikethrough|italicsubscript|italicsuperscript|italicunderlineHLC|KeyTermHead|LearnObjHeading|LongDash|Malayalam_Characters|ManualBodyList|MapCitation|MapNumber|MapPMI|Math|MathB|MathBI|MathBISub|MathBISup|MathBSub|MathBSup|MathI|MathISub|MathISup|MathSub|MathSup|MN|MovieCitation|MovieNumber|MoviePMI|OthersTitle|PartNumber|PartWord|PhotoCitation|PhotoNumber|PhotoPMI|PresentationTitle|Publication_Number|QuestionNumber|Retraction|Retrieved_Date|RunningHead|SchemeCitation|SchemeNumber|SchemePMI|SectionNumber|SectionWord|ShortTitleHead|singleunderline|SocialMediaReferenceTitle|strikethrough|StructureCitation|StructureNumber|StructurePMI|sub|sup|SupplBoxCitation|SupplBoxNumber|SupplExhibitCitation|SupplExhibitNumber|SupplIllustrationCitation|SupplIllustrationNumber|SupplImageCitation|SupplImageNumber|SupplMovieNumber|SupplMultiBoxCitation|SupplMultiExhibitCitation|SupplMultiFigureCitation|SupplMultiIllustrationCitation|SupplMultiImageCitation|SupplMultiMovieCitation|SupplMultiPhotoCitation|SupplMultiSchemeCitation|SupplMultiStructureCitation|SupplMultiTableCitation|SupplPhotoCitation|SupplPhotoNumber|SupplSchemeCitation|SupplSchemeNumber|SupplStructureCitation|SupplStructureNumber|Symbol|SymbolB|SymbolBI|SymbolBISub|SymbolBISup|SymbolBSub|SymbolBSup|SymbolI|SymbolISub|SymbolISup|SymbolSub|SymbolSup|TablePMI|Tag|Time|TitleHead|TrialRegistration|underlineboldHLC|underlineHLC|UnfigCaption|UnFigurePMI|UnitNumber|UnitWord|Untag|Updated|subscript|figurepart)>}{}gsi;

$Tmp=~s{<\/(AbstractHeading|Acknowledgements|AcronymHead|allcaps|ArabicCharacters|AuthorSummary|boldallcaps|boldHLC|bolditalicHLC|bolditalics|bolditalicunderlineHLC|boldsmallcaps|boldstrikethrough|boldsubscript|boldsuperscript|BoxPMI|ChapterNumber|ChapterWord|CherokeeCharacters|Cited|CJK_Characters|DocumentAuthor|Document_Author_Suffix|Editor|EgyptianCopticCharacters|EquationName|EthicalApproval|ExhibitCitation|ExhibitNumber|ExhibitPMI|ExternalBoxCitation|ExternalExhibitCitation|ExternalFigCitation|ExternalImageCitation|ExternalMultiBoxCitation|ExternalMultiExhibitCitation|ExternalMultiFigureCitation|ExternalMultiImageCitation|ExternalMultiPhotoCitation|ExternalMultiSchemeCitation|ExternalMultiStructureCitation|ExternalMultiTableCitation|ExternalPhotoCitation|ExternalSchemeCitation|ExternalStructureCitation|ExternalSupplFigureCitation|ExternalSupplMultiFigureCitation|ExternalSupplMultiTableCitation|ExternalSupplTableCitation|ExternalTableCitation|Fax_Format|FigurePMI|GreekCharacters|HeadingNumber|HebrewCharacters|Ibid|IllustrationCitation|IllustrationNumber|Illustration_PMI|ImageCitation|ImageNumber|ImagePMI|InPress|InternetResource|italicallcaps|italicHLC|italicsmallcaps|italicstrikethrough|italicsubscript|italicsuperscript|italicunderlineHLC|KeyTermHead|LearnObjHeading|LongDash|Malayalam_Characters|ManualBodyList|MapCitation|MapNumber|MapPMI|Math|MathB|MathBI|MathBISub|MathBISup|MathBSub|MathBSup|MathI|MathISub|MathISup|MathSub|MathSup|MN|MovieCitation|MovieNumber|MoviePMI|OthersTitle|PartNumber|PartWord|PhotoCitation|PhotoNumber|PhotoPMI|PresentationTitle|Publication_Number|QuestionNumber|Retraction|Retrieved_Date|RunningHead|SchemeCitation|SchemeNumber|SchemePMI|SectionNumber|SectionWord|ShortTitleHead|singleunderline|SocialMediaReferenceTitle|strikethrough|StructureCitation|StructureNumber|StructurePMI|sub|sup|SupplBoxCitation|SupplBoxNumber|SupplExhibitCitation|SupplExhibitNumber|SupplIllustrationCitation|SupplIllustrationNumber|SupplImageCitation|SupplImageNumber|SupplMovieNumber|SupplMultiBoxCitation|SupplMultiExhibitCitation|SupplMultiFigureCitation|SupplMultiIllustrationCitation|SupplMultiImageCitation|SupplMultiMovieCitation|SupplMultiPhotoCitation|SupplMultiSchemeCitation|SupplMultiStructureCitation|SupplMultiTableCitation|SupplPhotoCitation|SupplPhotoNumber|SupplSchemeCitation|SupplSchemeNumber|SupplStructureCitation|SupplStructureNumber|Symbol|SymbolB|SymbolBI|SymbolBISub|SymbolBISup|SymbolBSub|SymbolBSup|SymbolI|SymbolISub|SymbolISup|SymbolSub|SymbolSup|TablePMI|Tag|Time|TitleHead|TrialRegistration|underlineboldHLC|underlineHLC|UnfigCaption|UnFigurePMI|UnitNumber|UnitWord|Untag|Updated|subscript|figurepart)>}{}gsi;

$Tmp=~s{<(AbstractHeading|Acknowledgements|AcronymHead|allcaps|ArabicCharacters|AuthorSummary|boldallcaps|boldHLC|bolditalicHLC|bolditalics|bolditalicunderlineHLC|boldsmallcaps|boldstrikethrough|boldsubscript|boldsuperscript|BoxPMI|ChapterNumber|ChapterWord|CherokeeCharacters|Cited|CJK_Characters|DocumentAuthor|Document_Author_Suffix|Editor|EgyptianCopticCharacters|EquationName|EthicalApproval|ExhibitCitation|ExhibitNumber|ExhibitPMI|ExternalBoxCitation|ExternalExhibitCitation|ExternalFigCitation|ExternalImageCitation|ExternalMultiBoxCitation|ExternalMultiExhibitCitation|ExternalMultiFigureCitation|ExternalMultiImageCitation|ExternalMultiPhotoCitation|ExternalMultiSchemeCitation|ExternalMultiStructureCitation|ExternalMultiTableCitation|ExternalPhotoCitation|ExternalSchemeCitation|ExternalStructureCitation|ExternalSupplFigureCitation|ExternalSupplMultiFigureCitation|ExternalSupplMultiTableCitation|ExternalSupplTableCitation|ExternalTableCitation|Fax_Format|FigurePMI|GreekCharacters|HeadingNumber|HebrewCharacters|Ibid|IllustrationCitation|IllustrationNumber|Illustration_PMI|ImageCitation|ImageNumber|ImagePMI|InPress|InternetResource|italicallcaps|italicHLC|italicsmallcaps|italicstrikethrough|italicsubscript|italicsuperscript|italicunderlineHLC|KeyTermHead|LearnObjHeading|LongDash|Malayalam_Characters|ManualBodyList|MapCitation|MapNumber|MapPMI|Math|MathB|MathBI|MathBISub|MathBISup|MathBSub|MathBSup|MathI|MathISub|MathISup|MathSub|MathSup|MN|MovieCitation|MovieNumber|MoviePMI|OthersTitle|PartNumber|PartWord|PhotoCitation|PhotoNumber|PhotoPMI|PresentationTitle|Publication_Number|QuestionNumber|Retraction|Retrieved_Date|RunningHead|SchemeCitation|SchemeNumber|SchemePMI|SectionNumber|SectionWord|ShortTitleHead|singleunderline|SocialMediaReferenceTitle|strikethrough|StructureCitation|StructureNumber|StructurePMI|sub|sup|SupplBoxCitation|SupplBoxNumber|SupplExhibitCitation|SupplExhibitNumber|SupplIllustrationCitation|SupplIllustrationNumber|SupplImageCitation|SupplImageNumber|SupplMovieNumber|SupplMultiBoxCitation|SupplMultiExhibitCitation|SupplMultiFigureCitation|SupplMultiIllustrationCitation|SupplMultiImageCitation|SupplMultiMovieCitation|SupplMultiPhotoCitation|SupplMultiSchemeCitation|SupplMultiStructureCitation|SupplMultiTableCitation|SupplPhotoCitation|SupplPhotoNumber|SupplSchemeCitation|SupplSchemeNumber|SupplStructureCitation|SupplStructureNumber|Symbol|SymbolB|SymbolBI|SymbolBISub|SymbolBISup|SymbolBSub|SymbolBSup|SymbolI|SymbolISub|SymbolISup|SymbolSub|SymbolSup|TablePMI|Tag|Time|TitleHead|TrialRegistration|underlineboldHLC|underlineHLC|UnfigCaption|UnFigurePMI|UnitNumber|UnitWord|Untag|Updated|subscript|figurepart)\/>}{}gsi;




my @Error;

#Root Style_Validation

my $FM_Article_Type=$Tmp;

my $Supp_Tmp=$Tmp;

my $Count_FM=$FM_Article_Type=~s{<FMArticleType>}{<FMArticleType>}gsi;


my $FM_Running_Recto=$Tmp;

my $Count_Running_Recto=$FM_Running_Recto=~s{<FMRunningHeadRecto>}{<FMRunningHeadRecto>}gsi;

my $FM_Running_Verso=$Tmp;

my $Count_Running_Verso=$FM_Running_Verso=~s{<FMRunningHeadVerso>}{<FMRunningHeadVerso>}gsi;

my $FM_Article_Title=$Tmp;

my $Count_Article_Title=$FM_Article_Title=~s{<FMRunningHeadVerso>}{<FMRunningHeadVerso>}gsi;

my $FM_Article_Title1=$Tmp;

my $FM_Article_Title2=$Tmp;



if($Tmp!~m{<FMArticleType>}gsi)
{
	$Err="1";
	push(@Error,"\~Para No:1 Col No:1 FM_Article_Type style is missing");

	
}

my $Count_Article_Title1=$FM_Article_Title2=~s{<FMArticleTitle>}{<FMArticleTitle>}gsi;

my $FM_Article_Title2=$Tmp;


if($FM_Article_Title2!~m{<FMRunningHeadRecto}gsi)
{
	
	#push(@Error,"\~Para No:1 Col No:1 \'†FM_RunningHead_Recto\' style is missing");
}

my $FM_Article_Title3=$Tmp;

if($FM_Article_Title3!~m{<FMRunningHeadVerso}gsi)
{
	#push(@Error,"\~Para No:1 Col No:1 \'†FM_RunningHead_Verso\' style is missing");
}

if($FM_Article_Title1!~m{<FMArticleTitle>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Article_Title style is missing");
}

if($Journal=~m{(ASJOUR|ASJOFJ)}gsi)
{

	

if($Count_FM gt 1)
{

	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 More then 2 †FM_Article_Type style is present");
}
}

if($Count_Running_Verso gt 1)
{

	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 More then 1 †FM_RunningHead_Verso style is present");
}

if($Count_Running_Recto gt 1)
{

	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 More then 1 †FM_RunningHead_Recto style is present");
}

if($Count_Article_Title1 gt 1)
{

	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 More then 1 †FM_Article_Title style is present");
}


my $AA_Type=$Tmp;

my $Art_Subject;

if($AA_Type=~m{<FmArticletype>(.*?)<\/FmArticletype>}gsi)
{
	$Art_Subject=$1;
}

my $Art_Type1;

my $Subject_Type1;

my $Client_Path=$ARGV[0];


if($Client_Path=~m{(OUP\_Journals\-L|Data_OUPJOURNALS)}gsi)
{

$Subject_Type1="\\\\j-fs01\\OUP_Journals-L\\Production\\01_Tools\\Jaws_Conversion\\$Journal\\$Art_Subject.html";


}
elsif($Client_Path=~m{(\\LWW\\)}gsi)
{
	$Subject_Type1="\\\\j-fs02\\JData\\LWW\\PRINT\\JAWS\\01_TOOLS\\Jaws_Conversion\\$Journal\\$Art_Subject.html";
}

elsif($Client_Path=~m{(\\J\-Intellect\-L\\)}gsi)
{
	$Subject_Type1="\\\\j-fs02\\J-Intellect-L\\Production\\Tools\\Jaws_Conversion\\$Journal\\$Art_Subject.html";
}




if(-e "$Subject_Type1")
{
open(DTD1,"$Subject_Type1") || die "Can't open file '$Subject_Type1': $!\n";
{ local $/; $_=<DTD1>; $Art_Type1=$_; }


$Art_Type1=~s{<\/td><td}{<\/td>=<td}gsi;

$Art_Type1=~s{<([^\>]+)\>}{}gsi;



close(DTD1);
}



#Mandatory Style

#$Tmp=~s{<affxref> }{ <affxref>}gsi;
#$Tmp=~s{<affxrefonline> }{ <affxrefonline>}gsi;
#$Tmp=~s{<fnxref> }{ <fnxref>}gsi;
#$Tmp=~s{<fnxrefonline> }{ <fnxrefonline>}gsi;

#$Tmp=~s{ <\/affxref>}{<\/affxref> }gsi;
#$Tmp=~s{ <\/affxrefonline>}{<\/affxrefonline> }gsi;
#$Tmp=~s{ <\/fnxref>}{<\/fnxref> }gsi;
#$Tmp=~s{ <\/fnxrefonline>}{<\/fnxrefonline> }gsi;

$Tmp=~s{<affxref>(.*?)<\/affxref>}{"<affxref>".&Aff_Xref($1)."<\/affxref>"}gesi;
$Tmp=~s{<affxrefonline>(.*?)<\/affxrefonline>}{"<affxrefonline>".&Aff_Xref($1)."<\/affxrefonline>"}gesi;
$Tmp=~s{<fnxref>(.*?)<\/fnxref>}{"<fnxref>".&Aff_Xref($1)."<\/fnxref>"}gesi;
$Tmp=~s{<fnxrefonline>(.*?)<\/fnxrefonline>}{"<fnxrefonline>".&Aff_Xref($1)."<\/fnxrefonline>"}gesi;
$Tmp=~s{<tabfnxref>(.*?)<\/tabfnxref>}{"<tabfnxref>".&Tabfn_Xref($1)."<\/tabfnxref>"}gesi;
$Tmp=~s{<tabfnxrefonline>(.*?)<\/tabfnxrefonline>}{"<tabfnxrefonline>".&Tabfn_Xref($1)."<\/tabfnxrefonline>"}gesi;

$Tmp=~s{<affxref><\/affxref>}{}gsi;
$Tmp=~s{<affxrefonline><\/affxrefonline>}{}gsi;

$Tmp=~s{<fnxref><\/fnxref>}{}gsi;
$Tmp=~s{<fnxrefonline><\/fnxrefonline>}{}gsi;

$Tmp=~s{<affxref><sup>}{<affxref>}gsi;

$Tmp=~s{<affxrefonline><sup>}{<affxrefonline>}gsi;

$Tmp=~s{<\/sup><\/affxref>}{<\/affxref>}gsi;

$Tmp=~s{<\/sup><\/affxrefonline>}{<\/affxrefonline>}gsi;

my $Comment_Reference_Tmp=$Tmp;



$Tmp=~s{<CommentReference(\d+)>}{}gsi;

$Tmp=~s{<CommentReference(\d+)\/>}{}gsi;

$Tmp=~s{<\/CommentReference([^\>]+)\>}{}gsi;

my $Authors_Tmp=$Tmp;

my $Corr_Tmp=$Tmp;
my $Corr_Tmp1=$Tmp;
my $Corr_Tmp2=$Tmp;

my $Corr_Tmp3=$Tmp;



while($Authors_Tmp=~m{<([^\>]+)\><FMAuthors>(.*?)<\/FMAuthors>}gsi)
{
	my $Paragraph_No=$1;
	my $Authors=$2;
	my $Authors1=$2;
	my $Authors2=$2;
	my $Authors3=$2;
	my $Authors4=$2;
	my $Authors5=$2;
	my $Authors6=$2;
	my $Authors7=$2;
	my $Authors8=$2;
	my $Authors9=$2;
	my $Authors10=$2;
	

	my $Authors_Citation=$Authors;

	

	

	$Authors=~s{<(fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmcorrSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmauDegree|fmauCollab|italic|bold|sup|sub|smallcaps|Affxref|fnxref|Affxrefonline|fnxrefonline|query|orcxref|fmAlterGivenName|fmAlterSurname|fmTransGivenName|fmTransSurname|fmTransname)>}{}gsi;

	$Authors=~s{<\/(fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmcorrSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmauDegree|fmauCollab|italic|bold|sup|sub|smallcaps|Affxref|fnxref|Affxrefonline|fnxrefonline|query|orcxref|fmAlterGivenName|fmAlterSurname|fmTransGivenName|fmTransSurname|fmTransname)>}{}gsi;

	$Authors=~s{<(fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmcorrSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmauDegree|fmauCollab|italic|bold|sup|sub|smallcaps|Affxref|fnxref|Affxrefonline|fnxrefonline|query|orcxref|fmAlterGivenName|fmAlterSurname|fmTransGivenName|fmTransSurname|fmTransname)\/>}{}gsi;


	$Authors=~s{<para([^\>]+)\>}{}gsi;
	$Authors=~s{<\/para([^\>]+)\>}{}gsi;

	
	
	
	while($Authors=~m{<(\w([^\>]+))\>}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($Authors, $Character_Style) + 1;

		

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Character style $1 is not allowed in \†FM_Authors");
	}

	
	
	$Authors1=~s{<(\w([^\>]+))\>(.*?)<\/\1>}{}gsi;

	$Authors1=~s{(and)}{}gsi;

	$Authors1=~s{\[para([^\]]+)\]}{}gsi;

	$Authors1=~s{([\,\.\;\:\]\s\[\–]+)}{}gsi;

	
	
	
	while($Authors1=~m{(\w+)}gsi)
	{
		
		
		my $cnum = index($Authors, "$1") + 1;
		
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Free text $1 is not allowed in \†FM_Authors");
	}


	while($Authors1=~m{\(}gsi)
	{
		
		
		my $cnum = index($Authors, "$1") + 1;
		
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Free text \( is not allowed in \†FM_Authors");
	}

	while($Authors1=~m{\)}gsi)
	{
		
		
		my $cnum = index($Authors, "$1") + 1;
		
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Free text \) is not allowed in \†FM_Authors");
	}


	$Authors_Citation=~s{<(fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmauDegree|fmauCollab|italic|bold|sup|sub|smallcaps|query|fmAlterGivenName|fmAlterSurname|fmTransGivenName|fmTransSurname|fmTransname)>}{}gsi;

	$Authors_Citation=~s{<\/(fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmauDegree|fmauCollab|italic|bold|sup|sub|smallcaps|query|fmAlterGivenName|fmAlterSurname|fmTransGivenName|fmTransSurname|fmTransname)>}{}gsi;

	$Authors_Citation=~s{<(fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmauDegree|fmauCollab|italic|bold|sup|sub|smallcaps|query|fmAlterGivenName|fmAlterSurname|fmTransGivenName|fmTransSurname|fmTransname)\/>}{}gsi;


	my $Aut_Tmp=$Tmp;

	$Aut_Tmp=~s{<FMAuthors>(.*?)<\/FMAuthors>}{}gsi;

	
	
	my $Aut=$Authors;

	$Aut=~s{<([^\>]+)\>}{}gsi;

	$Authors_Citation=~s{<(Affxref|Affxrefonline|fnxref|Fnxrefonline)>(.*?)<\/\1>}{&Affiliation_Cit($1,$2)}gesi;

	$Authors_Citation=~s/(.)/asciiize($1)/eg;

	

	$Aut_Tmp=~s{<(Affxref|Affxrefonline|fnxref|Fnxrefonline)>(.*?)<\/\1>}{&Affiliation_Cit($1,$2)}gesi;

	$Aut_Tmp=~s/(.)/asciiize($1)/eg;

	
	while($Authors_Citation=~m{(<(Affxref|Affxrefonline|fnxref|Fnxrefonline)>(.*?)<\/\2>)}gsi)
	{
		my $Tag=$1;
		my $Tag1=$2;
		my $Tag2=$3;

		
		

		my $cnum = index($Aut, "$Tag2") + 1;


		if($Tag=~m{\s}gsi)
		{

			$Err="1";
			
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Warning: Space found inside the Affxref tag");
		}


		
		
		if($Aut_Tmp!~m{<$Tag1>\Q$Tag2\E<\/$Tag1>}si)
		{
			
		
		

push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Warning: $Tag is not cited in Affiliation,Footnote and Correspondance'");
		}
	}


	my $Aut1=$Authors2;

	$Aut1=~s{<([^\>]+)\>}{}gsi;


	if($Authors2=~m{<(fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree)>(.*?)<\/\1>}gsi)
	{
		my $Style=$1;

		

		my $cnum = index($Aut1, "$2") + 1;

		my $Corr_Tmp=$Tmp;
		
		if($Corr_Tmp!~m{<FMNoteCorrespondence>}gsi)
		{
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum $Style is present without FM_Note_Correspondence style in word document'");
		}
	}

	

	if($Authors3=~m{<(fmauPrefix|fmcorrPrefix)>(.*?)<\/\1>([\.\,\:\;]*)$}gsi)
	{
		my $Style=$1;

		

		my $cnum = index($Aut1, "$2") + 1;
		
		
			

push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Warning:$Style is present in the end of the author name'");
		
	}

	
	
	if($Authors9=~m{<(fmauPrefix|fmcorrPrefix)>([\.\,\:\;\s]*)<\/\1>}gsi)
	{
		my $Style=$1;

		

		my $cnum = index($Authors9, "$1") + 1;
		
		
			

push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Warning:Dummy $Style is present in the author name'");
		
	}

	
	$Authors5=~s{<\/fmausurname><fmausurname>}{}gsi;
	$Authors6=~s{<\/fmauGivenName><fmauGivenName>}{}gsi;
	
	$Authors5=~s{<fmausurname>([\s\,\.\;\:\)\(\]\[\–]+)<\/fmausurname>}{}gsi;
	$Authors6=~s{<fmauGivenName>([\s\,\.\;\:\)\(\]\[\–]+)<\/fmauGivenName>}{}gsi;

	$Authors5=~s{(<fmauGivenName>(.*?)<\/fmauGivenName>)}{&Fm_Givename($1)}gesi;
	$Authors6=~s{<fmauGivenName><\/fmauGivenName>}{}gsi;
	
	my $Count_Surname=$Authors5=~s{<fmausurname>}{<fmausurname>}gsi;
	my $Count_Givenname=$Authors6=~s{<fmauGivenName>}{<fmauGivenName>}gsi;

	
	if($Count_Surname ne $Count_Givenname)
	{
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning:Surname and givenname style is not equal. Either surname or given name style is missing'");
	}

	$Authors5=~s{<\/fmcorrsurname><fmcorrsurname>}{}gsi;
	$Authors6=~s{<\/fmcorrGivenName><fmcorrGivenName>}{}gsi;
	
	$Authors5=~s{<fmcorrsurname>([\s\,\.\;\:\)\(\]\[\–]+)<\/fmcorrsurname>}{}gsi;
	$Authors6=~s{<fmcorrGivenName>([\s\,\.\;\:\)\(\]\[\–]+)<\/fmcorrGivenName>}{}gsi;

	$Authors5=~s{(<fmcorrGivenName>(.*?)<\/fmcorrGivenName>)}{&Fm_Givename($1)}gesi;
	$Authors6=~s{<fmcorrGivenName><\/fmcorrGivenName>}{}gsi;
	
	my $Count_Surname1=$Authors5=~s{<fmcorrsurname>}{<fmcorrsurname>}gsi;
	my $Count_Givenname1=$Authors6=~s{<fmcorrGivenName>}{<fmcorrGivenName>}gsi;

	
	if($Count_Surname ne $Count_Givenname)
	{
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning:corr Surname and Corr givenname style is not equal. Either surname or given name style is missing'");
	}

	
	my $Affiliation_Path=$ARGV[0];

	if($Affiliation_Path!~m{(JData\\LWW|Intellect|Brill|Medknow|BUP|PLOS)}gsi)
	{
	

		
		
	if($Corr_Tmp3!~m{<(fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree)>}si)
		{
			
$Err="1";
#push(@Error,"\~Para No:1 Col No:1 Corresponding author style is missing");
		}
		
	
	}

	

	if($Authors8=~m{</fmauGivenName><fmcorrSurname>([\s\,]+)</fmcorrSurname><fmauSurname>}gsi)
		{
			
		my $Style=$1;

		my $cnum = index($Aut1, "$2") + 1;
		
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Fmcorrsurname style present in between FmauGivenname and fmauSurname'");
		
		}

	

	
}


my $Afffff_Tmp=$Tmp;



$Afffff_Tmp=~s{<\/affxref>(\s?)(\,?)(\s?)<affxref>}{$1$2$3}gsi;



 
    my $next_expected_aff = 1;
    my %seen_affs;
    my @intro_order;
    my $author_count = 0;
        while ($Afffff_Tmp=~ /<affxref[^>]*>(.*?)<\/affxref>/g) {
            my $aff_text = $1;
	    my @affs;
	    
            $aff_text =~ s/<[^>]+>//g; # Clean internal tags if any
            push @affs, split(/,/, $aff_text);
        
        @affs = map { s/\s+//gr } @affs; # Trim whitespace from each aff number
        @affs = grep { /^\d+$/ } @affs; # Ensure they are numbers

        print "Author $author_count: [Affiliations: " . join(", ", @affs) . "]\n";

        # Check 1: Ascending order for this author
        for (my $i = 0; $i < $#affs; $i++) {
            if ($affs[$i] > $affs[$i+1]) {
                push(@Error,"~Para No:1 Col No:1 Affiliation are not in ascending order: @affs");
                #$errors++;
            }
        }
	}
	
my $Back_After_Tmp1=$Tmp;

$Back_After_Tmp1=~s{<bold>(.*?)<\/bold>}{$1}gsi;

while($Back_After_Tmp1=~m{<([^\>]+)\><EMHead[A-Z]>(Author contributions)<\/EMHead[A-Z]>}gsi)
{
	my $FM_Keyword=$2;
	my $Paragraph_No=$1;

	if($FM_Keyword!~m{Author contributions}gs)
	{
		
	$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the author contribution title format. it should be Author contributions");
	}
	

	
}

my $Back_Matter_Path1=$ARGV[0];

	if($Back_Matter_Path1=~m{(JData\\LWW|JData_NEW\\LWW)}gsi)
	{
		my $Back_After_Tmp=$Tmp;



while($Back_After_Tmp=~m{<([^\>]+)\><EMHead[A-Z]>(.*?)<\/EMHead[A-Z]>\n<([^\>]+)\><FM}gsi)
{
	my $FM_Keyword=$1;
	my $Paragraph_No=$3;

	$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 FM Text style present after EMHead");
}

while($Back_After_Tmp=~m{<([^\>]+)\><EMAcknowledgment}gsi)
{
	my $FM_Keyword=$1;
	my $Paragraph_No=$3;

	$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 EMAcknowledgment style is not allowed");
}


my $Ref_Journal_Name=$Journal;

if($Ref_Journal_Name=~m{^(BPHARM|CD|EJCP|PG|ICP)$}gsi)
{
	if($Online_Bib_Xref_Tmp1!~m{(<BibXrefonline>)}gsi)
	{
		$Err="1";
		push(@Error,"\~Para No:1 Col No:1 Reference linking not done for this file");
	}


}

my $Ref_Journal_Name1=$Journal;

if($Ref_Journal_Name1=~m{^(BPHARM|CD|EJCP|PG|ICP)$}gsi)
{
	if($Online_Bib_Xref_Tmp1=~m{(<BibXref>)}gsi)
	{
		$Err="1";
		push(@Error,"\~Para No:1 Col No:1 Bibxref style is not allowed");
	}


}
	
my $Ref_Journal_Name2=$Journal;

if($Ref_Journal_Name2=~m{^(ACD|BPMJ|CAD|CAEN|EJEM|EJGH|ICP|IJRR|JPOB|MR|NMC|NR|PGEN|PCC|CCM|CCX)$}gsi)
{
	if($Online_Bib_Xref_Tmp1=~m{(<BibXref>)}gsi)
	{
		$Err="1";
		push(@Error,"\~Para No:1 Col No:1 Bibxref style is not allowed");
	}


}

my $Arti_Tmp=$Tmp;

while($Arti_Tmp=~m{<([^\>]+)\><FMArticleTitle>(.*?)<\/FMArticleTitle>}gsi)
{
	my $Paragraph_No=$1;

	my $Content=$2;

	

	if($Content=~m{([\.\,\:\;]+)(\s?)$}gs)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Article title should not end with punctuations");

	}

	
	

}

my $Arti_Tmp1=$Tmp;

while($Arti_Tmp1=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;

	my $Content=$3;

	

	if($Content=~m{^(\((\w+) 2022\;XX\: X\–X)}gs)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Catch line is not allowed $1");

	}

	
	

}



}




while($Authors_Tmp=~m{<([^\>]+)\><FMNoteStudyGroupMembers>(.*?)<\/FMNoteStudyGroupMembers>}gsi)
{
	my $Paragraph_No=$1;
	my $Authors=$2;
	my $Authors1=$2;
	my $Authors2=$2;
	my $Authors3=$2;
	my $Authors4=$2;
	my $Authors5=$2;
	my $Authors6=$2;
	my $Authors7=$2;
	my $Authors8=$2;
	my $Authors9=$2;

	
	my $Authors_Citation=$Authors;

	$Authors=~s{<(fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmcorrSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmauDegree|fmauCollab|italic|bold|sup|sub|smallcaps|Affxref|fnxref|Affxrefonline|fnxrefonline|query|orcxref|fmAlterGivenName|fmAlterSurname|fmTransGivenName|fmTransSurname|fmTransname)>}{}gsi;

	$Authors=~s{<\/(fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmcorrSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmauDegree|fmauCollab|italic|bold|sup|sub|smallcaps|Affxref|fnxref|Affxrefonline|fnxrefonline|query|orcxref|fmAlterGivenName|fmAlterSurname|fmTransGivenName|fmTransSurname|fmTransname)>}{}gsi;

	$Authors=~s{<(fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmcorrSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmauDegree|fmauCollab|italic|bold|sup|sub|smallcaps|Affxref|fnxref|Affxrefonline|fnxrefonline|query|orcxref|fmAlterGivenName|fmAlterSurname|fmTransGivenName|fmTransSurname|fmTransname)\/>}{}gsi;

	$Authors=~s{<(fmaffInstitution|fmaffDepartment|fmaffCity|fmaffState|fmaffAddressLine|fmaffCountry|fmaffFax|fmaffPhone|fmaffEmail|AffXref|Affxrefonline|italic|bold|sup|sub|smallcaps|comment|query)>}{}gsi;

	$Authors=~s{<\/(fmaffInstitution|fmaffDepartment|fmaffCity|fmaffState|fmaffAddressLine|fmaffCountry|fmaffFax|fmaffPhone|fmaffEmail|AffXref|Affxrefonline|italic|bold|sup|sub|smallcaps|comment|query)>}{}gsi;

	$Authors=~s{<(fmaffInstitution|fmaffDepartment|fmaffCity|fmaffState|fmaffAddressLine|fmaffCountry|fmaffFax|fmaffPhone|fmaffEmail|AffXref|Affxrefonline|italic|bold|sup|sub|smallcaps|comment|query)\/>}{}gsi;

	
	
	while($Authors=~m{<(\w([^\>]+))\>}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($Authors, $Character_Style) + 1;

		

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Character style $1 is not allowed in \†FMNoteStudyGroupMembers");
	}

	$Authors1=~s{<(\w([^\>]+))\>(.*?)<\/\1>}{}gsi;

	$Authors1=~s{(and)}{}gsi;

	$Authors1=~s{([\,\.\;\:\]\[\–]+)}{}gsi;

	
	while($Authors1=~m{(\w+)}gsi)
	{
		
		
		my $cnum = index($Authors, "$1") + 1;
		
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Free text $1 is not allowed in \†FMNoteStudyGroupMembers");
	}


	while($Authors1=~m{\(}gsi)
	{
		
		
		my $cnum = index($Authors, "$1") + 1;
		
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Free text \( is not allowed in \†FMNoteStudyGroupMembers'");
	}

	while($Authors1=~m{\)}gsi)
	{
		
		
		my $cnum = index($Authors, "$1") + 1;
		
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Free text \) is not allowed in \†FMNoteStudyGroupMembers");
	}

}
	


my $Back_Matter_Path1=$ARGV[0];

	if($Back_Matter_Path1=~m{(JData\\LWW|JData_NEW\\LWW)}gsi)
	{
		my $Back_After_Tmp=$Tmp;



while($Back_After_Tmp=~m{<([^\>]+)\><EMHead[A-Z]>(.*?)<\/EMHead[A-Z]>\n<([^\>]+)\><FM}gsi)
{
	my $FM_Keyword=$1;
	my $Paragraph_No=$3;

	$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 FM Text style present after EMHead");
}

while($Back_After_Tmp=~m{<([^\>]+)\><EMAcknowledgment}gsi)
{
	my $FM_Keyword=$1;
	my $Paragraph_No=$3;

	$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 EMAcknowledgment style is not allowed");
}


my $Ref_Journal_Name=$Journal;

if($Ref_Journal_Name=~m{^(BPHARM|CD|EJCP|PG|ICP)$}gsi)
{
	if($Online_Bib_Xref_Tmp1!~m{(<BibXrefonline>)}gsi)
	{
		$Err="1";
		push(@Error,"\~Para No:1 Col No:1 Reference linking not done for this file");
	}


}

my $Ref_Journal_Name1=$Journal;

if($Ref_Journal_Name1=~m{^(BPHARM|CD|EJCP|PG|ICP)$}gsi)
{
	if($Online_Bib_Xref_Tmp1=~m{(<BibXref>)}gsi)
	{
		$Err="1";
		push(@Error,"\~Para No:1 Col No:1 Bibxref style is not allowed");
	}


}

my $Ref_Journal_Name2=$Journal;

if($Ref_Journal_Name2=~m{^(ACD|BPMJ|CAD|CAEN|EJEM|EJGH|ICP|IJRR|JPOB|MR|NMC|NR|PGEN)$}gsi)
{
	if($Online_Bib_Xref_Tmp1=~m{(<BibXref>)}gsi)
	{
		$Err="1";
		push(@Error,"\~Para No:1 Col No:1 Bibxref style is not allowed");
	}


}



}	
	
	

my $Affiliation_Path1=$ARGV[0];


	if($Affiliation_Path1!~m{(JData\\LWW|Intellect|Brill|Medknow|BUP|PLOS)}gsi)
	{
	

if($Corr_Tmp1!~m{<FMNoteCorrespondence>}gsi)
		{
			
$Err="1";
#push(@Error,"\~Para No:1 Col No:1 Corresponding author style is missing in author byline. Please check");
		}

	}


my $FM_Author_Bio=$Tmp;

if($FM_Author_Bio=~m{<([^\>]+)\><FMNoteAuthorBio>(.*?)<\/FMNoteAuthorBio>}gsi)
{
	my $Paragraph_No=$1;

	my $Author_Tmp=$Tmp;

	if($Author_Tmp!~m{<([^\>]+)\><FMAuthors>(.*?)<\/FMAuthors>}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 FMNoteAuthorBio style found without FMAuthors style");
	}
}



my $FM_Notes_Text=$Tmp;

if($FM_Notes_Text=~m{<([^\>]+)\><FMNotesText>(.*?)<\/FMNotesText>}gsi)
{
	my $Paragraph_No=$1;

	my $Content=$2;

	if($Content=~m{^\<(affxref|fnxref)}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 check the style. It must be FM_Text.");
	}
}


my $Graph_Abstract_Path=$ARGV[0];

	if($Graph_Abstract_Path=~m{(JData\\LWW|JData_NEW\\LWW)}gsi)
	{

		my $Gra=$Tmp;

	if($Gra=~m{<([^\>]+)\><(FMGrapAbstractParaFlushLeft|FMGrapAbstractParaInd)>(.*?)<\/(FMGrapAbstractParaFlushLeft|FMGrapAbstractParaInd)>}gsi)
		{
		my $Paragraph_No=$1;


		my $Content=$3;

		if($Content!~m{<fmabstractsectionHeadrunIn>}gsi)
		{
			
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 fmabstractsectionHeadrunIn style is missing in graphical abstract");
		}
		}
		
	
	}

my $Affiliation_Tmp1=$Tmp;




$Affiliation_Tmp1=~s{<\/(fmaffInstitution|fmaffAddressLine|fmaffCountry|fmaffFax|fmaffPhone|fmaffEmail|AffXref|Affxrefonline|italic|bold|sup|sub|smallcaps|comment|query)>}{}gsi;

$Affiliation_Tmp1=~s{\[para([^\]]+)\]}{}gsi;



$Affiliation_Tmp1=~s{\,(\s?)<\/FMAffiliations>}{}gsi;




while($Affiliation_Tmp1=~m{<\/FMAffiliations>\n*<([^\>]+)\><FMAffiliations>}gsi)
{

	my $Paragraph_No=$1;

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Error: Comma seperator missing in between affiliation'");
	
}

	

my $Affiliation_Tmp=$Tmp;

$Affiliation_Tmp=~s{\*\*}{\* \*}gsi;


while($Affiliation_Tmp=~m{<([^\>]+)\><FMAffiliations>(.*?)<\/FMAffiliations>}gsi)
{
	my $Paragraph_No=$1;
	my $FMAffiliations=$2;
	my $FMAffiliations1=$2;
	my $FMAffiliations2=$2;
	my $FMAffiliations3=$2;

	my $FMAffiliations4=$2;
	my $FMAffiliations5=$2;
	my $FMAffiliations6=$2;
	my $FMAffiliations7=$2;
	my $FMAffiliations8=$2;

	
		    
	$FMAffiliations=~s{<(fmaffInstitution|fmaffDepartment|fmaffCity|fmaffState|fmaffAddressLine|fmaffCountry|fmaffFax|fmaffPhone|fmaffEmail|AffXref|Affxrefonline|italic|bold|sup|sub|smallcaps|comment|query)>}{}gsi;

	$FMAffiliations=~s{<\/(fmaffInstitution|fmaffDepartment|fmaffCity|fmaffState|fmaffAddressLine|fmaffCountry|fmaffFax|fmaffPhone|fmaffEmail|AffXref|Affxrefonline|italic|bold|sup|sub|smallcaps|comment|query)>}{}gsi;

	$FMAffiliations=~s{<(fmaffInstitution|fmaffDepartment|fmaffCity|fmaffState|fmaffAddressLine|fmaffCountry|fmaffFax|fmaffPhone|fmaffEmail|AffXref|Affxrefonline|italic|bold|sup|sub|smallcaps|comment|query)\/>}{}gsi;


	
	
	
	while($FMAffiliations=~m{<(\w([^\>]+))\>}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($FMAffiliations, $Character_Style) + 1;

		
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Character style $1 is not allowed in \†FMAffiliations");
	}

	
		
	$FMAffiliations1=~s{<(\w([^\>]+))\>(.*?)<\/\1>}{}gsi;

	
	
	$FMAffiliations1=~s{(and)}{}gsi;

	$FMAffiliations1=~s{(From the)}{}gsi;

	$FMAffiliations1=~s{\[para([^\]]+)\]}{}gsi;
	
	$FMAffiliations1=~s{([\,\.\;\:\)\(\]\[\–]+)}{}gsi;

	


	
	


	my $Affiliation_Path=$ARGV[0];

	#if($Affiliation_Path!~m{JData\\LWW}gsi)
	#{
		
	
	

	while($FMAffiliations1=~m{(\w+)}gsi)
	{
		my $cnum = index($FMAffiliations1, "$1$2") + 1;
		
		

push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Error: Free text $1 is not allowed in FMAffiliations'");
	}
	#}
	$FMAffiliations2=~s{<([^\>]+)\>}{}gsi;

	my $AJCPAT_Journal=$Journal;

	if($AJCPAT_Journal=~m{AJCPAT}gsi)
	{
		if($FMAffiliations2!~m{\.$}gsi)
		{
		
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Affiliation should end with dot in AJCPAT journal'");
		}
	}

	

	my $Country_Journal=$Journal;
	my $Country_Path=$ARGV[0];

	

	if($Country_Journal!~m{(ADAPTA|AENTOM|AJCLAW|CLIPHA|CRIMIN|EARLYJ|ECOPOL|EJILAW|ELTJ|FRENCH|IJCLAW|INDLAW|LABMED|PUBOPQ|SSJAPJ|STALAW)}gsi)
	{
		
		if($Country_Path=~m{(OUP\_Journals\-L|Data_OUPJOURNALS)}gsi)
		{
		if($FMAffiliations7!~m{<fmaffCountry>}gsi)
		{
		
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Country name is missing in the affiliation. Check metadata XML and insert it. Or insert an author query.'");
		}
		}
	}

	my $Country_Journal1=$Journal;
	if($Country_Journal1=~m{(HS9)}gsi)
	{
		
		
		if($FMAffiliations7!~m{<fmaffCountry>}gsi)
		{
		
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Country name is missing in the affiliation");
		}
		
	}


	my $Country_Journal11=$Journal;
	if($Country_Journal11=~m{(ONCOLO|STMCLS|STCLTM)}gsi)
	{
		
		
		if($FMAffiliations7=~m{<fmaffAddressLine>(.*?)<\/fmaffAddressLine>}gsi)
		{

			my $Address=$1;

			if($Address=~m{(\d+)}gsi)
			{
			
				push(@Error,"\~Para No:$Paragraph_No Col No:1 Only city and state names are allowed in addressline tag in affiliations.");

			}
		}
		
	}


	my $Affiliation_Path=$ARGV[0];

		
		if($Affiliation_Path=~m{(Brill)}gsi)
		{
		if($FMAffiliations8!~m{<fmaffemail>}gsi)
		{
		
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Email is missing in the affiliation.'");
		}
		}
	

		
	while($FMAffiliations3=~m{<fmaffEmail>(.*?)<\/fmaffEmail>}gsi)
	{
		my $Email=$1;
		my $Email1=$1;
		my $Email2=$1;
		my $Email3=$1;
		my $Email4=$1;
		
		my $cnum = index($FMAffiliations1, "$1") + 1;

		my $Count=$Email=~s{\@}{\@}gsi;

		if($Count gt 1)
		{
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum More then one email address is present in single fmaffEmail style'");
		}

		if($Count eq 0)
		{
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum \@ symbol is missing in fmaffEmail style'");
		}

		if($Email1=~m{([\,\:\;\.\)\(]+)$}gsi)
		{
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Email style should not end with punctuation'");
		}

		if($Email2=~m{ }gsi)
		{
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Email content should not have space'");
		}

		if($Email3=~m{([\,\:\;\.\)\(]+)\@}gsi)
		{
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Check the punctuation before @ Symbol'");
		}
		if($Email3=~m{\@([\,\:\;\.\)\(]+)}gsi)
		{
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Check the punctuation after @ Symbol'");
		}
		
	}

	$FMAffiliations4=~s{<fmaffEmail>(.*?)<\/fmaffEmail>}{}gsi;

	while($FMAffiliations4=~m{\@}gsi)
	{
		my $Email=$1;
		
		my $cnum = index($FMAffiliations1, "$1") + 1;

		
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum fmaffEmail style is missing for email'");
		
		
	}

	while($FMAffiliations5=~m{<affxref>(.*?)<\/affxref>}gsi)
	{
		my $Affxref=$1;
		my $Affxref=$2;

		my $Affiliation_Tmp1=$Tmp;


		$Affiliation_Tmp1=~s{<fmauthors>(.*?)<\/fmauthors>}{}gsi;


		

		my $Count=$Affiliation_Tmp1=~s{(<affxref>$Affxref<\/affxref>)}{$1}gs;
		
		my $cnum = index($FMAffiliations6, "$Affxref") + 1;


		if($Affxref=~m{ }gsi)
		{

			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Space found inside the affxref style $Affxref'");

		}
		
		
		if($Count gt 1)
		{
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Duplicate affilaition queue found $Affxref'");

		}
		
		
	}
	
	
}



my $Footnote_Tmp=$Tmp;




while($Footnote_Tmp=~m{<([^\>]+)\><Footnote>(.*?)<\/Footnote>}gsi)
{
	my $Paragraph_No=$1;

	my $Footnote=$2;

	my $Footnote_Tmp1=$Tmp;

$Footnote_Tmp1=~s{<footnote>(.*?)<\/footnote>}{}gsi;


	if($Footnote=~m{<(fnxref|fnxrefonline)>(.*?)<\/\1>}gsi)
	{
		my $Fnxref=$2;

		$Fnxref=~s{\.$}{}gsi;
		$Fnxref=~s{\. $}{}gsi;

		
		

		if($Footnote_Tmp1!~m{<(fnxref|fnxrefonline)>\Q$Fnxref\E<\/\1>}gsi)
		{
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Footnote citation is missing for $Fnxref'");
		}
	}
}


my $Aff_Tmppp=$Tmp;

while($Aff_Tmppp=~m{<([^\>]+)\><FMAffiliations>(.*?)<\/FMAffiliations>}gsi)
{
	my $Paragraph_No=$1;

	my $Footnote=$2;

	my $Footnote_Tmp1=$Tmp;

$Footnote_Tmp1=~s{<FMAffiliations>(.*?)<\/FMAffiliations>}{}gsi;


	if($Footnote=~m{<(affxref|affxrefonline)>(.*?)<\/\1>}gsi)
	{
		my $Fnxref=$2;

		$Fnxref=~s{\.$}{}gsi;
		$Fnxref=~s{\. $}{}gsi;

		
		

		if($Footnote_Tmp1!~m{<(affxref|affxrefonline)>\Q$Fnxref\E<\/\1>}gsi)
		{
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning: Affilaition citation is missing for $Fnxref'");
		}
	}
}





my $Correspondence_Tmp=$Tmp;

while($Correspondence_Tmp=~m{<([^\>]+)\><FMNoteCorrespondence>(.*?)<\/FMNoteCorrespondence>}gsi)
{
	my $Paragraph_No=$1;
	my $FMNoteCorrespondence=$2;
	my $FMNoteCorrespondence1=$2;
	my $FMNoteCorrespondence2=$2;
	my $FMNoteCorrespondence3=$2;
	my $FMNoteCorrespondence4=$2;
	my $FMNoteCorrespondence5=$2;
	my $FMNoteCorrespondence6=$2;
	my $FMNoteCorrespondence7=$2;
		    
	$FMNoteCorrespondence=~s{<(fmaffInstitution|fmaffDepartment|fmaffCity|fmaffState|fmcorrSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmaffAddressLine|fmaffCountry|fmaffFax|fmaffPhone|fmaffEmail|AffXref|Affxrefonline|italic|bold|sup|sub|smallcaps|comment|query|url)>}{}gsi;

	$FMNoteCorrespondence=~s{<\/(fmaffInstitution|fmaffDepartment|fmaffCity|fmaffState|fmcorrSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmaffAddressLine|fmaffCountry|fmaffFax|fmaffPhone|fmaffEmail|AffXref|Affxrefonline|italic|bold|sup|sub|smallcaps|comment|query|url)>}{}gsi;

	$FMNoteCorrespondence=~s{<(fmaffInstitution|fmaffDepartment|fmaffCity|fmaffState|fmcorrSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmaffAddressLine|fmaffCountry|fmaffFax|fmaffPhone|fmaffEmail|AffXref|Affxrefonline|italic|bold|sup|sub|smallcaps|comment|query|url)\/>}{}gsi;


	
	while($FMNoteCorrespondence=~m{<(\w([^\>]+))\>}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($FMNoteCorrespondence, $Character_Style) + 1;

		
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Character style $1 is not allowed in \†FMNoteCorrespondence");
	}

	while($FMNoteCorrespondence2=~m{<fmaffEmail>(.*?)<\/fmaffEmail>}gsi)
	{
		my $Email=$1;

		my $Email1=$1;
		my $Email2=$1;

	
		
		my $cnum = index($FMNoteCorrespondence, "$1") + 1;

		my $Count=$Email=~s{\@}{\@}gsi;

		if($Count gt 1)
		{
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum More then one email address is present in single fmaffEmail style'");
		}

		if($Count eq 0)
		{
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum \@ symbol is missing in fmaffEmail style'");
		}

		if($Email1=~m{([\,\:\;\.\(\)]+)$}gsi)
		{
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Email style should not end with punctuation'");
		}

		if($Email2=~m{\s}gsi)
		{
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Email content should not have space'");
		}
		
	}

	if($FMNoteCorrespondence3!~m{<fmaffEmail>(.*?)<\/fmaffEmail>}gsi)
	{
		my $Email=$1;
		
		$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Email style is missing in correspondance'");
		
		
	}

	$FMNoteCorrespondence4=~s{<fmaffEmail>(.*?)<\/fmaffEmail>}{}gsi;

	while($FMNoteCorrespondence4=~m{\@}gsi)
	{
		my $Email=$1;
		
		my $cnum = index($FMNoteCorrespondence1, "$1") + 1;

		
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 fmaffEmail style is missing for email'");
		
		
	}

	$FMNoteCorrespondence5=~s{<(\w([^\>]+))\>(.*?)<\/\1>}{}gsi;

	$FMNoteCorrespondence5=~s{(and)}{}gsi;

	$FMNoteCorrespondence5=~s{\[para([^\]]+)\]}{}gsi;

	$FMNoteCorrespondence5=~s{([\,\.\;\:\)\(\]\[\–]+)}{}gsi;

	$FMNoteCorrespondence5=~s{([\,\.\;\:\)\(\]\[\–]+)}{}gsi;

	$FMNoteCorrespondence5=~s{Correspondence}{}gsi;

	$FMNoteCorrespondence5=~s{e\-mail}{}gsi;


	my $Affiliation_Path=$ARGV[0];

	if($Affiliation_Path=~m{(JData\\LWW|JData_NEW\\LWW)}gsi)
	{
		
	
	

	while($FMNoteCorrespondence5=~m{(\w+)}gsi)
	{
		my $cnum = index($FMNoteCorrespondence5, "$1$2") + 1;
		
		

push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Warning: Free text $1 is not allowed in FMCorrespondence'");
	}
	}

	my $Country_Path=$ARGV[0];
	if($Country_Path=~m{(JPPHAR|JPHSRE|JOAAAC|IJPPHA|ENDOCR|JCEMET|ENDREV|JESOCI)}gsi)
		{
		if($FMNoteCorrespondence6!~m{<fmaffCountry>}gsi)
		{
		
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Country name is missing in the Correspondence. Check metadata XML and insert it. Or insert an author query.'");
		}
		}

my $Type1=$Tmp;

my $Subject_Type1;

if($Type1=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
{
	$Subject_Type1=$1;
		
}

if($Subject_Type1=~m{(For Art and Occupation|Obituary)}gsi)
{
	$FMNoteCorrespondence5=~s{<(\w([^\>]+))\>(.*?)<\/\1>}{}gsi;

	$FMNoteCorrespondence5=~s{art\@som\.org\.uk}{}gsi;
	

	if($FMNoteCorrespondence5=~m{\@}gsi)
	{
		push(@Error,"\~Para No:1 Col No:1 For Art and Occupation type artcles, corresponding author email should be art\@som\.org\.uk only");
	}

	

	
}
    
	
	
	
	
}

my $Type11=$Tmp;

my $Subject_Type11;

if($Type11=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
{
	$Subject_Type11=$1;
		
}

if($Subject_Type11=~m{(For Art and Occupation)}gsi)
{

	my $Figure_Tmp=$Tmp;
	my $Figure_Tmp1=$Tmp;

	if($Figure_Tmp!~m{<ParaCreditLine>}gsi)
	{
		push(@Error,"\~Para No:1 Col No:1 For Art and Occupation type artcles, paracreditline is must'");
	}
	

	

	
}

my $Type111=$Tmp;

my $Subject_Type111;

if($Type111=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
{
	$Subject_Type111=$1;
		
}


my $Subject1_Journal=$Journal;

my $Type=$Tmp;

my $Subject_Type;

if($Type=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
{
	$Subject_Type=$1;
		
}



my $Subject_Tmp1=$Art_Type1;
my $Subject_Tmp2=$Art_Type1;
my $Subject_Tmp3=$Art_Type1;
my $Subject_Tmp4=$Art_Type1;
my $Subject_Tmp5=$Art_Type1;
my $Subject_Tmp6=$Art_Type1;
my $Subject_Tmp7=$Art_Type1;
my $Subject_Tmp8=$Art_Type1;
my $Subject_Tmp9=$Art_Type1;
my $Subject_Tmp10=$Art_Type1;
my $Subject_Tmp11=$Art_Type1;
my $Subject_Tmp12=$Art_Type1;
my $Subject_Tmp13=$Art_Type1;
my $Subject_Tmp14=$Art_Type1;
my $Subject_Tmp15=$Art_Type1;
my $Subject_Tmp16=$Art_Type1;
my $Subject_Tmp17=$Art_Type1;
my $Subject_Tmp18=$Art_Type1;
my $Subject_Tmp19=$Art_Type1;
my $Subject_Tmp20=$Art_Type1;
my $Subject_Tmp21=$Art_Type1;
my $Subject_Tmp22=$Art_Type1;
my $Subject_Tmp23=$Art_Type1;
my $Subject_Tmp24=$Art_Type1;
my $Subject_Tmp25=$Art_Type1;
my $Subject_Tmp26=$Art_Type1;
my $Subject_Tmp27=$Art_Type1;
my $Subject_Tmp28=$Art_Type1;
my $Subject_Tmp29=$Art_Type1;
my $Subject_Tmp30=$Art_Type1;
my $Subject_Tmp31=$Art_Type1;
my $Subject_Tmp32=$Art_Type1;
my $Subject_Tmp33=$Art_Type1;
my $Subject_Tmp34=$Art_Type1;
my $Subject_Tmp35=$Art_Type1;
my $Subject_Tmp36=$Art_Type1;
my $Subject_Tmp37=$Art_Type1;
my $Subject_Tmp38=$Art_Type1;
my $Subject_Tmp39=$Art_Type1;
my $Subject_Tmp40=$Art_Type1;
my $Subject_Tmp41=$Art_Type1;
my $Subject_Tmp42=$Art_Type1;
my $Subject_Tmp43=$Art_Type1;
my $Subject_Tmp44=$Art_Type1;
my $Subject_Tmp45=$Art_Type1;
my $Subject_Tmp46=$Art_Type1;
my $Subject_Tmp47=$Art_Type1;
my $Subject_Tmp48=$Art_Type1;
my $Subject_Tmp49=$Art_Type1;
my $Subject_Tmp50=$Art_Type1;
my $Subject_Tmp51=$Art_Type1;
my $Subject_Tmp52=$Art_Type1;
my $Subject_Tmp53=$Art_Type1;
my $Subject_Tmp54=$Art_Type1;
my $Subject_Tmp55=$Art_Type1;
my $Subject_Tmp56=$Art_Type1;
my $Subject_Tmp57=$Art_Type1;
my $Subject_Tmp58=$Art_Type1;
my $Subject_Tmp59=$Art_Type1;
my $Subject_Tmp60=$Art_Type1;
my $Subject_Tmp61=$Art_Type1;
my $Subject_Tmp62=$Art_Type1;
my $Subject_Tmp63=$Art_Type1;
my $Subject_Tmp64=$Art_Type1;
my $Subject_Tmp65=$Art_Type1;
my $Subject_Tmp66=$Art_Type1;
my $Subject_Tmp67=$Art_Type1;
my $Subject_Tmp68=$Art_Type1;
my $Subject_Tmp69=$Art_Type1;
my $Subject_Tmp70=$Art_Type1;
my $Subject_Tmp71=$Art_Type1;
my $Subject_Tmp72=$Art_Type1;
my $Subject_Tmp73=$Art_Type1;
my $Subject_Tmp74=$Art_Type1;
my $Subject_Tmp75=$Art_Type1;
my $Subject_Tmp76=$Art_Type1;
my $Subject_Tmp77=$Art_Type1;
my $Subject_Tmp78=$Art_Type1;
my $Subject_Tmp79=$Art_Type1;
my $Subject_Tmp80=$Art_Type1;
my $Subject_Tmp81=$Art_Type1;
my $Subject_Tmp82=$Art_Type1;
my $Subject_Tmp83=$Art_Type1;
my $Subject_Tmp84=$Art_Type1;
my $Subject_Tmp85=$Art_Type1;
my $Subject_Tmp86=$Art_Type1;
my $Subject_Tmp87=$Art_Type1;
my $Subject_Tmp88=$Art_Type1;
my $Subject_Tmp89=$Art_Type1;
my $Subject_Tmp90=$Art_Type1;
my $Subject_Tmp91=$Art_Type1;
my $Subject_Tmp92=$Art_Type1;
my $Subject_Tmp93=$Art_Type1;
my $Subject_Tmp94=$Art_Type1;
my $Subject_Tmp95=$Art_Type1;
my $Subject_Tmp96=$Art_Type1;
my $Subject_Tmp97=$Art_Type1;
my $Subject_Tmp98=$Art_Type1;
my $Subject_Tmp99=$Art_Type1;
my $Subject_Tmp100=$Art_Type1;
my $Subject_Tmp101=$Art_Type1;
my $Subject_Tmp102=$Art_Type1;
my $Subject_Tmp103=$Art_Type1;
my $Subject_Tmp104=$Art_Type1;
my $Subject_Tmp105=$Art_Type1;
my $Subject_Tmp106=$Art_Type1;
my $Subject_Tmp107=$Art_Type1;
my $Subject_Tmp108=$Art_Type1;
my $Subject_Tmp109=$Art_Type1;
my $Subject_Tmp110=$Art_Type1;
my $Subject_Tmp111=$Art_Type1;
my $Subject_Tmp112=$Art_Type1;
my $Subject_Tmp113=$Art_Type1;
my $Subject_Tmp114=$Art_Type1;
my $Subject_Tmp115=$Art_Type1;
my $Subject_Tmp116=$Art_Type1;
my $Subject_Tmp117=$Art_Type1;
my $Subject_Tmp118=$Art_Type1;
my $Subject_Tmp119=$Art_Type1;
my $Subject_Tmp120=$Art_Type1;
my $Subject_Tmp121=$Art_Type1;
my $Subject_Tmp122=$Art_Type1;
my $Subject_Tmp123=$Art_Type1;
my $Subject_Tmp124=$Art_Type1;
my $Subject_Tmp125=$Art_Type1;
my $Subject_Tmp126=$Art_Type1;
my $Subject_Tmp127=$Art_Type1;
my $Subject_Tmp128=$Art_Type1;
my $Subject_Tmp129=$Art_Type1;
my $Subject_Tmp130=$Art_Type1;
my $Subject_Tmp131=$Art_Type1;
my $Subject_Tmp132=$Art_Type1;
my $Subject_Tmp133=$Art_Type1;
my $Subject_Tmp134=$Art_Type1;
my $Subject_Tmp135=$Art_Type1;
my $Subject_Tmp136=$Art_Type1;
my $Subject_Tmp137=$Art_Type1;
my $Subject_Tmp138=$Art_Type1;
my $Subject_Tmp139=$Art_Type1;
my $Subject_Tmp140=$Art_Type1;
my $Subject_Tmp141=$Art_Type1;
my $Subject_Tmp142=$Art_Type1;
my $Subject_Tmp143=$Art_Type1;
my $Subject_Tmp144=$Art_Type1;
my $Subject_Tmp145=$Art_Type1;
my $Subject_Tmp146=$Art_Type1;
my $Subject_Tmp147=$Art_Type1;
my $Subject_Tmp148=$Art_Type1;
my $Subject_Tmp149=$Art_Type1;
my $Subject_Tmp150=$Art_Type1;
my $Subject_Tmp151=$Art_Type1;
my $Subject_Tmp152=$Art_Type1;
my $Subject_Tmp153=$Art_Type1;
my $Subject_Tmp154=$Art_Type1;
my $Subject_Tmp155=$Art_Type1;

my $Subject_Tmp211=$Art_Type1;

#if($Art_Type1=~m{\[$Art_Subject\]}gsi)
#{

if($Subject_Tmp1=~m{\nArticleTitle=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMArticleTitle>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Article_Title style is must $Subject_Type type in $Journal");
}

}

if($Subject_Tmp2=~m{\nArticleTitle=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMArticleTitle>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Article_Title style no needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp3=~m{\nSubTitle=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMArticleSubtitle>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Article_Subtitle style is must $Subject_Type type in $Journal");
}

}

if($Subject_Tmp4=~m{\nSubTitle=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMArticleSubtitle>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Article_Subtitle style no needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp5=~m{\nRunningHeadRecto=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMRunningHeadRecto>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_RunningHead_Recto style is must $Subject_Type type in $Journal");
}

}

if($Subject_Tmp6=~m{\nRunningHeadRecto=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMRunningHeadRecto>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_RunningHead_Recto style no needed for $Subject_Type type in $Journal");
}

}


if($Subject_Tmp7=~m{\nRunningHeadVerso=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMRunningHeadVerso>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_RunningHead_Verso style is must $Subject_Type type in $Journal");
}

}

if($Subject_Tmp8=~m{\nRunningHeadVerso=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMRunningHeadVerso>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_RunningHead_Verso style no needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp9=~m{\nAuthor=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMAuthors>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Authors style is must $Subject_Type type in $Journal");
}

}

if($Subject_Tmp10=~m{\nAuthor=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMAuthors>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Authors style no needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp11=~m{\nAffiliation=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMAffiliations>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Affiliations style is must $Subject_Type type in $Journal");
}

}

if($Subject_Tmp12=~m{\nAffiliation=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMAffiliations>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Affiliations style no needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp13=~m{\nCorrespondence=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMNoteCorrespondence>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FMNoteCorrespondence style is must $Subject_Type type in $Journal");
}

}

if($Subject_Tmp14=~m{\nCorrespondence=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMNoteCorrespondence>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FMNoteCorrespondence style no needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp15=~m{\nAbstract=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMAbstract}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Abstract must for $Subject_Type type in $Journal");
}

}


if($Subject_Tmp15=~m{\nAbstract_Count=([^\n]+)\n}gsi)
{
my $Abstract_Count=$1;
my $FM_Article_Title1=$Tmp;

my $FM_Abstract=$Tmp;

my @Abstract;

while($FM_Abstract=~m{<(FMAbstractParaFlushLeft|FMAbstractParaInd)>(.*?)<\/FMAbstractParaFlushLeft|FMAbstractParaInd>}gsi)
{
	push(@Abstract,$2);
}

my $Final_Abstract=join("\n",@Abstract);

$Final_Abstract=~s{<([^\>]+)\>}{}gsi;

my $Count=$Final_Abstract=~s{(\s)}{$1}gsi;


if($Count > $Abstract_Count)
{

my $FM_Abstract1=$Tmp;

if($FM_Abstract1!~m{AQ\: Per style, the abstract length should not be over $Abstract_Count words}gsi)
{

	$Err="1";
push(@Error,"\~Para No:1 Col No:1 Per style, $Subject_Type articles should have $Abstract_Count words. If it exceeds, please raise the AQ.");

	
}

}
}


if($Subject_Tmp16=~m{\nAbstract=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMAbstract}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Abstract content no needed for $Subject_Type type in $Journal");
}

}


if($Subject_Tmp17=~m{\nAbstract_Title=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMAbstractHead>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Abstract_Head style needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp18=~m{\nAbstract_Title=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMAbstractHead>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Abstract_Head style not allowed for $Subject_Type types in $Journal journal");
}

}

if($Subject_Tmp19=~m{\nAbstract_Structured_Title=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;




if($FM_Article_Title1!~m{<fmabstractsectionHeadrunIn>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 fmabstractsectionHeadrunIn style needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp20=~m{\nAbstract_Structured_Title=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<fmabstractsectionHeadrunIn>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 fmabstractsectionHeadrunIn style not allowed for $Subject_Type type in $Journal journal");
}

}


if($Subject_Tmp122=~m{\nAbstract_UnStructured=No}gsi)
{

my $FM_Article_Title1=$Tmp;

$FM_Article_Title1=~s{<bold>(.*?)<\/bold>}{$1}gsi;
$FM_Article_Title1=~s{<italic>(.*?)<\/italic>}{$1}gsi;
$FM_Article_Title1=~s{<bold\/>}{$1}gsi;
$FM_Article_Title1=~s{<italic\/>}{$1}gsi;

while($FM_Article_Title1=~m{<([^\>]+)\><(FMAbstractParaFlushLeft|FMAbstractParaInd)>(.*?)<\/FMAbstractParaFlushLeft|FMAbstractParaInd>}gsi)
{
	my $Title=$3;

	my $Paragraph_No=$1;
	  

if($Title!~m{<fmabstractsectionHeadrunIn>}gsi)
{
	
$Err="1";

push(@Error,"\~Para No:$Paragraph_No Col No:1 fmabstractsectionHeadrunIn style is missing. UnStructured abstract for $Subject_Type type in $Journal");


}

}
}

if($Subject_Tmp122=~m{\nAbstract_UnStructured=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

$FM_Article_Title1=~s{<bold>(.*?)<\/bold>}{$1}gsi;
$FM_Article_Title1=~s{<italic>(.*?)<\/italic>}{$1}gsi;
$FM_Article_Title1=~s{<bold\/>}{$1}gsi;
$FM_Article_Title1=~s{<italic\/>}{$1}gsi;

while($FM_Article_Title1=~m{<([^\>]+)\><(FMAbstractParaFlushLeft|FMAbstractParaInd)>(.*?)<\/FMAbstractParaFlushLeft|FMAbstractParaInd>}gsi)
{
	my $Title=$3;

	my $Paragraph_No=$1;
	  

if($Title=~m{<fmabstractsectionHeadrunIn>}gsi)
{
	
$Err="1";

push(@Error,"\~Para No:$Paragraph_No Col No:1 fmabstractsectionHeadrunIn is not allowed. Structured abstract for $Subject_Type type in $Journal");


}

}
}


if($Subject_Tmp211=~m{\nAbstract_Structured_Title_Seperator=Endwithdot}gsi)
{

my $FM_Article_Title1=$Tmp;

$FM_Article_Title1=~s{<bold>(.*?)<\/bold>}{$1}gsi;
$FM_Article_Title1=~s{<italic>(.*?)<\/italic>}{$1}gsi;
$FM_Article_Title1=~s{<bold\/>}{$1}gsi;
$FM_Article_Title1=~s{<italic\/>}{$1}gsi;

while($FM_Article_Title1=~m{<fmabstractsectionHeadrunIn>(.*?)<\/fmabstractsectionHeadrunIn>}gsi)
{
	my $Title=$1;

	

		  

if($Title!~m{\.(\s?)$}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Abstract section headrun in should end with dot for $Subject_Type type in $Journal");
}

}
}


if($Subject_Tmp22=~m{\nAbstract_Structured_Title_Seperator=Endwithcolon}gsi)
{

my $FM_Article_Title1=$Tmp;

$FM_Article_Title1=~s{<bold>(.*?)<\/bold>}{$1}gsi;
$FM_Article_Title1=~s{<italic>(.*?)<\/italic>}{$1}gsi;
$FM_Article_Title1=~s{<bold\/>}{$1}gsi;
$FM_Article_Title1=~s{<italic\/>}{$1}gsi;

while($FM_Article_Title1=~m{<fmabstractsectionHeadrunIn>(.*?)<\/fmabstractsectionHeadrunIn>}gsi)
{
	my $Title=$1;

	if($Title!~m{\:(\s?)$}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Abstract section headrun in should end with colon for $Subject_Type type in $Journal");
}

}
}

if($Subject_Tmp23=~m{\nAbstract_Title_Text=([^\n]+)\n}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Keyword_Title=$1;

if($FM_Article_Title1!~m{<FMAbstractHead>$Keyword_Title<\/FMAbstractHead>}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the Abstract title. It should be $Keyword_Title for $Subject_Type type in $Journal");
}

}






if($Subject_Tmp24=~m{\nLay_Summary_Abstract=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMLayAbstract}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Lay Abstract must for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp25=~m{\nLay_Summary_Abstract=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMLayAbstract}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Lay Abstract content no needed for $Subject_Type type in $Journal");
}

}


if($Subject_Tmp26=~m{\nLay_Summary_Abstract_Title=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMLayAbstractHead>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Lay_Abstract_Head style needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp27=~m{\nLay_Summary_Abstract_Title=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMLayAbstractHead>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Lay_Abstract_Head style no needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp28=~m{\nLay_Summary_Abstract_Text=([^\n]+)\n}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Keyword_Title=$1;

if($FM_Article_Title1!~m{<FMLayAbstractHead>$Keyword_Title<\/FMLayAbstractHead>}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the Lay summary title Abstract title. It should be $Keyword_Title for $Subject_Type type in $Journal");
}

}


if($Subject_Tmp29=~m{\nKeywords=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<Keywords}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Keywords must for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp30=~m{\nKeywords=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<Keywords}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Keywords content not needed for $Subject_Type type in $Journal");
}

}



if($Subject_Tmp31=~m{\nKeywords_Title=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<keywordsHead>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 keywordsHead style needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp32=~m{\nKeywords_Title=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<keywordsHead>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 keywordsHead style no needed for $Subject_Type type in $Journal");
}

}


if($Subject_Tmp33=~m{\nKeywords_Title_Text=([^\n]+)\n}gsi)
{
my $Keyword_Title=$1;
my $FM_Article_Title1=$Tmp;

$FM_Article_Title1=~s{<bold>(.*?)<\/bold>}{$1}gsi;
$FM_Article_Title1=~s{<italic>(.*?)<\/italic>}{$1}gsi;
$FM_Article_Title1=~s{<bold\/>}{$1}gsi;
$FM_Article_Title1=~s{<italic\/>}{$1}gsi;






if($FM_Article_Title1!~m{<keywordsHead>\Q$Keyword_Title\E(\s?)<\/keywordsHead>}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the keyword title. It should be $Keyword_Title for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp34=~m{\nKeywords_End_with_Dot=Yes\n}gsi)
{

my $Keywords=$Tmp;

my $Keyword_Seperator=$1;

#$Keywords=~s{<keyword>(.*?)<\/keyword>}{}gsi;
$Keywords=~s{<keywordsHead>(.*?)<\/keywordsHead>}{}gsi;
#$Keywords=~s{$Keyword_Seperator}{}gsi;

if($Keywords!~m{\.(\s?)</Keywords>}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Keyword should end with dot for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp35=~m{\nKeywords_End_with_Dot=No\n}gsi)
{

my $Keywords=$Tmp;

my $Keyword_Seperator=$1;

$Keywords=~s{<keyword>(.*?)<\/keyword>}{}gsi;
$Keywords=~s{<keywordsHead>(.*?)<\/keywordsHead>}{}gsi;
#$Keywords=~s{$Keyword_Seperator}{}gsi;


if($Keywords=~m{\.(\s?)</Keywords>}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Keyword should not end with dot for $Subject_Type type in $Journal");
}

}


if($Subject_Tmp36=~m{\nKeywords_Seprator=([^\n]+)\n}gsi)
{

my $Keywords=$Tmp;

my $Keyword_Seperator=$1;

my $Key1=$Tmp;

if($Key1=~m{<keywords>(.*?)<\/keywords>}gsi)
{
my $Key=$1;
$Key=~s{<keyword>(.*?)<\/keyword>}{}gsi;
$Key=~s{<keywordsHead>(.*?)<\/keywordsHead>}{}gsi;
if($Key!~m{$Keyword_Seperator}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Keyword must have seperator $Keyword_Seperator for $Subject_Type type in $Journal");
}

}
}


if($Subject_Tmp37=~m{\nFMNoteGuestEditor=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMNoteGuestEditor>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FMNoteGuestEditor must for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp38=~m{\nFMNoteGuestEditor=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMNoteGuestEditor>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FMNoteGuestEditor content not needed for $Subject_Type type in $Journal");
}

}



if($Subject_Tmp39=~m{\nFMNoteGuestEditor_Title_Text=([^\n]+)\n}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Keyword_Title=$1;

if($FM_Article_Title1!~m{<FMNoteGuestEditor>$Keyword_Title}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the Guest editor title. It should be $Keyword_Title for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp40=~m{\nFMNoteAuthorBio=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMNoteAuthorBio>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FMNoteAuthorBio must for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp41=~m{\nFMNoteAuthorBio=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMNoteAuthorBio}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FMNoteAuthorBio content not needed for $Subject_Type type in $Journal");
}

}


if($Subject_Tmp42=~m{\nGraphical_Abstract=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMGrapAbstract}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Graphical_Abstract must for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp43=~m{\nGraphical_Abstract=No}gsi)
{

my $FM_Article_Title1=$Tmp;


if($FM_Article_Title1=~m{<FMGrapAbstract}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Graphical_Abstract not needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp44=~m{\nGraphical_Abstract_Title_Text=([^\n]+)\n}gsi)
{

my $Graphical_Abstract=$1;	

my $FM_Article_Title1=$Tmp;



if($FM_Article_Title1!~m{<FMGrapAbstract([^\>]*)\>$Graphical_Abstract}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FMGrapAbstract title should be $Graphical_Abstract for  $Subject_Type type in $Journal");
}

}




if($Subject_Tmp45=~m{\nTrans_Abstract=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMTransAbstract}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Trans_Abstract must for $Subject_Type type in $Journal");
}

}
if($Subject_Tmp46=~m{\nTrans_Abstract=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMTransAbstract}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Trans_Abstract no needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp47=~m{\nTrans_Abstract_Head=yes}gsi)
{

my $Graphical_Abstract=$1;	

my $FM_Article_Title1=$Tmp;



if($FM_Article_Title1=~m{<FMTransAbstract([^\>]*)\>$Graphical_Abstract(.*?)<\/FMGrapAbstract\1>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FMGrapAbstract content not needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp48=~m{\nTrans_Keywords=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<KeywordsTrans}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 KeywordsTrans must for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp49=~m{\nTrans_Keywords=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<KeywordsTrans}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Keywords content not needed for $Subject_Type type in $Journal");
}

}



if($Subject_Tmp50=~m{\nTrans_Keywords_Seprator=([^\n]+)\n}gsi)
{

my $Keywords=$Tmp;

my $Keyword_Seperator=$1;
if($Keywords=~m{<KeywordsTrans>(.*?)<\/KeywordsTrans>}gsi)
{
my $Key=$1;
$Key=~s{<keyword>(.*?)<\/keyword>}{}gsi;
$Key=~s{<keywordsHead>(.*?)<\/keywordsHead>}{}gsi;
$Keywords=~s{<keyword>(.*?)<\/keyword>}{}gsi;
$Keywords=~s{<keywordsHead>(.*?)<\/keywordsHead>}{}gsi;
#$Keywords=~s{$Keyword_Seperator}{}gsi;


if($Keywords!~m{$Keyword_Seperator}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the Trans keyword seperator. It should be $Keyword_Seperator for $Subject_Type type in $Journal");
}
}

}

if($Subject_Tmp51=~m{\nAbbreviations=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<Abbreviations}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Abbreviations must for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp52=~m{\nAbbreviations=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<Abbreviations}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Abbreviations content not needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp53=~m{\nAbbreviations_Title_Text=([^\n]+)\n}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Keyword_Title=$1;

if($FM_Article_Title1!~m{<abbreviationsHead>$Keyword_Title<\/abbreviationsHead>}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the abbreviations title. It should be $Keyword_Title for $Subject_Type type in $Journal");
}

}


if($Subject_Tmp123=~m{\nHeadA=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<([^\>]+)\><HeadA>(.*?)<\/HeadA>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadA Style is must for $Subject_Type type in $Journal");
	
}

}


if($Subject_Tmp124=~m{\nHeadB=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<([^\>]+)\><HeadB>(.*?)<\/HeadB>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadB Style is must for $Subject_Type type in $Journal");
	
}

}

if($Subject_Tmp125=~m{\nHeadC=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<([^\>]+)\><HeadC>(.*?)<\/HeadC>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadC Style is must for $Subject_Type type in $Journal");
	
}

}

if($Subject_Tmp125=~m{\nHeadD=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<([^\>]+)\><HeadD>(.*?)<\/HeadD>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadD Style is must for $Subject_Type type in $Journal");
	
}

}

if($Subject_Tmp126=~m{\nHeadE=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<([^\>]+)\><HeadE>(.*?)<\/HeadE>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadE Style is must for $Subject_Type type in $Journal");
	
}

}

if($Subject_Tmp127=~m{\nHeadF=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<([^\>]+)\><HeadF>(.*?)<\/HeadF>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadF Style is must for $Subject_Type type in $Journal");
	
}

}

if($Subject_Tmp128=~m{\nHeadA=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadA>(.*?)<\/HeadA>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadA Style is not allowed for $Subject_Type type in $Journal");
	
}

}


if($Subject_Tmp129=~m{\nHeadB=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadB>(.*?)<\/HeadB>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadB Style is not allowed for $Subject_Type type in $Journal");
	
}

}

if($Subject_Tmp130=~m{\nHeadC=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadC>(.*?)<\/HeadC>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadC Style is not allowed for $Subject_Type type in $Journal");
	
}

}

if($Subject_Tmp131=~m{\nHeadD=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadD>(.*?)<\/HeadD>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadD Style is not allowed for $Subject_Type type in $Journal");
	
}

}

if($Subject_Tmp132=~m{\nHeadE=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadE>(.*?)<\/HeadE>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadE Style is not allowed for $Subject_Type type in $Journal");
	
}

}

if($Subject_Tmp133=~m{\nHeadF=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadF>(.*?)<\/HeadF>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadF Style is not allowed for $Subject_Type type in $Journal");
	
}

}

if($Subject_Tmp134=~m{\nHeadArunIn=Yes}gsi)
{

	my $FM_Article_Title1=$Tmp;

	if($FM_Article_Title1!~m{<([^\>]+)\><([^>]+)\><HeadArunIn>(.*?)<\/HeadArunIn>}gsi)
	{

		my $Paragraph_No=$1;

		my $Label=$2;


		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadArunIn Style is must for $Subject_Type type in $Journal");

	}

}


if($Subject_Tmp135=~m{\nHeadBrunIn=Yes}gsi)
{

	my $FM_Article_Title1=$Tmp;

	if($FM_Article_Title1!~m{<([^\>]+)\><([^>]+)\><HeadBrunIn>(.*?)<\/HeadBrunIn>}gsi)
	{

		my $Paragraph_No=$1;

		my $Label=$2;


		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadBrunIn Style is must for $Subject_Type type in $Journal");

	}

}

if($Subject_Tmp136=~m{\nHeadCrunIn=Yes}gsi)
{

	my $FM_Article_Title1=$Tmp;

	if($FM_Article_Title1!~m{<([^\>]+)\><([^>]+)\><HeadCrunIn>(.*?)<\/HeadCrunIn>}gsi)
	{

		my $Paragraph_No=$1;

		my $Label=$2;


		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadCrunIn Style is must for $Subject_Type type in $Journal");

	}

}

if($Subject_Tmp137=~m{\nHeadDrunIn=Yes}gsi)
{

	my $FM_Article_Title1=$Tmp;

	if($FM_Article_Title1!~m{<([^\>]+)\><([^>]+)\><HeadDrunIn>(.*?)<\/HeadDrunIn>}gsi)
	{

		my $Paragraph_No=$1;

		my $Label=$2;


		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadDrunIn Style is must for $Subject_Type type in $Journal");

	}

}

if($Subject_Tmp138=~m{\nHeadErunIn=Yes}gsi)
{

	my $FM_Article_Title1=$Tmp;

	if($FM_Article_Title1!~m{<([^\>]+)\><HeadErunIn>(.*?)<\/HeadErunIn>}gsi)
	{

		my $Paragraph_No=$1;

		my $Label=$2;


		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadErunIn Style is must for $Subject_Type type in $Journal");

	}

}

if($Subject_Tmp139=~m{\nHeadFrunIn=Yes}gsi)
{

	my $FM_Article_Title1=$Tmp;

	if($FM_Article_Title1!~m{<([^\>]+)\><HeadFrunIn>(.*?)<\/HeadFrunIn>}gsi)
	{

		my $Paragraph_No=$1;

		my $Label=$2;


		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadFrunIn Style is must for $Subject_Type type in $Journal");

	}

}

if($Subject_Tmp140=~m{\nHeadArunIn=No}gsi)
{

	my $FM_Article_Title1=$Tmp;

	while($FM_Article_Title1=~m{<([^\>]+)\><([^>]+)\><HeadArunIn>(.*?)<\/HeadArunIn>}gsi)
	{

		my $Paragraph_No=$1;

		my $Label=$2;


		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadArunIn Style is not allowed for $Subject_Type type in $Journal");

	}

}


if($Subject_Tmp141=~m{\nHeadBrunIn=No}gsi)
{

	my $FM_Article_Title1=$Tmp;

	while($FM_Article_Title1=~m{<([^\>]+)\><([^>]+)\><HeadBrunIn>(.*?)<\/HeadBrunIn>}gsi)
	{

		my $Paragraph_No=$1;

		my $Label=$2;


		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadBrunIn Style is not allowed for $Subject_Type type in $Journal");

	}

}

if($Subject_Tmp142=~m{\nHeadCrunIn=No}gsi)
{

	my $FM_Article_Title1=$Tmp;

	while($FM_Article_Title1=~m{<([^\>]+)\><([^>]+)\><HeadCrunIn>(.*?)<\/HeadCrunIn>}gsi)
	{

		my $Paragraph_No=$1;

		my $Label=$2;


		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadCrunIn Style is not allowed for $Subject_Type type in $Journal");

	}

}

if($Subject_Tmp143=~m{\nHeadDrunIn=No}gsi)
{

	my $FM_Article_Title1=$Tmp;

	while($FM_Article_Title1=~m{<([^\>]+)\><([^>]+)\><HeadDrunIn>(.*?)<\/HeadDrunIn>}gsi)
	{

		my $Paragraph_No=$1;

		my $Label=$2;


		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadDrunIn Style is not allowed for $Subject_Type type in $Journal");

	}

}

if($Subject_Tmp144=~m{\nHeadErunIn=No}gsi)
{

	my $FM_Article_Title1=$Tmp;

	while($FM_Article_Title1=~m{<([^\>]+)\><([^>]+)\><HeadErunIn>(.*?)<\/HeadErunIn>}gsi)
	{

		my $Paragraph_No=$1;

		my $Label=$2;


		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadErunIn Style is not allowed for $Subject_Type type in $Journal");

	}

}

if($Subject_Tmp145=~m{\nHeadFrunIn=No}gsi)
{

	my $FM_Article_Title1=$Tmp;

	while($FM_Article_Title1=~m{<([^\>]+)\><([^>]+)\><HeadFrunIn>(.*?)<\/HeadFrunIn>}gsi)
	{

		my $Paragraph_No=$1;

		my $Label=$2;


		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadFrunIn Style is not allowed for $Subject_Type type in $Journal");

	}

}



if($Subject_Tmp54=~m{\nHeadA_Label=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadA>(.*?)<\/HeadA>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label!~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is must for HeadA of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp55=~m{\nHeadA_Label=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadA>(.*?)<\/HeadA>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label=~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style not needed for HeadA of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp56=~m{\nHeadB_Label=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadB>(.*?)<\/HeadB>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label!~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is must for HeadB of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp57=~m{\nHeadB_Label=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadB>(.*?)<\/HeadB>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label=~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style not needed for HeadB of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp58=~m{\nHeadC_Label=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadC>(.*?)<\/HeadC>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label!~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is must for HeadC of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp59=~m{\nHeadC_Label=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadC>(.*?)<\/HeadC>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label=~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style not needed for HeadC of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp60=~m{\nHeadD_Label=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadD>(.*?)<\/HeadD>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label!~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is must for HeadD of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp61=~m{\nHeadD_Label=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadD>(.*?)<\/HeadD>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label=~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style not needed for HeadD of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp62=~m{\nHeadE_Label=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadE>(.*?)<\/HeadE>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label!~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is must for HeadE of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp63=~m{\nHeadE_Label=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadE>(.*?)<\/HeadE>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label=~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style not needed for HeadE of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp64=~m{\nHeadF_Label=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadF>(.*?)<\/HeadF>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label!~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is must for HeadF of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp65=~m{\nHeadF_Label=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><HeadF>(.*?)<\/HeadF>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label=~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style not needed for HeadF of $Subject_Type type in $Journal");
	}
}

}



if($Subject_Tmp66=~m{\nheadArunIn_Label=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headArunIn>(.*?)<\/headArunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label!~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is must for headArunIn of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp67=~m{\nheadArunIn_Label=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headArunIn>(.*?)<\/headArunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label=~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style not needed for headArunIn of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp68=~m{\nheadBrunIn_Label=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headBrunIn>(.*?)<\/headBrunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label!~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is must for headBrunIn of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp69=~m{\nheadBrunIn_Label=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headBrunIn>(.*?)<\/headBrunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label=~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style not needed for headBrunIn of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp70=~m{\nheadCrunIn_Label=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headCrunIn>(.*?)<\/headCrunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label!~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is must for headCrunIn of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp71=~m{\nheadCrunIn_Label=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headCrunIn>(.*?)<\/headCrunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label=~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style not needed for headCrunIn of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp72=~m{\nheadDrunIn_Label=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headDrunIn>(.*?)<\/headDrunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label!~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is must for headDrunIn of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp73=~m{\nheadErunIn_Label=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headErunIn>(.*?)<\/headErunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label=~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style not needed for headErunIn of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp74=~m{\nheadErunIn_Label=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headErunIn>(.*?)<\/headErunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label!~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is must for headErunIn of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp75=~m{\nheadErunIn_Label=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headErunIn>(.*?)<\/headErunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label=~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style not needed for headErunIn of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp76=~m{\nheadFrunIn_Label=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headFrunIn>(.*?)<\/headFrunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label!~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is must for headFrunIn of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp77=~m{\nheadFrunIn_Label=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headFrunIn>(.*?)<\/headFrunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label=~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style not needed for headFrunIn of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp78=~m{\nheadFrunIn_Label=No}gsi)
{

my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headFrunIn>(.*?)<\/headFrunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label=~m{^<label>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style not needed for headFrunIn of $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp79=~m{\nHeadArunIn_End_with_Seprator=([^\n]+)\n}gsi)
{
my $Seperator=$1;
my $FM_Article_Title1=$Tmp;


while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headArunIn>(.*?)<\/headArunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label!~m{$Seperator(\s?)$}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the HeadArunin end with $Seperator for $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp80=~m{\nHeadBrunIn_End_with_Seprator=([^\n]+)\n}gsi)
{
my $Seperator=$1;
my $FM_Article_Title1=$Tmp;


while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headBrunIn>(.*?)<\/headBrunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label!~m{$Seperator(\s?)$}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the HeadBrunin end with $Seperator for $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp81=~m{\nHeadCrunIn_End_with_Seprator=([^\n]+)\n}gsi)
{
my $Seperator=$1;
my $FM_Article_Title1=$Tmp;


while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headCrunIn>(.*?)<\/headCrunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label!~m{$Seperator(\s?)$}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the HeadCrunin end with $Seperator for $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp82=~m{\nHeadDrunIn_End_with_Seprator=([^\n]+)\n}gsi)
{
my $Seperator=$1;
my $FM_Article_Title1=$Tmp;


while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headDrunIn>(.*?)<\/headDrunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label!~m{$Seperator(\s?)$}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the HeadDrunin end with $Seperator for $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp83=~m{\nHeadErunIn_End_with_Seprator=([^\n]+)\n}gsi)
{
my $Seperator=$1;
my $FM_Article_Title1=$Tmp;


while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headErunIn>(.*?)<\/headErunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label!~m{$Seperator(\s?)$}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the HeadErunin end with $Seperator for $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp84=~m{\nHeadFrunIn_End_with_Seprator=([^\n]+)\n}gsi)
{
my $Seperator=$1;
my $FM_Article_Title1=$Tmp;


while($FM_Article_Title1=~m{<([^\>]+)\><([^\>]+)\><headFrunIn>(.*?)<\/headFrunIn>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label!~m{$Seperator(\s?)$}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the HeadFrunin end with $Seperator for $Subject_Type type in $Journal");
	}
}

}




if($Subject_Tmp85=~m{\nTable_Label=([^\n]+)\n}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Table_Label=$1;


while($FM_Article_Title1=~m{<([^\>]+)\><Tablecaption>(.*?)<\/Tablecaption>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	$Label=~s{<bold>(.*?)<\/bold>}{$1}gsi;
	$Label=~s{<italic>(.*?)<\/italic>}{$1}gsi;
	$Label=~s{<bold\/>}{}gsi;
	$Label=~s{<italic\/>}{}gsi;
	
	
	
	if($Label!~m{^<TableNumber>$Table_Label}gs)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Table number label should be $Table_Label for $Subject_Type type in $Journal");
	}
}

}


if($Subject_Tmp86=~m{\nTable_Label_End_with_Dot=Yes\n}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Table_Label=$1;

while($FM_Article_Title1=~m{<([^\>]+)\><Tablecaption>(.*?)<\/Tablecaption>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	$Label=~s{<bold>(.*?)<\/bold>}{$1}gsi;
	$Label=~s{<italic>(.*?)<\/italic>}{$1}gsi;
	$Label=~s{<bold\/>}{}gsi;
	$Label=~s{<italic\/>}{}gsi;
	
	

	$Label=~s{<query>(.*?)<\/query>}{}gsi;
	$Label=~s{<query\/>}{}gsi;
	$Label=~s{<\/tablenumber>([\.\,\s]+)<tablenumber>}{$1}gsi;

	if($Label!~m{\.(\s?)<\/tablenumber>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Table number should end with dot for $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp87=~m{\nTable_Label_End_with_Dot=No\n}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Table_Label=$1;

while($FM_Article_Title1=~m{<([^\>]+)\><Tablecaption>(.*?)<\/Tablecaption>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	$Label=~s{<bold>(.*?)<\/bold>}{$1}gsi;
	$Label=~s{<italic>(.*?)<\/italic>}{$1}gsi;
	$Label=~s{<bold\/>}{}gsi;
	$Label=~s{<italic\/>}{}gsi;
	
	

	$Label=~s{<query>(.*?)<\/query>}{}gsi;
	$Label=~s{<query\/>}{}gsi;
	$Label=~s{<\/tablenumber>([\.\,\s]+)<tablenumber>}{$1}gsi;

	if($Label=~m{\.(\s?)<\/tablenumber>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Table number should not end with label for $Subject_Type type in $Journal");
	}
}

}
if($Subject_Tmp88=~m{\nTable_Caption_End_with_Dot=Yes\n}gsi)
{

while($FM_Article_Title1=~m{<([^\>]+)\><Tablecaption>(.*?)<\/Tablecaption>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label!~m{\.(\s?)}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Table number should end with label for $Subject_Type type in $Journal");
	}
}

}


if($Subject_Tmp89=~m{\nFigure_Label=([^\n]+)\n}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Figure_Label=$1;

while($FM_Article_Title1=~m{<([^\>]+)\><Figurecaption>(.*?)<\/Figurecaption>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;
	$Label=~s{<bold>(.*?)<\/bold>}{$1}gsi;
	$Label=~s{<italic>(.*?)<\/italic>}{$1}gsi;
	$Label=~s{<bold\/>}{}gsi;
	$Label=~s{<italic\/>}{}gsi;
	
	

	$Label=~s{<query>(.*?)<\/query>}{}gsi;
	$Label=~s{<query\/>}{}gsi;
	$Label=~s{<\/figurenumber>([\.\,\s]+)<figurenumber>}{$1}gsi;

	if($Label!~m{^<figurenumber>$Figure_Label}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Figure number label should be $Figure_Label for $Subject_Type type in $Journal");
	}



}

}

if($Subject_Tmp90=~m{\nBox_Label=([^\n]+)\n}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Figure_Label=$1;

while($FM_Article_Title1=~m{<([^\>]+)\><BoxTitle>(.*?)<\/BoxTitle>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;
	$Label=~s{<query>(.*?)<\/query>}{}gsi;
	$Label=~s{<query\/>}{}gsi;
	$Label=~s{<\/boxnumber>([\.\,\s]+)<boxnumber>}{$1}gsi;

	$Label=~s{<bold>(.*?)<\/bold>}{$1}gsi;
	$Label=~s{<italic>(.*?)<\/italic>}{$1}gsi;
	$Label=~s{<bold\/>}{}gsi;
	$Label=~s{<italic\/>}{}gsi;
	if($Label!~m{^<boxnumberrunIn>$Figure_Label}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Box number label should be $Figure_Label for $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp91=~m{\nBox_Caption_End_with_Dot=Yes\n}gsi)
{

while($FM_Article_Title1=~m{<([^\>]+)\><Boxtitle>(.*?)<\/Boxtitle>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;
	$Label=~s{<query>(.*?)<\/query>}{}gsi;
	$Label=~s{<query\/>}{}gsi;
	$Label=~s{<\/boxnumber>([\.\,\s]+)<boxnumber>}{$1}gsi;

	if($Label!~m{\.(\s?)}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Box title should end with dot for $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp92=~m{\nFigure_Caption_End_with_Dot=Yes\n}gsi)
{

while($FM_Article_Title1=~m{<([^\>]+)\><Figurecaption>(.*?)<\/Figurecaption>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label!~m{\.(\s?)}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Figure number should end with label for $Subject_Type type in $Journal");
	}
}

}


if($Subject_Tmp93=~m{\nReference_Type_Numbered=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Figure_Label=$1;

while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	$Label=~s{<bold>(.*?)<\/bold>}{$1}gsi;
	$Label=~s{<italic>(.*?)<\/italic>}{$1}gsi;
	

	$Label=~s{}{}gsi;
	$Label=~s{}{}gsi;
	$Label=~s{☒}{}gsi;
	$Label=~s{☑}{}gsi;
	
	

	if($Label!~m{^(.?)<refnumber>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Numbered reference for $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp94=~m{\nReference_Type_Numbered=No}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Figure_Label=$1;

while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	$Label=~s{}{}gsi;
	$Label=~s{☒}{}gsi;
	$Label=~s{☑}{}gsi;

	if($Label=~m{^<refnumber>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Unnumbered reference for $Subject_Type type in $Journal");
	}
}

}



if($Subject_Tmp95=~m{\nSupplementary_Citation=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Figure_Label=$1;

if($FM_Article_Title1!~m{<SupplementaryMaterialXref>}gsi)
{

	
	
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 SupplementaryMaterialXref must for $Subject_Type type in $Journal");
	
}

}

if($Subject_Tmp96=~m{\nSupplementary_Citation=No}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Figure_Label=$1;

if($FM_Article_Title1=~m{<SupplementaryMaterialXref>}gsi)
{

	
	
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 SupplementaryMaterialXref no needed for $Subject_Type type in $Journal");
	
}

}

if($Subject_Tmp97=~m{\nReference_Title=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<EMReferencesHead>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 EM_References_Head style needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp98=~m{\nReference_Title=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<EMReferencesHead>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 EM_References_Head style no needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp99=~m{\nReference_Title_Text=([^\n]+)\n}gsi)
{

	my $Keyword_Title=$1;
my $FM_Article_Title1=$Tmp;



$FM_Article_Title1=~s{<bold>(.*?)<\/bold>}{$1}gsi;

$FM_Article_Title1=~s{<italic>(.*?)<\/italic>}{$2}gsi;



if($FM_Article_Title1!~m{<EMReferencesHead>$Keyword_Title<\/EMReferencesHead>}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the Reference title. It should be $Keyword_Title for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp100=~m{\nReference_Text_End_with_Dot=Yes\n}gsi)
{

while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	

	if($Label!~m{\.(\s?)}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 reference should end with dot $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp101=~m{\nReference_Text_End_with_Dot=No\n}gsi)
{

while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	if($Label=~m{\.(\s?)}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 reference should not end with dot $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp102=~m{\nSeries_Title=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMSeriesTitle>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Series_Title style is must $Subject_Type type in $Journal");
}

}

if($Subject_Tmp103=~m{\nFMSeriesTitle=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMSeriesTitle>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Series_Title style no needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp104=~m{\nSeries_Editor=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<FMSectionEditor>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Section_Editor style is must $Subject_Type type in $Journal");
}

}

if($Subject_Tmp105=~m{\nSeries_Editor=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMSectionEditor>}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Section_Editor style no needed for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp106=~m{\nVideo_Abstract=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1!~m{<Video_Abstract}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Video_Abstract must for $Subject_Type type in $Journal");
}

}

if($Subject_Tmp107=~m{\nVideo_Abstract=No}gsi)
{

my $FM_Article_Title1=$Tmp;

if($FM_Article_Title1=~m{<FMVideoAbstract}gsi)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 FM_Video_Abstract content no needed for $Subject_Type type in $Journal");
}

}



if($Subject_Tmp108=~m{\nET_AL_Formatting=Roman}gsi)
{

my $FM_Article_Title1=$Bi_Tmp;
my $FM_Article_Title2=$Bi_Tmp;



while($FM_Article_Title1=~m{<(bibxref|bibxrefonline|onlinebibxref)>(.*?)<\/\1>}gsi)
{
	my $Italic=$2;
	my $Italic1=$2;

	

if($Italic=~m{<italic>et([\.\s]+)}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 et al should be in roman format for $Subject_Type type in $Journal");
}



while($Italic1=~m{<bold>et([\.\s]+)}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 et al should be in roman format for $Subject_Type type in $Journal");
}

}
}


if($Subject_Tmp109=~m{\nET_AL_Formatting=italic}gsi)
{

my $FM_Article_Title1=$Bi_Tmp;
my $FM_Article_Title2=$Bi_Tmp;

while($FM_Article_Title1=~m{<(bibxref|bibxrefonline|onlinebibxref)>(.*?)<\/\1>}gsi)
{
	my $Italic=$2;
	my $Italic1=$2;

	$Italic=~s{<italic>(.*?)<\/italic>}{}gsi;
	
if($Italic=~m{<bold>et([\.\s]+)}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 et al should be in italic format for $Subject_Type type in $Journal");
}



while($Italic1=~m{et([\.\s]+)}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 et al should be in italic format for $Subject_Type type in $Journal");
}

}
}

if($Subject_Tmp110=~m{\nET_AL_Formatting=bold}gsi)
{

my $FM_Article_Title1=$Bi_Tmp;
my $FM_Article_Title2=$Bi_Tmp;

while($FM_Article_Title1=~m{<(bibxref|bibxrefonline|onlinebibxref)>(.*?)<\/\1>}gsi)
{
	my $Italic=$2;
	my $Italic1=$2;

	$Italic=~s{<bold>(.*?)<\/bold>}{}gsi;
	
if($Italic=~m{<italic>et([\.\s]+)}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 et al should be in bold format for $Subject_Type type in $Journal");
}



while($Italic1=~m{et([\.\s]+)}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 et al should be in bold format for $Subject_Type type in $Journal");
}

}
}

if($Subject_Tmp111=~m{\nReference_Label_End_with_Dot=Yes\n}gsi)
{
	my $FM_Article_Title1=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	

	if($Label!~m{\.(\s?)<\/refnumber>}si)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 reference label should end with dot $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp101=~m{\nReference_Label_End_with_Dot=No\n}gsi)
{
my $FM_Article_Title1=$Tmp;
while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	if($Label=~m{\.(\s?)<\/refnumber>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 reference label should not end with dot $Subject_Type type in $Journal");
	}
}

}


if($Subject_Tmp111=~m{\nRef_Collab_End_with_Dot=Yes\n}gsi)
{
my $FM_Article_Title1=$Tmp;
while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	my $Label1=$2;

	if($Label=~m{<refaucollab>}si)
	{

		


	if($Label1!~m{\.(\s?)<\/refaucollab>}si)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Reference collab should end with dot $Subject_Type type in $Journal");
	}
	}
}

}

if($Subject_Tmp112=~m{\nRef_Collab_End_with_Dot=No\n}gsi)
{
my $FM_Article_Title1=$Tmp;
while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	my $Label1=$2;

	if($Label=~m{<refaucollab>}si)
	{
	


	if($Label1=~m{\.(\s?)<\/refaucollab>}si)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Reference collab should not end with dot $Subject_Type type in $Journal");
	}
	}
}

}

if($Subject_Tmp113=~m{\nRef_ET_AL_Author_Count=([^\n]+)\n}gsi)
{
my $Author_Count=$1;
my $FM_Article_Title1=$Tmp;
while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{

	my $Paragraph_No=$1;

	my $Reference=$2;

	my $Count=$Reference=~s{(<refausurname>(.*?)<\/refausurname>)}{$1}gsi;

	

	if($Count > $Author_Count)
	{
	


	
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Author name count should be less then or equal to $Author_Count for $Subject_Type type in $Journal");
	
	}
}

}
if($Subject_Tmp114=~m{\nRef_ArticleTitle_End_with_Dot=Yes\n}gsi)
{
my $FM_Article_Title1=$Tmp;
while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	my $Label1=$2;

	$Label1=~s{<\/reftitleArticle>(\s?)(\.)}{$2<\/reftitleArticle>}gsi;

	if($Label=~m{<reftitleArticle>}si)
	{

		


	if($Label1!~m{\.(\s?)<\/reftitleArticle>}si)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Reference reftitleArticle should end with dot $Subject_Type type in $Journal");
	}
	}
}

}

if($Subject_Tmp115=~m{\nRef_ArticleTitle_End_with_Dot=No\n}gsi)
{
my $FM_Article_Title1=$Tmp;
while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	my $Label1=$2;

	if($Label=~m{<reftitleArticle>}si)
	{
	


	if($Label1=~m{\.(\s?)<\/reftitleArticle>}si)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Reference reftitleArticle should not end with dot $Subject_Type type in $Journal");
	}
	}
}

}

if($Subject_Tmp108=~m{\nRef_ET_AL_Formatting=Roman}gsi)
{

my $FM_Article_Title1=$Tmp;
my $FM_Article_Title2=$Tmp;



while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{
	my $Paragraph_No=$1;
	my $Italic=$2;
	my $Italic1=$2;

	

if($Italic=~m{<italic>et([\.\s]+)}gs)
{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 et al should be in roman format for $Subject_Type type in $Journal");
}



while($Italic1=~m{<bold>et([\.\s]+)}gs)
{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 et al should be in roman format for $Subject_Type type in $Journal");
}

}
}


if($Subject_Tmp109=~m{\nET_AL_Formatting=italic}gsi)
{

my $FM_Article_Title1=$Tmp;
my $FM_Article_Title2=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{
	my $Paragraph_No=$1;
	my $Italic=$2;
	my $Italic1=$2;

	$Italic=~s{<italic>(.*?)<\/italic>}{}gsi;
	
if($Italic=~m{<bold>et([\.\s]+)}gs)
{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 et al should be in italic format for $Subject_Type type in $Journal");
}



while($Italic1=~m{et([\.\s]+)}gs)
{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 et al should be in italic format for $Subject_Type type in $Journal");
}

}
}

if($Subject_Tmp110=~m{\nET_AL_Formatting=bold}gsi)
{

	
my $FM_Article_Title1=$Tmp;
my $FM_Article_Title2=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{
	my $Paragraph_No=$1;
	my $Italic=$2;
	my $Italic1=$2;

	$Italic=~s{<bold>(.*?)<\/bold>}{}gsi;
	
if($Italic=~m{<italic>et([\.\s]+)}gs)
{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 et al should be in bold format for $Subject_Type type in $Journal");
}



while($Italic1=~m{et([\.\s]+)}gs)
{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 et al should be in bold format for $Subject_Type type in $Journal");
}

}
}

if($Subject_Tmp111=~m{\nFootnote=No}gsi)
{

my $FM_Article_Title1=$Tmp;
my $FM_Article_Title2=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><Footnote>(.*?)<\/Footnote>}gsi)
{
	my $Paragraph_No=$1;
	
	$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Footnote not allowed for $Subject_Type type in $Journal");
	

}

}

if($Subject_Tmp111=~m{\nEndnote=No}gsi)
{

my $FM_Article_Title1=$Tmp;
my $FM_Article_Title2=$Tmp;

while($FM_Article_Title1=~m{<enxref>}gsi)
{
	my $Paragraph_No=$1;
	
	$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Endnote citation present. Endnote not allowed for $Subject_Type type in $Journal");
	

}

}

if($Subject_Tmp116=~m{\nRef_Author_Initial_Space=Yes}gsi)
{

my $FM_Article_Title1=$Tmp;
my $FM_Article_Title2=$Tmp;

my $FM_Article_Title1=$Tmp;
my $FM_Article_Title2=$Tmp;

while($FM_Article_Title1=~m{<([^\>]+)\><refauGivenName>(.*?)<\/refauGivenName>}gsi)
{
	my $Paragraph_No=$1;
	my $Italic=$2;
	my $Italic1=$2;

	
	
if($Italic=~m{([A-Z])\.([A-Z])}gs)
{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Initial space missing in givennames for $Subject_Type type in $Journal");
}

}
}

if($Subject_Tmp116=~m{\nRef_Author_Initial_Space=No}gsi)
{

my $FM_Article_Title1=$Tmp;
my $FM_Article_Title2=$Tmp;

my $FM_Article_Title1=$Tmp;
my $FM_Article_Title2=$Tmp;

 while($FM_Article_Title1=~m{<([^\>]+)\><refauGivenName>(.*?)<\/refauGivenName>}gsi)
{
	my $Paragraph_No=$1;
	my $Italic=$2;
	my $Italic1=$2;

	
	
if($Italic=~m{([A-Z])\. ([A-Z])}gs)
{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Initial space is not allowed in givennames $Subject_Type type in $Journal");
}

}
}

if($Subject_Tmp118=~m{\nSummary_Abstract_Text=([^\n]+)\n}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Keyword_Title=$1;

if($FM_Article_Title1!~m{<FMSummaryHead>$Keyword_Title<\/FMSummaryHead>}gs)
{
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the summary title Abstract content. It should be $Keyword_Title for $Subject_Type type in $Journal");
}

}



if($Subject_Tmp146=~m{\nArticle_Type=([^\n]+)\n}gsi)
{

my $FM_Article_Title1=$Tmp;

my $Article_Type=$1;

$Article_Type=",$Article_Type,";


$Article_Type=~s{(\s?)\,(\s?)}{\,}gsi;

if($FM_Article_Title=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
{
	my $Article=$1;

	if($Article_Type!~m{\,$Article\,}gsi)
	{
		
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Article type mismatched with word template. Please check");
	}
}

}



if($Subject_Tmp147=~m{\nAffiliation_Queue_Format=Number}gsi)
{

my $Affiliation=$Tmp;




while($Affiliation=~m{<Affxref>(.*?)<\/Affxref>}gsi)
{
	my $Affxref=$1;

	

	if($Affxref!~m{([0-9])}gsi)
	{
		
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the Affiliation queue format. It should be in number format for $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp148=~m{\nAffiliation_Queue_Format=Alphabet\n}gsi)
{

my $Affiliation=$Tmp;



while($Affiliation=~m{<Affxref>(.*?)<\/Affxref>}gs)
{
	my $Affxref=$1;

	if($Affxref!~m{([a-z])}gs)
	{
		
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the Affiliation queue format. It should be in alphabet format for $Subject_Type type in $Journal");
	}
}

}


if($Subject_Tmp149=~m{\nAffiliation_Queue_Format=Symbol\n}gsi)
{

my $Affiliation=$Tmp;



while($Affiliation=~m{<Affxref>(.*?)<\/Affxref>}gs)
{
	my $Affxref=$1;

	if($Affxref!~m{(\$\\+\§\*\¶\‖)}gs)
	{
		
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the Affiliation queue format. It should be in Symbol format for $Subject_Type type in $Journal");
	}
}

}

if($Subject_Tmp150=~m{\nData Availability=Data Availability([\:\.\-]+)\n}gsi)
{

my $Affiliation=$Tmp;

$Affiliation=~s{<italic>(.*?)<\/italic>}{$1}gsi;
$Affiliation=~s{<bold>(.*?)<\/bold>}{$1}gsi;

if($Affiliation!~m{<EMText>Data Availability}gs)
	{
		
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Data availabilty text should appear in EMText $Subject_Type type in $Journal");
	}


}

if($Subject_Tmp151=~m{\nData Availability=Data Availability\n}gsi)
{

my $Affiliation=$Tmp;

$Affiliation=~s{<italic>(.*?)<\/italic>}{$1}gsi;
$Affiliation=~s{<bold>(.*?)<\/bold>}{$1}gsi;

if($Affiliation!~m{<EMHeadA>Data Availability}gs)
	{
		
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Data availabilty text should appear in EMHeadA $Subject_Type type in $Journal");
	}


}

if($Subject_Tmp152=~m{\nReference_Citation_Format=Superscript\n}gsi)
{

my $Affiliation=$Bi_Tmp;



$Affiliation=~s{<italic>(.*?)<\/italic>}{$1}gsi;
$Affiliation=~s{<bold>(.*?)<\/bold>}{$1}gsi;



while($Affiliation=~m{<(bibxrefonline|onlinebibxref)>}gsi)
	{
		
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Reference citation format is superscript for $Subject_Type type in $Journal.Please check the style bibxrefonline or onlinebibxref");
	}


}

if($Subject_Tmp153=~m{\nReference_Citation_Format=online\n}gsi)
{

my $Affiliation=$Bi_Tmp;

$Affiliation=~s{<italic>(.*?)<\/italic>}{$1}gsi;
$Affiliation=~s{<bold>(.*?)<\/bold>}{$1}gsi;

while($Affiliation=~m{<(bibxref)>}gs)
	{
		
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Reference citation format is online for $Subject_Type type in $Journal.Please check the style bibxref");
	}


}

if($Subject_Tmp154=~m{\nReference_Citation_Grouping=\(\n}gsi)
{

my $Affiliation=$Bi_Tmp;

$Affiliation=~s{<italic>(.*?)<\/italic>}{$1}gsi;
$Affiliation=~s{<bold>(.*?)<\/bold>}{$1}gsi;



while($Affiliation=~m{<(bibxref|bibxrefonline|onlinebibxref)>(.*?)<\/(bibxref|bibxrefonline|onlinebibxref)>}gsi)
	{
		my $Bib_Xref=$2;
		my $Bib_Xref1=$2;

		if($Bib_Xref!~m{^(\s?)\(}gsi)
		{
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Reference citation grouping is missing. It should be in \( \)for $Subject_Type type in $Journal.Please check the Reference citation format $Bib_Xref");
		}

		if($Bib_Xref!~m{\)(\s?)$}gsi)
		{
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Reference citation grouping is missing. It should be in \( \)for $Subject_Type type in $Journal.Please check the Reference citation format $Bib_Xref");
		}

		
	}


}

if($Subject_Tmp155=~m{\nReference_Citation_Grouping=\[\n}gsi)
{

my $Affiliation=$Bi_Tmp;

$Affiliation=~s{<italic>(.*?)<\/italic>}{$1}gsi;
$Affiliation=~s{<bold>(.*?)<\/bold>}{$1}gsi;

while($Affiliation=~m{<(bibxref|bibxrefonline|onlinebibxref)>(.*?)<\/(bibxref|bibxrefonline|onlinebibxref)>}gsi)
	{
		my $Bib_Xref=$2;
		my $Bib_Xref1=$2;

		if($Bib_Xref!~m{^(\s?)\[}gsi)
		{
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Reference citation grouping is missing. It should be in \[ \]for $Subject_Type type in $Journal.Please check the Reference citation format $Bib_Xref");
		}

		if($Bib_Xref!~m{\](\s?)$}gsi)
		{
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Reference citation grouping is missing. It should be in \[ \]for $Subject_Type type in $Journal.Please check the Reference citation format $Bib_Xref");
		}

		
	}


}




#End style_Sheet



my $Arti_Tmp=$Tmp;

while($Arti_Tmp=~m{<([^\>]+)\><FMArticleTitle>(.*?)<\/FMArticleTitle>}gsi)
{
	my $Paragraph_No=$1;

	my $Content=$2;

	

	if($Content!~m{[a-z]}gs)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Article title should be in title case");

	}

	#if($Content!~m{[A-Z][A-Z]}gs)
	#{

	#push(@Error,"\~Para No:$Paragraph_No Col No:1 Article title should be in title case");

	#}
	

}

my $S_ARGV1=$ARGV[0];

if($S_ARGV1=~m{(OUP\_Journals\-L|Data_OUPJOURNALS)}gsi)
{

my $Subject_Journal=$Journal;

$Art_Type="\n".$Art_Type."\n";

if($Art_Type=~m{\n$Journal\t$Art_Subject\t([^\t]+)\t([^\t]+)\t([^\n]*)}gsi)
{
	my $Subject=$Art_Subject;

	my $Running_Verso=$1;
	my $Running_Verso1=$1;

	my $Running_Recto=$2;
	my $Running_Recto1=$2;

	my $Guest_Editor=$3;
	

	my $FM_Article_Type=$Tmp;

	my $FM_Guest_Editor=$Tmp;

	if($FM_Article_Type=~m{<FMArticleType>$Subject}gsi)
	{
		if($Running_Verso=~m{yes}gsi)
		{
			my $Running_Verso_Tmp=$Tmp;

			if($Running_Verso_Tmp!~m{<FMRunningHeadVerso>}gsi)
			{
				$Err="1";
		push(@Error,"\~Para No:1 Col No:1 RunningHeadVerso is must for the article type $Subject'");
			}
		}

		if($Running_Verso1=~m{no}gsi)
		{
			my $Running_Verso_Tmp=$Tmp;

			if($Running_Verso_Tmp=~m{<FMRunningHeadVerso>}gsi)
			{
				$Err="1";
		push(@Error,"\~Para No:1 Col No:1 RunningHeadVerso is not needed for the article type $Subject'");
			}
		}

		if($Running_Recto=~m{yes}gsi)
		{
			my $Running_Recto_Tmp=$Tmp;

			if($Running_Recto_Tmp!~m{<FMRunningHeadRecto>}gsi)
			{
				$Err="1";
		push(@Error,"\~Para No:1 Col No:1 RunningHeadRecto is must for the article type $Subject'");
			}
		}

		if($Running_Recto1=~m{no}gsi)
		{
			my $Running_Recto_Tmp=$Tmp;

			if($Running_Recto_Tmp=~m{<FMRunningHeadRecto>}gsi)
			{
				$Err="1";
		push(@Error,"\~Para No:1 Col No:1 RunningHeadRecto is not needed for the article type $Subject'");
			}
		}
	}

	
		if($Guest_Editor=~m{^(\w(.*?))$}gsi)
		{
			my $Editor_Name=$1;
			
			if($FM_Guest_Editor=~m{<([^\>]+)\><FMNoteGuestEditor>(.*?)<\/FMNoteGuestEditor>}gsi)
			{
				my $Editor_Names=$1;
				if($Editor_Names=~m{^$Editor_Name}gsi)
				{
				$Err="1";
		push(@Error,"\~Para No:1 Col No:1 Check the guest editor for article type $Subject. it should be start with $Editor_Name'");

				}
			}
			
		}
	

	
}
}
elsif($S_ARGV1=~m{\\LWW}gsi)
{

my $Subject_Journal=$Journal;

$Art_Type="\n".$Art_Type."\n";

if($Art_Type=~m{\n$Journal\t$Art_Subject\t([^\t]+)\t([^\n]*)\n}gsi)
{
	my $Subject=$Art_Subject;

	
	my $Running_Verso=$1;
	my $Running_Verso1=$1;

	my $Running_Recto=$2;
	my $Running_Recto1=$2;

	my $Guest_Editor=$3;
	

	my $FM_Article_Type=$Tmp;

	my $FM_Guest_Editor=$Tmp;

	if($FM_Article_Type=~m{<FMArticleType>$Subject}gsi)
	{
		if($Running_Verso=~m{yes}gsi)
		{
			my $Running_Verso_Tmp=$Tmp;

			if($Running_Verso_Tmp!~m{<FMRunningHeadVerso>}gsi)
			{
				$Err="1";
		push(@Error,"\~Para No:1 Col No:1 RunningHeadVerso is must for the article type $Subject'");
			}
		}

		if($Running_Verso1=~m{no}gsi)
		{
			my $Running_Verso_Tmp=$Tmp;

			if($Running_Verso_Tmp=~m{<FMRunningHeadVerso>}gsi)
			{
				$Err="1";
		push(@Error,"\~Para No:1 Col No:1 RunningHeadVerso is not needed for the article type $Subject'");
			}
		}

		if($Running_Recto=~m{yes}gsi)
		{
			my $Running_Recto_Tmp=$Tmp;

			if($Running_Recto_Tmp!~m{<FMRunningHeadRecto>}gsi)
			{
				$Err="1";
		push(@Error,"\~Para No:1 Col No:1 RunningHeadRecto is must for the article type $Subject'");
			}
		}

		if($Running_Recto1=~m{no}gsi)
		{
			my $Running_Recto_Tmp=$Tmp;

			if($Running_Recto_Tmp=~m{<FMRunningHeadRecto>}gsi)
			{
				$Err="1";
		push(@Error,"\~Para No:1 Col No:1 RunningHeadRecto is not needed for the article type $Subject'");
			}
		}
	}

	
		if($Guest_Editor=~m{^(\w(.*?))$}gsi)
		{
			my $Editor_Name=$1;
			
			if($FM_Guest_Editor=~m{<([^\>]+)\><FMNoteGuestEditor>(.*?)<\/FMNoteGuestEditor>}gsi)
			{
				my $Editor_Names=$1;
				if($Editor_Names=~m{^$Editor_Name}gsi)
				{
				$Err="1";
		push(@Error,"\~Para No:1 Col No:1 Check the guest editor for article type $Subject. it should be start with $Editor_Name'");

				}
			}
			
		}
	

	
}
	
}
my $Art_Tmp=$Tmp;

while($Art_Tmp=~m{<([^\>]+)\><FMArticleType>(.*?)<\/FMArticleType>}gsi)
	{
		my $Title=$2;

		$Title=~s{<query>(.*?)<\/query>}{}gsi;
		$Title=~s{<query>(.*?)<\/query>}{}gsi;

		
		my $Paragraph_No=$1;

		
		if($Title=~m{([A-Z][A-Z])}gs)
		{

			$Err="1";
		
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the case sensitive in FMArticle type. Full Caps found in article type");
			
		}
		
	}


	my $Art_Tmp=$Tmp;

while($Art_Tmp=~m{<([^\>]+)\><(HeadA|HeadB|HeadC|HeadD|HeadE|HeadF)>(.*?)<\/HeadA|HeadB|HeadC|HeadD|HeadE|HeadF>}gsi)
	{
		my $Title=$2;

		$Title=~s{<query>(.*?)<\/query>}{}gsi;
		$Title=~s{<query>(.*?)<\/query>}{}gsi;
		
		my $Paragraph_No=$1;

		
		if($Title=~m{([A-Z][A-Z])}gs)
		{

			$Err="1";
		
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the case sensitive in Heading levels");
			
		}
		
	}



my $JBREIM_Journal=$Journal;

if($JBREIM_Journal=~m{(JBREIM)}gsi)
{
	my $Abstract_Tmp=$Tmp;
	my $Article_Type_Tmp=$Tmp;

	
	
	while($Abstract_Tmp=~m{<([^\>]+)\><(FMGrapAbstract)}gsi)
	{
		my $Paragraph_No=$1;

		$Err="1";
		
push(@Error,"\~Para No:$Paragraph_No Col No:1 FMGraphAbstarct is not allowed for JBREIM");
	}

	while($Article_Type_Tmp=~m{<([^\>]+)\><FMArticleType>(.*?)<\/FMArticleType>}gsi)
	{
		my $Title=$2;
		my $Paragraph_No=$1;

		
		if($Title=~m{([A-Z][A-Z])}gs)
		{

			$Err="1";
		
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the case sensitive in FMArticle type");
			
		}
		
	}

	my $Subject_Tmp=$Tmp;

	while($Abstract_Tmp=~m{<([^\>]+)\><FMAuthors>(.*?)<\/FMAuthors>}gsi)
	{
		
		my $Paragraph_No=$1;

		my $Author=$2;

		if($Author!~m{<(fmaudegree|fmcorrdegree)>}gsi)
		{
		
		$Err="1";
		
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Fmaudegree or Fmcorrdegree is missing. For JBREIM Journal, degree is must");
		}
	}

	my $Conflict_Tmp=$Tmp;

	$Conflict_Tmp=~s{<bold>(.*?)<\/bold>}{$1}gsi;
	$Conflict_Tmp=~s{<italic>(.*?)<\/italic>}{$1}gsi;
	
	
	if($Conflict_Tmp!~m{<([^\>]+)\><([^\>]+)\>Conflict of interest}gsi)
	{
		my $Style=$2;

		
		
		my $Paragraph_No=$1;
		$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Conflict of interest must for JBREIM journal");
	}
	
	
		

	
}


my $NEOUNC_Journal=$Journal;

if($NEOUNC_Journal=~m{(NEOUNC)}gsi)
{
	my $Abstract_Tmp=$Tmp;

	my $FM_Article_Type=$Tmp;

	if($FM_Article_Type=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
	{
	my $Article_Type=$1;
	$Article_Type=~s{<([^\>]+)\>}{}gsi;

	if($Article_Type=~m{(Review Article)}gsi)
	{
	
	if($Abstract_Tmp=~m{<([^\>]+)\><(BoxTitle)>key point}gsi)
	{
		my $Paragraph_No=$1;

		$Err="1";
		
push(@Error,"\~Para No:$Paragraph_No Col No:1 Review articles should not have Key Points for the journals.");
	}
	}

	
	}
}

my $NEOUNC_Journal=$ARGV[0];

if($NEOUNC_Journal=~m{(Intellect)}gsi)
{
	my $Abstract_Tmp=$Tmp;

	my $FM_Article_Type=$Tmp;

	my $FM_Article_Type1=$Tmp;

	my $FM_Keywords=$Tmp;

	if($FM_Article_Type=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
	{
	my $Article_Type=$1;
	$Article_Type=~s{<([^\>]+)\>}{}gsi;

	if($Article_Type=~m{^(Article|Essay|Report|Open Forum|In Memoriam)(s?)$}gsi)
	{
	
	if($Abstract_Tmp!~m{<([^\>]+)\><EMReferencesHead>Suggested Citation}gsi)
	{
		my $Paragraph_No=$1;

		$Err="1";
		
push(@Error,"\~Para No:$Paragraph_No Col No:1 Suggested Citation is must for the article type.");
	}
	}

	
	}

	if($FM_Article_Type1=~m{<Keywords>(.*?)<\/Keywords>}gsi)
	{
	my $Keywords=$1;

	if($Keywords=~m{Keyword(s?)(\s?)\:}gsi)
	{

	$Err="1";
		
	push(@Error,"\~Para No:1 Col No:1 Colon not allowed in the end of the Keyword");

	
	}
	}
}



my $AJCPAT_Journal=$Journal;

if($AJCPAT_Journal=~m{(AJCPAT)}gsi)
{
	my $Abstract_Tmp=$Tmp;

	my $FM_Article_Type=$Tmp;

	if($FM_Article_Type=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
	{
	my $Article_Type=$1;
	$Article_Type=~s{<([^\>]+)\>}{}gsi;

	if($Article_Type=~m{(Original Article|Review Article)}gsi)
	{
	
	if($Abstract_Tmp!~m{<([^\>]+)\><(BoxTitle)>key point}gsi)
	{
		my $Paragraph_No=$1;

		$Err="1";
		
push(@Error,"\~Para No:$Paragraph_No Col No:1 Key points is must for Article type original article and Review article");
	}
	}

	
	}
}


my $EJILAW_Journal=$Journal;

if($EJILAW_Journal=~m{(EJILAW)}gsi)
{
	my $Abstract_Tmp=$Tmp;
	
	my $Abstract_Tmp1=$Tmp;

	my $FM_Article_Type=$Tmp;

	if($FM_Article_Type=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
	{
	my $Article_Type=$1;
	$Article_Type=~s{<([^\>]+)\>}{}gsi;

	if($Article_Type=~m{(Roaming charge|Last page|poetry|Editorial)}gsi)
	{
	
	if($Abstract_Tmp=~m{<([^\>]+)\><FMNoteCorrespondence>}gsi)
	{
		my $Paragraph_No=$1;

		$Err="1";
		
push(@Error,"\~Para No:$Paragraph_No Col No:1 FMNotecorrespondense is not allowed for Article type Roaming charge, Last page, poetry, Editorial");
	}

	if($Abstract_Tmp1=~m{<fmcorr}gsi)
	{
		my $Paragraph_No=$1;

		$Err="1";
		
push(@Error,"\~Para No:1 Col No:1 Correspondend author style is not allowed for Article type Roaming charge, Last page, poetry, Editorial");
	}
	}

	
	}
}

my $BEHECO_Journal=$Journal;

if($BEHECO_Journal=~m{(BEHECO)}gsi)
{
	my $Abstract_Tmp=$Tmp;

	my $Abstract_Tmp1=$Tmp;

	my $FM_Article_Type=$Tmp;

	my $Count=$FM_Article_Type=~s{<FMArticleType>(.*?)<\/FMArticleType>}{}gsi;

	if($Count ne "2")
	{
		push(@Error,"\~Para No:1 Col No:1 Article BEHECO journal article must have two article type");
	}
	
}

my $ANNWEH_Journal=$Journal;

if($ANNWEH_Journal=~m{(ANNWEH)}gsi)
{
	my $Abstract_Tmp=$Tmp;

	my $Abstract_Tmp1=$Tmp;

	my $FM_Article_Type=$Tmp;

	if($FM_Article_Type=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
	{
	my $Article_Type=$1;
	$Article_Type=~s{<([^\>]+)\>}{}gsi;

	if($Article_Type=~m{(original research paper|review article|short communication)}gsi)
	{

	if($Abstract_Tmp1!~m{Please provide a short paragraph to describe the impact of the work under}gsi)
	{
		
	if($Abstract_Tmp!~m{Whats important about this paper}gsi)
	{
		my $Paragraph_No=$1;

		$Err="1";
		
push(@Error,"\~Para No:$Paragraph_No Col No:1 whats important about this paper is must for Article type $Article_Type");
	}
	}
	}

	
	}
}



my $JOFORE_Journal=$Journal;

if($JOFORE_Journal=~m{(JOFORE|FORSCI)}gsi)
{
	my $Abstract_Tmp=$Tmp;

	
	
	while($Abstract_Tmp=~m{<([^\>]+)\><(FMAbstractHead)>(Management and Policy Implication)}gsi)
	{
		my $Paragraph_No=$1;

		$Err="1";
		
push(@Error,"\~Para No:$Paragraph_No Col No:1 Client has changed the content from Management and Policy Implications to Study Implications with abstract style");
	}


	my $Study_Tmp=$Tmp;

while($Study_Tmp=~m{<([^\>]+)\><([^\>]+)\>Study Implication(s?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Content=$3;
	my $Content1=$3;
	my $Content2=$3;
	my $Content3=$3;

	$Err="1";
		
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the study Implication. Colon missing in the title");

}
	
	
	
	
}
 
my $Abstract_Tmp=$Tmp;



while($Abstract_Tmp=~m{<([^\>]+)\><(FMAbstractParaFlushLeft|FMAbstractParaInd)>(.*?)<\/FMAbstractParaFlushLeft|FMAbstractParaInd>}gsi)
{
	my $Paragraph_No=$1;
	my $Abstract=$3;
	my $Abstract1=$3;
	my $Abstract2=$3;
	my $Style=$2;

	
		    
	$Abstract=~s{<(fmabstractsectionHeadrunIn|italic|bold|sup|sub|smallcaps|comment|query|url|UIXREF)>}{}gsi;

	$Abstract=~s{<\/(fmabstractsectionHeadrunIn|italic|bold|sup|sub|smallcaps|comment|query|url|UIXREF)>}{}gsi;

	$Abstract=~s{<(fmabstractsectionHeadrunIn|italic|bold|sup|sub|smallcaps|comment|query|url|UIXREF)\/>}{}gsi;

	$Abstract1=~s{<(italic|bold|sup|sub|smallcaps|comment|query|url|UIXREF)>}{}gsi;

	$Abstract1=~s{<\/(italic|bold|sup|sub|smallcaps|comment|query|url)>}{}gsi;

	$Abstract1=~s{<(italic|bold|sup|sub|smallcaps|comment|query|url)\/>}{}gsi;

	
	while($Abstract=~m{<(\w([^\>]+))\>}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($Abstract, $Character_Style) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Character style $1 is not allowed in \†$Style");
	}

	while($Abstract1=~m{^(Background|Aim|Introduction|Objective|Method|Result|Conclusion|Context|Discussion|Implication)([\:\.\-]+)}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($Abstract, $Character_Style) + 1;

		

push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Warning: fm_abstract_sectionHead_runIn is missing in abstarct content for $1'");
	}

	while($Abstract2=~m{<fmabstractsectionHeadrunIn> <\/fmabstractsectionHeadrunIn>}gsi)
	{
		push(@Error,"\~Para No:$Paragraph_No Col No:1 fmabstractsectionHeadrunIn present only for space'");
	}
	
	
	
}

my $ENGHIS_Jou=$Journal;

if($ENGHIS_Jou=~m{GERHIS}gsi)
{
	my $Running_Head=$Tmp;

	

	$Running_Head=~s{<FMRunningHeadRecto><\/FMRunningHeadRecto>}{}gsi;
	$Running_Head=~s{<FMRunningHeadVerso><\/FMRunningHeadVerso>}{}gsi;
	

	if($Running_Head!~m{<FMRunningHeadRecto>}gsi)
	{
		push(@Error,"\~Para No:1 Col No:1 FMRunningHeadRecto is must for GERHIS Journal'");
		
	}

	if($Running_Head!~m{<FMRunningHeadVerso>}gsi)
	{
		push(@Error,"\~Para No:1 Col No:1 FMRunningHeadVerso is must for GERHIS Journal'");
		
	}
}

my $EXBOTJ_Jou=$Journal;

if($EXBOTJ_Jou=~m{EXBOTJ}gsi)
{
	my $Supplement=$Tmp;

	my $Editor=$Tmp;


	my $Abs_Tmp=$Tmp;

	$Abs_Tmp=~s{<(\d+)><FM([^\>]+)\>(.*?)\n}{}gsi;

	$Abs_Tmp=~s{<(\d+)><Keywords([^\>]+)\>(.*?)\n}{}gsi;

	$Abs_Tmp=~s{\n{1,}}{\n}gsi;


	
	while($Supplement=~m{<([^\>]+)\><(SupplementaryMaterialCaption)><bold>}gsi)
	{
		push(@Error,"\~Para No:$1 Col No:1 Bold format applied for citation inside SupplementaryMaterialCaption'");
	}

	while($Editor=~m{<([^\>]+)\><(FMRunningHeadRecto|FMRunningHeadVerso)>}gsi)
	{
		push(@Error,"\~Para No:$1 Col No:1 Bold format applied for citation inside SupplementaryMaterialCaption'");
	}

	

	
	
if($FM_Article_Type=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
{
	my $Article_Type=$1;
	$Article_Type=~s{<([^\>]+)\>}{}gsi;

	if($Article_Type=~m{(Insight|Editorial|Viewpoint)}gsi)
	{
		if($Tmp=~m{<([^\>]+)\><(FMAbstractParaFlushLeft|FMAbstractParaInd)>}gsi)
		{
			my $Paragraph_No=$1;
			my $Style=$2;
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Abstarct is not allowed for $Article_Type Article_type");
		}

		if($Abs_Tmp!~m{<([^\>]+)\><(ParaFlushLeft|ParaInd)><bold>}gsi)
		{
			my $Paragraph_No=$1;
			my $Style=$2;
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 First para of the body content should be in bold tag for $Article_Type Article_type");
		}
	}
	
}

my $Aff_Tmp=$Tmp;

my $Aff_Tmp1=$Tmp;

$Aff_Tmp1=~s{<FMNoteCorrespondence>(.*?)<\/FMNoteCorrespondence>}{}gsi;

if($Aff_Tmp!~m{<FMNoteCorrespondence><(Affxref|Affxrefonline)>\*}gsi)
{
	$Err="1";
push(@Error,"\~Para No:1 Col No:1 * author queue is missing in Correspondence. * queue is must for EXBOTJ journal");
}

if($Aff_Tmp!~m{<(Affxref|Affxrefonline)>\*}gsi)
{
	$Err="1";
push(@Error,"\~Para No:1 Col No:1 * author queue is missing in FM_authors. * queue is must for EXBOTJ");
}

	
}


my $Annbot_Jou=$Journal;

if($Annbot_Jou=~m{ANNBOT}gsi)
{

	my $A_Tmp=$Tmp;
	
if($A_Tmp=~m{<([^\>]+)\><Para([^\>]+)\>xxx}gsi)
{
	push(@Error,"\~Para No:$1 Col No:1 xxx should be runon with previous line'");
}
}

my $Abstract_Jou=$Journal;

my $Abs_Tmp=$Tmp;

if($Abstract_Jou=~m{(JMAMMA|OCCMED|CROCOL|NOAJNL|AMJHSP|ANNBOT|BIOLIN|BOTLIN|CLINID|FORSCI|IBDJNL|INFDIS|JOFORE|JPIDSJ|LABMED|NEUONC|NOPRAC|OFIDIS|ZOOLIN|ENDOCR|JCEMET|JESOCI)}gsi)
{

	while($Abs_Tmp=~m{<([^\>]+)\><(FMAbstractHead)>(.*?)<\/FMAbstractHead>}gsi)
	{
		my $Paragraph_No=$1;

		
push(@Error,"\~Para No:$Paragraph_No Col No:1 Error: Abstract head is not allowed for the journal $Journal");
	}
	
}

my $Abstract_Jou11=$Journal;

my $Abs_Tmp11=$Tmp;

if($Abstract_Jou11=~m{(BIOLIN|BOTLIN|ZOOLIN)}gsi)
{

	while($Abs_Tmp11=~m{<([^\>]+)\><HeadB>(.*?)<\/HeadB>}gsi)
	{
		my $Paragraph_No=$1;

		my $Content=$2;

		if($Content=~m{<smallcaps>}gsi)
		{

		
push(@Error,"\~Para No:$Paragraph_No Col No:1 Error: Small cap style is not allowed for the journal $Journal");
		}
	}
	
}


my $Abstract_Jou1=$Journal;

my $Abs_Tmp1=$Tmp;

if($Abstract_Jou1=~m{(PPAREP|EARLYJ|INTIMM|CWWRIT|ANFRON)}gsi)
{

	while($Abs_Tmp1=~m{<([^\>]+)\><(FMAbstract)}gsi)
	{
		my $Paragraph_No=$1;

		
push(@Error,"\~Para No:$Paragraph_No Col No:1 Error: Abstract section is not allowed for the journal $Journal");
	}
	
}

my $Abstract_Jou2=$Journal;

my $Abs_Tmp2=$Tmp;

if($Abstract_Jou2=~m{(AESAME|AMTEST|AOBPLA|ASJOFJ|DSCILJ|ENVENT|GERONA|GERONB|GERONT|GERONI|ISDIVE|JEENTO|JIPMAN|JISESA|JMENTO|MSPECI|TRANAS|JANSCI|INSILC|AJCPAT|ASJOUR|JBREIM|PUBOPQ|ENDREV)}gsi)
{

	if($Abs_Tmp2!~m{<([^\>]+)\><(FMAbstractHead)}gsi)
	{
		my $Paragraph_No=$1;

		
push(@Error,"\~Para No:$Paragraph_No Col No:1 Error: Abstract head is must for the journal $Journal");
	}
	
}

my $Keyword_Before_Tmp=$Tmp;



while($Keyword_Before_Tmp=~m{<\/([^\>]+)\>\n<([^\>]+)\><Keywords>}gsi)
{
	my $FM_Keyword=$1;
	my $Paragraph_No=$2;

	

	if($FM_Keyword!~m{^(FM|Abbreviations|Keywords)}gsi)
	{
		$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the style before keywords. Keyword style applied in between body content'");
	}
}

my $Keyword_Before_Tmp1=$Tmp;



while($Keyword_Before_Tmp1=~m{<\/([^\>]+)\>\n<([^\>]+)\><FM([^\>]+)>}gsi)
{
	my $FM_Keyword=$1;
	my $Paragraph_No=$2;
	my $Front_Style="FM$3";

	

	if($FM_Keyword!~m{^(FM|Keywords|Abbreviations|TSComment)}gsi)
	{
		if($Front_Style!~m{(FMNote|FMAbbreviations)}gsi)
		{
		$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the style after $FM_Keyword. $Front_Style style applied in between body content'");
		}
	}
}


my $Footnote_After_Tmp=$Tmp;



while($Footnote_After_Tmp=~m{<\/Footnote\>\n<([^\>]+)\><([^\>]+)\>}gsi)
{
	my $FM_Keyword=$2;
	my $Paragraph_No=$1;

	

	if($FM_Keyword!~m{^Footnote}gsi)
	{
		$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the style after Footnotes. $FM_Keyword style applied in between Footnote content'");
	}
}

my $Extract_Tmp=$Tmp;



while($Extract_Tmp=~m{<([^\>]+)\><Extract>(.*?)<\/Extract>}gsi)
{
	my $FM_Keyword=$1;
	my $Paragraph_No=$1;

	#my $Dot_Count=$FM_Keyword=~s{\.}{\.}gsi;

	if($FM_Keyword!~m{\.}gsi)
	{

	$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the extract style. Only one sentence present in extract paragraph'");
	
	}
}


my $Endnote_After_Tmp=$Tmp;

while($Endnote_After_Tmp=~m{<\/EM([^\>]+)\>\n<([^\>]+)\><([^\>]+)\>}gsi)
{
	my $FM_Keyword=$3;
	my $Paragraph_No=$2;
	my $Style="EM$1";

	

	if($FM_Keyword!~m{^(EM|Ref|FMAffiliations|FMNoteSupplementaryMaterial|FMNoteCorrespondence|EMSupplementaryMaterialTitle|EMSupplementaryMaterialTitle|EMAppendixTitle)}gsi)
	{
		if($Style=~m{ParaFlushLeft}gsi)
		{
		$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the style after $Style. $FM_Keyword style'");
		}
	}
}


my $Keyword_Tmp=$Tmp;
my $Keyword_Tmp1=$Tmp;



while($Keyword_Tmp=~m{<([^\>]+)\><Keywords>(.*?)<\/Keywords>}gsi)
{
	my $Paragraph_No=$1;
	my $Keyword=$2;
	my $Keyword1=$2;
	my $Keyword2=$2;
	my $Keyword3=$2;
	my $Keyword4=$2;
	my $Keyword5=$2;
	
		 
	$Keyword=~s{<(keyword|keywordsHead|italic|bold|sup|sub|smallcaps|comment|query)>}{}gsi;

	$Keyword=~s{<\/(keyword|keywordsHead|italic|bold|sup|sub|smallcaps|comment|query)>}{}gsi;

	$Keyword=~s{<(keyword|keywordsHead|italic|bold|sup|sub|smallcaps|comment|query)\/>}{}gsi;

	
	while($Keyword=~m{<(\w([^\>]+))\>}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($Keyword, $Character_Style) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Character style $1 is not allowed in \†Keywords");
	}

	$Keyword1=~s{<(\w([^\>]+))\>(.*?)<\/\1>}{}gsi;

	$Keyword1=~s{(and)}{}gsi;

	$Keyword1=~s{([\,\.\;\:\)\(\]\[]+)}{}gsi;

	while($Keyword1=~m{(\w+)}gsi)
	{
		my $cnum = index($Keyword, "$1") + 1;
		
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Free text $1 is not allowed in Keywords'");
	}

	

	my $Count_Keyword=$Keyword2=~s{<keywordsHead>}{<keywordsHead>}gsi;

	if($Count_Keyword gt 2)
	{

	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 More then 1 KeywordHead style is present");
	}

	my $Count_Keyword1=$Keyword3=~s{<keyword>}{<keyword>}gsi;

	if($Count_Keyword1 eq 1)
	{

	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the keyword character style applied for punctuation also");
	}

	
	if($Keyword4!~m{<keywordsHead>}gsi)
	{

	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Keyword Head style is missing");
	}

	if($Keyword5=~m{<keyword>(.*?)<\/keyword>}gsi)
	{
		my $Key=$1;


		if($Key=~m{([\.\;\:\,]+)}gsi)
		{
			my $cnum = index($Keyword, "$1") + 1;
			$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Punctuation is not allowed inside the keyword character style");
		
		
		}
	}

	
	
	
}

while($Keyword_Tmp1=~m{<([^\>]+)\><KeywordsTrans>(.*?)<\/KeywordsTrans>}gsi)
{
	my $Paragraph_No=$1;
	my $Keyword=$2;
	my $Keyword1=$2;
	my $Keyword2=$2;
	
		 
	$Keyword=~s{<(keyword|keywordsHead|italic|bold|sup|sub|smallcaps|comment|query)>}{}gsi;

	$Keyword=~s{<\/(keyword|keywordsHead|italic|bold|sup|sub|smallcaps|comment|query)>}{}gsi;

	$Keyword=~s{<(keyword|keywordsHead|italic|bold|sup|sub|smallcaps|comment|query)\/>}{}gsi;

	
	while($Keyword=~m{<(\w([^\>]+))\>}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($Keyword, $Character_Style) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Character style $1 is not allowed in \†KeywordsTrans");
	}

	$Keyword1=~s{<(\w([^\>]+))\>(.*?)<\/\1>}{}gsi;

	$Keyword1=~s{(and)}{}gsi;

	$Keyword1=~s{([\,\.\;\:\)\(\]\[\–]+)}{}gsi;

	while($Keyword1=~m{(\w+)}gsi)
	{
		my $cnum = index($Keyword, "$1") + 1;
		
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Free text $1 is not allowed in KeywordsTrans'");
	}

	

	my $Count_Keyword=$Keyword2=~s{<keywordsHead>}{<keywordsHead>}gsi;

	if($Count_Keyword gt 2)
	{

	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 More then 1 KeywordHead style is present");
	}

	if($Keyword2!~m{<keywordsHead>}gsi)
	{

	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Keyword Head style is missing");
	}
	
	
	
}


my $Title_Head_Tmp=$Tmp;

while($Title_Head_Tmp=~m{<Head([A-Z])\>(.*?)<\/Head\1>\n<([^\>]+)\><ParaInd>}gsi)
{
	my $Paragraph_No=$3;
	$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 The paragraph style should be Para_flushleft after the section title");

}





my $Abbre_Child_Tmp=$Tmp;


while($Abbre_Child_Tmp=~m{<([^\>]+)\><Abbreviations>(.*?)<\/Abbreviations>}gsi)
{
	my $Paragraph_No=$1;
	my $Abbreviations=$2;

	my $Abbreviations1=$2;

	my $Abbreviations2=$2;

	my $Abbreviations3=$2;

	my $Abbreviations4=$2;

	

	
	if($Abbreviations!~m{<(abbreviationExpansion|abbreviationsHead)>}gsi)
	{
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 abbreviationExpansion or abbreviationsHead is must in Abbreviations");
	}

	if($Abbreviations3!~m{<(abbreviation|abbreviationsHead)>}gsi)
	{
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 abbreviation or abbreviationsHead is must in Abbreviations");
	}

	$Abbreviations=~s{<(abbreviationExpansion|abbreviation|abbreviationsHead|italic|bold|sup|sub|smallcaps|comment|query)>}{}gsi;

	$Abbreviations=~s{<\/(abbreviationExpansion|abbreviation|abbreviationsHead|italic|bold|sup|sub|smallcaps|comment|query)>}{}gsi;

	$Abbreviations=~s{<(abbreviationExpansion|abbreviation|abbreviationsHead|italic|bold|sup|sub|smallcaps|comment|query)\/>}{}gsi;

	
	while($Abbreviations=~m{<(\w([^\>]+))\>}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($Abbreviations, $Character_Style) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Character style $1 is not allowed in \†Abbreviation");
	}


	$Abbreviations1=~s{<(\w([^\>]+))\>(.*?)<\/\1>}{}gsi;
	
	$Abbreviations1=~s{([\,\.\;\:\)\(\]\[\=]+)}{}gsi;

	$Abbreviations1=~s{<(\w([^\>]+))\/>}{}gsi;

	my $Abbreviations3=$Abbreviations1;


	
	
	while($Abbreviations1=~m{(\w+)}gsi)
	{
		
		my $cnum = index($Abbreviations, "$1") + 1;
		
		
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Free text $1 is not allowed in Abbreviation'");
	}
	while($Abbreviations3=~m{(\–)}gsi)
	{

		my $cnum = index($Abbreviations, "$1") + 1;
		
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Hyphen, endash is not allowed in abbreviation'");
	}


	my $Abb=$Tmp;
	
	my $Count_Abb=$Abb=~s{<abbreviationsHead>}{<abbreviationsHead>}gsi;
	
	if($Count_Abb gt 1)
	{

		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 More then one abbreviationsHead style present in the word document'");
		
	}

	my $Count_Abb1=$Abb=~s{<abbreviationExpansion>}{<abbreviationExpansion>}gsi;
	
	if($Count_Abb gt 1)
	{

		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 More then one abbreviationExpansion style present in the word document'");
		
	}

	$Abbreviations4=~s{<italic>(.*?)<\/italic>}{$1}gsi;
	$Abbreviations4=~s{<bold>(.*?)<\/bold>}{$1}gsi;
	$Abbreviations4=~s{<sup>(.*?)<\/sup>}{$1}gsi;
	$Abbreviations4=~s{<sub>(.*?)<\/sub>}{$1}gsi;

	while($Abbreviations4=~m{<abbreviationExpansion>([^\<]+)\<\/abbreviationExpansion>([\,\.\;\:\)\(\]\[\=\s]+)<abbreviationExpansion>}gsi)
	{
		my $D=$1;

		$D=~s{<([^\>]+)\>}{}gsi;
		
		my $cnum = index($Abbreviations, "$D") + 1;
		
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Check the abbreviationexpansion style present continusly after the text $1");
	}
	
	
}

my $FM_Orcid_Tmp=$Tmp;

while($FM_Orcid_Tmp=~m{<([^\>]+)\><FMOrcid>(.*?)<\/FMOrcid>}gsi)
{
	my $Paragraph_No=$1;
	my $Orcid=$2;

my $OUP_Path=$ARGV[0];


if($OUP_Path=~m{(OUP\_Journals\-L|Data_OUPJOURNALS)}gsi)
{
	if($Orcid!~m{<orcxref>}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 orcxref style is missing in FMOrcid'");
	}

	my $Orcid1=$Orcid;

	$Orcid=~s{<orcxref>(.*?)<\/orcxref>}{}gsi;

	if($Orcid=~m{<([^\>]+)\>}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 $1 is not allowed FMOrcid'");
	}

	if($Orcid1=~m{http}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 http not allowed in FMOrcid'");
	}

	
}

}

my $Abbre_Child_Tmp=$Tmp;

my $L_Path=$ARGV[0];


if($L_Path=~m{(OUP\_Journals\-L|Data_OUPJOURNALS)}gsi)
{

while($Abbre_Child_Tmp=~m{<([^\>]+)\><FMNoteGuestEditor>(.*?)<\/FMNoteGuestEditor>}gsi)
{
	my $Paragraph_No=$1;
	my $Abbreviations=$2;

	$Abbreviations=~s{([\,\.\;\:\)\(\]\[\–\=]+)}{}gsi;

	if($Abbreviations!~m{<(fmau)}gsi)
	{
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 FM Author Granular styling missing in FMNoteGuestEditor");
	}
	
}
}


my $EM_Text=$Tmp;
while($EM_Text=~m{<([^\>]+)\><EMText>(.*?)<\/EMText>}gsi)
{

	my $Paragraph_No=$1;
	my $Style=$2;

	$Style=~s{<secxref>(.*?)<\/secxref>}{}gsi;

	if($Style=~m{Supporting information}gsi)
	{
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning: Supporting information should tag as Secxref");
	}

}


my $Table_Tmp=$Tmp;



while($Table_Tmp=~m{<([^\>]+)\><TableCaption>(.*?)<\/TableCaption>}gsi)
{
	my $Paragraph_No=$1;
	my $Table_Caption=$2;

	

	my $Table_Caption1=$2;
	my $Table_Caption2=$2;
	my $Table_Caption3=$2;
	my $Table_Caption4=$2;
	my $Table_Caption5=$2;

	my $Table_Caption6=$2;

	$Table_Caption=~s{<tablenumber>([\.\s]+)<\/tablenumber>}{}gsi;
	
		    
	$Table_Caption=~s{<(tablenumber|italic|bold|sup|sub|smallcaps|comment|query|tabxref|figxref|figxrefc|tabxrefc|modxref|videoxref|eqnxref|genxref|SupplementaryMaterialXref|pi|bibxref|UIXref|bibxrefonline|url|tabfnxref|tabfnxrefonline)>}{}gsi;

	$Table_Caption=~s{<\/(tablenumber|italic|bold|sup|sub|smallcaps|comment|query|tabxref|figxref|figxrefc|tabxrefc|modxref|videoxref|eqnxref|genxref|SupplementaryMaterialXref|pi|bibxref|UIXref|bibxrefonline|url|tabfnxref|tabfnxrefonline)>}{}gsi;

	$Table_Caption=~s{<(tablenumber|italic|bold|sup|sub|smallcaps|comment|query|tabxref|figxref|figxrefc|tabxrefc|modxref|videoxref|eqnxref|genxref|SupplementaryMaterialXref|pi|bibxref|UIXref|bibxrefonline|url|tabfnxref|tabfnxrefonline)\/>}{}gsi;



	
	
	
	while($Table_Caption=~m{<(\w([^\>]+))\>}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($Table_Caption, $Character_Style) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Character style $1 is not allowed in Table Caption");
	}

	if($Table_Caption1!~m{<tablenumber}gsi)
	{
		my $Character_Style=$1;

		

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 table_number style is missing in table caption");
	}


	$Table_Caption4 =~ s/(.)/asciiize($1)/eg;

	$Table_Caption4=~s{<bold>(.*?)<\/bold>}{$1}gsi;

	$Table_Caption4=~s{<italic>(.*?)<\/italic>}{$1}gsi;
	
	
	

	if($Table_Caption4=~m{<tablenumber>(.*?)<\/tablenumber>(\s?)(\&\#x00E2\;\&\#x0080;\&\#x0083;)}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 emspace or enspace entity is found after the table label. Remove it and keep normal space");
	}

	if($Table_Caption4=~m{<tablenumber>(.*?)(\&\#x00E2\;\&\#x0080;\&\#x0083;)(\s?)<\/tablenumber>}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 emspace or enspace entity is found after the table label. Remove it and keep normal space");
	}

	if($Table_Caption4=~m{<tablenumber>(.*?)(\s?)(\&\#x2003;|\&\#x2002)(\s?)<\/tablenumber>}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 emspace or enspace entity is found inside the table label. Remove it and keep normal space");
	}

	if($Table_Caption4=~m{<tablenumber>(.*?)<\/tablenumber>(\s?)(\&\#x2003;|\&\#x2002)}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 emspace or enspace entity is found after the table label. Remove it and keep normal space");
	}

	my $PLOS_Path=$ARGV[0];
	#if($PLOS_Path=~m{plos}gsi)
	#{
	my $Label=$Table_Caption6;

	$Label=~s{<bold>(.*?)<\/bold>}{$1}gsi;
	$Label=~s{<italic>(.*?)<\/italic>}{$1}gsi;
	$Label=~s{<bold\/>}{}gsi;
	$Label=~s{<italic\/>}{}gsi;
	
	

	$Label=~s{<query>(.*?)<\/query>}{}gsi;
	$Label=~s{<query\/>}{}gsi;
	$Label=~s{<\/tablenumber>([\.\,\s]+)<tablenumber>}{$1}gsi;

	if($Label!~m{\.(\s?)<\/tablenumber>}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Table number should end with dot");
	}
#}

	while($Table_Caption2=~m{<tablenumber>(.*?)<\/tablenumber>}gsi)
	{
		my $Label=$1;

		

		$Label=~s{^<bold>(.*?)<\/bold>$}{$1}gsi;

		$Label=~s{^<italic>(.*?)<\/italic>$}{$2}gsi;

		

		my $Label1=$Label;

		if($Label=~m{(<bold>|<italic>)}gsi)
		{

			$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Formatting partially applied for table number");
			
		}


		
		
		if($Label1=~m{<smallcaps>}gsi)
		{

			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Small cap not allowed for table number");
			
		}

		

		
		
	}

	
	while($Table_Caption3=~m{<smallcaps><tablenumber>(.*?)<\/tablenumber>}gsi)
	{
		my $Label=$1;

		

		
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Small cap not allowed for table number");
			
		
		
		
	}

	my $Fig1=$Table_Caption3;

	$Fig1=~s{<([^\>]+)\>}{}gsi;
	
	
	if($Fig1!~m{(\.)(\s?)$}gsi)
	{

		
		
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Table caption style should end with dot");
		

	
	}

	my $Abstract_Jou=$Journal;

my $Abs_Tmp=$Table_Caption;
my $Abs_Tmp1=$Table_Caption;


my $Tab_Tmp=$Table_Caption5;

my $OUP_Path=$ARGV[0];



if($OUP_Path=~m{(OUP\_Journals\-L|Data_OUPJOURNALS)}gsi)
{

if($Tab_Tmp=~m{<tablenumber>(.*?)<\/tablenumber>}gsi)
{
	my $Table_Number=$1;

	if($Table_Number=~m{(\d+)([A-Z]+)}gs)
	{
		$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Part Label not allowed in table caption");
	}
}

}

if($Abstract_Jou=~m{(HS9)}gsi)
{

if($Abs_Tmp=~m{([A-Z]) \= }gs)
{
	if($Abs_Tmp!~m{<abbreviationFloat>}gs)
	{
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Abbreviation float is not missing in Table Caption");
		
	}

}
}

my $Abss_Jou131=$Journal;
if($Abss_Jou131=~m{(TBMEDI|ABMEDI)}gsi)
{

	my $Tab_Tmp=$Table_Caption;
	
if($Tab_Tmp!~m{<tablenumber>(.*?)<\/tablenumber>(\|)}gsi)
{
	my $Table_Number=$1;

		$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Pipe symbol is must in between table number and table caption");
	
}

	
}
   
	


}




	
my $Reprint_Tmp=$Tmp;

my $Reprint_Tmp1=$Tmp;


my $An_Journal=$Journal;

if($An_Journal=~m{(ANE|XAA)}gsi)
{
	if($Reprint_Tmp=~m{<([^\>]+)\><([^\>]+)\>(Reprints will not be available)}gsi)
	{
		my $Style=$2;

		if($Style!~m{FMNoteReprint}gsi)
		{
		
		my $Paragraph_No=$1;
		$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Reprints will not be available should come in FMNoteReprint style");
		}
	}

	if($Reprint_Tmp1=~m{<([^\>]+)\><([^\>]+)\>(This manuscript was handled by)}gsi)
	{
		my $Style=$2;

		if($Style!~m{EMText}gsi)
		{
		
		my $Paragraph_No=$1;
		$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 This manuscript was handled by should come in EMText style");
		}
	}

	
	
}



my $Conflict_Tmp=$Tmp;



if($Journal=~m{(CROCOL|IBDJNL|JBCRES|SSJAPJ|TRANAS|CLINID)}gsi)
{
	if($Conflict_Tmp=~m{<([^\>]+)\><([^\>]+)\>Conflict of interest}gsi)
	{
		my $Style=$2;

		
		
		my $Paragraph_No=$1;
		$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Conflict of interest should come in EM_Text style");
	}
	
}
else
{
	if($Conflict_Tmp=~m{<([^\>]+)\><FMText>Conflict}gsi)
	{
		my $Paragraph_No=$1;
		$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Conflict of interest should come in back matter");
	}
}

my $Version_Tmp=$Tmp;

my $Jc_Journal=$Journal;

if($Jc_Journal=~m{(JCBIOL)}gsi)
{
	if($Version_Tmp=~m{<([^\>]+)\><([^\>]+)\>Version_of_Record}gsi)
	{
		my $Style=$2;

		if($Style!~m{EMNotesText}gsi)
		{
			

		
		
		my $Paragraph_No=$1;
		$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Version_of_Record should come in EM_Text_Para style");
		}
	}
	
}
	       

my $Table_Footnote=$Tmp;

while($Table_Footnote=~m{<([^\>]+)\><TableNote>(.*?)<\/TableNote>}gsi)
{
	my $Paragraph_No=$1;
	my $Table_Note=$2;
	if($Table_Note=~m{^(\s?)<sub>}gsi)
	{
		$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Table footnote queue should not start with subscript");
	}

	if($Table_Note=~m{^(\s?)<sup>}gsi)
	{
		
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning: Tabfnxref or Tabfnxrefonline is missing in table note");
	}
	
	
}


my $Table_Footnote1=$Tmp;



while($Table_Footnote1=~m{<([^\>]+)\><TableNote>(.*?)<\/TableNote>}gsi)
{
	my $Paragraph_No=$1;
	my $Table_Note=$2;
	if($Table_Note=~m{^(\s?)<sub>}gsi)
	{
		$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Table footnote queue should not start with subscript");
	}
	
	
}





my $Figure_Tmp=$Tmp;



while($Figure_Tmp=~m{<([^\>]+)\><FigureCaption>(.*?)<\/FigureCaption>}gsi)
{
	my $Paragraph_No=$1;
	my $Figure_Caption=$2;

	
	
	
	
	$Figure_Caption=~s{<figurenumber>([\.\s]+)<\/figurenumber>}{}gsi;

	$Figure_Caption=~s{<\/figurenumber><figurenumber>}{}gsi;

	my $Figure_Caption1=$Figure_Caption;

	my $Figure_Caption2=$Figure_Caption;

	my $Figure_Caption3=$Figure_Caption;

	my $Figure_Caption4=$Figure_Caption;

	my $Figure_Caption5=$Figure_Caption;

	my $Figure_Caption6=$Figure_Caption;

	my $Figure_Caption7=$Figure_Caption;

	my $Figure_Caption8=$Figure_Caption;

	my $Figure_Caption9=$Figure_Caption;

	

	
	
		    
	$Figure_Caption=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|tabxref|figxref|figxrefc|tabxrefc|modxref|videoxref|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref|url|figuretext|abbreviationFloat|secxref)>}{}gsi;

	$Figure_Caption=~s{<\/(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|tabxref|figxref|figxrefc|tabxrefc|modxref|videoxref|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref|url|figuretext|abbreviationFloat|secxref)>}{}gsi;

	$Figure_Caption=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|tabxref|figxref|figxrefc|tabxrefc|modxref|videoxref|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref|url|figuretext|abbreviationFloat|secxref)\/>}{}gsi;


	
	
	while($Figure_Caption=~m{<(\w([^\>]+))\>}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($Figure_Caption, $Character_Style) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Character style $1 is not allowed");
	}

	if($Figure_Caption1!~m{<figurenumber}gsi)
	{
		my $Character_Style=$1;

		

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Figure_number style is missing in figure caption");
	}

	while($Figure_Caption2=~m{<figurenumber>(.*?)<\/figurenumber>}gsi)
	{
		my $Label=$1;

		

		$Label=~s{^<bold>(.*?)<\/bold>$}{$1}gsi;

		$Label=~s{^<italic>(.*?)<\/italic>$}{$2}gsi;

		

		my $Label1=$Label;

		if($Label=~m{(<bold>|<italic>)}gsi)
		{

			$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Formatting partially applied for figure number");
			
		}


		
		
		if($Label1=~m{<smallcaps>}gsi)
		{

			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Small cap not allowed for figure number");
			
		}
		
		
	}

	
	while($Figure_Caption3=~m{<smallcaps><figurenumber>(.*?)<\/figurenumber>}gsi)
	{
		my $Label=$1;

		

		
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Small cap not allowed for figure number");
			
		
		
		
	}

	$Figure_Caption4=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption4=~s{<\/(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption4=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)\/>}{}gsi;


	while($Figure_Caption4=~m{(<figxref>(\(?)([A-Z])<\/figxref>)}gsi)
	{
		my $Fig_Xref=$1;

		

		my $cnum = index($Figure_Caption4, $Fig_Xref) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Part label is styled in figure caption");
		
		
		
	}

	$Figure_Caption5=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption5=~s{<\/(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption5=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)\/>}{}gsi;


	while($Figure_Caption5=~m{(<figxref>(.*?)<\/figxref>)}gsi)
	{
		my $Fig_Xref=$1;

		

		my $cnum = index($Figure_Caption4, $Fig_Xref) + 1;

		
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Check the figure citation inside the figure caption");
		
		
		
	}

	while($Figure_Caption3=~m{<\/figurenumber>(\s?)(\.)}gsi)
	{
		my $Fig_Xref=$1;

		

		my $cnum = index($Figure_Caption4, $Fig_Xref) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum label style is missing for dot after figure number");
		
		
		
	}

	$Figure_Caption8=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption8=~s{<\/(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption8=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)\/>}{}gsi;

	if($Figure_Caption8!~m{(\s?)(\.)(\s?)$}gsi)
	{
		my $Fig_Xref=$1;

		

		my $cnum = index($Figure_Caption4, $Fig_Xref) + 1;

		
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 Figure caption should end with dot");
		
		
		
	}

	$Figure_Caption9=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption9=~s{<\/(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption9=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)\/>}{}gsi;

	if($Journal eq "EMPHEA")
	{
	   
	if($Figure_Caption9=~m{(\s?)(\.)(\s?)$}gsi)
	{
		my $Fig_Xref=$1;

		

		my $cnum = index($Figure_Caption4, $Fig_Xref) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Figure caption should not end with dot for EMPHEA");
		
		
		
	}
	}
	

	my $Figure_Number_Count=$Figure_Caption7=~s{<figurenumber>}{<figurenumber>}gsi;

	if($Figure_Number_Count > 1)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 More then one figure number style present in word document");
		
		
		
	}
	
}




while($Figure_Tmp=~m{\[([^\]]+)\]<FigureCaption>(.*?)<\/FigureCaption>}gsi)
{
	my $Paragraph_No=$1;
	my $Figure_Caption=$2;

	
	
	
	
	$Figure_Caption=~s{<figurenumber>([\.\s]+)<\/figurenumber>}{}gsi;

	$Figure_Caption=~s{<\/figurenumber><figurenumber>}{}gsi;

	my $Figure_Caption1=$Figure_Caption;

	my $Figure_Caption2=$Figure_Caption;

	my $Figure_Caption3=$Figure_Caption;

	my $Figure_Caption4=$Figure_Caption;

	my $Figure_Caption5=$Figure_Caption;

	my $Figure_Caption6=$Figure_Caption;

	my $Figure_Caption7=$Figure_Caption;

	my $Figure_Caption8=$Figure_Caption;

	my $Figure_Caption9=$Figure_Caption;

	my $Figure_Caption10=$Figure_Caption;

	my $Figure_Caption11=$Figure_Caption;

	my $Figure_Caption12=$Figure_Caption;

	my $Figure_Caption13=$Figure_Caption;
	

	
	
		    
	$Figure_Caption=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|tabxref|figxref|figxrefc|tabxrefc|modxref|videoxref|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref|url|figuretext|abbreviationFloat)>}{}gsi;

	$Figure_Caption=~s{<\/(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|tabxref|figxref|figxrefc|tabxrefc|modxref|videoxref|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref|url|figuretext|abbreviationFloat)>}{}gsi;

	$Figure_Caption=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|tabxref|figxref|figxrefc|tabxrefc|modxref|videoxref|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref|url|figuretext|abbreviationFloat)\/>}{}gsi;


	
	
	while($Figure_Caption=~m{<(\w([^\>]+))\>}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($Figure_Caption, $Character_Style) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Character style $1 is not allowed");
	}

	if($Figure_Caption1!~m{<figurenumber}gsi)
	{
		my $Character_Style=$1;

		

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Figure_number style is missing in figure caption");
	}

	while($Figure_Caption2=~m{<figurenumber>(.*?)<\/figurenumber>}gsi)
	{
		my $Label=$1;

		

		$Label=~s{^<bold>(.*?)<\/bold>$}{$1}gsi;

		$Label=~s{^<italic>(.*?)<\/italic>$}{$2}gsi;

		

		my $Label1=$Label;

		if($Label=~m{(<bold>|<italic>)}gsi)
		{

			$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Formatting partially applied for figure number");
			
		}


		
		
		if($Label1=~m{<smallcaps>}gsi)
		{

			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Small cap not allowed for figure number");
			
		}
		
		
	}

	
	while($Figure_Caption3=~m{<smallcaps><figurenumber>(.*?)<\/figurenumber>}gsi)
	{
		my $Label=$1;

		

		
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Small cap not allowed for figure number");
			
		
		
		
	}

	$Figure_Caption4=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption4=~s{<\/(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption4=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)\/>}{}gsi;


	while($Figure_Caption4=~m{(<figxref>(\(?)([A-Z])<\/figxref>)}gsi)
	{
		my $Fig_Xref=$1;

		

		my $cnum = index($Figure_Caption4, $Fig_Xref) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Part label is styled in figure caption");
		
		
		
	}

	$Figure_Caption5=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption5=~s{<\/(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption5=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)\/>}{}gsi;


	while($Figure_Caption5=~m{(<figxref>(.*?)<\/figxref>)}gsi)
	{
		my $Fig_Xref=$1;

		

		my $cnum = index($Figure_Caption4, $Fig_Xref) + 1;

		
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Check the figure citation inside the figure caption");
		
		
		
	}

	while($Figure_Caption3=~m{<\/figurenumber>(\s?)(\.)}gsi)
	{
		my $Fig_Xref=$1;

		

		my $cnum = index($Figure_Caption4, $Fig_Xref) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum label style is missing for dot after figure number");
		
		
		
	}

	$Figure_Caption8=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption8=~s{<\/(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption8=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)\/>}{}gsi;

	if($Figure_Caption8!~m{(\s?)(\.)(\s?)$}gsi)
	{
		my $Fig_Xref=$1;

		

		my $cnum = index($Figure_Caption4, $Fig_Xref) + 1;

		
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 Figure caption should end with dot");
		
		
		
	}

	$Figure_Caption9=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption9=~s{<\/(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)>}{}gsi;

	$Figure_Caption9=~s{<(figurenumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref)\/>}{}gsi;

	if($Journal eq "EMPHEA")
	{
	   
	if($Figure_Caption9=~m{(\s?)(\.)(\s?)$}gsi)
	{
		my $Fig_Xref=$1;

		

		my $cnum = index($Figure_Caption4, $Fig_Xref) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Figure caption should not end with dot for EMPHEA");
		
		
		
	}
	}
	

	my $Figure_Number_Count=$Figure_Caption7=~s{<figurenumber>}{<figurenumber>}gsi;

	if($Figure_Number_Count > 1)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 More then one figure number style present in word document");
		
		
		
	}

	$Figure_Caption10=~s{<bold>}{}gsi;
	$Figure_Caption10=~s{<\/bold>}{}gsi;
	$Figure_Caption10=~s{<italic>}{}gsi;
	$Figure_Caption10=~s{<\/italic>}{}gsi;
	$Figure_Caption10=~s{<\/figuretext>(\s?)(\.)}{$1$2<\/figuretext>}gsi;

	my $Figure_Caption101=$Figure_Caption10;
	if($Figure_Caption10=~m{<\/figuretext>}gsi)
	{
		
		
		if($Figure_Caption101!~m{\.<\/figuretext>}gsi)
	{
			
		
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Figuretext style should end with dot");
		

	}
	}

	$Figure_Caption12=~s{<figuretext>(.*?)<\/figuretext>}{$1}gsi;
	$Figure_Caption12=~s{<bold>(.*?)<\/bold>}{$1}gsi;
	$Figure_Caption12=~s{<italic>(.*?)<\/italic>}{$1}gsi;

	my $Fig1=$Figure_Caption12;

	
	
	if($Fig1!~m{(\.)(\s?)$}gsi)
	{

		
		
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Figurecaption style should end with dot");
		

	
	}
	
}


my $Figure_Tmp=$Tmp;

while($Figure_Tmp=~m{<([^\>]+)\><ModelCaption>(.*?)<\/ModelCaption>}gsi)
{
	my $Paragraph_No=$1;
	my $Figure_Caption=$2;
	
	$Figure_Caption=~s{<modelnumber>([\.\s]+)<\/modelnumber>}{}gsi;

	$Figure_Caption=~s{<\/modelnumber><modelnumber>}{}gsi;

	my $Figure_Caption1=$Figure_Caption;

	my $Figure_Caption2=$Figure_Caption;

	my $Figure_Caption3=$Figure_Caption;

	my $Figure_Caption4=$Figure_Caption;

	my $Figure_Caption5=$Figure_Caption;

	my $Figure_Caption6=$Figure_Caption;

	my $Figure_Caption7=$Figure_Caption;

	my $Figure_Caption8=$Figure_Caption;

	

	
	
		    
	$Figure_Caption=~s{<(modelnumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|tabxref|figxref|modxref|videoxref|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref|fnxref|url|figuretext)>}{}gsi;

	$Figure_Caption=~s{<\/(modelnumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|tabxref|figxref|modxref|videoxref|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref|fnxref|url|figuretext)>}{}gsi;

	$Figure_Caption=~s{<(modelnumber|videonumber|italic|bold|sup|sub|smallcaps|comment|query|tabxref|figxref|modxref|videoxref|eqnxref|genxref|bibxref|UIXref|bibxrefonline|SupplementaryMaterialXref|fnxref|url|figuretext)\/>}{}gsi;


	
	
	while($Figure_Caption=~m{<(\w([^\>]+))\>}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($Figure_Caption, $Character_Style) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Character style $1 is not allowed");
	}

	if($Figure_Caption1!~m{<modelnumber}gsi)
	{
		my $Character_Style=$1;

		

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 model_number style is missing in model caption");
	}

	while($Figure_Caption2=~m{<figurenumber>(.*?)<\/figurenumber>}gsi)
	{
		my $Label=$1;

		

		$Label=~s{^<bold>(.*?)<\/bold>$}{$1}gsi;

		$Label=~s{^<italic>(.*?)<\/italic>$}{$2}gsi;

		

		my $Label1=$Label;

		if($Label=~m{(<bold>|<italic>)}gsi)
		{

			$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Formatting partially applied for model number");
			
		}


		
		
		if($Label1=~m{<smallcaps>}gsi)
		{

			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Small cap not allowed for model number");
			
		}
		
		
	}

	
	while($Figure_Caption3=~m{<smallcaps><modelnumber>(.*?)<\/modelnumber>}gsi)
	{
		my $Label=$1;

		

		
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Small cap not allowed for model number");
			
		
		
		
	}

	

	

	while($Figure_Caption3=~m{<\/modelnumber>(\s?)(\.)}gsi)
	{
		my $Fig_Xref=$1;

		

		my $cnum = index($Figure_Caption4, $Fig_Xref) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum label style is missing for dot after model number");
		
		
		
	}

	my $Figure_Number_Count=$Figure_Caption7=~s{<modelnumber>}{<modelnumber>}gsi;

	if($Figure_Number_Count > 1)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 More then one model number style present in word document");
		
		
		
	}

	
	if($Figure_Caption6!~m{https\:\/\/sketchfab\.com\/3d\-models\/(.*?)}gsi)
	{
		my $Fig_Xref=$1;

		

		my $cnum = index($Figure_Caption4, $Fig_Xref) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Sketchfab link is missing in model caption. Please check");
		
		
		
	}

	
	
}


my $Suppl_Path=$ARGV[0];

if($Suppl_Path=~m{(JData\\LWW|JData_NEW\\LWW)}gsi)
{

	my $Suppl_Tmp=$Tmp;
	
	my $Count_Supp=$Suppl_Tmp=~s{<FMNoteSupplementaryMaterial>}{<FMNoteSupplementaryMaterial>}gsi;

	if($Count_Supp gt 1)
	{
		$Err="1";
		push(@Error,"\~Para No:1 Col No:1 More then one FMNoteSupplementaryMaterial present in word document");
		
	}

	
}

my $History_Tmp=$Tmp;

my $Affiliation_Path2=$ARGV[0];

if($Affiliation_Path2!~m{(JData\\LWW|JData_NEW\\LWW)}gsi)
{

while($History_Tmp=~m{<(\d+)\><([^\>]+)\>Received}gsi)
{
	my $Paragraph_No=$1;
	$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Delete History Information from word document");
			
}

while($History_Tmp=~m{<(\d+)\><([^\>]+)\><([^\>]+)\>Received}gsi)
{
	my $Paragraph_No=$1;
	$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 History Information present in word document");
			
}

}

	

my $Figure_Tmp1=$Tmp;

	

while($Figure_Tmp=~m{<([^\>]+)\><FigureCaption>(.*?)<\/FigureCaption>}gsi)
{
	my $Figure=$2;
	my $Figure1=$2;
	my $Paragraph_No=$1;

	if($Figure=~m{<figurenumber>(.*?)<\/figurenumber>}gsi)
	{
		my $Figure_Number=$1;

		

		my $Count=$Tmp=~s{(<figurenumber>$Figure_Number<\/figurenumber>)}{$1}gsi;

		
		if($Count > 1)
		{
			$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Figure_number is repeted in figure caption");
		}
				
	}

	
	$Figure1 =~ s/(.)/asciiize($1)/eg;

	$Figure1=~s{<bold>(.*?)<\/bold>}{$1}gsi;

	$Figure1=~s{<italic>(.*?)<\/italic>}{$1}gsi;
	
	
	

	if($Figure1=~m{<figurenumber>(.*?)<\/figurenumber>(\s?)(\&\#x00E2\;\&\#x0080;\&\#x0083;)}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 emspace or enspace entity is found after the figure label. Remove it and keep normal space");
	}

	if($Figure1=~m{<figurenumber>(.*?)(\&\#x00E2\;\&\#x0080;\&\#x0083;)(\s?)<\/figurenumber>}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 emspace or enspace entity is found after the figure label. Remove it and keep normal space");
	}

	if($Figure1=~m{<figurenumber>(.*?)(\s?)(\&\#x2003;|\&\#x2002)(\s?)<\/figurenumber>}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 emspace or enspace entity is found inside the figure label. Remove it and keep normal space");
	}

	if($Figure1=~m{<figurenumber>(.*?)<\/figurenumber>(\s?)(\&\#x2003;|\&\#x2002)}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 emspace or enspace entity is found after the figure label. Remove it and keep normal space");
	}

	my $Abstract_Jou=$Journal;

my $Abs_Tmp=$Figure;
my $Abs_Tmp1=$Figure;


if($Abstract_Jou=~m{(HS9)}gsi)
{

if($Abs_Tmp=~m{([A-Z]) \= }gs)
{
	if($Abs_Tmp!~m{<abbreviationFloat>}gs)
	{
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Abbreviation float missing in Figure Caption");
		
	}

}
   
	
}


my $Abstract_Jou1=$Journal;

if($Abstract_Jou1=~m{^(RES|ATV|HAE|HCG|HCI|HCV|HCQ|HS9|HHF|CIR|STR|CP9)$}gsi)
{

	if($Abs_Tmp!~m{<Figuretext>}gs)
	{
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Figure text style missing in Figure Caption");
		
	}


}
	
}

my $Abstract_Jou111=$Journal;

if($Abstract_Jou111=~m{^(ATV|HAE|HCG|HCI|HCQ|CIR|HCV|HHF|HYP|RES|STR)$}gsi)
{
my $FM_Article_Title1=$Tmp;
while($FM_Article_Title1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$2;

	my $Label1=$2;

	$Label1=~s{<\/reftitleJournal>(\s?)(\.)}{$2<\/reftitleJournal>}gsi;

	if($Label=~m{<reftitleJournal>}si)
	{

		


	if($Label1!~m{\.(\s?)<\/reftitleJournal>}si)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Reference reftitleJournal should end with dot for $Journal");
	}
	}
}

}

my $Abstract_Jou11111=$Journal;

if($Abstract_Jou11111=~m{^(MC9|PASTJ|PAST\.J)$}gsi)
{
my $FM_Article_Title1=$Tmp;
while($FM_Article_Title1=~m{<([^\>]+)\><(HeadA|HeadB|HeadC|HeadD|HeadE)>(.*?)<\/\2>}gsi)
{

	my $Paragraph_No=$1;

	my $Label=$3;

	my $Label1=$3;

	$Label1=~s{<\/label>(\s?)(\.)}{$2<\/label>}gsi;

	if($Label=~m{\.<\/label>}si)
	{

	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 end period is not allowed in the end of the label");
	
	}
}

}
my $Arti_Tmp=$Tmp;

my $Ar_Tmp=$Tmp;

my $Abstract_Jou11=$Journal;

if($Abstract_Jou11=~m{^(RES|ATV|HAE|HCG|HCI|HCV|HCQ|HHF|CIR|STR|HYP)$}gsi)
{

while($Ar_Tmp=~m{An online graphic abstract is available for this article}gsi)
{
	push(@Error,"\~Para No:1 Col No:1 Check statement for graphical abstarct. It should be An graphic abstract is available for this article");
}
	


while($Arti_Tmp=~m{<([^\>]+)\><FMArticleTitle>(.*?)<\/FMArticleTitle>}gsi)
{
	my $Paragraph_No=$1;

	my $Content=$2;

	my $Content1=$2;

	$Content1=~s{<query>(.*?)<\/query>}{}gsi;
	$Content=~s{<query>(.*?)<\/query>}{}gsi;

	

	if($Content1=~m{<fmarticlesubtitle>}gs)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 fmarticlesubtitle is not allowed for aha journal");

	}

	
	#if($Content!~m{[A-Z][A-Z]}gs)
	#{

	#push(@Error,"\~Para No:$Paragraph_No Col No:1 Article title should be in title case");

	#}
	

}

}

my $New_Jou11=$Journal;

my $Subject_Tmp4444=$Tmp;
my $Subject_Tmp5555=$Tmp;

if($New_Jou11=~m{^(PG9|MD|MD9|MPG|IA9|CP9|HM9|JD9|MC9|PN9|RD9|BS9|CD9|JR9|JP9)$}gsi)
{

	while($Subject_Tmp4444=~m{<([^\>]+)\><(HeadA|HeadB|HeadC|HeadD)>(.*?)<\/\2>}gs)
	{
	my $Paragraph_No=$1;

	my $Content=$2;

	if($Content!~m{[a-z]}gs)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Heading should be in title case");

	}
	}

	while($Subject_Tmp5555=~m{<([^\>]+)\><(EMReferencesHead)>(.*?)<\/\2>}gs)
	{
	my $Paragraph_No=$1;

	my $Content=$2;

	if($Content!~m{References}gs)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Reference heading should be in lower case");

	}
	}

}

my $Arti_Tmp11=$Tmp;

my $Abstract_Jou1111=$Journal;

if($Abstract_Jou1111=~m{^(AESAME|ISDIVE|JCBIOL|JMAMMA|JMENTO|MSPEC|ZOOLIN)$}gsi)
{

	$Arti_Tmp11=~s{<query>(.*?)<\/query>}{}gsi;
	$Arti_Tmp11=~s{<query>(.*?)<\/query>}{}gsi;

	my $Arti_Tmp12=$Arti_Tmp11;
	
while($Arti_Tmp11=~m{(Zoobank|Nomenclature)}gsi)
{
	my $Cont=$1;

	my $Content=$2;

	my $Content1=$2;

	

	if($Arti_Tmp12!~m{<([^\>]+)\><FMVersionofRecord>}gs)
	{

	push(@Error,"\~Para No:1 Col No:1 $Cont found in word document without FMVersionofRecord");

	

	}
	

}

}


my $Arti_Tmp1=$Tmp;

my $Abstract_Jou111=$Journal;

if($Abstract_Jou111=~m{^(INF|EDE|EE9|CR9|AS9|CRD)$}gsi)
{

while($Arti_Tmp=~m{<([^\>]+)\><FMArticleTitle>(.*?)<\/FMArticleTitle>}gsi)
{
	my $Paragraph_No=$1;

	my $Content=$2;

	my $Content1=$2;

	$Content1=~s{<query>(.*?)<\/query>}{}gsi;
	$Content=~s{<query>(.*?)<\/query>}{}gsi;

	if($Content1=~m{\:}gs)
	{


	if($Content1!~m{<fmarticlesubtitle>}gs)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Colon is present in the article title. Without character style fmarticlesubtitle");

	}

	}
	#if($Content!~m{[A-Z][A-Z]}gs)
	#{

	#push(@Error,"\~Para No:$Paragraph_No Col No:1 Article title should be in title case");

	#}
	

}

}




my $Para_Tmp=$Tmp;




$Para_Tmp=~s{<para(\w+)\_(\w+)>}{}gsi;

$Para_Tmp=~s{<para(\w+)\_(\w+)>}{}gsi;

$Para_Tmp=~s{<(FMSectionTitle|FMSubsectionTitle|FMSectionEditor|FMSubjectCodes|FMCustomMetaLogo|FMCustomMetaPatientConsent|FMCustomMetaEthicsCommittee|FMSeriesTitle|FMSeriesText|FMArticleType|FMDOILine|FMRunningHeadRecto|FMRunningHeadVerso|FMArticleTitle|FMArticleSubtitle|FMArticleTranslatedTitle|FMArticleTranslatedSubtitle|FMReviewObject|FMRelatedArticle|FMCiteThisArticle|FMAuthors|FMAffiliations|FMAbstractHead|FMAbstractSectionHeadDisplayed|FMAbstractParaFlushLeft|FMAbstractParaInd|FMTranslatedAbstract|Keywords|Abbreviations|FMNoteAuthorBio|FMNoteCorrespondence|ParaFlushLeft|ParaInd|HeadA|HeadB|HeadC|HeadD|HeadE|HeadF|HeadG|BL1|BL2|BL3|BL4|BL5|OL1|OL2|OL3|OL4|OL5|ListPara|UL1|UL2|UL3|ExtractHead|Extract|ExtractTextInd|ExtractSpaceAboveSecondExtract|ExtractList|ExtractSubList|ExtractTranslation|ExtractSource|Epigraph|EpigraphTextInd|EpigraphSource|PoetryExtract|PoetryExtractSpaceAboveStanzaBreak|PoetryExtractSource|DialogueExtract|DialogueExtractSource|Epilogue|EpilogueTextInd|EpilogueSource|Footnote|EMAcknowledgmentsHead|EMAcknowledgmentsText|EMAppendixNumber|EMAppendixTitle|EMNotesTitle|EMGlossaryTitle|EMGlossaryEntry|EMOtherSectionTitle|EMReferencesHead|Reference|RefAnnotationPara|BoxNumber|BoxTitle|BoxSubtitle|BoxParaFlushLeft|BoxParaInd|BoxHeadA|BoxHeadB|BoxHeadC|BoxExtract|BoxExtractTextInd|BoxExtractSource|BoxBL1|BoxOL1|BoxUL1|BoxBL2|BoxOL2|BoxUL2|BoxBL|BoxOL|BoxUL|BoxBL|BoxOL|BoxUL|BoxNote|BoxSource|TableNumber|TableCaption|TableColumnHead|TableStubEntry|TableStubSubentry|TableBody|TableNote|TableSource|TableHeadA|TableHeadB|TableHeadC|FigureNumber|FigureCaption|ModelCaption|ParaCreditLine|FigureNote|FigureSource|InlineGraphic|EMSupplementaryMaterialTitle|SupplementaryMaterialNumber|SupplementaryMaterialCaption|SupplementaryMaterialNote|SupplementaryMaterialSource|VideoNumber|VideoCaption|VideoNote|VideoSource|EquationDisplay|ChemicalStructureDisplay|FormalStatement|FormalStatement|ResponseArticleSeparator|SubarticleSeparator|NoteToComp|p|EMNotes|EMNotesText|EMHeadA|EMHeadB|EMText|EMTextInd|FMText|FMVersionofRecord|FMNotesText|EMNotesText|SupplementaryMaterialXref|FMTransAbstractParaInd|FMTransAbstractParaFlushLeft|FMTransAbstractHead|FMTransAbstractSectionHeadDisplayed|FMGrapAbstractHead|FMGrapAbstractParaFlushLeft|FMGrapAbstractParaInd|FMVideoAbstractParaFlushLeft|FMVideoAbstractParaInd|FMVideoAbstractHead|KeywordsTrans|TSComment|PullQuotes|FMLayAbstractHead|FMLayAbstractParaFlushLeft|FMLayAbstractParaInd|Pests|FMSummaryHead|FMSummaryParaFlushLeft|FMSummaryParaInd|OrcXref|FMNoteReport|FMNoteReprint|FMNoteStudyGroupMembers|FootnoteExtract)>}{}gsi;

$Para_Tmp=~s{<\/(FMSectionTitle|FMSubsectionTitle|FMSectionEditor|FMSubjectCodes|FMCustomMetaLogo|FMCustomMetaPatientConsent|FMCustomMetaEthicsCommittee|FMSeriesTitle|FMSeriesText|FMArticleType|FMDOILine|FMRunningHeadRecto|FMRunningHeadVerso|FMArticleTitle|FMArticleSubtitle|FMArticleTranslatedTitle|FMArticleTranslatedSubtitle|FMReviewObject|FMRelatedArticle|FMCiteThisArticle|FMAuthors|FMAffiliations|FMAbstractHead|FMAbstractSectionHeadDisplayed|FMAbstractParaFlushLeft|FMAbstractParaInd|FMTranslatedAbstract|Keywords|Abbreviations|FMNoteAuthorBio|ParaFlushLeft|ParaInd|HeadA|HeadB|HeadC|HeadD|HeadE|HeadF|HeadG|BL1|BL2|BL3|BL4|BL5|OL1|OL2|OL3|OL4|OL5|ListPara|UL1|UL2|UL3|ExtractHead|Extract|ExtractTextInd|ExtractSpaceAboveSecondExtract|ExtractList|ExtractSubList|ExtractTranslation|ExtractSource|Epigraph|EpigraphTextInd|EpigraphSource|PoetryExtract|PoetryExtractSpaceAboveStanzaBreak|PoetryExtractSource|DialogueExtract|DialogueExtractSource|Epilogue|EpilogueTextInd|EpilogueSource|Footnote|EMAcknowledgmentsHead|EMAcknowledgmentsText|EMAppendixNumber|EMAppendixTitle|EMNotesTitle|EMGlossaryTitle|EMGlossaryEntry|EMOtherSectionTitle|EMReferencesHead|Reference|RefAnnotationPara|BoxNumber|BoxTitle|BoxSubtitle|BoxParaFlushLeft|BoxParaInd|BoxHeadA|BoxHeadB|BoxHeadC|BoxExtract|BoxExtractTextInd|BoxExtractSource|BoxBL1|BoxOL1|BoxUL1|BoxBL2|BoxOL2|BoxUL2|BoxBL|BoxOL|BoxUL|BoxBL|BoxOL|BoxUL|BoxNote|BoxSource|TableNumber|TableCaption|TableColumnHead|TableStubEntry|TableStubSubentry|TableBody|TableNote|TableSource|TableHeadA|TableHeadB|TableHeadC|FigureNumber|FigureCaption|ModelCaption|ParaCreditLine|FigureNote|FigureSource|InlineGraphic|EMSupplementaryMaterialTitle|SupplementaryMaterialNumber|SupplementaryMaterialCaption|SupplementaryMaterialNumber|SupplementaryMaterialNote|SupplementaryMaterialSource|VideoNumber|VideoCaption|VideoNote|VideoSource|EquationDisplay|ChemicalStructureDisplay|FormalStatement|FormalStatement|ResponseArticleSeparator|SubarticleSeparator|NoteToComp|p|EMNotes|EMNotesText|EMHeadA|EMText|EMTextInd|FMText|FMVersionofRecord|EMNotesText|FMNotesText|SupplementaryMaterialXref|FMNoteGuestEditor|FMTransAbstractParaInd|FMTransAbstractParaFlushLeft|FMTransAbstractHead|FMTransAbstractSectionHeadDisplayed|FMGrapAbstractHead|FMGrapAbstractParaFlushLeft|FMGrapAbstractParaInd|FMVideoAbstractParaFlushLeft|FMVideoAbstractParaInd|FMVideoAbstractHead|KeywordsTrans|TSComment|PullQuotes|FMLayAbstractHead|FMLayAbstractParaFlushLeft|FMLayAbstractParaInd|Pests|ExtractBL1|ExtractBL2|ExtractBL3|ExtractNL1|ExtractNL2|ExtractNL3|ExtractOL1|ExtractOL2|ExtractOL3|FMSummaryHead|FMSummaryParaFlushLeft|FMSummaryParaInd|OrcXref|FMNoteReport|FMNoteReprint|FMNoteStudyGroupMembers|FootnoteExtract)>}{}gsi;

$Para_Tmp=~s{<(fmsubjectCode|fmdoi|fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmauDegree|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrSuffix|fmcorrDegree|fmauCollab|fmaffInstitution|fmaffDepartment|fmaffCity|fmaffState|fmaffAddressLine|fmaffCountry|fmaffFax|fmaffPhone|fmaffEmail|fmmsHistoryreceivedDate|fmmsHistoryrevisedRequestDate|fmmsHistoryrevisedDate|fmmsHistoryacceptedDate|fmabstractsectionHeadrunIn|keywordsHead|keyword|abbreviation|abbreviationExpansion|abbreviationsHead|fmcopyrightDate|fmcopyrightHolder|headArunIn|headBrunIn|headCrunIn|headDrunIn|headErunIn|label|listheadrunIn|emappendixNumber|emauthorBioname|glossaryTerm|glossaryDefinition|refanonymous|refauCollab|refedCollab|reftransCollab|refassigneeCollab|refcompilerCollab|refguestedCollab|refinventorCollab|refauSurname|refedSurname|reftransSurname|reftransedSurname|refassigneeSurname|refcompilerSurname|refdirectorSurname|refguestedSurname|refinventorSurname|refauGivenName|refedGivenName|reftransGivenName|reftransedGivenName|refassigneeGivenName|refcompilerGivenName|refdirectorGivenName|refguestedGivenName|refinventorGivenName|refauPrefix|refedPrefix|reftransPrefix|reftransedPrefix|refassigneePrefix|refcompilerPrefix|refdirectorPrefix|refguestedPrefix|refinventorPrefix|refauSuffix|refedSuffix|reftransSuffix|reftransedSuffix|refassigneeSuffix|refcompilerSuffix|refdirectorSuffix|refguestedSuffix|refinventorSuffix|refaffiliation|refetal|reftitleArticle|reftitleChapter|reftitlePatent|reftitleDiscussion|reftitleTransArticle|reftitleTransChapter|reftitleTransPatent|reftitleTransCommunication|reftitleTransDiscussion|reftitleJournal|reftitleBook|reftitleThesis|reftitleWebsite|refcommunicationType|refdiscussionType|refidPatentNumber|reftitleTransJournal|reftitleTransBook|reftitleTransThesis|reftitleTransWebsite|refpubdateYear|refpubdateMonth|refpubdateDay|refpubdateTime|refpubdateSeason|refaccessDate|refvolumeNumber|refedition|refconferenceName|refconferenceDate|refconferencePlace|refissueNumber|refsupplement|refpublisherLocation|refpublisherName|refpageFirst|refpageLast|refpageCount|refseriesTitle|refidDOI|refidCrossref|refidPMID|refannotationinline|refnumber|refURL|refconferenceSponsor|refidGovernmentReportNumber|refidISBN|refidISSN|refissueTitle|refidStandardsNumber|boxnumberrunIn|supplementaryMaterialnumber|videonumber|equationDisplayNumber|chemicalStructureNumber|URL|pi|query|BibXref|UIXref|BibXrefonline|FnXref|FnXrefonline|TabXref|BoxXref|FigXref|modxref|videoxref|genxref|AffXref|AffXrefonline|allcaps|allcapsbold|allcapsbolditalic|allcapsitalic|bold|bolditalic|italic|math|mathitalic|smallcaps|strikethrough|sub|subbold|subbolditalic|subitalic|sup|supbold|supbolditalic|supitalic|underline|comment|EMNotes|EMNotesText|EMHeadA|EMText|EMTextInd|FMText|FMVersionofRecord|FMNotesText|EMNotesText|fmgrantSponsor|SupplementaryMaterialXref|FMNoteGuestEditor|tabfnxref|tabfnxrefonline|FMTransAbstractParaInd|FMTransAbstractParaFlushLeft|FMTransAbstractHead|FMTransAbstractSectionHeadDisplayed|FMGrapAbstractHead|FMGrapAbstractParaFlushLeft|FMGrapAbstractParaInd|FMVideoAbstractParaFlushLeft|FMVideoAbstractParaInd|FMVideoAbstractHead|KeywordsTrans|TSComment|PullQuotes|FMLayAbstractHead|FMLayAbstractParaFlushLeft|FMLayAbstractParaInd|Pests|ExtractBL1|ExtractBL2|ExtractBL3|ExtractNL1|ExtractNL2|ExtractNL3|ExtractOL1|ExtractOL2|ExtractOL3|FMSummaryHead|FMSummaryParaFlushLeft|FMSummaryParaInd|OrcXref|FMNoteReport|FMNoteReprint|FMNoteStudyGroupMembers|FootnoteExtract)>}{}gsi;



	$Para_Tmp=~s{<\/(fmsubjectCode|fmdoi|fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmauDegree|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrSuffix|fmcorrDegree|fmauCollab|fmaffInstitution|fmaffDepartment|fmaffCity|fmaffState|fmaffAddressLine|fmaffCountry|fmaffFax|fmaffPhone|fmaffEmail|fmmsHistoryreceivedDate|fmmsHistoryrevisedRequestDate|fmmsHistoryrevisedDate|fmmsHistoryacceptedDate|fmabstractsectionHeadrunIn|keywordsHead|keywords|abbreviation|abbreviationExpansion|abbreviationsHead|fmcopyrightDate|fmcopyrightHolder|headArunIn|headBrunIn|headCrunIn|headDrunIn|headErunIn|label|listheadrunIn|emappendixNumber|emauthorBioname|glossaryTerm|glossaryDefinition|refanonymous|refauCollab|refedCollab|reftransCollab|refassigneeCollab|refcompilerCollab|refguestedCollab|refinventorCollab|refauSurname|refedSurname|reftransSurname|reftransedSurname|refassigneeSurname|refcompilerSurname|refdirectorSurname|refguestedSurname|refinventorSurname|refauGivenName|refedGivenName|reftransGivenName|reftransedGivenName|refassigneeGivenName|refcompilerGivenName|refdirectorGivenName|refguestedGivenName|refinventorGivenName|refauPrefix|refedPrefix|reftransPrefix|reftransedPrefix|refassigneePrefix|refcompilerPrefix|refdirectorPrefix|refguestedPrefix|refinventorPrefix|refauSuffix|refedSuffix|reftransSuffix|reftransedSuffix|refassigneeSuffix|refcompilerSuffix|refdirectorSuffix|refguestedSuffix|refinventorSuffix|refaffiliation|refetal|reftitleArticle|reftitleChapter|reftitlePatent|reftitleDiscussion|reftitleTransArticle|reftitleTransChapter|reftitleTransPatent|reftitleTransCommunication|reftitleTransDiscussion|reftitleJournal|reftitleBook|reftitleThesis|reftitleWebsite|refcommunicationType|refdiscussionType|refidPatentNumber|reftitleTransJournal|reftitleTransBook|reftitleTransThesis|reftitleTransWebsite|refpubdateYear|refpubdateMonth|refpubdateDay|refpubdateTime|refpubdateSeason|refaccessDate|refvolumeNumber|refedition|refconferenceName|refconferenceDate|refconferencePlace|refissueNumber|refsupplement|refpublisherLocation|refpublisherName|refpageFirst|refpageLast|refpageCount|refseriesTitle|refidDOI|refidCrossref|refidPMID|refannotationinline|refnumber|refURL|refconferenceSponsor|refidGovernmentReportNumber|refidISBN|refidISSN|refissueTitle|refidStandardsNumber|boxnumberrunIn|supplementaryMaterialnumber|videonumber|equationDisplayNumber|chemicalStructureNumber|URL|pi|query|BibXref|UIXref|BibXrefonline|FnXref|FnXrefonline|TabXref|BoxXref|FigXref|modxref|videoxref|genxref|AffXref|AffXrefonline|allcaps|allcapsbold|allcapsbolditalic|allcapsitalic|bold|bolditalic|italic|math|mathitalic|smallcaps|strikethrough|sub|subbold|subbolditalic|subitalic|sup|supbold|supbolditalic|supitalic|underline|comment|EMNotes|EMNotesText|EMHeadA|EMText|EMTextInd|FMText|FMVersionofRecord|FMNotesText|EMNotesText|fmgrantSponsor|SupplementaryMaterialXref|FMNoteGuestEditor|FMTransAbstractParaInd|FMTransAbstractParaFlushLeft|FMTransAbstractHead|FMTransAbstractSectionHeadDisplayed|FMGrapAbstractHead|FMGrapAbstractParaFlushLeft|FMGrapAbstractParaInd|FMVideoAbstractParaFlushLeft|FMVideoAbstractParaInd|FMVideoAbstractHead|KeywordsTrans|TSComment|PullQuotes|FMLayAbstractHead|FMLayAbstractParaFlushLeft|FMLayAbstractParaInd|Pests|ExtractBL1|ExtractBL2|ExtractBL3|ExtractNL1|ExtractNL2|ExtractNL3|ExtractOL1|ExtractOL2|ExtractOL3|FMSummaryHead|FMSummaryParaFlushLeft|FMSummaryParaInd|OrcXref|FMNoteReport|FMNoteReprint|FMNoteStudyGroupMembers|FootnoteExtract)>}{}gsi;

$Para_Tmp=~s{<(FMSectionTitle|FMSubsectionTitle|FMSectionEditor|FMSubjectCodes|FMCustomMetaLogo|FMCustomMetaPatientConsent|FMCustomMetaEthicsCommittee|FMSeriesTitle|FMSeriesText|FMArticleType|FMDOILine|FMRunningHeadRecto|FMRunningHeadVerso|FMArticleTitle|FMArticleSubtitle|FMArticleTranslatedTitle|FMArticleTranslatedSubtitle|FMReviewObject|FMRelatedArticle|FMCiteThisArticle|FMAuthors|FMAffiliations|FMAbstractHead|FMAbstractSectionHeadDisplayed|FMAbstractParaFlushLeft|FMAbstractParaInd|FMTranslatedAbstract|Keywords|Abbreviations|FMNoteAuthorBio|FMNoteCorrespondence|ParaFlushLeft|ParaInd|HeadA|HeadB|HeadC|HeadD|HeadE|HeadF|HeadG|BL1|BL2|BL3|BL4|BL5|OL1|OL2|OL3|OL4|OL5|ListPara|UL1|UL2|UL3|ExtractHead|Extract|ExtractTextInd|ExtractSpaceAboveSecondExtract|ExtractList|ExtractSubList|ExtractTranslation|ExtractSource|Epigraph|EpigraphTextInd|EpigraphSource|PoetryExtract|PoetryExtractSpaceAboveStanzaBreak|PoetryExtractSource|DialogueExtract|DialogueExtractSource|Epilogue|EpilogueTextInd|EpilogueSource|Footnote|EMAcknowledgmentsHead|EMAcknowledgmentsText|EMAppendixNumber|EMAppendixTitle|EMNotesTitle|EMGlossaryTitle|EMGlossaryEntry|EMOtherSectionTitle|EMReferencesHead|Reference|RefAnnotationPara|BoxNumber|BoxTitle|BoxSubtitle|BoxParaFlushLeft|BoxParaInd|BoxHeadA|BoxHeadB|BoxHeadC|BoxExtract|BoxExtractTextInd|BoxExtractSource|BoxBL1|BoxOL1|BoxUL1|BoxBL2|BoxOL2|BoxUL2|BoxBL|BoxOL|BoxUL|BoxBL|BoxOL|BoxUL|BoxNote|BoxSource|TableNumber|TableCaption|TableColumnHead|TableStubEntry|TableStubSubentry|TableBody|TableNote|TableSource|TableHeadA|TableHeadB|TableHeadC|FigureNumber|FigureCaption|ModelCaption|ParaCreditLine|FigureNote|FigureSource|InlineGraphic|EMSupplementaryMaterialTitle|SupplementaryMaterialNumber|SupplementaryMaterialCaption|SupplementaryMaterialNumber|SupplementaryMaterialNote|SupplementaryMaterialSource|VideoNumber|VideoCaption|VideoNote|VideoSource|EquationDisplay|ChemicalStructureDisplay|FormalStatement|FormalStatement|ResponseArticleSeparator|SubarticleSeparator|NoteToComp|comment|p|EMNotes|EMNotesText|EMHeadA|EMText|EMTextInd|FMText|FMVersionofRecord|FMNotesText|EMNotesText|fmgrantSponsor|SupplementaryMaterialXref|FMNoteGuestEditor|FMTransAbstractParaInd|FMTransAbstractParaFlushLeft|FMTransAbstractHead|FMTransAbstractSectionHeadDisplayed|FMGrapAbstractHead|FMGrapAbstractParaFlushLeft|FMGrapAbstractParaInd|FMVideoAbstractParaFlushLeft|FMVideoAbstractParaInd|FMVideoAbstractHead|KeywordsTrans|TSComment|PullQuotes|FMLayAbstractHead|FMLayAbstractParaFlushLeft|FMLayAbstractParaInd|Pests|ExtractBL1|ExtractBL2|ExtractBL3|ExtractNL1|ExtractNL2|ExtractNL3|ExtractOL1|ExtractOL2|ExtractOL3|FMSummaryHead|FMSummaryParaFlushLeft|FMSummaryParaInd|OrcXref|FMNoteReport|FMNoteReprint|FMNoteStudyGroupMembers|FootnoteExtract)\/>}{}gsi;

$Para_Tmp=~s{<\/(fmsubjectCode|fmdoi|fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmauDegree|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrSuffix|fmcorrDegree|fmauCollab|fmaffInstitution|fmaffDepartment|fmaffCity|fmaffState|fmaffAddressLine|fmaffCountry|fmaffFax|fmaffPhone|fmaffEmail|fmmsHistoryreceivedDate|fmmsHistoryrevisedRequestDate|fmmsHistoryrevisedDate|fmmsHistoryacceptedDate|fmabstractsectionHeadrunIn|keywordsHead|keywords|abbreviation|abbreviationExpansion|abbreviationsHead|fmcopyrightDate|fmcopyrightHolder|headArunIn|headBrunIn|headCrunIn|headDrunIn|headErunIn|label|listheadrunIn|emappendixNumber|emauthorBioname|glossaryTerm|glossaryDefinition|refanonymous|refauCollab|refedCollab|reftransCollab|refassigneeCollab|refcompilerCollab|refguestedCollab|refinventorCollab|refauSurname|refedSurname|reftransSurname|reftransedSurname|refassigneeSurname|refcompilerSurname|refdirectorSurname|refguestedSurname|refinventorSurname|refauGivenName|refedGivenName|reftransGivenName|reftransedGivenName|refassigneeGivenName|refcompilerGivenName|refdirectorGivenName|refguestedGivenName|refinventorGivenName|refauPrefix|refedPrefix|reftransPrefix|reftransedPrefix|refassigneePrefix|refcompilerPrefix|refdirectorPrefix|refguestedPrefix|refinventorPrefix|refauSuffix|refedSuffix|reftransSuffix|reftransedSuffix|refassigneeSuffix|refcompilerSuffix|refdirectorSuffix|refguestedSuffix|refinventorSuffix|refaffiliation|refetal|reftitleArticle|reftitleChapter|reftitlePatent|reftitleDiscussion|reftitleTransArticle|reftitleTransChapter|reftitleTransPatent|reftitleTransCommunication|reftitleTransDiscussion|reftitleJournal|reftitleBook|reftitleThesis|reftitleWebsite|refcommunicationType|refdiscussionType|refidPatentNumber|reftitleTransJournal|reftitleTransBook|reftitleTransThesis|reftitleTransWebsite|refpubdateYear|refpubdateMonth|refpubdateDay|refpubdateTime|refpubdateSeason|refaccessDate|refvolumeNumber|refedition|refconferenceName|refconferenceDate|refconferencePlace|refissueNumber|refsupplement|refpublisherLocation|refpublisherName|refpageFirst|refpageLast|refpageCount|refseriesTitle|refidDOI|refidCrossref|refidPMID|refannotationinline|refnumber|refURL|refconferenceSponsor|refidGovernmentReportNumber|refidISBN|refidISSN|refissueTitle|refidStandardsNumber|boxnumberrunIn|supplementaryMaterialnumber|videonumber|equationDisplayNumber|chemicalStructureNumber|URL|pi|query|BibXref|UIXref|BibXrefonline|FnXref|FnXrefonline|TabXref|Eqnxref|FigXref|modxref|videoxref|Eqnxref|genxref|AffXref|AffXrefonline|allcaps|allcapsbold|allcapsbolditalic|allcapsitalic|bold|bolditalic|italic|math|mathitalic|smallcaps|strikethrough|sub|subbold|subbolditalic|subitalic|sup|supbold|supbolditalic|supitalic|underline|comment|EMNotes|EMNotesText|EMHeadA|EMText|EMTextInd|FMText|FMVersionofRecord|FMNotesText|EMNotesText|fmgrantSponsor|SupplementaryMaterialXref|FMNoteGuestEditor|tabfnxref|tabfnxrefonline|FMTransAbstractParaInd|FMTransAbstractParaFlushLeft|FMTransAbstractHead|FMTransAbstractSectionHeadDisplayed|FMGrapAbstractHead|FMGrapAbstractParaFlushLeft|FMGrapAbstractParaInd|FMVideoAbstractParaFlushLeft|FMVideoAbstractParaInd|FMVideoAbstractHead|KeywordsTrans|TSComment|PullQuotes|FMLayAbstractHead|FMLayAbstractParaFlushLeft|FMLayAbstractParaInd|Pests|ExtractBL1|ExtractBL2|ExtractBL3|ExtractNL1|ExtractNL2|ExtractNL3|ExtractOL1|ExtractOL2|ExtractOL3|FMSummaryHead|FMSummaryParaFlushLeft|FMSummaryParaInd|OrcXref|FMNoteReport|FMNoteReprint|FMNoteStudyGroupMembers|FootnoteExtract)>}{}gsi;

$Para_Tmp=~s{<\/(fmsubjectCode|fmdoi|fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmauDegree|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrSuffix|fmcorrDegree|fmauCollab|fmaffInstitution|fmaffDepartment|fmaffCity|fmaffState|fmaffAddressLine|fmaffCountry|fmaffFax|fmaffPhone|fmaffEmail|fmmsHistoryreceivedDate|fmmsHistoryrevisedRequestDate|fmmsHistoryrevisedDate|fmmsHistoryacceptedDate|fmabstractsectionHeadrunIn|keywordsHead|keywords|abbreviation|abbreviationExpansion|abbreviationsHead|fmcopyrightDate|fmcopyrightHolder|headArunIn|headBrunIn|headCrunIn|headDrunIn|headErunIn|label|listheadrunIn|emappendixNumber|emauthorBioname|glossaryTerm|glossaryDefinition|refanonymous|refauCollab|refedCollab|reftransCollab|refassigneeCollab|refcompilerCollab|refguestedCollab|refinventorCollab|refauSurname|refedSurname|reftransSurname|reftransedSurname|refassigneeSurname|refcompilerSurname|refdirectorSurname|refguestedSurname|refinventorSurname|refauGivenName|refedGivenName|reftransGivenName|reftransedGivenName|refassigneeGivenName|refcompilerGivenName|refdirectorGivenName|refguestedGivenName|refinventorGivenName|refauPrefix|refedPrefix|reftransPrefix|reftransedPrefix|refassigneePrefix|refcompilerPrefix|refdirectorPrefix|refguestedPrefix|refinventorPrefix|refauSuffix|refedSuffix|reftransSuffix|reftransedSuffix|refassigneeSuffix|refcompilerSuffix|refdirectorSuffix|refguestedSuffix|refinventorSuffix|refaffiliation|refetal|reftitleArticle|reftitleChapter|reftitlePatent|reftitleDiscussion|reftitleTransArticle|reftitleTransChapter|reftitleTransPatent|reftitleTransCommunication|reftitleTransDiscussion|reftitleJournal|reftitleBook|reftitleThesis|reftitleWebsite|refcommunicationType|refdiscussionType|refidPatentNumber|reftitleTransJournal|reftitleTransBook|reftitleTransThesis|reftitleTransWebsite|refpubdateYear|refpubdateMonth|refpubdateDay|refpubdateTime|refpubdateSeason|refaccessDate|refvolumeNumber|refedition|refconferenceName|refconferenceDate|refconferencePlace|refissueNumber|refsupplement|refpublisherLocation|refpublisherName|refpageFirst|refpageLast|refpageCount|refseriesTitle|refidDOI|refidCrossref|refidPMID|refannotationinline|refnumber|refURL|refconferenceSponsor|refidGovernmentReportNumber|refidISBN|refidISSN|refissueTitle|refidStandardsNumber|boxnumberrunIn|supplementaryMaterialnumber|videonumber|equationDisplayNumber|chemicalStructureNumber|URL|pi|query|BibXref|UIXref|BibXrefonline|FnXref|FnXrefonline|TabXref|Boxxref|Eqnxref|FigXref|modxref|videoxref|genxref|AffXref|AffXrefonline|allcaps|allcapsbold|allcapsbolditalic|allcapsitalic|bold|bolditalic|italic|math|mathitalic|smallcaps|strikethrough|sub|subbold|subbolditalic|subitalic|sup|supbold|supbolditalic|supitalic|underline|comment|EMNotes|EMNotesText|EMHeadA|EMText|EMTextInd|FMText|FMVersionofRecord|FMNotesText|EMNotesText|fmgrantSponsor|bibxrefonline|SupplementaryMaterialXref|FMNoteGuestEditor|FMTransAbstractParaInd|FMTransAbstractParaFlushLeft|FMTransAbstractHead|FMTransAbstractSectionHeadDisplayed|FMGrapAbstractHead|FMGrapAbstractParaFlushLeft|FMGrapAbstractParaInd|FMVideoAbstractParaFlushLeft|FMVideoAbstractParaInd|FMVideoAbstractHead|KeywordsTrans|TSComment|PullQuotes|FMLayAbstractHead|FMLayAbstractParaFlushLeft|FMLayAbstractParaInd|Pests|ExtractBL1|ExtractBL2|ExtractBL3|ExtractNL1|ExtractNL2|ExtractNL3|ExtractOL1|ExtractOL2|ExtractOL3|FMSummaryHead|FMSummaryParaFlushLeft|FMSummaryParaInd|OrcXref|FMNoteReport|FMNoteReprint|FMNoteStudyGroupMembers|FootnoteExtract)\/>}{}gsi;


$Para_Tmp=~s{<(FMSectionTitle|FMSubsectionTitle|FMSectionEditor|FMSubjectCodes|FMCustomMetaLogo|FMCustomMetaPatientConsent|FMCustomMetaEthicsCommittee|FMSeriesTitle|FMSeriesText|FMArticleType|FMDOILine|FMRunningHeadRecto|FMRunningHeadVerso|FMArticleTitle|FMArticleSubtitle|FMArticleTranslatedTitle|FMArticleTranslatedSubtitle|FMReviewObject|FMRelatedArticle|FMCiteThisArticle|FMAuthors|FMAffiliations|FMAbstractHead|FMAbstractSectionHeadDisplayed|FMAbstractParaFlushLeft|FMAbstractParaInd|FMTranslatedAbstract|Keywords|Abbreviations|FMNoteAuthorBio|FMNoteCorrespondence|ParaFlushLeft|ParaInd|HeadA|HeadB|HeadC|HeadD|HeadE|HeadF|HeadG|BL1|BL2|BL3|BL4|BL5|OL1|OL2|OL3|OL4|OL5|ListPara|UL1|UL2|UL3|ExtractHead|Extract|ExtractTextInd|ExtractSpaceAboveSecondExtract|ExtractList|ExtractSubList|ExtractTranslation|ExtractSource|Epigraph|EpigraphTextInd|EpigraphSource|PoetryExtract|PoetryExtractSpaceAboveStanzaBreak|PoetryExtractSource|DialogueExtract|DialogueExtractSource|Epilogue|EpilogueTextInd|EpilogueSource|Footnote|EMAcknowledgmentsHead|EMAcknowledgmentsText|EMAppendixNumber|EMAppendixTitle|EMNotesTitle|EMGlossaryTitle|EMGlossaryEntry|EMOtherSectionTitle|EMReferencesHead|Reference|RefAnnotationPara|BoxNumber|BoxTitle|BoxSubtitle|BoxParaFlushLeft|BoxParaInd|BoxHeadA|BoxHeadB|BoxHeadC|BoxExtract|BoxExtractTextInd|BoxExtractSource|BoxBL1|BoxOL1|BoxUL1|BoxBL2|BoxOL2|BoxUL2|BoxBL|BoxOL|BoxUL|BoxBL|BoxOL|BoxUL|BoxNote|BoxSource|TableNumber|TableCaption|TableColumnHead|TableStubEntry|TableStubSubentry|TableBody|TableNote|TableSource|TableHeadA|TableHeadB|TableHeadC|FigureNumber|FigureCaption|ModelCaption|ParaCreditLine|FigureNote|FigureSource|InlineGraphic|EMSupplementaryMaterialTitle|SupplementaryMaterialNumber|SupplementaryMaterialCaption|SupplementaryMaterialNumber|SupplementaryMaterialNote|SupplementaryMaterialSource|VideoNumber|VideoCaption|VideoNote|VideoSource|EquationDisplay|ChemicalStructureDisplay|FormalStatement|FormalStatement|ResponseArticleSeparator|SubarticleSeparator|NoteToComp|comment|p|EMNotes|EMNotesText|EMHeadA|EMText|EMTextInd|FMText|FMVersionofRecord|FMNotesText|EMNotesText|fmgrantSponsor|SupplementaryMaterialXref|FMNoteGuestEditor|tabfnxref|tabfnxrefonline|FMTransAbstractParaInd|FMTransAbstractParaFlushLeft|FMTransAbstractHead|FMTransAbstractSectionHeadDisplayed|FMGrapAbstractHead|FMGrapAbstractParaFlushLeft|FMGrapAbstractParaInd|FMVideoAbstractParaFlushLeft|FMVideoAbstractParaInd|FMVideoAbstractHead|KeywordsTrans|TSComment|PullQuotes|FMLayAbstractHead|FMLayAbstractParaFlushLeft|FMLayAbstractParaInd|Pests|ExtractBL1|ExtractBL2|ExtractBL3|ExtractNL1|ExtractNL2|ExtractNL3|ExtractOL1|ExtractOL2|ExtractOL3|FMSummaryHead|FMSummaryParaFlushLeft|FMSummaryParaInd|fnxref|OrcXref|FMNoteReport|FMNoteReprint|FMNoteStudyGroupMembers|FootnoteExtract)\/>}{}gsi;


	
$Para_Tmp=~s{<entry ([^\>]+)\>}{}gsi;

$Para_Tmp=~s{<\/entry>}{}gsi;

$Para_Tmp=~s{<\/row>}{}gsi;

$Para_Tmp=~s{<thead>}{}gsi;

$Para_Tmp=~s{<\/thead>}{}gsi;

$Para_Tmp=~s{<commentReference(\d+)\/>}{}gsi;

$Para_Tmp=~s{<Reference_citation ([^\>]+)\>(.*?)<\/Reference_citation>}{}gsi;

$Para_Tmp=~s{<Reference_citation ([^\>]+)\>}{}gsi;

$Para_Tmp=~s{<li ([^\>]+)\>}{}gsi;

$Para_Tmp=~s{<\/li>}{}gsi;

my $OUP_Path=$ARGV[0];

my $OUP_Path1=$ARGV[0];

my $Intellect_Path=$ARGV[0];




if($OUP_Path!~m{(OUP\_Journals\-L|Data_OUPJOURNALS)}gsi)
{
	$Para_Tmp=~s{<(FMCustomMetaLogo|FMMSHistoryDetails|FMNoteArticleCitation|FMNoteAttributeHead|FMNoteAuthorBio|FMNoteAuthorBioHead|FMNoteClinicalTrailInfo|FMNoteCodeDataRequest|FMNoteConferenceHistory|FMNoteConflict|FMNoteConsent|FMNoteContributions|FMNoteContributors|FMNoteCopyrightStatement|FMNoteCorrespondence|FMNoteDeceased|FMNoteDisclaimer|FMNoteEditorBio|FMNoteEthicalApprovalStatement|FMNoteFunding|FMNoteGuestEditor|FMNoteHandlingEditor|FMNoteIRBInfo|FMNoteLevel|FMNoteMemberID|FMNoteMiscellaneous|FMNoteOnline|FMNoteOrcid|FMNotePatentDetails|FMNotePresent|FMNotePresentAddress|FMNotePresentAddressDetails|FMNotePreviousAddress|FMNoteProductInfo|FMNotePublished|FMNoteRoyalty|FMNotesText|FMNoteStudyGroupMembers|FMNoteStudyGroupMembersonline|FMNoteStudyGroupMembersDetails|FMNoteSubmitted|FMNoteSummary|FMNoteSupplementaryMaterial|FMNoteTweet|FMNoteURL|FMNoteWebsite|FMNoteWorkplace|FMLayAbstractHead|FMLayAbstractParaFlushLeft|FMLayAbstractParaInd|XMLmetadata|FMTOCStatement|WhiteSpaceSectionBreak|algorithmtitle|algorithmpara|figuretext|supplementarytext)>}{}gsi;
	$Para_Tmp=~s{<\/(FMCustomMetaLogo|FMMSHistoryDetails|FMNoteArticleCitation|FMNoteAttributeHead|FMNoteAuthorBio|FMNoteAuthorBioHead|FMNoteClinicalTrailInfo|FMNoteCodeDataRequest|FMNoteConferenceHistory|FMNoteConflict|FMNoteConsent|FMNoteContributions|FMNoteContributors|FMNoteCopyrightStatement|FMNoteCorrespondence|FMNoteDeceased|FMNoteDisclaimer|FMNoteEditorBio|FMNoteEthicalApprovalStatement|FMNoteFunding|FMNoteGuestEditor|FMNoteHandlingEditor|FMNoteIRBInfo|FMNoteLevel|FMNoteMemberID|FMNoteMiscellaneous|FMNoteOnline|FMNoteOrcid|FMNotePatentDetails|FMNotePresent|FMNotePresentAddress|FMNotePresentAddressDetails|FMNotePreviousAddress|FMNoteProductInfo|FMNotePublished|FMNoteRoyalty|FMNotesText|FMNoteStudyGroupMembers|FMNoteStudyGroupMembersonline|FMNoteStudyGroupMembersDetails|FMNoteSubmitted|FMNoteSummary|FMNoteSupplementaryMaterial|FMNoteTweet|FMNoteURL|FMNoteWebsite|FMNoteWorkplace|FMLayAbstractHead|FMLayAbstractParaFlushLeft|FMLayAbstractParaInd|XMLmetadata|FMTOCStatement|WhiteSpaceSectionBreak|algorithmtitle|algorithmpara|figuretext|supplementarytext)>}{}gsi;
	$Para_Tmp=~s{<(FMCustomMetaLogo|FMMSHistoryDetails|FMNoteArticleCitation|FMNoteAttributeHead|FMNoteAuthorBio|FMNoteAuthorBioHead|FMNoteClinicalTrailInfo|FMNoteCodeDataRequest|FMNoteConferenceHistory|FMNoteConflict|FMNoteConsent|FMNoteContributions|FMNoteContributors|FMNoteCopyrightStatement|FMNoteCorrespondence|FMNoteDeceased|FMNoteDisclaimer|FMNoteEditorBio|FMNoteEthicalApprovalStatement|FMNoteFunding|FMNoteGuestEditor|FMNoteHandlingEditor|FMNoteIRBInfo|FMNoteLevel|FMNoteMemberID|FMNoteMiscellaneous|FMNoteOnline|FMNoteOrcid|FMNotePatentDetails|FMNotePresent|FMNotePresentAddress|FMNotePresentAddressDetails|FMNotePreviousAddress|FMNoteProductInfo|FMNotePublished|FMNoteRoyalty|FMNotesText|FMNoteStudyGroupMembers|FMNoteStudyGroupMembersonline|FMNoteStudyGroupMembersDetails|FMNoteSubmitted|FMNoteSummary|FMNoteSupplementaryMaterial|FMNoteTweet|FMNoteURL|FMNoteWebsite|FMNoteWorkplace|FMLayAbstractHead|FMLayAbstractParaFlushLeft|FMLayAbstractParaInd|XMLmetadata|FMTOCStatement|WhiteSpaceSectionBreak||algorithmtitle|algorithmpara|figuretext|supplementarytext)\/>}{}gsi;
	
}

if($Intellect_Path=~m{(Intellect|OUP\_Journals\-L|Data\_OUP)}gsi)
{
	$Para_Tmp=~s{<(FMOrcid)>}{}gsi;
	$Para_Tmp=~s{<\/(FMOrcid)>}{}gsi;
	$Para_Tmp=~s{<(FMOrcid)\/>}{}gsi;
	
}

if($OUP_Path1=~m{(OUP\_Journals\-L|Data\_OUP|Brill)}gsi)
{
	$Para_Tmp=~s{<(hyperlink)>}{}gsi;
	$Para_Tmp=~s{<\/(hyperlink)>}{}gsi;
	$Para_Tmp=~s{<(hyperlink)\/>}{}gsi;
	
}



while($Para_Tmp=~m{<([^\>]+)\><([^\>]+)\>}gsi)
{
	my $Paragraph_No=$1;
	my $Style_Name=$2;
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Incorrect style found $2");
}

my $Nested_Para=$Tmp;



while($Nested_Para=~m{<([^\>]+)\><(FMSectionTitle|FMSubsectionTitle|FMSectionEditor|FMSubjectCodes|FMCustomMetaLogo|FMCustomMetaPatientConsent|FMCustomMetaEthicsCommittee|FMSeriesTitle|FMSeriesText|FMArticleType|FMDOILine|FMRunningHeadRecto|FMRunningHeadVerso|FMArticleTitle|FMArticleSubtitle|FMArticleTranslatedTitle|FMArticleTranslatedSubtitle|FMRelatedArticle|FMCiteThisArticle|FMAbstractHead|FMAbstractSectionHeadDisplayed|FMTranslatedAbstract|FMNoteAuthorBio|ParaFlushLeft|ParaInd|HeadA|HeadB|HeadC|HeadD|HeadE|HeadF|HeadG|BL1|BL2|BL3|BL4|BL5|OL1|OL2|OL3|OL4|OL5|ListPara|UL1|UL2|UL3|ExtractHead|Extract|ExtractTextInd|ExtractSpaceAboveSecondExtract|ExtractList|ExtractSubList|ExtractTranslation|ExtractSource|Epigraph|EpigraphTextInd|EpigraphSource|PoetryExtract|PoetryExtractSpaceAboveStanzaBreak|PoetryExtractSource|DialogueExtract|DialogueExtractSource|Epilogue|EpilogueTextInd|EpilogueSource|Footnote|EMAcknowledgmentsHead|EMAcknowledgmentsText|EMAppendixNumber|EMAppendixTitle|EMNotesTitle|EMGlossaryTitle|EMGlossaryEntry|EMOtherSectionTitle|EMReferencesHead|RefAnnotationPara|BoxNumber|BoxTitle|BoxSubtitle|BoxParaFlushLeft|BoxParaInd|BoxHeadA|BoxHeadB|BoxHeadC|BoxExtract|BoxExtractTextInd|BoxExtractSource|BoxBL1|BoxOL1|BoxUL1|BoxBL2|BoxOL2|BoxUL2|BoxBL|BoxOL|BoxUL|BoxBL|BoxOL|BoxUL|BoxNote|BoxSource|TableNumber|TableColumnHead|TableStubEntry|TableStubSubentry|TableBody|TableNote|TableSource|TableHeadA|TableHeadB|TableHeadC|FigureNumber|FigureNote|FigureSource|EMSupplementaryMaterialTitle|SupplementaryMaterialNumber|SupplementaryMaterialCaption|SupplementaryMaterialNote|SupplementaryMaterialNumber|SupplementaryMaterialSource|VideoNumber|VideoNote|VideoSource|ChemicalStructureDisplay|FormalStatement|FormalStatement|ResponseArticleSeparator|SubarticleSeparator|NoteToComp|EMNotes|EMNotesText|EMHeadA|EMHeadB|EMText|EMTextInd|FMNotesText|EMNotesText|FMTransAbstractParaInd|FMTransAbstractParaFlushLeft|FMTransAbstractHead|FMTransAbstractSectionHeadDisplayed|FMVideoAbstractParaFlushLeft|FMVideoAbstractParaInd|FMVideoAbstractHead|WhiteSpaceSectionBreak|ExtractBL1|ExtractBL2|ExtractBL3|ExtractNL1|ExtractNL2|ExtractNL3|ExtractOL1|ExtractOL2|ExtractOL3|FMNoteContributions|FMNoteConflict|FMNotePreviousAddress|FMNoteDeceased|FMNoteFunding|FMNoteConferenceHistory|FMNotePresent|FMNotePresentAddressDetails|FMNoteLevel|FMCustomMetaLogo|FMNoteHandlingEditor|FMNoteDisclaimer|FMNoteAttributeHead|FMNoteContributors|FMNoteEditorBio|FMNoteURL|FMNoteClinicalTrailInfo|FMNoteEthicalApprovalStatement|FMNoteOnline|FMNoteCodeDataRequest|FMMSHistoryDetails|FMNoteConsent|FMNoteSubmitted|FMNoteMiscellaneous|FMNoteIRBInfo|FMNoteDiscussant|FMNoteMemberID|FMNoteTweet|FMNotePatentDetails|FMNoteSummary|FMNoteOrcid|FMNotePublished|FMNoteWebsite|FMNoteRoyalty|FMNoteCopyrightStatement|FMNoteProductInfo)>(.*?)<\/(FMSectionTitle|FMSubsectionTitle|FMSectionEditor|FMSubjectCodes|FMCustomMetaLogo|FMCustomMetaPatientConsent|FMCustomMetaEthicsCommittee|FMSeriesTitle|FMSeriesText|FMArticleType|FMDOILine|FMRunningHeadRecto|FMRunningHeadVerso|FMArticleTitle|FMArticleSubtitle|FMArticleTranslatedTitle|FMArticleTranslatedSubtitle|FMReviewObject|FMRelatedArticle|FMCiteThisArticle|FMAbstractHead|FMAbstractSectionHeadDisplayed|FMAbstractParaFlushLeft|FMAbstractParaInd|FMTranslatedAbstract|FMNoteAuthorBio|ParaFlushLeft|ParaInd|HeadA|HeadB|HeadC|HeadD|HeadE|HeadF|HeadG|BL1|BL2|BL3|BL4|BL5|OL1|OL2|OL3|OL4|OL5|ListPara|UL1|UL2|UL3|ExtractHead|Extract|ExtractTextInd|ExtractSpaceAboveSecondExtract|ExtractList|ExtractSubList|ExtractTranslation|ExtractSource|Epigraph|EpigraphTextInd|EpigraphSource|PoetryExtract|PoetryExtractSpaceAboveStanzaBreak|PoetryExtractSource|DialogueExtract|DialogueExtractSource|Epilogue|EpilogueTextInd|EpilogueSource|Footnote|EMAcknowledgmentsHead|EMAcknowledgmentsText|EMAppendixNumber|EMAppendixTitle|EMNotesTitle|EMGlossaryTitle|EMGlossaryEntry|EMOtherSectionTitle|EMReferencesHead|RefAnnotationPara|BoxNumber|BoxTitle|BoxSubtitle|BoxParaFlushLeft|BoxParaInd|BoxHeadA|BoxHeadB|BoxHeadC|BoxExtract|BoxExtractTextInd|BoxExtractSource|BoxBL1|BoxOL1|BoxUL1|BoxBL2|BoxOL2|BoxUL2|BoxBL|BoxOL|BoxUL|BoxBL|BoxOL|BoxUL|BoxNote|BoxSource|TableNumber|TableColumnHead|TableStubEntry|TableStubSubentry|TableBody|TableNote|TableSource|TableHeadA|TableHeadB|TableHeadC|FigureNumber|FigureNote|FigureSource|EMSupplementaryMaterialTitle|SupplementaryMaterialNumber|SupplementaryMaterialCaption|SupplementaryMaterialNumber|SupplementaryMaterialNote|SupplementaryMaterialSource|VideoNumber|VideoCaption|VideoNote|VideoSource|ChemicalStructureDisplay|FormalStatement|FormalStatement|ResponseArticleSeparator|SubarticleSeparator|NoteToComp|EMNotes|EMNotesText|EMHeadA|EMHeadB|EMText|EMTextInd|FMNotesText|EMNotesText|FMTransAbstractParaInd|FMTransAbstractParaFlushLeft|FMTransAbstractHead|FMTransAbstractSectionHeadDisplayed|FMVideoAbstractParaFlushLeft|FMVideoAbstractParaInd|FMVideoAbstractHead|WhiteSpaceSectionBreak|ExtractBL1|ExtractBL2|ExtractBL3|ExtractNL1|ExtractNL2|ExtractNL3|ExtractOL1|ExtractOL2|ExtractOL3|FMNoteContributions|FMNoteConflict|FMNotePreviousAddress|FMNoteDeceased|FMNoteFunding|FMNoteConferenceHistory|FMNotePresent|FMNotePresentAddressDetails|FMNoteLevel|FMCustomMetaLogo|FMNoteHandlingEditor|FMNoteDisclaimer|FMNoteAttributeHead|FMNoteContributors|FMNoteEditorBio|FMNoteURL|FMNoteClinicalTrailInfo|FMNoteEthicalApprovalStatement|FMNoteOnline|FMNoteCodeDataRequest|FMMSHistoryDetails|FMNoteConsent|FMNoteSubmitted|FMNoteMiscellaneous|FMNoteIRBInfo|FMNoteDiscussant|FMNoteMemberID|FMNoteTweet|FMNotePatentDetails|FMNoteSummary|FMNoteOrcid|FMNotePublished|FMNoteWebsite|FMNoteRoyalty|FMNoteCopyrightStatement|FMNoteProductInfo)>}gsi)
{
	my $Paragraph_No=$1;
	my $Style_Name=$2;
	my $Para_Content=$3;

	

	$Para_Content=~s{<(italic|bold|sup|sub|smallcaps|fnxref|query|bibxref|UIXref|bibxrefonlie|fnxrefonline|figxref|modxref|videoxref|genxref|tabxref|OnlineBibXref|boxxref|tabfnxref|tabfnxrefonline|formalstatement|label|comment|url|SupplementaryMaterialXref|citationref|fmgrantSponsor|fmgrantNumber|query|eqnxref|headArunIn|headBrunIn|headCrunIn|headDrunIn|headErunIn|headFrunIn|underline|boxnumberrunIn|fmdoi|fmaffEmail|secxref|enxref|appxref|affxref|affxrefonline|pi|SupplementaryMaterialNumber|fmabstractsectionHeadrunIn|BibXrefonline|BoxNumber)>}{}gsi;

	$Para_Content=~s{<\/(italic|bold|sup|sub|smallcaps|fnxref|query|bibxref|UIXref|bibxrefonlie|fnxrefonline|figxref|modxref|videoxref|tabxref|OnlineBibXref|boxxref|tabfnxref|tabfnxrefonline|formalstatement|label|comment|url|SupplementaryMaterialXref|citationref|fmgrantSponsor|fmgrantNumber|query|eqnxref|headArunIn|headBrunIn|headCrunIn|headDrunIn|headErunIn|headFrunIn|underline|boxnumberrunIn|fmdoi|fmaffEmail|secxref|enxref|appxref|affxref|affxrefonline|pi|SupplementaryMaterialNumber|fmabstractsectionHeadrunIn|BibXrefonline)>}{}gsi;

	$Para_Content=~s{<(italic|bold|sup|sub|smallcaps|fnxref|query|bibxref|UIXref|bibxrefonlie|fnxrefonline|figxref|modxref|videoxref|tabxref|OnlineBibXref|boxxref|formalstatement|label|comment|url|tabfnxref|tabfnxrefonline|SupplementaryMaterialXref|citationref|fmgrantSponsor|fmgrantNumber|query|eqnxref|headArunIn|headBrunIn|headCrunIn|headDrunIn|headErunIn|headFrunIn|underline|boxnumberrunIn|fmdoi|fmaffEmail|secxref|enxref|appxref|affxref|affxrefonline|pi|SupplementaryMaterialNumber|fmabstractsectionHeadrunIn|BibXrefonline|BoxNumber)\/>}{}gsi;


	$Para_Content=~s{<Hyperlink>RRID<\/Hyperlink><Hyperlink>\:</Hyperlink>}{}gsi;
	$Para_Content=~s{(RRID)(\:)(\s?)<hyperlink>(.*?)<\/hyperlink>}{}gsi;

	
	$Para_Content=~s{<citationref>HYPERLINK \\(\w+) \"CJML_BIB_J_(\w+)\"([^\<]+)\<\/citationref><hyperlink>(.*?)<\/hyperlink>}{}gsi;

	
	$Para_Content=~s{<para([^\]]+)>}{}gsi;

	
	
	$Para_Content=~s{<Reference_citation ([^\>]+)\>(.*?)<\/Reference_citation>}{}gsi;

	$Para_Content=~s{<Hyperlink>(.*?)<\/hyperlink>}{}gsi;

	
	
	
	while($Para_Content=~m{<(\w[^\>]+)\>}gsi)
	{
		my $Character_Style=$1;

		
		

		my $cnum = index($Para_Content, $Character_Style) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Unwanted style $1 found in para style $Style_Name.");
	}
	
}

my $Style_Tmp=$Tmp;



while($Style_Tmp=~m{<([^\>]+)\><(FMSectionTitle|FMSubsectionTitle|FMSectionEditor|FMSubjectCodes|FMCustomMetaLogo|FMCustomMetaPatientConsent|FMCustomMetaEthicsCommittee|FMSeriesTitle|FMSeriesText|FMArticleType|FMDOILine|FMRunningHeadRecto|FMRunningHeadVerso|FMArticleTitle|FMArticleSubtitle|FMArticleTranslatedTitle|FMArticleTranslatedSubtitle|FMReviewObject|FMRelatedArticle|FMCiteThisArticle|FMAuthors|FMAffiliations|FMAbstractHead|FMAbstractSectionHeadDisplayed|FMAbstractParaFlushLeft|FMAbstractParaInd|FMTranslatedAbstract|Keywords|Abbreviations|FMNoteAuthorBio|FMNoteCorrespondence|ParaFlushLeft|ParaInd|HeadA|HeadB|HeadC|HeadD|HeadE|HeadF|HeadG|BL1|BL2|BL3|BL4|BL5|OL1|OL2|OL3|OL4|OL5|ListPara|UL1|UL2|UL3|ExtractHead|Extract|ExtractTextInd|ExtractSpaceAboveSecondExtract|ExtractList|ExtractSubList|ExtractTranslation|ExtractSource|Epigraph|EpigraphTextInd|EpigraphSource|PoetryExtract|PoetryExtractSpaceAboveStanzaBreak|PoetryExtractSource|DialogueExtract|DialogueExtractSource|Epilogue|EpilogueTextInd|EpilogueSource|Footnote|EMAcknowledgmentsHead|EMAcknowledgmentsText|EMAppendixNumber|EMAppendixTitle|EMNotesTitle|EMGlossaryTitle|EMGlossaryEntry|EMOtherSectionTitle|EMReferencesHead|Reference|RefAnnotationPara|BoxNumber|BoxTitle|BoxSubtitle|BoxParaFlushLeft|BoxParaInd|BoxHeadA|BoxHeadB|BoxHeadC|BoxExtract|BoxExtractTextInd|BoxExtractSource|BoxBL1|BoxOL1|BoxUL1|BoxBL2|BoxOL2|BoxUL2|BoxBL|BoxOL|BoxUL|BoxBL|BoxOL|BoxUL|BoxNote|BoxSource|TableNumber|TableCaption|TableNote|TableSource|TableHeadA|TableHeadB|TableHeadC|FigureCaption|ModelCaption|ParaCreditLine|FigureNote|FigureSource|InlineGraphic|EMSupplementaryMaterialTitle|SupplementaryMaterialNumber|SupplementaryMaterialCaption|SupplementaryMaterialNote|SupplementaryMaterialNumber|SupplementaryMaterialSource|VideoNumber|VideoCaption|VideoNote|VideoSource|EquationDisplay|ChemicalStructureDisplay|FormalStatement|FormalStatement|ResponseArticleSeparator|SubarticleSeparator|NoteToComp|p|EMNotes|EMNotesText|EMHeadA|EMText|EMTextInd|FMNotesText|EMNotesText|FMTransAbstractParaInd|FMTransAbstractParaFlushLeft|FMTransAbstractHead|FMTransAbstractSectionHeadDisplayed|FMGrapAbstractHead|FMGrapAbstractParaFlushLeft|FMGrapAbstractParaInd|FMVideoAbstractParaFlushLeft|FMVideoAbstractParaInd|FMVideoAbstractHead|KeywordsTrans)\/>}gsi)
{
	my $Paragraph_No=$1;
	my $Style=$2;
	
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Empty paragraph mark found with para style $Style");
}


my $Review_Object_Tmp=$Tmp;



while($Review_Object_Tmp=~m{<([^\>]+)\><FMReviewObject>(.*?)<\/FMReviewObject>}gsi)
{
	my $Paragraph_No=$1;
	my $Reference=$2;

	if($Reference!~m{<reftitleArticle>(.*?)<\/reftitleArticle>}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$1 Article title is missing in review object. Please structure the review object like reference format");
	}

}



my $Reference_Tmp=$Tmp;



while($Reference_Tmp=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
{
	my $Paragraph_No=$1;
	my $Reference=$2;

	my $Reference1=$2;

	my $Reference2=$2;

	my $Reference3=$2;
	my $Reference4=$2;
	my $Reference5=$2;
	my $Reference6=$2;
	my $Reference7=$2;
	my $Reference8=$2;
	my $Reference9=$2;
	my $Reference10=$2;
	my $Reference11=$2;
	my $Reference12=$2;
	my $Reference13=$2;
	my $Reference14=$2;
	my $Reference15=$2;
	my $Reference16=$2;
	my $Reference17=$2;
	my $Reference18=$2;
	my $Reference19=$2;
	my $Reference20=$2;
	my $Reference21=$2;
	my $Reference22=$2;
	my $Reference23=$2;
	my $Reference24=$2;
	my $Reference25=$2;
	my $Reference26=$2;
	my $Reference27=$2;
	my $Reference28=$2;
	my $Reference29=$2;
	my $Reference30=$2;
	my $Reference31=$2;

	my $Reference32=$2;

			    
	$Reference=~s{<(refanonymous|refauCollab|refedCollab|reftransCollab|refassigneeCollab|refcompilerCollab|refguestedCollab|refinventorCollab|refauSurname|refedSurname|reftransSurname|reftransedSurname|refassigneeSurname|refcompilerSurname|refdirectorSurname|refguestedSurname|refinventorSurname|refauGivenName|refedGivenName|reftransGivenName|reftransedGivenName|refassigneeGivenName|refcompilerGivenName|refdirectorGivenName|refguestedGivenName|refinventorGivenName|refauPrefix|refedPrefix|reftransPrefix|reftransedPrefix|refassigneePrefix|refcompilerPrefix|refdirectorPrefix|refguestedPrefix|refinventorPrefix|refauSuffix|refedSuffix|reftransSuffix|reftransedSuffix|refassigneeSuffix|refcompilerSuffix|refdirectorSuffix|refguestedSuffix|refinventorSuffix|refaffiliation|refetal|reftitleArticle|reftitleChapter|reftitlePatent|reftitleDiscussion|reftitleTransArticle|reftitleTransChapter|reftitleTransPatent|reftitleTransCommunication|reftitleTransDiscussion|reftitleJournal|reftitleBook|reftitleThesis|reftitleWebsite|refcommunicationType|refdiscussionType|refidPatentNumber|reftitleTransJournal|reftitleTransBook|reftitleTransThesis|reftitleTransWebsite|refpubdateYear|refpubdateMonth|refpubdateDay|refpubdateTime|refpubdateSeason|refaccessDate|refvolumeNumber|refedition|refconferenceName|refconferenceDate|refconferencePlace|refissueNumber|refsupplement|refpublisherLocation|refpublisherName|refpageFirst|refpageLast|refpageCount|refseriesTitle|refidDOI|refidCrossref|refidPMID|refannotationinline|RefAnnotationPara|refnumber|refURL|refidGovernmentReportNumber|refidISBN|refidISSN|refissueTitle|refidStandardsNumber|italic|bold|sup|sub|smallcaps|query|comment|reftitleReport|refidReportNumber)>}{}gsi;

	$Reference=~s{<\/(refanonymous|refauCollab|refedCollab|reftransCollab|refassigneeCollab|refcompilerCollab|refguestedCollab|refinventorCollab|refauSurname|refedSurname|reftransSurname|reftransedSurname|refassigneeSurname|refcompilerSurname|refdirectorSurname|refguestedSurname|refinventorSurname|refauGivenName|refedGivenName|reftransGivenName|reftransedGivenName|refassigneeGivenName|refcompilerGivenName|refdirectorGivenName|refguestedGivenName|refinventorGivenName|refauPrefix|refedPrefix|reftransPrefix|reftransedPrefix|refassigneePrefix|refcompilerPrefix|refdirectorPrefix|refguestedPrefix|refinventorPrefix|refauSuffix|refedSuffix|reftransSuffix|reftransedSuffix|refassigneeSuffix|refcompilerSuffix|refdirectorSuffix|refguestedSuffix|refinventorSuffix|refaffiliation|refetal|reftitleArticle|reftitleChapter|reftitlePatent|reftitleDiscussion|reftitleTransArticle|reftitleTransChapter|reftitleTransPatent|reftitleTransCommunication|reftitleTransDiscussion|reftitleJournal|reftitleBook|reftitleThesis|reftitleWebsite|refcommunicationType|refdiscussionType|refidPatentNumber|reftitleTransJournal|reftitleTransBook|reftitleTransThesis|reftitleTransWebsite|refpubdateYear|refpubdateMonth|refpubdateDay|refpubdateTime|refpubdateSeason|refaccessDate|refvolumeNumber|refedition|refconferenceName|refconferenceDate|refconferencePlace|refissueNumber|refsupplement|refpublisherLocation|refpublisherName|refpageFirst|refpageLast|refpageCount|refseriesTitle|refidDOI|refidCrossref|refidPMID|refannotationinline|RefAnnotationPara|refnumber|refURL|refidGovernmentReportNumber|refidISBN|refidISSN|refissueTitle|refidStandardsNumber|italic|bold|sup|sub|smallcaps|query|comment|reftitleReport|refidReportNumber)>}{}gsi;

	$Reference=~s{<(refanonymous|refauCollab|refedCollab|reftransCollab|refassigneeCollab|refcompilerCollab|refguestedCollab|refinventorCollab|refauSurname|refedSurname|reftransSurname|reftransedSurname|refassigneeSurname|refcompilerSurname|refdirectorSurname|refguestedSurname|refinventorSurname|refauGivenName|refedGivenName|reftransGivenName|reftransedGivenName|refassigneeGivenName|refcompilerGivenName|refdirectorGivenName|refguestedGivenName|refinventorGivenName|refauPrefix|refedPrefix|reftransPrefix|reftransedPrefix|refassigneePrefix|refcompilerPrefix|refdirectorPrefix|refguestedPrefix|refinventorPrefix|refauSuffix|refedSuffix|reftransSuffix|reftransedSuffix|refassigneeSuffix|refcompilerSuffix|refdirectorSuffix|refguestedSuffix|refinventorSuffix|refaffiliation|refetal|reftitleArticle|reftitleChapter|reftitlePatent|reftitleDiscussion|reftitleTransArticle|reftitleTransChapter|reftitleTransPatent|reftitleTransCommunication|reftitleTransDiscussion|reftitleJournal|reftitleBook|reftitleThesis|reftitleWebsite|refcommunicationType|refdiscussionType|refidPatentNumber|reftitleTransJournal|reftitleTransBook|reftitleTransThesis|reftitleTransWebsite|refpubdateYear|refpubdateMonth|refpubdateDay|refpubdateTime|refpubdateSeason|refaccessDate|refvolumeNumber|refedition|refconferenceName|refconferenceDate|refconferencePlace|refissueNumber|refsupplement|refpublisherLocation|refpublisherName|refpageFirst|refpageLast|refpageCount|refseriesTitle|refidDOI|refidCrossref|refidPMID|refannotationinline|RefAnnotationPara|refnumber|refURL|refidGovernmentReportNumber|refidISBN|refidISSN|refissueTitle|refidStandardsNumber|italic|bold|sup|sub|smallcaps|query|comment|reftitleReport|refidReportNumber)\/>}{}gsi;


	$Reference=~s{<para([^\>]+)\>}{}gsi;
	$Reference=~s{<\/para([^\>]+)\>}{}gsi;
	

	
	
	while($Reference=~m{<(\w([^\>]+))\>}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($Reference, $Character_Style) + 1;
	

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Character style $1 is not allowed in \†Reference");
	}


	while($Reference13=~m{<refnumber>}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($Reference, $Character_Style) + 1;
	

		
#$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the unwanted symbol found before reference\†Reference");
	}


	
	
	$Reference1=~s{<(\w([^\>]+))\>(.*?)<\/\1>}{}gsi;

	$Reference1=~s{(and|pp|In|Available|accepted|eds|ed|pmid|pp|p|submitted|unpublised|personal|pmid|\&\#x2013;)}{}gsi;

	$Reference1=~s{ {1,}}{ }gsi;
	
	$Reference1=~s{([\,\.\;\:\)\(\]\[\–]+)}{}gsi;

	

	while($Reference1=~m{(\w)(.*)}gsi)
	{
		my $cnum = index($Reference1, "$1$2") + 1;
		
		#

		$Reference=~s{\n}{}gsi;
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Warning:Free text $1$2 is not allowed in \†Reference $Reference");
	}


	
	while($Reference5=~m{<refetal><bold>}gsi)
	{
				
		#
#$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 et al with bold style is not allowed in \†Reference");
	}

	

	while($Reference5=~m{<refetal><italic>}gsi)
	{
				
		#
#$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 et al with italic style is not allowed in \†Reference");
	}

	while($Reference7=~m{<refausurname>(.*?)<\/refausurname>}gsi)
	{
		my $Surname=$1;

		$Surname=~s{<([^\>]+)\>}{}gsi;

		if($Surname=~m{([A-Z][A-Z])$}gs)
		{
		

push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning:Check the surname end with capital letters $Surname \†Reference");
		}

		if($Surname=~m{([A-Z]\.[A-Z]\.)$}gs)
		{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the surname end with capital letters $Surname \†Reference");
		}
	}

	

	$Reference2=~s{<\/(\w([^\>]+))\>\.<(\w([^\>]+))\>}{}gsi;
	$Reference2=~s{<query>(.*?)<\/query>}{}gsi;
	$Reference2=~s{<(\w([^\>]+))\>(.*?)<\/\1>}{}gsi;

	

	

	if($Reference2=~m{\.\.(\s?)$}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Reference should not end with double dot'");
	}

	
	$Reference8=~s{<refedsurname>(.*?)<\/refedsurname>}{<refausurname>$1<\/refausurname>}gsi;
	$Reference9=~s{<refedGivenName>(.*?)<\/refedGivenName>}{<refauGivenName>(.*?)<\/refauGivenName>}gsi;
	
	
	$Reference8=~s{<\/refausurname><refausurname>}{}gsi;
	$Reference8=~s{<refausurname> <\/refausurname>}{}gsi;
	$Reference9=~s{<\/refauGivenName><refauGivenName>}{}gsi;
	$Reference9=~s{<refauGivenName> <\/refauGivenName>}{}gsi;
	
	$Reference8=~s{<refausurname>([\s\,\.\;\:\)\(\]\[\–]+)<\/refausurname>}{}gsi;
	$Reference9=~s{<refauGivenName>([\s\,\.\;\:\)\(\]\[\–]+)<\/refauGivenName>}{}gsi;

	$Reference9=~s{(<refauGivenName>(.*?)<\/refauGivenName>)}{&Ref_Givename($1)}gesi;
	$Reference9=~s{<refauGivenName><\/refauGivenName>}{}gsi;
	$Reference9=~s{<refauGivenName> <\/refauGivenName>}{}gsi;

	
	
	my $Count_Surname=$Reference8=~s{<refausurname>}{<refausurname>}gsi;
	my $Count_Givenname=$Reference9=~s{<refauGivenName>}{<refauGivenName>}gsi;

	
	if($Count_Surname ne $Count_Givenname)
	{
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning:Surname and givenname style is not equal. Either surname or given name style is missing'");

	
	
	}

	if($Reference9=~m{</refed(\w+)>([\.\,\:\;\s]+)<refau(\w+)>(\w+)}gsi)
	{
		my $cnum = index($Reference1, "$4") + 1;
		
		
		
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Reference author style applied in between editor author style");
	}

	$Reference11=~s{<\/refedsurname><refedsurname>}{}gsi;
	$Reference12=~s{<\/refedGivenName><refedGivenName>}{}gsi;
	
	$Reference11=~s{<refedsurname>([\s\,\.\;\:\)\(\]\[\–]+)<\/refedsurname>}{}gsi;
	$Reference12=~s{<refedGivenName>([\s\,\.\;\:\)\(\]\[\–]+)<\/refedGivenName>}{}gsi;

	$Reference11=~s{(<refedGivenName>(.*?)<\/refedGivenName>)}{&Ref_edGivename($1)}gesi;
	$Reference12=~s{<refedGivenName><\/refedGivenName>}{}gsi;
	
	my $Count_Surname1=$Reference11=~s{<refedsurname>}{<refedsurname>}gsi;
	my $Count_Givenname1=$Reference12=~s{<refedGivenName>}{<refedGivenName>}gsi;

	
	if($Count_Surname1 ne $Count_Givenname1)
	{
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning:Editor Surname and givenname style is not equal. Either surname or given name style is missing'");
	}


	my $ESA_Journal=$Journal;

	if($ESA_Journal=~m{(JEENTO|JMENTO|ENVENT|ISDIVE|JIPMAN|JISESA|AMTEST|AESAME|FORSCI|JOFORE)}gsi)
	{
		$Reference14=~s{<refnumber>(.*?)<\/refnumber>([^\<]+)\<}{\<}gsi;

		$Reference14=~s{<bold>(.*?)<\/bold>}{$1}gsi;
		
		$Reference14=~s{<italic>(.*?)<\/italic>}{$1}gsi;

		
		

	if($Reference14=~m{^<refauSurname>([^\<]*)\</refauSurname>([^\<]*)\<refauGivenName>([^\<]*)\</refauGivenName>([^\<]*)<refauSurname>([^\<]*)\</refauSurname>([^\<]*)\<refauGivenName>([^\<]*)\</refauGivenName>}gsi)
	{
		
		
			$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Author initials should come first before surname from second author onwards'");
	}
	}



	my $JBREIM_Journal=$Journal;

	if($JBREIM_Journal=~m{(JBREIM)}gsi)
	{
		
		while($Reference15=~m{(.{1,14})([\s\;\.]*)(www|http)}gsi)
	{
			my $value=$1;

			if($value!~m{Available at\:}gsi)
			{
				
				push(@Error,"\~Para No:$Paragraph_No Col No:1 Available at: should be inserted before web address in reference section. \n");
			}
	}

	}

	my $GOX_PRS_Journal=$Journal;

	if($GOX_PRS_Journal=~m{(GOX|PRS)}gsi)
	{
		
	if($Reference17!~m{<refidDOI>}gsi)
	{
			
				
				push(@Error,"\~Para No:$Paragraph_No Col No:1 Doi is must for all reference. Check the style\n");
			
	}

	}

	my $JW9_PRS_Journal=$Journal;

	if($JW9_PRS_Journal=~m{(JW9|IN9)}gsi)
	{
		
	if($Reference17=~m{<refidDOI>}gsi)
	{
			
				
	push(@Error,"\~Para No:$Paragraph_No Col No:1 Doi no needed for all reference. Check the style\n");
			
	}

	}

	my $Ref_Path=$ARGV[0];

	if($Ref_Path=~m{(OUP\_Journals\-L|Data_OUPJOURNALS)}gsi)
	{
		if($Reference16=~m{<refiddoi>(.*?)<\/refiddoi>}gsi)
		{
			my $Ref_Doi=$1;
			my $Ref_Doi1=$1;
			my $Ref_Doi2=$1;

			if($Ref_Doi!~m{^(\s?)10\.}gsi)
			{
				push(@Error,"\~Para No:$Paragraph_No Col No:1 Doi should start with prefix 10\. \n");
			}

			if($Ref_Doi1=~m{^(\s?)doi}gsi)
			{
				push(@Error,"\~Para No:$Paragraph_No Col No:1 Doi should not start with prefix doi\. \n");
			}
			if($Ref_Doi2=~m{^(\s?)http}gsi)
			{
				push(@Error,"\~Para No:$Paragraph_No Col No:1 Doi should not start with prefix http \n");
			}
			if($Ref_Doi2=~m{^(\s?)org}gsi)
			{
				push(@Error,"\~Para No:$Paragraph_No Col No:1 Doi should not start with prefix org \n");
			}

			if($Ref_Doi2=~m{^(\s?)(\d+)\/}gsi)
			{
				push(@Error,"\~Para No:$Paragraph_No Col No:1 Doi should not start with prefix $2 \n");
			}

			
		}
	}

	my $Ref_Path=$ARGV[0];

	if($Ref_Path=~m{JBREIM}gsi)
	{
		if($Reference16=~m{<reftitleJournal>(.*?)<\/reftitleJournal>}gsi)
		{
			my $Ref_Doi=$1;


			if($Ref_Doi=~m{([\s\.\,\:\;]+)JBI([\s\.\,\:\;]+)}gsi)
			{
				push(@Error,"\~Para No:$Paragraph_No Col No:1 Journal of Breast Imaging is J Breast Imag\, never JBI\.\n");
			}
			
		}
	}

	while($Reference18=~m{^(\d+)}gsi)
	{
		
		$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Reference number style is not applied \†Reference");
	}

	while($Reference18=~m{<([^\>]+)\>(.*?)<\/\1>}gsi)
	{
		
		$Err="1";

		my $Content=$2;

		if($Content=~m{Available at}gsi)
		{
		
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Available at should come in free text \†Reference");
		}
	}


	my $Page_Journal=$Journal;

	if($Page_Journal!~m{(ASJOUR|JCEMET|JESOCI|ENDOCR|ENDREV|AJCPAT|AMJHSP|ASJOFJ|STMCLS|STCLTM|ONCOLO|IBDJNL)}gsi)
	{

	while($Reference20=~m{<\/refpageFirst>(\s?)\-(\s?)<refpageLast>}gsi)
	{
		
		$Err="1";

		push(@Error,"\~Para No:$Paragraph_No Col No:1 Hypen present in between fpage and lpage \†Reference");
		
	}
	}
	else
	{
	while($Reference20=~m{<\/refpageFirst>(\s?)\—(\s?)<refpageLast>}gsi)
	{
		
		$Err="1";

		push(@Error,"\~Para No:$Paragraph_No Col No:1 mdash present in between fpage and lpage \†Reference");
		
	}
		
	}

	$Reference21=~s{<reftitle([^\>]+)\>(.*?)<\/reftitle\1>}{}gsi;

	while($Reference21=~m{\—}gsi)
	{
		
		$Err="1";

		push(@Error,"\~Para No:$Paragraph_No Col No:1 mdash present in \†Reference");
		
	}

	my $ACM_Journal=$Journal;

	if($ACM_Journal=~m{(ACM)}gsi)
	{
		if($Reference22!~m{\.(\s?)$}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Reference should end with dot for ACM journal'");
	}

	while($Reference22=~m{<(refausurname|refauGivenName|refedsurname|refauGivenName|refauSuffix|refedSuffix|refetal)>(.*?)<\/\1>}gsi)
	{
		my $Sup=$2;

		if($Sup=~m{<sup>}gsi)
		{
			
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 superscript not allowed in author names for ACM journal'");

		}
	}

	while($Reference23=~m{<(reftitleArticle)>(.*?)<\/\1>}gsi)
	{
		my $Sup=$2;

		if($Sup!~m{\.(\s)$}gsi)
		{
			
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 ref article title should end with dot should not end with dot for ACM journal'");

		}
	}
	while($Reference24=~m{<(reftitleJournal)>(.*?)<\/\1>}gsi)
	{
		my $Sup=$2;

		

		if($Sup!~m{\.(\s)$}gsi)
		{
			
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 ref journal title should end with dot should not end with dot for ACM journal'");

		}

		if($Reference25=~m{<refpubdateYear>}gsi)
		{
			my $Ref=$Reference25;

			if($Ref!~m{<\/refpubdateYear>;}gsi)
			{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 semicolon should come for journal reference after year ACM journal'");

			}
		}

		if($Reference27=~m{<refissueNumber>}gsi)
		{
			
push(@Error,"\~Para No:$Paragraph_No Col No:1 refissueNumber not allowed ACM journal'");

			
		}
	}

	if($Reference26=~m{<\/refpageFirst>}gsi)
	{
		if($Reference26!~m{<\/refpageFirst>(\s?)\-(\s?)<refpageLast>}gsi)
		{
		
		$Err="1";

		push(@Error,"\~Para No:$Paragraph_No Col No:1 ndash should present in between fpage and lpage \†Reference");
		}
		
	}
		
	}

	if($Reference30=~m{<refidPMID>}gsi)
	{
		my $Ref=$Reference31;

		
		
		if($Ref=~m{(\.)(\s?)$}gsi)
		{

		
			
		$Err="1";

		push(@Error,"\~Para No:$Paragraph_No Col No:1 Reference should end with dot for reference have pmid");
		}
		
	}

	my $Reff=$Reference32;

	$Reff=~s{<([^\>]+)\>}{}gsi;
	
	if($Reff=~m{\.(\s?)\.}gsi)
	{

			
			
		$Err="1";

		push(@Error,"\~Para No:$Paragraph_No Col No:1 Double dot present in reference");
		
	}

	

	

	
}


my $FM_Authors_Tmp=$Tmp;

while($FM_Authors_Tmp=~m{<FMAuthors>(.*?)<para(\w+)>(.*?)<([^\>]+)\><FMAuthors>}gsi)
{
my $Paragraph_No=$4;

$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 FMAuthor present in top and bottom of the document'");

	
}


my $HeadA_Tmp=$Tmp;

while($HeadA_Tmp=~m{<([^\>]+)\><HeadA>(.*?)<\/HeadA>}gsi)
{
	my $Paragraph_No=$1;
	my $HeadB=$2;
	my $Head=$2;

	if($HeadB=~m{<headArunIn>}gsi)
	{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Character style headArunIn is not allowed in \†HeadA");
	}

	

	$Head=~s{<label>(.*?)<\/label>}{}gsi;
	$Head=~s{<([^\>]+)\>}{}gsi;

	if($Head=~m{^([A-Z0-9]+)\.}gs)
	{
		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is missing in \†HeadA");
	}
	
}

my $HeadB_Tmp=$Tmp;

while($HeadB_Tmp=~m{<([^\>]+)\><HeadB>(.*?)<\/HeadB>}gsi)
{
	my $Paragraph_No=$1;
	my $HeadB=$2;
	my $Head=$2;
	

	if($HeadB=~m{<headBrunIn>}gsi)
	{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Character style headBrunIn is not allowed in \†HeadB");
	}

	$Head=~s{<label>(.*?)<\/label>}{}gsi;
	$Head=~s{<([^\>]+)\>}{}gsi;

	if($Head=~m{^([A-Z0-9]+)\.}gs)
	{
		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is missing in \†HeadB");
	}
	
}

my $HeadC_Tmp=$Tmp;



while($HeadC_Tmp=~m{<([^\>]+)\><HeadC>(.*?)<\/HeadC>}gsi)
{
	my $Paragraph_No=$1;
	my $HeadC=$2;
	my $Head=$2;
	

	if($HeadC=~m{<headCrunIn>}gsi)
	{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Character style headCrunIn is not allowed in \†HeadC");
	}

	$Head=~s{<label>(.*?)<\/label>}{}gsi;
	$Head=~s{<([^\>]+)\>}{}gsi;

	if($Head!~m{\.(\s?)}gs)
	{
		$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:1 HeadC should end with dot \†HeadC");
	}
	
}


my $HeadD_Tmp=$Tmp;

while($HeadD_Tmp=~m{<([^\>]+)\><HeadD>(.*?)<\/HeadD>}gsi)
{
	my $Paragraph_No=$1;
	my $HeadD=$2;
	my $Head=$2;
	

	if($HeadD=~m{<headDrunIn>}gsi)
	{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Character style headDrunIn is not allowed in \†HeadD");
	}

	$Head=~s{<label>(.*?)<\/label>}{}gsi;
	$Head=~s{<([^\>]+)\>}{}gsi;

	if($Head=~m{^([A-Z0-9]+)\.}gs)
	{
		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is missing in \†HeadD");
	}
	
}

my $HeadE_Tmp=$Tmp;

while($HeadE_Tmp=~m{<([^\>]+)\><HeadE>(.*?)<\/HeadE>}gsi)
{
	my $Paragraph_No=$1;
	my $HeadE=$2;
	my $Head=$2;
	

	if($HeadE=~m{<headErunIn>}gsi)
	{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Character style headErunIn is not allowed in \†HeadE");
	}

	$Head=~s{<label>(.*?)<\/label>}{}gsi;
	$Head=~s{<([^\>]+)\>}{}gsi;

	if($Head=~m{^([A-Z0-9]+)\.}gs)
	{
		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:1 Label style is missing in \†HeadE");
	}
	
}


my $Head_Para_Tmp=$Tmp;

while($Head_Para_Tmp=~m{<([^\>]+)\><(ParaInd|ParaFlushLeft)>(.*?)<\/(ParaInd|Para_FlushLeft)>}gsi)
{
	my $Paragraph_No=$1;
	my $Style=$2;
	my $Para=$3;

	my $Para1=$3;

	my $Para2=$3;

	

	if($Para=~m{<headCrunIn>}gsi)
	{
		if($Para1=~m{<headDrunIn>}gsi)
		{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Two runin style headCrunIn and headDrunIn is not allowed in $Style");
		}
	}

	
	if($Para=~m{<headBrunIn>}gsi)
	{
		if($Para1=~m{<headCrunIn>}gsi)
		{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Two runin style headBrunIn and headCrunIn is not allowed in $Style");
		}
	}

	if($Para=~m{<headDrunIn>}gsi)
	{
		if($Para1=~m{<headErunIn>}gsi)
		{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Two runin style headDrunIn and headErunIn is not allowed in $Style");
		}
	}

	
	
	if($Para2=~m{(\w+)(.*?)<head([A-Z])runIn>}gsi)
	{

		my $Character_Style=$2;

	my $cnum = index($Para2, $Character_Style) + 1;

		
		
#$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 head$3runIn style present in between the paragraph $1$2");
		
	}

	
}

my $HeadD_Tmp=$Tmp;


while($HeadD_Tmp=~m{<([^\>]+)\><EquationDisplay>(.*?)<\/EquationDisplay>}gsi)
{
	my $Paragraph_No=$1;
	my $Equation=$2;

	my $Equation1=$2;

	$Equation=~s{<equationDisplayNumber>(.*?)<\/equationDisplayNumber>}{}gsi;

	$Equation=~s{<(equationDisplayNumber|italic|bold|sup|sub|smallcaps)>}{}gsi;

	$Equation=~s{<\/(equationDisplayNumber|italic|bold|sup|sub|smallcaps)>}{}gsi;

	$Equation=~s{<(equationDisplayNumber|italic|bold|sup|sub|smallcaps)\/>}{}gsi;

	$Equation=~s{\&lt;mathgraphic id=\"([^\"]+)\"\/\&gt;}{}gsi;

	$Equation=~s{\&lt;\/mathgraphic\&gt;}{}gsi;

	$Equation=~s{\&lt\;\&lt\;Eqn(\d\d)\&gt;\&gt;}{}gsi;

	$Equation=~s{\&lt\;\&lt\;Eqn(\d)\&gt;\&gt;}{}gsi;

	$Equation=~s{\&lt\;\&lt\;Eqn(\d\d\d)\&gt;\&gt;}{}gsi;

	$Equation=~s{\&\#x3C;\&\#x3C;Eqn(\d\d)\&\#x3E\;\&\#x3E;}{}gsi;

	$Equation=~s{\&\#x3C;\&\#x3C;Eqn(\d)\&\#x3E\;\&\#x3E;}{}gsi;

	$Equation=~s{\&\#x3C;\&\#x3C;Eqn(\d\d\d)\&\#x3E\;\&\#x3E;}{}gsi;

	$Equation=~s{\&\#x003C;\&\#x3C;Eqn(\d\d)\&\#x3E\;\&\#x003E;}{}gsi;

	$Equation=~s{\&\#x003C;\&\#x3C;Eqn(\d)\&\#x3E\;\&\#x003E;}{}gsi;

	$Equation=~s{\&\#x003C;\&\#x3C;Eqn(\d\d\d)\&\#x3E\;\&\#x003E;}{}gsi;

	

	
	while($Equation=~m{<(\w([^\>]+))\>}gsi)
	{
		my $Character_Style=$1;

		

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Character style $1 is not allowed in \†Equation Display");
	}

	
	
	$Equation=~s{<(\w([^\>]+))\>(.*?)<\/\1>}{}gsi;

	my $Equ1=$Equation;
	
		
	if($Equation=~m{(\w+)}gsi)
	{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Free text $1 is not allowed in \†Equation_Display");
	}

	if($Equation=~m{([\.\,\:\;]+)}gsi)
	{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Free text $1 is not allowed in \†Equation_Display");
	}


	
	
	if($ARGV[0]=~m{(\\Word|\\04_copyedit)}gsi)
	{
		if($Equation1!~m{\&lt\;mathgraphic}gsi)
		{
			$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:1 Math equation not exported");
		}
	}
	else
	{
		if($Equation1!~m{\&#x(\w+)\;Eqn}gsi)
		{
			$Err="1";

			
#push(@Error,"\~Para No:$Paragraph_No Col No:1 Math equation not exported");
		}
	}
}


while($Equ_Tmp=~m{<([^\>]+)\><EquationDisplay>(.*?)<\/EquationDisplay>}gsi)
{
	my $Paragraph_No=$1;
	my $Equation=$2;

	my $Object_Count=$Equation=~s{<object\/>}{<object\/>}gsi;
	if($Object_Count gt 1)
	{

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 More then one eqaution is not allowed in \†Equation Display");
	}

	
}


while($Equ_Tmp1=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Equation=$2;

	

	
	if($Equation=~m{(<italic><object\/>)}gsi)
	{
		my $Character_Style=$1;

	my $cnum = index($Equation, $Character_Style) + 1;


		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Check the equation with italic format");
	}

	
}



while($Equ_Tmp4=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Equation=$3;

	

	
	if($Equation=~m{(<\/allcaps>)}gsi)
	{
		my $Character_Style=$1;

	my $cnum = index($Equation, $Character_Style) + 1;


		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Allcaps not allowed");
	}

	
}


while($Equ_Tmp1=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Equation=$2;

	if($Tmp!~m{<EquationDisplay>}gsi)
	{
		

	if($Equation=~m{(<Eqnxref>)}gsi)
	{
		my $Character_Style=$1;

	my $cnum = index($Equation, $Character_Style) + 1;


		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Equation citation style present without display equation");
	}

	}

	
}

my $NICTOB_Journal=$Journal;

my $HeadD1_Tmp=$Tmp;
if($NICTOB_Journal=~m{(NICTOB)}gsi)
{
	
while($HeadD1_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Equation=$3;
	my $Equation1=$3;

	

	$Equation1=~s{<figxref>(.*?)<\/figxref>}{}gsi;
	$Equation1=~s{<videoxref>(.*?)<\/videoxref>}{}gsi;
	$Equation1=~s{<([^\>]+)\>}{}gsi;


	if($Tmp!~m{<VideoCaption>}gsi)
	{
		

	if($Equation=~m{(<videoxref>)}gsi)
	{
		my $Character_Style=$1;

	my $cnum = index($Equation, $Character_Style) + 1;


		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Video xref citation style present without Video caption");
	}

	}

	
	if($Equation1=~m{(\(Video )}gsi)
	{
		$Err="1";
		my $Character_Style=$1;

	my $cnum = index($Equation1, $Character_Style) + 1;
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Video xref citation found without videoXref style");
	}

	

	
}


}




	my $HeadD1_Tmp=$Tmp;

	
	

	while($HeadD1_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Equation=$3;
	my $Equation1=$3;
	my $Equation2=$3;

	my $Equation3=$3;
	my $Equation4=$3;
	my $Equation5=$3;
	

	
	
	
	
	while($Equation1=~m{(\w+)<bibxref>(.*?)<\/bibxref>}gsi)
	{
		$Err="1";
		my $Bibxref=$1;

		
	my $cnum = index($Equation1, $Bibxref) + 1;
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum\'Space is missing before reference citation\'");
		
	}

	while($Equation2=~m{(\w+)<bibxrefonline>(.*?)<\/bibxrefonline>}gsi)
	{
		$Err="1";
		my $Bibxref=$1;

		
	my $cnum = index($Equation1, $Bibxref) + 1;
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum\'Space is missing before reference citation\'");
		
	}

	while($Equation3=~m{(\w+)\[<bibxref>(.*?)<\/bibxref>}gsi)
	{
		$Err="1";
		my $Bibxref=$1;

		

	my $cnum = index($Equation1, $Bibxref) + 1;
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum\'Space is missing before reference citation\'");
		
	}

	while($Equation4=~m{(\w+)\[<bibxrefonline>(.*?)<\/bibxrefonline>}gsi)
	{
		$Err="1";
		my $Bibxref=$1;

		
	my $cnum = index($Equation1, $Bibxref) + 1;
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum\'Space is missing before reference citation\'");
		
	}

	while($Equation4=~m{\(<bibxrefonline>(.*?)<\/bibxrefonline>}gsi)
	{
		$Err="1";
		my $Bibxref=$1;

		
	my $cnum = index($Equation1, $Bibxref) + 1;
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum\'Square bracket is missing before reference citation\'");
		
	}

	

	
}




my $NIC_Journal=$Journal;

my $HeadD2_Tmp=$Tmp;
if($NIC_Journal=~m{(AMJHSP|JESOCI|ENDREV|ENDOCR|JCEMET|AJCPAT|ASJOUR|ASJOFJ)}gsi)
{
	
while($HeadD1_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Equation=$3;
	my $Equation1=$3;

	

	
	
	
	while($Equation1=~m{<bibxref>(.*?)<\/bibxref>}gsi)
	{
		$Err="1";
		my $Bibxref=$1;

		if($Bibxref=~m{(\–)}gsi)
		{

	my $cnum = index($Equation1, $Bibxref) + 1;
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum ndash found inside the bibxref. Not allowed for the $Journal");
		}
	}

	

	
}


}
	
my $NIC_Journal1=$Journal;

my $HeadD21_Tmp=$Tmp;
if($NIC_Journal1=~m{(JD9)}gsi)
{
	
while($HeadD21_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Equation=$3;
	my $Equation1=$3;

	

	
	
	
	while($Equation1=~m{<bibxref>(.*?)<\/bibxref>}gsi)
	{
		$Err="1";
		my $Bibxref=$1;

		if($Bibxref=~m{(\-)}gsi)
		{

	my $cnum = index($Equation1, $Bibxref) + 1;
$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:$cnum hyphen found inside the bibxref. Not allowed for the $Journal");
		}
	}

	

	
}


}

my $List_Tmp=$Tmp;

while($List_Tmp=~m{<([^\>]+)\><OL(\d+)>(.*?)<\/OL(\d+)>}gsi)
{

	my $Paragraph_No=$1;
	my $List1=$3;
	my $List2=$3;
	my $List3=$3;

	
	

	if($List1!~m{<label>}gsi)
	{

		
#$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning: Label style missing in list");
	}

	if($List2=~m{<\/label>\.}gsi)
	{

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Dot present after the list style'");
	}

	if($List2=~m{<\/label>\)}gsi)
	{

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Closing bracket present after the list style'");
	}
	
}

my $List_Tmp1=$Tmp;

while($List_Tmp1=~m{<([^\>]+)\><UL(\d+)>(.*?)<\/UL(\d+)>}gsi)
{

	my $Paragraph_No=$1;
	my $List1=$3;
	my $List2=$3;
	my $List3=$3;

	
	

	if($List1!~m{<label>}gsi)
	{

		
#$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning: Label style missing in list");
	}

	if($List2=~m{<\/label>\.}gsi)
	{

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Dot present after the list style'");
	}

	if($List2=~m{<\/label>\)}gsi)
	{

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Closing bracket present after the list style'");
	}
	
}

my $List_Tmp2=$Tmp;



while($List_Tmp2=~m{<([^\>]+)\><BoxUL>(.*?)<\/BoxUL>}gsi)
{

	my $Paragraph_No=$1;
	my $List1=$2;
	my $List2=$2;
	my $List3=$2;

	
	

	if($List1!~m{<label>}gsi)
	{

		
#$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning: Label style missing in list");
	}

	if($List2=~m{<\/label>\.}gsi)
	{

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Dot present after the list style'");
	}

	if($List2=~m{<\/label>\)}gsi)
	{

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Closing bracket present after the list style'");
	}
	
}

my $List_Tmp3=$Tmp;

while($List_Tmp3=~m{<([^\>]+)\><BoxOL>(.*?)<\/BoxOL>}gsi)
{

	my $Paragraph_No=$1;
	my $List1=$2;
	my $List2=$2;
	my $List3=$2;

	
	

	if($List1!~m{<label>}gsi)
	{

		
#$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning: Label style missing in list");
	}

	if($List2=~m{<\/label>\.}gsi)
	{

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Dot present after the list style'");
	}

	if($List2=~m{<\/label>\)}gsi)
	{

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Closing bracket present after the list style'");
	}
	
}


my $Ack_Tmp=$Tmp;

my $Ack_Tmp1=$Tmp;


if($Ack_Tmp=~m{<([^\>]+)\><EMAcknowledgmentsHead>}gsi)
{
	my $Paragraph_No=$1;
	
	if($Ack_Tmp1!~m{<EMAcknowledgmentsText>}si)
	{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 \†EM_Acknowledgments_Head style present without EM_Acknowledgments_Text");
	}
	
	
}



while($Comment_Reference_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;

	my $Content=$3;

	my $Content10=$Content;

	

	$Content10=~s{<CommentReference(\d+)>}{\[CommentReference\]}gsi;
	$Content10=~s{<Comment>}{\[CommentReference\]}gsi;
	$Content10=~s{<([^\>]+)\>}{}gsi;
	$Content10=~s{\&amp;}{\&}gsi;

	my $Content11=$Content10;

	if($Content11=~m{(\[CommentReference\])}gsi)
	{
		my $Query=$1;

		my $cnum = index($Content10, $1) + 1;

		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Dummy comment style present");

		
	}

	
}


	
my $Url_Tmp=$Tmp;



$Url_Tmp=~s{<FMOrcid>(.*?)<\/FMOrcid>}{}gsi;

$Url_Tmp=~s{<URL>(.*?)<\/URL>}{}gsi;



while($Url_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Content=$3;
	my $Content1=$3;
	my $Content2=$3;
	my $Content3=$3;
	my $Content4=$3;
	my $Content5=$3;
	my $Content6=$3;
	my $Content7=$3;
	my $Content8=$3;
	my $Content9=$3;
	my $Content10=$3;
	my $Content11=$3;
	my $Content12=$3;
	

	
	$Content2=~s{<url>(.*?)<\/url>}{}gsi;
	$Content2=~s{<query>(.*?)<\/query>}{}gsi;
	$Content2=~s{<refurl>(.*?)<\/refurl>}{}gsi;
	$Content2=~s{<refiddoi>(.*?)<\/refiddoi>}{}gsi;
	$Content2=~s{<fmaffEmail>(.*?)<\/fmaffEmail>}{}gsi;
	$Content2=~s{<FMOrcid>(.*?)<\/FMOrcid>}{}gsi;


	
	$Content1=~s{<([^\>]+)\>}{}gsi;

	

	
	
	while($Content2=~m{(http\:|https\:|www\:)}gsi)
	{
		my $Url="$1";

		
		

				
		my $cnum = index($Content1, $Url) + 1;
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Url style is not applied $Url");

		
		
	}

	while($Content3=~m{(Error\! Bookmark not defined)}gsi)
	{
		my $Url=$1;

		
		
		my $cnum = index($Content1, $Url) + 1;
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Url style is not applied $Url");

		
		
	}

	

	while($Content4=~m{<\/figxref><query>([^\<]+)<\/query><figxref>}gsi)
	{
		my $Fig_Xref=$1;

	
		
		my $cnum = index($Content1, $1) + 1;
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Query present inside the figxref");

		
		
	}
	while($Content9=~m{<\/tabxref><query>([^\<]+)<\/query><tabxref>}gsi)
	{
		my $Fig_Xref=$1;

	
		
		my $cnum = index($Content1, $1) + 1;
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Query present inside the tabxref");

		
		
	}
	while($Content6=~m{<figxref>(\(?)(Tab)}gsi)
	{
		my $Fig_Xref=$2;

	
		
		my $cnum = index($Content1, $2) + 1;
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  figxref style wrongly applied for table citation");

		
		
	}

	while($Content7=~m{<tabxref>(\(?)(Fig)}gsi)
	{
		my $Fig_Xref=$2;

	
		
		my $cnum = index($Content1, $2) + 1;
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  tabxref style wrongly applied for figure citation");

		
		
	}

	while($Content10=~m{(<fmaffemail>(.*?)<\/fmaffemail>)}gsi)
	{
		my $Email=$2;
		my $Email1=$2;

	
		
		my $cnum = index($Content10, $2) + 1;

		if($Email!~m{\@}gsi)
		{
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  \@ Symbol missing in email");

		}

		if($Email1=~m{\s}gsi)
		{
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  space is not allowed in email");

		}
		
	}

	while($Content11=~m{(<url>(.*?)<\/url>)}gsi)
	{
		my $Email=$2;

	
		
		my $cnum = index($Content10, $2) + 1;

		if($Email!~m{http|www}gsi)
		{

			
		
		#push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  http or www is missing in email");

		}
		
	}

	while($Content12=~m{(<refurl>(.*?)<\/refurl>)}gsi)
	{
		my $Email=$2;

	
		
		my $cnum = index($Content10, $2) + 1;

		if($Email!~m{http|www}gsi)
		{
		
		#push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  http or www is missing in email");

		}
		
	}

	my $OUP_Journal=$ARGV[0];
	
	if($OUP_Journal=~m{(OUP_Journals)}gsi)
	{
		while($Content11=~m{(<(url|refurl)>(.*?)<\/(url|refurl)>)}gsi)
	{
		my $Email=$2;

	
		
		my $cnum = index($Content10, $2) + 1;

		if($Email=~m{tidbitapp\.io}gsi)
		{
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  tidbitapp.io is present in url.This graphical abstract is also available at Tidbit: XXX [Replace XXX with URL, from handshake email notes or manuscript].");

		}
		
	}
	}

	$Content11=~s{ <\/url>}{<\/url>}gsi;
	$Content11=~s{ <\/refurl>}{<\/refurl>}gsi;

	while($Content11=~m{(<(url|refurl)>(.*?)<\/(url|refurl)>)}gsi)
	{
		my $Email=$3;

		

		
		
		my $cnum = index($Content10, $2) + 1;

		if($Email=~m{\s}gsi)
		{

			

					
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Space found inside the url");

		}
		
	}




	my $Endocrine_Jou=$Journal;
	
	if($Endocrine_Jou=~m{(JCEMET|ENDOCR|ENDREV|JESOCI)}gsi)
	{
		if($Content5=~m{<SupplementaryMaterialXref>(.*?)<\/SupplementaryMaterialXref>}gsi)
		{
			my $cnum = index($Content1, $1) + 1;
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  SupplementaryMaterialXref citation is not allowed for endocrine journal");
		}

	}

	

	
	

}

$Supp_Tmp=~s{<EMSupplementaryMaterialTitle>(.*?)$}{}gsi;

$Supp_Tmp=~s{<TSComment>(.*?)$}{}gsi;

$Supp_Tmp=~s{<query>(.*?)<\/query>}{}gsi;

my $End_Journal=$Journal;
my $End_Journal1=$Journal;
my $End_Journal2=$Journal;
my $Intellect_Journal=$ARGV[0];

if($Intellect_Journal!~m{(Intellect|LWW|Brill)}gsi)
{
if($End_Journal!~m{(JCEMET|ENDOCR|ENDREV|JESOCI)}gsi)
{

while($Supp_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Content=$3;
	my $Content1=$3;
	my $Content2=$3;

	$Content=~s{<([^\>]+)\>}{}gsi;

	
	
	$Content1=~s{<SupplementaryMaterialXref>(.*?)<\/SupplementaryMaterialXref>}{}gsi;
	
	while($Content1=~m{(Supplementary material|ESM Figure|ESM Table|Supplementary data|Electronic supplementary material|ESM Appendix|ESM Movie|Supplementary|Supplemental|eAppendix|online suppl|Supp fig|Supp table|Online appendix|Supp table|Online fig|Online table|eFigure Online table| etable | efig |Electronic table|Electronic fig|supplementary information|supporting information|support information|supplementary Tab|supplementary Fig|supplementary Table|supplementary Figure|supplementary Video|supporting Tab|supporting Fig|supporting Table|supporting Figure|supporting Video|Fig S(\d+)|Table s(\d+)|Figure s(\d+))}gsi)
	{
		my $Character_Style=$1;
		
		my $cnum = index($Content, $Character_Style) + 1;
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Warning: $Character_Style text found without SupplementaryMaterialXref style");
	}



	
}
	}
}


my $Intellect_Journal1=$ARGV[0];

if($Intellect_Journal1=~m{(LWW)}gsi)
{
if($End_Journal=~m{(HS9)}gsi)
{

	

	my $Content1=$Tmp;
	my $Content2=$Tmp;

	my $Correspond=$Tmp;
	my $Table_Caption=$Tmp;

	
	
	
	
	if($Content1!~m{<Hyperlink>(.*?)<\/Hyperlink>}gsi)
	{
		my $Character_Style=$1;
		
		my $cnum = index($Content1, $Character_Style) + 1;
		
		push(@Error,"\~Para No:1 Col No:1 hyperlink missing. please check with PM");
	}

	while($Content2=~m{(Supplementary table|Supplementary figure|Suppl\. table|Suppl\. figure|Suppl\.table|Suppl\.figure)}gsi)
	{
		my $Character_Style=$1;
		
		my $cnum = index($Content2, $Character_Style) + 1;
		
		push(@Error,"\~Para No:1 Col No:1 $1 Hyperlink missing for supplementary link");
	}

	while($Correspond=~m{<([^\>]+)\><FMNoteCorrespondence>(.*?)<\/FMNoteCorrespondence>}gsi)
	{
		
		my $Con=$2;
		my $Paragraph_No=$1;

		$Con=~s{<([^\>]+)\>}{}gsi;

		
		
		my $cnum = index($Correspond, $Con) + 1;

		if($Con!~m{\.(\s?)$}gsi)
		{
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  For HS9 journal, the correspondence line should have an end period per style.");
		}
	}

	while($Correspond=~m{<([^\>]+)\><Tablecaption>(.*?)<\/Tablecaption>}gsi)
	{
		
		my $Con=$2;
		my $Paragraph_No=$1;

		$Con=~s{<([^\>]+)\>}{}gsi;

		
		
		my $cnum = index($Correspond, $Con) + 1;

		if($Con=~m{\.(\s?)$}gsi)
		{
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  For HS9 journal, the table caption line should not have an end period per style.
");
		}
	}



	

}

if($End_Journal1=~m{(STR)}gsi)
{

	my $Content1=$Tmp;
	my $Content2=$Tmp;
	my $Content3=$Tmp;
	my $Content4=$Tmp;	
	
	
	if($Content1!~m{<fmabstractsectionHeadrunIn>(BACKGROUND)}gsi)
	{
		
		
		push(@Error,"\~Para No:1 Col No:1 The abstract headings for STR should have background");
	}

	if($Content2!~m{<fmabstractsectionHeadrunIn>(METHOD)}gsi)
	{
		
		
		push(@Error,"\~Para No:1 Col No:1 The abstract headings for STR should have method");
	}
	
	if($Content3!~m{<fmabstractsectionHeadrunIn>(RESULT)}gsi)
	{
		
		
		push(@Error,"\~Para No:1 Col No:1 The abstract headings for STR should have result");
	}

	if($Content4!~m{<fmabstractsectionHeadrunIn>(CONCLUSION)}gsi)
	{
		
		
		push(@Error,"\~Para No:1 Col No:1 The abstract headings for STR should have conculusion");
	}

	

	

	}
}



if($End_Journal2=~m{(ALN)}gsi)
{

	my $Content1=$Tmp;
	my $Content2=$Tmp;
	my $Content3=$Tmp;
	my $Content4=$Tmp;	
	
	
	my $Conflict_Tmp=$Tmp;

	$Conflict_Tmp=~s{<bold>(.*?)<\/bold>}{$1}gsi;
	$Conflict_Tmp=~s{<italic>(.*?)<\/italic>}{$1}gsi;
	
	
	if($Conflict_Tmp=~m{<([^\>]+)\><([^\>]+)\>Editors Perspective}gsi)
	{
		my $Style=$2;

		if($Style!~m{BoxTitle}gsi)
		{
		
		my $Paragraph_No=$1;
		$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Editor Perspective should have box title style");
		}
	}
	

	

	
}









my $LWW_Journal=$Journal;
if($LWW_Journal=~m{\\(CIR)\\}gs)
{

while($Supp_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Content=$3;
	my $Content1=$3;
	my $Content2=$3;

	$Content=~s{<([^\>]+)\>}{}gsi;

	
	
	$Content1=~s{<SupplementaryMaterialXref>(.*?)<\/SupplementaryMaterialXref>}{}gsi;
	
	while($Content1=~m{(Figure (\w+) in the Data Supplement|Table (\w+) in the Data Supplement|Figure (\w+) in the online Data Supplement|Tables (\w+) and (\w+) in the Online Data Supplement|Figure (\w+) in the online Online only data supplement|Tables (\w+) and (\w+) in the Online only data supplement|Figure (\w+) of the Data Supplement|Tables (\w+) and (\w+) of the Data Supplement|Figure (\w+) of the online Data Supplement|Tables (\w+) and (\w+) of the Online Data Supplement|Figure (\w+) of the online Online only data supplement|Tables (\w+) and (\w+) of the Online only data supplement|Figure (\w+) in the Supplement|Table (\w+) in the Supplement|Table (\w+) \& figure (\w+) in the Supplement|Table (\w+) \& figure (\w+) in the Supplement|Table (\w+) and Figure (\w+) in the Supplement|Table (\w+)\-(\w+) in the Supplement|Figure (\w+)\-(\w+) in the Supplement)}gsi)
	{
		my $Character_Style=$1;
		
		my $cnum = index($Content, $Character_Style) + 1;
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Error: Supplementary citation found without SupplementaryMaterialXref style");
	}



	
}
}

my $LWW_Journal1=$ARGV[0];

my $Clinical_Tmp=$Tmp;

my $Clinical_Tmp1=$Tmp;

my $LWW_Journals=$ARGV[0];
if($LWW_Journals=~m{(HAE|STR|HCV|HCQ|HCG|HHF|HCI|HYP|RES|ATV)}gs)
{

while($Supp_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Content=$3;
	my $Content1=$3;
	my $Content2=$3;

	$Content=~s{<([^\>]+)\>}{}gsi;

	
	
	$Content1=~s{<SupplementaryMaterialXref>(.*?)<\/SupplementaryMaterialXref>}{}gsi;
	
	while($Content1=~m{(Supplementary material|ESM Figure|ESM Table|Supplementary data|Electronic supplementary material|ESM Appendix|ESM Movie|Supplementary|Supplemental|eAppendix|online suppl|Supp fig|Supp table|Online appendix|Supp table|Online fig|Online table|eFigure Online table|etable|efig|Electronic table|Electronic fig|supplementary information|supporting information|support information|supplementary Tab|supplementary Fig|supplementary Table|supplementary Figure|supplementary Video|supporting Tab|supporting Fig|supporting Table|supporting Figure|supporting Video|Fig S(\d+)|Table s(\d+)|Figure s(\d+))}gsi)
	{
		my $Character_Style=$1;
		
		my $cnum = index($Content, $Character_Style) + 1;
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Error: Supplementary citation found without SupplementaryMaterialXref style");
	}



	
}

$Clinical_Tmp=~s{<(\d+)\><([^\>]+)\><([^\>]+)\>(.*?)<([^\>]+)\>}{<$1><$2>$4}gsi;	
	
while($Clinical_Tmp=~m{<(\d+)\><([^\>]+)\>(Clinical Trial Registration|REGISTRATION)}gsi)
{
	
	my $Style=$2;

	my $Paragraph_No=$1;

	if($Style!~m{(FMNoteClinicalTrailInfo)}gsi)
	{
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Error: Check the style. FMnoteClinicaltrailinfo");
	}

			
}

while($Clinical_Tmp1=~m{<([^\>]+)\><FMNoteClinicalTrailInfo>(.*?)<\/FMNoteClinicalTrailInfo>}gsi)
{
	
	my $Content=$2;

	my $Paragraph_No=$1;

	if($Content!~m{<UIxref>}gsi)
	{
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Error: Uixref style is missing in FMNoteClinicalTrailInfo");
	}

			
}



}



if($Math_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Content=$3;
	my $Content1=$3;
	my $Content2=$3;

	
	
	
	while($Content=~m{(<math\/>)}gsi)
	{
		my $Character_Style=$1;
		
		my $cnum = index($Content, $Character_Style) + 1;
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Math equation in word frame");
	}

	while($Content=~m{(<\/allcaps>)}gsi)
	{
		my $Character_Style=$1;
		
		my $cnum = index($Content, $Character_Style) + 1;
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Allcaps not allowed");
	}


	


	

	
	

}

while($Citation_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Content=$3;
	my $Content1=$3;

	
	
	
	

	if($Content1=~m{<citationRef>(\s?)Add}gsi)
	{
		my $Character_Style=$1;

		
		my $cnum = index($Content, $Character_Style) + 1;
		
		push(@Error,"\~Para No:1 Col No:1 Check the unwanted field code present in the paragraph");
	}

	

}

my $Query_Tmp=$Tmp;



while($Query_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{

	my $Paragraph_No=$1;
	my $Content=$3;
	my $Content1=$3;
	my $Content2=$3;
	my $Content3=$3;
	my $Content4=$3;

	$Content1=~s{<query>\[Citation (\w+)\]<\/query>}{}gsi;
	
	while($Content1=~m{<query>(.*?)<\/query>}gsi)
	{
		my $Query=$1;

		my $cnum = index($Content, $Query) + 1;
		
		$Query=~s{\?$}{\?\.}gsi;
		$Query=~s{\? $}{\?\.}gsi;
		$Query=~s{\?\]$}{\?\]\.}gsi;
		$Query=~s{\? \]$}{\?\.\]}gsi;
		$Query=~s{\.\"\]$}{\"\.\]}gsi;
		$Query=~s{\.\”\]$}{\”\.\]}gsi;
		$Query=~s{\. \”$}{\”\.}gsi;
		$Query=~s{\.\”$}{\”\.}gsi;
		$Query=~s{\. \”\]$}{\”\.\]}gsi;
		$Query=~s{\. \"\]$}{\"\.\]}gsi;
		$Query=~s{\? \]$}{\?\.\]}gsi;
		$Query=~s{ \]$}{\]}gsi;
		$Query=~s{\]$}{}gsi;

		$Query=~s{AQ\_(\d+)}{AQ}gsi;
		
		
		if($Query!~m{(AQ\:|AU\:|TS\:|TS_Comment\:|Note to comp)}si)
		{
			
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Author query should contain either AQ, AU,TS,TS_Comment,Note to Comp");
		}


		if($Query!~m{\.$}si)
		{
			
			push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Query should end with dot");
		}

		if($ARGV[0]=~m{(\\LWW\\Production\\(\w+)|JData_NEW\\LWW)}gsi)
		{
			if($Query=~m{(PE\:|CE\:)}si)
			{
				push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  query should not contain $1");
			}
		
		}

		

		
	}

	$Content2=~s{<query>(.*?)<\/query>}{}gsi;
	$Content2=~s{<comment>(.*?)<\/comment>}{}gsi;
	if($Content2=~m{\[AU\:}gsi)
	{
		my $Query=$1;

		my $cnum = index($Content, $Query) + 1;

		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Query content present inside the text");

		
	}

	if($Content2=~m{\[(AQ\:|CE\:|TS\:)}gsi)
	{
		my $Query=$1;

		my $cnum = index($Content, $Query) + 1;

		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Query content present inside the text");

		
	}

	



	
	
}
my $Reference_Tmp=$Tmp;

my $Reference_Tmp1=$Tmp;


		
if($Reference_Tmp=~m{<([^\>]+)\><EMReferencesHead>}gsi)
{
	my $Paragraph_No=$1;
	if($Reference_Tmp1!~m{<Reference>}si)
	{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 \†Reference style present without reference heading(EM_Reference_Head)");
	}
	
	
}

my $Reference_Tmp4=$Tmp;

if($Reference_Tmp=~m{<([^\>]+)\><EMReferencesHead>(.*?)<\/EMReferencesHead>}gsi)
{
	my $Paragraph_No=$1;
	if($Reference_Tmp1!~m{^(Reference|Literature Cited|Bibliography|Suggested)}si)
	{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the Reference head style applied wrongly");
	}
	
	
}


my $Reference_Tmp2=$Tmp;

my $Reference_Tmp3=$Tmp;


if($Reference_Tmp2=~m{<([^\>]+)\><Reference>}gsi)
{
	my $Paragraph_No=$1;
	if($Reference_Tmp1!~m{<EMReferencesHead>}si)
	{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 \†Reference style present without EM_Reference_Text");
	}

	my $Paragraph_No=$1;
	if($Reference_Tmp1=~m{([\.\:\;\,]+)<\/EMReferencesHead>}si)
	{
		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Punctutaion is not allowed in the end of the reference heading.");
	}
	
	
}

my $Table_Count="1";



$Tab_Tmp=~s{<\/tablenote>\n<tablenote>}{<\/tablenote><tablenote>}gsi;


$Tab_Tmp=~s{<table\/>\n<tablenote>(.*?)<\/tablenote>\n}{<tablenote>$1<\/tablenote>\n<table\/>\n}gsi;

	
my $Tab_Tmp1=$Tmp;



$Tab_Tmp1=~s{<table frame=\"(\w+)\" orient=\"port\"\/>(.*?)<table\/>}{}gsi;

while($Tab_Tmp1=~m{<tbody>(.*?)<\/tbody>}gsi)
{
	my $Table=$1;
	my $Table1=$1;
	my $Table2=$1;
	my $Table3=$1;


	

	my $Row_Count="1";

	$Table=~s{<td}{"<".$Row_Count++."><td"}gesi;

	#$Table=~s{<(\d+)>(<row([^\>]*)\>(.*?)<\/row>)}{&Row($1,$2)}gesi;


	
	
	if($Table3!~m{(XMLmetadata|FMArticleTitle)}si)
	{
		

	my $Table_Row=$Table;

	

	while($Table_Row=~m{<td([^\>]*)\>\n*<(\d+)>(.*?)<\/td>}gsi)
	{

		my $Rowno=$2;
		my $Row=$3;
		my $Row1=$3;

		

		if($Row=~m{<tableBody}gsi)
		{
			
			
			if($Row1=~m{<tablecolumn}gsi)
			{
				$Err="1";
				
push(@Error,"\~Table No:$Table_Count Row No:$Rowno Col No:1 Both TableColumn head style and table Body style is present in same row");
			}
			
		}

		
		
	}
		      
	

	while($Table=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
	{

		my $Rowno=$1;
		my $Colno=$2;
		my $Entry=$2;
		my $Entry1=$2;
		my $Entry2=$2;
		my $Entry3=$2;
		my $Entry4=$2;
		
		my $Content=$3;

		$Colno=~s{col}{}gsi;

		

		if($Entry!~m{^(table|BL|NL|OL|UL)(.*?)}gsi)
		{
			
			
$Err="1";
push(@Error,"\~Para No:1 Col No:1 $Table_Count Row No:1 Col No:1 TableColumn head style or table Body style is missing. Check the style $Entry");
		}

		
		
		
		if($Entry4=~m{<tablenote}gsi)
		{

			push(@Error,"\~Table No:$Table_Count Row No:$Rowno Col No:$Colno Tablenote style is present inside the table");
$Err="1";

		}


		

		my $XCS_Journal=$Journal;

		if($XCS_Journal=~m{^(XCS)$}gsi)
		{

		if($Entry=~m{<TableColumnHead><bold>}si)
		{
			$Err="1";
push(@Error,"\~Table No:$Table_Count Row No:$Rowno Col No:$Colno Bold style applied for Tablecolumnhead");
		}

		}
		
		my $Ent2=$Entry2;
		
		if($Ent2=~m{<tabfnxref>(.*?)<\/tabfnxref>}gsi)
		{
			my $Tag=$1;

			my $Table1=$Table;

			
			$Tag=~s{<bold>(.*?)<\/bold>}{$1}gsi;
			$Tag=~s{<italic>(.*?)<\/italic>}{$1}gsi;
			
		
			if($Table1!~m{<tablenote>(\s?)<tabfnxref>\Q$Tag\E<\/tabfnxref>}gsi)
			{
			
			
			$Err="1";
push(@Error,"\~Table No:$Table_Count Row No:$Rowno Col No:$Colno $Tag not cited in the table note");
			}
		}

		my $Ent3=$Entry3;
		
		if($Ent3=~m{<tabfnxrefonline>(.*?)<\/tabfnxrefonline>}gsi)
		{
			my $Tag=$1;

			my $Table2=$Table;
			if($Table2!~m{<tablenote>(\s?)<tabfnxrefonline>\Q$Tag\E<\/tabfnxrefonline>}gsi)
			{
				
			
			$Err="1";
push(@Error,"\~Table No:$Table_Count Row No:$Rowno Col No:$Colno $Tag not cited in the table note");
			}
		}

		my $Ent4=$Entry2;
		
		if($Ent4=~m{<tabxref>(.*?)<\/tabxref>}gsi)
		{
			my $Tag=$1;

		my $Table1=$Table;	
			
			
			$Err="1";
push(@Error,"\~Table No: TabXref Style is not allowed inside the table");
			
		}
		

	
	}

	$Table_Count++;
	}
}



$Tab_Tmp1=~s{<entry ([^\>]+)\>(.*?)<\/entry>}{}gsi;


while($Tab_Tmp1=~m{<([^\>]+)\><(TableBody|TableColumnHead)>(.*?)<\/\2>}gsi)
{
	$Err="1";
	my $Paragraph_No=$1;
#push(@Error,"\~Para No:$Paragraph_No Col No:1 $2 style is applied in the body matter");
}

my $Comma_Tmp=$Tmp;


while($Comma_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Content=$3;

	

	$Content=~s{<([^\>]+)\>}{}gsi;

	
	
	while($Content=~m{(\,\,)}gsi)
	{
		my $cnum = index($Content, "$1") + 1;
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Warning:Double camma found");
	}
	
	
}

my $Semi_Tmp=$Tmp;


while($Semi_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Content=$3;

	

	$Content=~s{<([^\>]+)\>}{}gsi;

	
	
	while($Content=~m{(\;\;)}gsi)
	{
		my $cnum = index($Content, "$1") + 1;
		$Err="1";
		#push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  Double semicolon found");
	}
	
	
}

$Ref_Tmp=~s{<BibXrefonline\/>}{}gsi;
$Ref_Tmp=~s{<BibXref\/>}{}gsi;
$Ref_Tmp=~s{ <\/bibxref>}{<\/bibxref> }gsi;
$Ref_Tmp=~s{<\/bibxref>\&ndash;<bibxref>}{\&ndash;}gsi;
$Ref_Tmp=~s{<\/OnlineBibXref>\&ndash;<OnlineBibXref>}{\&ndash;}gsi;
$Ref_Tmp=~s{<\/BibXrefonline>\&ndash;<BibXrefonline>}{\&ndash;}gsi;
$Ref_Tmp=~s{(\[\[\[ins\]\]\]\,\[\[\[\/ins\]\]\])<\/bibxref>}{<\/bibxref>$1}gsi;

$Ref_Tmp=~s{(\[\[\[ins\]\]\]\,\[\[\[\/ins\]\]\])<\/bibxrefonline>}{<\/bibxrefonline>$1}gsi;

$Ref_Tmp=~s{(\[\[\[ins\]\]\]\,\[\[\[\/ins\]\]\])<\/onlinebibxref>}{<\/onlinebibxref>$1}gsi;

$Ref_Tmp=~s{<bibxref>(\w+)\]<\/bibxref>}{<bibxref>$1<\/bibxref>\]}gsi;

$Ref_Tmp=~s{\](\s+)<\/bibxref>}{<\/bibxref>\]$1}gsi;

$Ref_Tmp=~s{\](\s+)<\/onlinebibxref>}{<\/onlinebibxref>\]$1}gsi;

$Ref_Tmp=~s{\)(\s+)<\/bibxref>}{<\/bibxref>\)$1}gsi;

$Ref_Tmp=~s{\)(\s+)<\/onlinebibxref>}{<\/onlinebibxref>\)$1}gsi;


$Ref_Tmp=~s{<bibxref>\[(\w+)<\/bibxref>}{\[<bibxref>$1<\/bibxref>}gsi;

$Ref_Tmp=~s{<bibxref>(\w+)\)<\/bibxref>}{<bibxref>$1<\/bibxref>\)}gsi;

$Ref_Tmp=~s{<bibxref>\((\w+)<\/bibxref>}{\(<bibxref>$1<\/bibxref>}gsi;	

$Ref_Tmp=~s{<bibxref><bold>(.*?)<\/bold><\/bibxref>}{<bold><bibxref>$1<\/bibxref><\/bold>}gsi;


$Ref_Tmp=~s{<bibxref>(.*?)<\/bibxref>}{&Bib_xref($1)}gesi;



#$Ref_Tmp=~s{<OnlineBibXref>(.*?)<\/OnlineBibXref>}{&Bib_xref_sup($1)}gesi;
#$Ref_Tmp=~s{<BibXrefonline>(.*?)<\/BibXrefonline>}{&Bib_xref_sup($1)}gesi;

$Ref_Tmp=~s{(<citationref>(.*?)<\/citationref>)}{&OUP_Part_Label($1)}gesi;

$Ref_Tmp=~s{<partref>([^\<]+)\<\/partref>(\1)}{<bold type=\"xrefchar\">$2<\/bold>}gsi;

$Ref_Tmp=~s{<citationref>(\s?)SET \"CIT(\d+)\"([^\<]*)\<\/citationref>}{<citationref>CIT$2<\/citationref>}gsi;



$Ref_Tmp=~s{<citationref>(\s?)SET \"(\d+)\s\"([^\<]*)\<\/citationref>}{<citationref>CIT$2<\/citationref>}gsi;

$Ref_Tmp=~s{<citationref>(\s?)SET \"\s(\d+)\s\"([^\<]*)\<\/citationref>}{<citationref>CIT$2<\/citationref>}gsi;

$Ref_Tmp=~s{<\/citationref><citationref>}{}gsi;


$Ref_Tmp=~s{(<citationref>(.*?)<\/citationref>)}{&Citation($1)}gesi;

$Ref_Tmp=~s{<\/citationId><citationId>}{}gsi;



$Ref_Tmp=~s{<citationId>([^\<]+)\<\/citationId><bibxrefonline>(.*?)<\/bibxrefonline>}{&Linking($1,$2)}gesi;

$Ref_Tmp=~s{<citationId>([^\<]+)\<\/citationId>}{}gsi;



$Ref_Tmp=~s{<citationref>([^\<]+)\<\/citationref>}{\n<citationref>$1<\/citationref>}gsi;

$Ref_Tmp=~s{<BibXrefonline>(.*?)<\/BibXrefonline>}{"<BibXrefonline>".&Bib($1)."<\/BibXrefonline>"}gesi;

$Ref_Tmp=~s{<citationref>([^\<]+)\</citationref><BibXrefonline>(.*?)<\/BibXrefonline>}{<xref ref-type="bibr" rid=\"$1\">$2<\/xref>}gsi;



$Ref_Tmp=~s{<citationref>(.*?)<\/citationref>}{}gsi;





$Ref_Tmp=~s{\,<xref ref-type="bibr" rid=\"([^\"]+)\"> (\d+)}{\, <xref ref-type=\"bibr\" rid=\"$1\">$2}gsi;

$Ref_Tmp=~s{<sup>(\d+)</sup></xref>(\s?)\,(\s?)<xref ref-type=\"bibr\"}{<sup>$1<\/sup><\/xref><sup>$2\,$3<\/sup><xref ref-type=\"bibr\"}gsi;

$Ref_Tmp=~s{rid=\"(\w+)\]\"}{rid=\"$1\"}gsi;
$Ref_Tmp=~s{rid=\"(\w+)\)\"}{rid=\"$1\"}gsi;

$Ref_Tmp=~s{(<sup><xref ref-type=\"bibr" rid=\"([^\"]+)\">(\d+)<\/xref>)<\/sup>\,<sup>(<xref ref-type=\"bibr" rid=\"([^\"]+)\">(\d+)<\/xref><\/sup>)}{$1\,$4}gsi;







my $R_Tmp=$Ref_Tmp;
my $RR_Tmp=$Ref_Tmp;

$R_Tmp=~s{<footnote>(.*?)<\/footnote>}{}gsi;



while($R_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{

	my $Paragraph_No=$1;
	my $Journal_Name=$Journal;

	
	my $Ref=$3;
	my $Ref1=$3;
	my $Ref2=$3;
	my $Footnote_Text=$3;

	
	if($Journal_Name=~m{(ANNBOT|ZOOLIN|BIOLIN|BOTLIN)}gsi)
	{
	$Ref=~s{(<xref ref\-type=\"bibr\" rid=\"([^\"]+)\">(.*?)<\/xref>)}{&Ref_Citation($1)}gesi;

	
	
	

	while($Ref=~m{(<xref ref\-type=\"bibr\")}gsi)
	{
		my $Character_Style=$1;

		my $cnum = index($Ref, $Character_Style) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum et al should be in italic format'");
	}

	}

	$RR_Tmp=~s{<refnumber>(\d+)}{<refnumber>$1}gsi;

	$RR_Tmp=~s{<refnumber>☑(\d+)}{<refnumber>$1}gsi;

	$RR_Tmp=~s{<refnumber>☒(\d+)}{<refnumber>$1}gsi;

		
	if($RR_Tmp=~m{<refnumber>(\d+)([\.\s]?)<\/refnumber>}gsi)
	{
	while($Ref1=~m{<xref ref\-type=\"bibr\" rid=\"([^\"]+)\">}gsi)
	{
		my $Ref=$1;

		

		my @Ref_ID=split(" ",$Ref);

		foreach my $Value(@Ref_ID)
		{
			my $Reference_Tmp=$Tmp;
			my $Reference_Tmp1=$Tmp;

			$Reference_Tmp=~s{<refnumber>(\d+)}{<refnumber>$1}gsi;

			$Reference_Tmp=~s{ </refnumber>}{</refnumber>}gsi;

			$Reference_Tmp=~s{<refnumber>(\d+)}{<refnumber>$1}gsi;

			$Reference_Tmp=~s{<refnumber>☑(\d+)}{<refnumber>$1}gsi;

			$Reference_Tmp=~s{<refnumber>☒(\d+)}{<refnumber>$1}gsi;

			$Reference_Tmp=~s{ </refnumber>}{</refnumber>}gsi;

			

			$Value=~s{CIT000}{}gsi;
			$Value=~s{CIT00}{}gsi;
			$Value=~s{CIT0}{}gsi;

			

			

			if($Reference_Tmp!~m{<refnumber>(.?)$Value([\.\s]?)<\/refnumber>}gsi)
			{
				if($Reference_Tmp1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
				{
					my $Paragraph_No=$1;

					
					push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning: Reference Citation $Value found. But $Value reference not found in the reference list");
				}
			}
			
		}
		
	}
	while($Ref2=~m{<xref ref\-type=\"bibr\" rid=\"CIT(\d+)\">}gsi)
	{
		my $Value=$1;

		
			my $Reference_Tmp=$Tmp;
			my $Reference_Tmp1=$Tmp;

			$Reference_Tmp=~s{<refnumber>(\d+)}{<refnumber>$1}gsi;
			$Reference_Tmp=~s{ <\/refnumber>}{<\/refnumber>}gsi;
			$Reference_Tmp=~s{<refnumber>(\d+)}{<refnumber>$1}gsi;

			$Reference_Tmp=~s{ </refnumber>}{</refnumber>}gsi;

			$Reference_Tmp=~s{<refnumber>(\d+)}{<refnumber>$1}gsi;

			$Reference_Tmp=~s{<refnumber>☑(\d+)}{<refnumber>$1}gsi;

			$Reference_Tmp=~s{<refnumber>☒(\d+)}{<refnumber>$1}gsi;


		
			$Value=~s{^000}{}gsi;
			$Value=~s{^00}{}gsi;
			$Value=~s{^0}{}gsi;

			
			if($Reference_Tmp!~m{<refnumber>(.?)$Value([\.\s]?)<\/refnumber>}gsi)
			{
				if($Reference_Tmp1=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
				{
					my $Paragraph_No=$1;

					
					push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning: Reference Citation $Value found. But $Value reference not found in the reference list");
				}
			}
			
		
		
	}

			}
	

	while($Footnote_Text=~m{<(fnxref|fnxrefonline)>(.*?)<\/\1>}gsi)
	{
		my $Fnxref=$2;

		my $F_Tmp=$Tmp;

		$F_Tmp=~s{\.<\/fnxref>}{<\/fnxref>}gsi;
		$F_Tmp=~s{(\s?)\.(\s?)<\/fnxref>}{<\/fnxref>}gsi;

		#$Tmp=~s{<footnote>(\s?)}{}gsi;

		

		if($F_Tmp!~m{<footnote>(\s?)<(fnxref|fnxrefonline)>\Q$Fnxref\E<\/\2>}gsi)
		{
			$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Footnote citation $Fnxref present without footnote");
		}
		
	}

	
}


my $R_Tmp1=$Ref_Tmp;




while($R_Tmp1=~m{(<(\d+)><([^\>]+)\>(.*?)<\/\3>)}gsi)
{

	my $Paragraph_No=$2;

	my $Content=$4;

	

	my $Content1=$4;

	my $Content2=$4;
	
	$Content=~s{<xref ref\-type=\"bibr\" rid=\"CIT([^\"]+)\">(.*?)<\/xref>}{$2}gsi;

	$Content1=~s{<([^\>]+)\>}{}gsi;

	
	
	while($Content=~m{(<xref ref\-type=\"bibr\" rid=\"000\">(.*?)<\/xref>)}gsi)
	{

		
		my $Character_Style=$2;

		my $Year=$2;

		my $cnum = index($Content1, $Character_Style) + 1;

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Citation linking field code not present $Year'");
	}

	while($Content=~m{(<bibxrefonline>(.*?)<\/bibxrefonline>)}gsi)
	{

		
		my $Character_Style=$2;

		my $Year=$2;

		my $cnum = index($Content1, $Character_Style) + 1;

		if($Ref_no!~m{<refnumber>}si)
		{
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Citation linking field code not present $Year'");
		}
	}

	
	

}


$Ref_Tmp=~s{<citationId></citationId>}{}gsi;


$Ref_Tmp=~s{\[\[\[ob:italic([^\]]+)\]\]\]}{<$1>}gsi;


$Ref_Tmp=~s{<reference>(.*?)<\/reference>}{"<ref><citation citation-type=\"journal\">".&Reference($1)."</citation></ref>"}gesi;

$Ref_Tmp=~s{<ref><citation citation-type="journal"><reftrack>(.*?)<\/reftrack><\/citation><\/ref>}{<reftrack>$1<\/reftrack>}gsi;


$Ref_Tmp=~s{<thesis-title>(.*?)<\/thesis-title>}{<source>$1<\/source>}gsi;

$Ref_Tmp=~s{(<citation citation-type=\"(\w+)\">) }{$1}gsi;


my $ref ='1';
$Ref_Tmp=~s/<ref>/'<ref id="'.$ref++.'">'/segi;

$Ref_Tmp=~s{<person\-group><label>}{<label>}gsi;

my $Ref_Tmps=$Ref_Tmp;



if($Ref_Tmps=~m{<ref id=\"([^\"]+)\"><citation ([^\>]+)\><label}gsi)
{

while($Ref_Tmp=~m{<([^\>]+)\><ref id=\"(\d+)\"><citation ([^\>]+)\><label>(\s?)(\d+)}gsi)
{
	my $Paragraph_No=$1;

	my $ID=$2;

	my $Label=$5;

	
	if($ID ne $Label)
	{
		
		

push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning: Check the reference sequence label");
		
	}

	
}

}

$Ref_Tmp=~s{rid=\"CIT(0*)}{rid=\"}gsi;

$Ref_Tmp=~s{<italic>}{}gsi;
$Ref_Tmp=~s{<\/italic>}{}gsi;
$Ref_Tmp=~s{<bold>}{}gsi;
$Ref_Tmp=~s{<\/bold>}{}gsi;
my $Ref_Tmp1=$Ref_Tmp;




		while($Ref_Tmp1=~m{(<xref ref\-type=\"bibr\" rid=\"([^\"]+)\">([^\<]+)\</xref>)}gsi)
		{
			
			my $Ref_Id=$2;

			my $Ref_Yearsss=$3;

			my $Tag=$1;

			$Ref_Yearsss=~s{\&\#x(\w+);}{}gsi;

			my $Ref_Yearsss1=$Ref_Yearsss;

			my $Ref_Year;

			if($Ref_Yearsss=~m{([0-9][0-9][0-9][0-9])(\w?)}gsi)
			{

				$Ref_Year="$1$2";
			}

			
			if($Ref_Yearsss1=~m{(\[[0-9][0-9][0-9][0-9]\]) ([0-9][0-9][0-9][0-9])(\w?)}gsi)
			{

				$Ref_Year="$1 $2$3";

				
			}
			

			

			

			if($Ref_Year=~m{(\d+)}gsi)
			{
			
			if($Ref_Tmp=~m{(<ref id=\"$Ref_Id\">(.*?)<\/ref>)}gsi)
			{
				my $Ref=$1;

				$Ref=~s{<year>\[}{<year>}gsi;
				$Ref=~s{\]<\/year>}{<\/year>}gsi;

				$Ref=~s{<year>\(}{<year>}gsi;
				$Ref=~s{\)<\/year>}{<\/year>}gsi;
				$Ref=~s{\.<\/year>}{<\/year>}gsi;

				$Ref_Year=~s{^\[}{}gsi;
				
				if($Ref=~m{<year>\Q$Ref_Year\E(\.?)<\/year>}si)
				{
					
					
					
					$Ref_Tmp=~s{\Q$Tag\E}{}gsi;
					$Ref_Tmp=~s{\Q$Tag\E}{}gsi;
					
				}

				else
				{
					
				}
				}

			}
		}

	

my $FM_Article_Type=$Tmp;

if($FM_Article_Type=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
{
	my $Article_Type=$1;
	$Article_Type=~s{<([^\>]+)\>}{}gsi;

	if($Article_Type=~m{(In This Issue|Editorial|Book Review|Commentary|Erratum|Corrigendum|News|Letter to the Editor|Addendum|Announcement|Books\-received|Calendar|Case\-report|Discussion|Letter|Meeting\-report|Obituary|Product-review|Reply \(Letter\)|Retraction)}gsi)
	{
		if($Tmp=~m{<([^\>]+)\><(FMAbstractParaFlushLeft|FMAbstractParaInd)>}gsi)
		{
			my $Paragraph_No=$1;
			my $Style=$2;
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Abstarct is not allowed for $Article_Type Article_type");
		}
	}
	
}

my $MD99_Journal=$Journal;

if($MD99_Journal=~m{^(MD9|MD)$}gsi)
{

my $FM_Article_Type=$Tmp;
my $Corres=$Tmp;
my $Corres1=$Tmp;

$Corres=~s{<FMNoteCorrespondence>(.*?)<\/FMNoteCorrespondence>}{}gsi;

my $Count1=$Corres=~s{<fmcorrsurname}{<fmcorrsurname}gsi;

my $Count2=$Corres=~s{<fmcorrGivenName}{<fmcorrGivenName}gsi;

if($Count1 ge "2")
{
	$Err="1";
push(@Error,"\~Para No:1 Col No:1 More then one correspondence surname is not allowed");
}

if($Count2 ge "2")
{
	push(@Error,"\~Para No:1 Col No:1 More then one correspondence givenname is not allowed");
}

	
}

my $MD999_Journal=$Journal;

if($MD999_Journal=~m{^(MD)$}gsi)
{

my $FM_Article_Type=$Tmp;
my $Corres=$Tmp;
my $Corres1=$Tmp;



my $Count1=$Corres=~s{<FMNoteEthicalApprovalStatement>}{<FMNoteEthicalApprovalStatement>}gsi;

my $Count2=$Corres=~s{<FMNoteFunding>}{<FMNoteFunding>}gsi;

my $Count3=$Corres=~s{<FMNoteCodeDataRequest>}{<FMNoteCodeDataRequest>}gsi;

if($Count1 ge "2")
{
	$Err="1";
push(@Error,"\~Para No:1 Col No:1 More then one FM_Note_Ethical_Approval_Statement is not allowed");
}

if($Count2 ge "2")
{
	$Err="1";
	push(@Error,"\~Para No:1 Col No:1 More then one FM_Note_Funding is not allowed");
}

if($Count3 ge "2")
{
	$Err="1";
	push(@Error,"\~Para No:1 Col No:1 More then one FM_Note_Code_Data_Request is not allowed");
}

my $FM_Article_Type11=$Tmp;
my $EM_Text=$Tmp;

if($FM_Article_Type11=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
{
	my $Article_Type=$1;
	$Article_Type=~s{<([^\>]+)\>}{}gsi;

	if($Article_Type=~m{(Clinical Trial/Experimental Study|Systematic Review and Meta-Analysis|Observational Study|Clinical Case Report|Study Protocol Systematic Review|Study Protocol Clinical Trial|Narrative Review|Quality Improvement Study|Diagnostic Accuracy Study|Erratum)}gsi)
	{

	if($EM_Text!~m{<fmarticlesubtitle>}gs)
	{

	push(@Error,"\~Para No:1 Col No:1 FM_article_subtitle is missing");

	}

		
			
		
	}
	
}
	
}

my $TPA_Journal=$Journal;

if($TPA_Journal=~m{^(TPA)$}gsi)
{

my $FM_Article_Type=$Tmp;
my $Corres=$Tmp;
my $Corres1=$Tmp;

if($Corres!~m{(If you have color in your proof, please indicate whether you approve the color charge by returning the color agreement with your corrections. The color agreement can be found at)}gsi)
{
	push(@Error,"\~Para No:1 Col No:1 Query is missing. If you have color in your proof, please indicate whether you approve the color charge by returning the color agreement with your corrections. The color agreement can be found at http://links.lww.com/TP/B705. The rate is \$100 per 1 printed color figure. You may also chose to have online only color at no extra charge. If you have any questions, please contact Anna.butrim\@wolterskluwer.com.");
}
	
}


my $ATV_Journal=$Journal;

if($ATV_Journal=~m{^(ATV)$}gsi)
{

my $FM_Article_Type=$Tmp;
my $Corres=$Tmp;
my $HeadD1_Tmp=$Tmp;

while($HeadD1_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;
	my $Equation=$3;
	my $Equation1=$3;

	

	
		

	while($Equation=~m{(<figxref>(.*?)<\/figxref>)}gsi)
	{
		my $Figxref=$1;

		
		my $Character_Style=$1;

	my $cnum = index($Equation, $Character_Style) + 1;

	if($Figxref=~m{<bold>}gsi)
	{
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum bold is not allowed for figxref citation");
	}

		

	}

	}
	
}


my $MD9_Journal=$Journal;

if($MD9_Journal=~m{^MD9$}gsi)
{

my $FM_Article_Type=$Tmp;
my $EM_Text=$Tmp;

if($FM_Article_Type=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
{
	my $Article_Type=$1;
	$Article_Type=~s{<([^\>]+)\>}{}gsi;

	if($Article_Type!~m{(Clinical Trial\/Experimental Study|Study Protocol Clinical Trial|Study Protocol Systematic Review|Systematic Review and Meta-Analysis|Diagnostic Accuracy Study|Quality Improvement Study|Economic Evaluation Study|Clinical Case Report|Meta-Analysis of Observ Studies in Epidemiology|Observational Study|Animal Research Studies|Automated Case Generator|Erratum|Review in Molecular Medicine|Letter to the Editor|Original Study|Proceeding Abstracts)}gsi)
	{
		
			my $Paragraph_No=$1;
			my $Style=$2;
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the article type");
		
	}
	
}

if($EM_Text=~m{<EMText>(.*?)<\/EMText>\n*<(\d+)><EMText>(.*?)<\/EMText>\n*<(\d+)><EMText>(.*?)<\/EMText>}gsi)
{

	my $Paragraph_No=$4;
	my $Style=$2;
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the style EMText. Author contribution sub paras should have \"EM_TextInd\"");

}

}

my $New_Journal=$Journal;

if($New_Journal=~m{^(JW9|MPG|MD|MD9|BS9|CD9|CP9|JR9|JD9|JP9|PN9|MC9|RD9|HM9|IA9)$}gsi)
{

my $Article_Type_Count1=$Authors_Tmp=~s{<FMNoteArticleCitation>}{<FMNoteArticleCitation>}gsi;

	if($Article_Type_Count1 gt 1)
	{
		push(@Error,"\~Para No:1 Col No:1 More then one FMNoteArticleCitation is not allowed");

	}

	my $Article_Type_Count2=$Authors_Tmp=~s{<FMNoteFunding>}{<FMNoteFunding>}gsi;

	if($Article_Type_Count2 gt 1)
	{
		push(@Error,"\~Para No:1 Col No:1 More then one FMNoteFunding is not allowed");

	}

	my $Article_Type_Count3=$Authors_Tmp=~s{<FMNoteConflict>}{<FMNoteConflict>}gsi;

	if($Article_Type_Count3 gt 1)
	{
		push(@Error,"\~Para No:1 Col No:1 More then one FMNoteConflict is not allowed");

	}

	my $Article_Type_Count4=$Authors_Tmp=~s{<FMNoteSupplementaryMaterial>}{<FMNoteSupplementaryMaterial>}gsi;

	if($Article_Type_Count4 gt 1)
	{
		push(@Error,"\~Para No:1 Col No:1 More then one FMNoteSupplementaryMaterial is not allowed");

	}

	
}


my $Abss_Jou13111=$Journal;
if($Abss_Jou13111=~m{(JHERED)}gsi)
{
	my $Subject_Tmp33=$Tmp;
	my $Subject_Tmp22=$Tmp;

	if($Subject_Tmp22=~m{<FMArticletype>(Special Issue Article|Introduction to Special Issue|Brief Communication|Symposium Article|Perspective)}gsi)
	{
	
	$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the article type. $1 article type is not allowed for JHERED.");
				
	}
}


my $Abss_Jou1311=$Journal;
if($Abss_Jou1311=~m{(JW9)}gsi)
{
	my $Subject_Tmp33=$Tmp;
	my $Subject_Tmp22=$Tmp;

	if($Subject_Tmp22=~m{<FMArticletype>Original article}gsi)
	{
	
	$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the article type. Original article type is not allowed. it should be Article");
				
	}
}

my $MD_Journal=$Journal;

if($MD_Journal=~m{^MD$}gsi)
{

my $FM_Article_Type=$Tmp;


my $EM_Text=$Tmp;



if($FM_Article_Type=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
{
	my $Article_Type=$1;
	$Article_Type=~s{<([^\>]+)\>}{}gsi;

	if($Article_Type!~m{(Clinical Trial\/Experimental Study|Systematic Review and Meta-Analysis|Observational Study|Clinical Case Report|Study Protocol Systematic Review|Study Protocol Clinical Trial|Narrative Review|Quality Improvement Study|Diagnostic Accuracy Study|Meta-Analysis of Observ Studies in Epidemiology|Economic Evaluation Study|Proceeding Abstracts|Animal Research Studies|Automated Case Generator|Erratum|Original Study|Retraction|Review in Molecular Medicine|Letter to the Editor)}gsi)
	{
		
			my $Paragraph_No=$1;
			my $Style=$2;
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the article type");
		
	}
	
}

if($EM_Text=~m{<EMText>(.*?)<\/EMText>\n*<(\d+)><EMText>(.*?)<\/EMText>\n*<(\d+)><EMText>(.*?)<\/EMText>}gsi)
{

	my $Paragraph_No=$4;
	my $Style=$2;
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the style EMText. Author contribution sub paras should have \"EM_TextInd\"");

}

}

my $MPG_Journal=$Journal;

if($MPG_Journal=~m{^MPG$}gsi)
{

my $FM_Article_Type=$Tmp;

if($FM_Article_Type=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
{
	my $Article_Type=$1;
	$Article_Type=~s{<([^\>]+)\>}{}gsi;

	if($Article_Type!~m{(Commentary|Selected Summary|Special Feature|Topic of the Month|News \& Views)}gsi)
	{
		
			my $Paragraph_No=$1;
			my $Style=$2;
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the article type");
		
	}
	
}
}

my $JP9_Journal=$Journal;

if($JP9_Journal=~m{^(JP9|JR9)$}gsi)
{

my $FM_Article_Type=$Tmp;

if($FM_Article_Type=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
{
	my $Article_Type=$1;
	$Article_Type=~s{<([^\>]+)\>}{}gsi;

	if($Article_Type!~m{(Review Article|Editorial|Article|Comment)}gsi)
	{
		
			my $Paragraph_No=$1;
			my $Style=$2;
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the article type");
		
	}
	
}
}

my $PN9_Journal=$Journal;

if($PN9_Journal=~m{^(PN9)$}gsi)
{

my $FM_Article_Type=$Tmp;

if($FM_Article_Type=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
{
	my $Article_Type=$1;
	$Article_Type=~s{<([^\>]+)\>}{}gsi;

	if($Article_Type!~m{(Editorial)}gsi)
	{
		
			my $Paragraph_No=$1;
			my $Style=$2;
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the article type");
		
	}
	
}
}

my $Abss_Jou131=$Journal;
if($Abss_Jou131=~m{(JMQ)}gsi)
{
	my $Subject_Tmp33=$Tmp;
	my $Subject_Tmp22=$Tmp;

	if($Subject_Tmp22=~m{<FMArticletype>(Original article)}gsi)
	{
	
	$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the article type. Original article type is not allowed. it should be article.");
				
	}
	
}

my $Abss_Jou1312=$Journal;
if($Abss_Jou1312=~m{(CCM)}gsi)
{
	my $Subject_Tmp33=$Tmp;
	my $Subject_Tmp22=$Tmp;

	
	
}


my $L_Journal=$Journal;

if($L_Journal=~m{^GOX$}gsi)
{

my $FM_Article_Type=$Tmp;

if($FM_Article_Type=~m{<FMArticleType>(.*?)<\/FMArticleType>}gsi)
{
	my $Article_Type=$1;
	$Article_Type=~s{<([^\>]+)\>}{}gsi;

	if($Article_Type=~m{(Original Article|Experimental|Review Article|Ideas and Innovations|Special Topic)}gsi)
	{
		if($Tmp!~m{<([^\>]+)\><Box_Title>}gsi)
		{
			my $Paragraph_No=$1;
			my $Style=$2;
			
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Take away box is must for $Article_Type Article_type");
		}

		my $Take_Away1=$Tmp;
		my $Take_Away2=$Tmp;
		my $Take_Away3=$Tmp;

		my @Take_Away;

		my $Tmp1=$Tmp;
		
		if($Tmp1=~m{<([^\>]+)\><Box([^\>]+)\>(Takeaways)}gsi)
		{
			my $Paragraph_No=$1;
			my $Style=$2;
			

		
		while($Take_Away1=~m{<Box([^\>]+)\>(Question|Findings|Meaning)(.*?)<\/Box$1>}gsi)
		{
			push(@Take_Away,"$2$3");
		}

		my $Final_Abstract=join("\n",@Take_Away);

$Final_Abstract=~s{<([^\>]+)\>}{}gsi;

my $Count=$Final_Abstract=~s{(\s)}{$1}gsi;


if($Count > 105)
{

my $FM_Abstract1=$Tmp;

if($FM_Abstract1!~m{AQ\: Please confirm your previously provided \"Takeaways\" statement based on the following prompts and headers\. Please reduce to 105 words including the headlines:}gsi)
{

	$Err="1";
push(@Error,"\~Para No:1 Col No:1 As per journal style, the take away box must not be more than 105 words. If so, the following AQ must be raised by the copyeditor");

	
}
}

		
	}
	
}
	
}


my $FM_Abstract=$Tmp;

my @Abstract;

while($FM_Abstract=~m{<(FMAbstractParaFlushLeft|FMAbstractParaInd)>(.*?)<\/FMAbstractParaFlushLeft|FMAbstractParaInd>}gsi)
{
	push(@Abstract,$2);
}

my $Final_Abstract=join("\n",@Abstract);

$Final_Abstract=~s{<([^\>]+)\>}{}gsi;

my $Count=$Final_Abstract=~s{(\s)}{$1}gsi;


if($Count > 250)
{

my $FM_Abstract1=$Tmp;

if($FM_Abstract1!~m{AQ\: Per style, the abstract length should not be over 250 words}gsi)
{

	$Err="1";
push(@Error,"\~Para No:1 Col No:1 As per journal style, the abstract must not be more than 250 words. If so, the following AQ must be raised by the copyeditor");

	
}


}

my $FM_Box_Title=$Tmp;

my $FM_Box_Title1=$Tmp;

my $FM_Box_Title2=$Tmp;

		if($FM_Box_Title=~m{<([^\>]+)\><Box([^\>]+)\>(TAKEAWAY)}gs)
		{
			my $Paragraph_No=$1;
			my $Style=$2;

			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Takeaways box title should not be in caps");

			
		}

		if($FM_Box_Title1=~m{<([^\>]+)\><Box([^\>]+)\>(Question|Findings|Meaning)(.*?)<\/Box$2>}gsi)
		{
			my $Paragraph_No=$1;
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Bold formatting is must for $2 in takeaway box content");

		}

		if($FM_Box_Title2=~m{<([^\>]+)\><Box([^\>]+)\>(Takeaway)}gsi)
		{
			my $Paragraph_No=$1;
			my $Box=$2;
			if($Box!~m{Title}gsi)
			{
			$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Takeway title should have box title style");
			}

		}



my $Keyword_Before_Tmp=$Tmp;



while($Keyword_Before_Tmp=~m{<\/FMAuthors>\n*<(\d+)><FMAffiliations>}gsi)
{
	my $FM_Keyword=$1;
	my $Paragraph_No=$2;

	

	
		$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the style FM_Affiliation style present after FM_Authors'");
	
}

my $Keyword_Before_Tmp1=$Tmp;



while($Keyword_Before_Tmp1=~m{<\/FMCorrespondence>\n*<(\d+)><FMAffiliations>}gsi)
{
	my $FM_Keyword=$1;
	my $Paragraph_No=$2;

	

	
		$Err="1";
		push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the style FM_Affiliation style present after FM_Correspondence'");
	
}

my $Correspond=$Tmp;

while($Correspond=~m{<([^\>]+)\><Tablecaption>(.*?)<\/Tablecaption>}gsi)
	{
		
		my $Con=$2;
		my $Paragraph_No=$1;

		$Con=~s{<([^\>]+)\>}{}gsi;

		
		
		my $cnum = index($Correspond, $Con) + 1;

		if($Con=~m{\.(\s?)$}gsi)
		{
		
		push(@Error,"\~Para No:$Paragraph_No Col No:$cnum  For GOX journal, the table caption line should not have an end period per style.
");
		}
	}
}


my $Brill_Jou3=$ARGV[0];
if($Brill_Jou3=~m{(Brill)}gsi)
{
	my $Abs_Tmp=$Tmp;
	while($Abs_Tmp=~m{<([^\>]+)\><(FigureSource|TableSource)>(.*?)<\/\2>}gsi)
	{
	my $Paragraph_No=$1;

	my $Content=$3;

	if($Content!~m{<sc>(.*?)<\/sc>}gsi)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 small cap is must for Figure source or table source");

	}
	}

	my $Abs_Tmp1=$Tmp;
	while($Abs_Tmp1=~m{<([^\>]+)\><(FigureNote|TableNote)>(.*?)<\/\2>}gsi)
	{
	my $Paragraph_No=$1;

	my $Content=$2;

	if($Content=~m{<sc>(.*?)<\/sc>}gsi)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 small cap is not allowed for Figure note or table note");

	}
	}
}



my $Abstract_Jou=$Journal;
my $Abstract_Jou1=$Journal;
my $Abstract_Jou2=$Journal;

my $Author_Tmp=$Tmp;
my $Authors_Tmp=$Tmp;

if($Abstract_Jou=~m{(AMJHSP)}gsi)
{
	
	if($Author_Tmp=~m{<FMArticletype>ASHP Report}gsi)
	{
if($Authors_Tmp=~m{<([^\>]+)\><FMAuthors>(.*?)<\/FMAuthors>}gsi)
{
	my $Paragraph_No=$1;

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning: FMAuthor style is not allowed for ASHP Report");

}
	}
	
}

my $Subject_Tmp=$Tmp;
if($Abstract_Jou1=~m{(AMJHSP)}gsi)
{
	
	if($Authors_Tmp=~m{<FMArticletype>Letter(s?) to the Editor}gsi)
	{
	my $Paragraph_No=$1;

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Article type should be letters not Letters to the editor");


	}
	
}

my $Subject_Tmp2=$Tmp;
if($Abstract_Jou2=~m{(JCEMET)}gsi)
{
	
	if($Authors_Tmp=~m{<FMArticletype>Invited}gsi)
	{
	my $Paragraph_No=$1;

	push(@Error,"\~Para No:$Paragraph_No Col No:1 check the article type started with invited");


	}

	my $Article_Type_Count=$Authors_Tmp=~s{<FMArticletype>}{<FMArticletype>}gsi;

	if($Article_Type_Count gt 1)
	{
		push(@Error,"\~Para No:1 Col No:1 More then one article type is not allowed in JCEMET");

	}

	my $Correspondence_Tmp=$Tmp;
	
	if($Correspondence_Tmp=~m{<([^\>]+)\><FMNoteCorrespondence><bold>}gsi)
	{	
		push(@Error,"\~Para No:$1 Col No:1 Bold format not allowed for correspondence tag in JCEMET");
	}
	
	
}


my $Subject_Tmp1=$Tmp;
my $Subject_Tmp22=$Tmp;
my $Subject_Tmp33=$Tmp;
my $Abss_Jou=$Journal;
if($Abss_Jou=~m{(ENDREV)}gsi)
{
	
	if($Subject_Tmp1=~m{<FMArticletype>Invited Review}gsi)
	{
	my $Paragraph_No=$1;

	push(@Error,"\~Para No:1 Col No:1 Invited Review or Invited Reviews should not allowed in the journal and its should be Review only.");


	}

	if($Subject_Tmp22=~m{<FMArticletype>Scientific Statement}gsi)
	{
		if($Subject_Tmp33=~m{<([^\>]+)\><FMGrapAbstract}gsi)
		{

			my $Paragraph_No=$1;
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Graphical abstract is present in the file. Please check with PM and proceed.");
		}
		
	
	}
	
}

my $Abss_Jou12=$Journal;
if($Abss_Jou12=~m{(CLEANE)}gsi)
{
	my $Subject_Tmp33=$Tmp;
	my $Subject_Tmp22=$Tmp;
	my $Reference_Tmp22=$Tmp;

	if($Subject_Tmp22=~m{<FMArticletype>(Review article|Research article|Perspective)}gsi)
	{
	
		if($Subject_Tmp33!~m{<([^\>]+)\><FMGrapAbstract}gsi)
		{

			my $Paragraph_No=$1;
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Graphical abstract is must for this article type. Please raise query");
		}

	}

	while($Reference_Tmp22=~m{<([^\>]+)\><Reference>(.*?)<\/Reference>}gsi)
	{

	my $Paragraph_No=$1;

	my $Label=$2;

	$Label=~s{<refnumber>}{<refnumber>}gsi;

	if($Label!~m{^<refnumber>\[(\d+)\]}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the reference label format. For CLEANE journal square bracker should be around the reference label");
	}
	}

}

	
	






my $Abss_Jou13=$Journal;
if($Abss_Jou13=~m{(NEUONC)}gsi)
{
	my $Subject_Tmp33=$Tmp;
	my $Subject_Tmp22=$Tmp;

	#if($Subject_Tmp22=~m{<FMArticletype>(Review article|Research article|Perspective)}gsi)
	#{
	
		if($Subject_Tmp33!~m{<([^\>]+)\><FMGrapAbstract}gsi)
		{

			#my $Paragraph_No=$1;
			#push(@Error,"\~Para No:$Paragraph_No Col No:1 Graphical abstract is must for NEOUNC Journal. Please raise query");
		}

	#}	
}



my $Abss_Jou11=$Journal;
if($Abss_Jou11=~m{(IMMADV)}gsi)
{
	
	my $Subject_Tmp22=$Tmp;

	if($Subject_Tmp22=~m{<FMArticletype>Original Article}gsi)
	{
		my $Subject_Tmp33=$Tmp;
		if($Subject_Tmp33!~m{<([^\>]+)\><FMGrapAbstract}gsi)
		{

			my $Paragraph_No=$1;
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Graphical abstract is must for Original Article. Please hold the article and raise author query");
		}
		
	
	}
	else
	{
		my $Subject_Tmp33=$Tmp;
		if($Subject_Tmp33=~m{<([^\>]+)\><FMGrapAbstract}gsi)
		{

			my $Paragraph_No=$1;
			push(@Error,"\~Para No:$Paragraph_No Col No:1 No need Graphical abstract for the article type. Please remove and proceed");
		}
	}
	
}

my $Subject_Tmp2=$Tmp;
my $Subject_Tmp3=$Tmp;
my $Subject_Tmp4=$Tmp;
my $Subject_Tmp414=$Tmp;
my $Abss_Jou1=$Journal;
if($Abss_Jou1=~m{(ENDREV|JCEMET|ENDOCR|JESOCI)}gsi)
{
	
	if($Subject_Tmp2=~m{<([^\>]+)\><FMAbstractHead>(.*?)<\/FMAbstractHead>}gsi)
	{
	my $Paragraph_No=$1;

	my $Content=$2;

	if($Content!~m{[a-z]}gs)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Abstract head should be in title case");

	}
	}

	while($Subject_Tmp4=~m{<([^\>]+)\><(HeadA|HeadB|HeadC|HeadD)>(.*?)<\/\2>}gs)
	{
	my $Paragraph_No=$1;

	my $Content=$2;

	if($Content!~m{[a-z]}gs)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Heading should be in title case");

	}
	}

	while($Subject_Tmp3=~m{<([^\>]+)\><EMReferencesHead>(.*?)<\/EMReferencesHead>}gsi)
	{
	my $Paragraph_No=$1;

	my $Content=$2;

	if($Content!~m{[a-z]}gs)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 EMReferencesHead should be in title case");

	}
	}

	while($Subject_Tmp414=~m{<([^\>]+)\><FigureNote>(.*?)<\/\2>}gs)
	{
	my $Paragraph_No=$1;

	my $Content=$2;

	

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Figure note is not allowed for $Abss_Jou1");

	
	}
	
}

my $Abss_Jou66=$Journal;
if($Abss_Jou66=~m{(GERONT)}gsi)
{
	my $Subject_Tmp2212=$Tmp;

	if($Subject_Tmp2212=~m{<FMArticletype>(book review)}gsi)
	{
		my $Subject_Tmp33=$Tmp;
		if($Subject_Tmp33=~m{<([^\>]+)\><(HeadA|HeadB|HeadC|HeadD|HeadE|HeadF)>(Conflicts of Interest|Conflict of Interest|Competing Interest|Competing Interests|Conflict of interest statement|Conflicts of interest statement|Potential conflict of interest|Funding|Financial support)<\/\2>}gsi)
		{

			
			
			
			push(@Error,"\~Para No:1 Col No:1 Book Review article should not contain conflict of intreast text");

			
		}
		
	
	}
}
my $Abss_Jou6=$Journal;
if($Abss_Jou6=~m{(OCCMED)}gsi)
{
	my $Abs_Tmp=$Tmp;
	while($Abs_Tmp=~m{<([^\>]+)\><FMAbstractParaFlushLeft>(.*?)<\/FMAbstractParaFlushLeft>}gsi)
	{
	my $Paragraph_No=$1;

	my $Content=$2;

	my $Content1=$2;

	

	if($Content=~m{<fmabstractsectionHeadrunIn>(Conclusion)([\.\:\;\-]*)<\/fmabstractsectionHeadrunIn>}gs)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Change Conclusion heading in abstract to Conclusions.");

	}
	if($Content1=~m{<fmabstractsectionHeadrunIn>(Aim)([\.\:\;\-]*)<\/fmabstractsectionHeadrunIn>}gs)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Change Aim heading in abstract to Aims.");

	}
	}

	my $Abs_Tmp1=$Tmp;
	while($Abs_Tmp=~m{<([^\>]+)\><([^\>]+)\>Competing interest(s?)}gsi)
	{
	my $Paragraph_No=$1;

	my $Content=$1;

	

	if($Content!~m{<EMHeadA>}gs)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Competing interest text should always be tagged as †EM_HeadA");

	}
	}

	my $Abs_Tmp2=$Tmp;
	while($Abs_Tmp2=~m{<([^\>]+)\><([^\>]+)\>Competing interest([\.\:\;\s]+)}gsi)
	{
	my $Paragraph_No=$1;

	my $Content=$1;

	

	
	push(@Error,"\~Para No:$Paragraph_No Col No:1 Change Competing interest to Competing interests");

	
	}

	my $Abs_Tmp3=$Tmp;
	while($Abs_Tmp3=~m{<([^\>]+)\><([^\>]+)\>Conflict of interest(s?)([\.\:\;\s]+)}gsi)
	{
	my $Paragraph_No=$1;

	my $Content=$1;

	

	
	push(@Error,"\~Para No:$Paragraph_No Col No:1 Change Conflict of interest to Competing interests");

	
	}

	my $Subject_Tmp221=$Tmp;

	if($Subject_Tmp221=~m{<FMArticletype>(Original paper|In\-depth review|Short report|Case report)}gsi)
	{
		my $Subject_Tmp33=$Tmp;
		while($Subject_Tmp33=~m{<fmauGivenName>(.*?)<\/fmauGivenName>}gsi)
		{

			
			my $Author=$1;

			my $A_Count=$Author=~s{([A-Z])}{$1}gsi;

			if($A_Count ne 1)
			{
			
			push(@Error,"\~Para No:1 Col No:1 Forename should be initialized");

			}
		}
		
	
	}

	my $Subject_Tmp2211=$Tmp;

	if($Subject_Tmp2211=~m{<FMArticletype>(For Letters|Art and occupation|Book review|Website review)}gsi)
	{
		my $Subject_Tmp33=$Tmp;
		while($Subject_Tmp33=~m{<fmauGivenName>(.*?)<\/fmauGivenName>}gsi)
		{

			
			my $Author=$1;

			my $A_Count=$Author=~s{([A-Z])}{$1}gsi;

			if($A_Count eq 1)
			{
			
			push(@Error,"\~Para No:1 Col No:1 Forename in author byline must be in full.");

			}
		}
		
	
	}

	my $Subject_Tmp2212=$Tmp;

	if($Subject_Tmp2212=~m{<FMArticletype>(book review)}gsi)
	{
		my $Subject_Tmp33=$Tmp;
		if($Subject_Tmp33=~m{<RatingText>\((Not recommended|Reference only|Buy and keep|Essential)\)<\/RatingText>}gsi)
		{

			
			
			
			push(@Error,"\~Para No:1 Col No:1 Book Review article should contain rating text. \(Not recommended, Reference only, Buy and keep, Essential\)");

			
		}
		
	
	}
}


my $Abss_Jou2=$Journal;
if($Abss_Jou2=~m{(AJHYPE)}gsi)
{
	my $Abs_Tmp=$Tmp;
	while($Abs_Tmp=~m{<([^\>]+)\><FMAbstractParaFlushLeft>(.*?)<\/FMAbstractParaFlushLeft>}gsi)
	{
	my $Paragraph_No=$1;

	my $Content=$2;

	if($Content=~m{\:(\s?)<\/fmabstractsectionHeadrunIn>}gs)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 Colon is not allowed in the end of the abstract section head");

	}
	}
}

my $Abss_Jou3=$Journal;
if($Abss_Jou3=~m{(BEHECO)}gsi)
{
	my $Abs_Tmp=$Tmp;
	while($Abs_Tmp=~m{<([^\>]+)\><FigureCaption>(.*?)<\/FigureCaption>}gsi)
	{
	my $Paragraph_No=$1;

	my $Content=$2;

	if($Content=~m{\.(\s?)<\/figurenumber>}gsi)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 end period is not allowed in the end of the figure number");

	}
	}

	my $Abs_Tmp1=$Tmp;
	while($Abs_Tmp1=~m{<([^\>]+)\><TableCaption>(.*?)<\/TableCaption>}gsi)
	{
	my $Paragraph_No=$1;

	my $Content=$2;

	if($Content=~m{\.(\s?)<\/tablenumber>}gsi)
	{

	push(@Error,"\~Para No:$Paragraph_No Col No:1 end period is not allowed in the end of the table number");

	}
	}
}




$Bib_Xref_Tmp=~s{\–}{\&ndash;}gsi;
$Bib_Xref_Tmp=~s{\-}{\&ndash;}gsi;



my $Bib_Xref_Tmp1=$Bib_Xref_Tmp;



if($Bib_Xref_Tmp1=~m{<refnumber>(\[?)(\d+)([^\>]*)\<\/refnumber>}gsi)
{

$Bib_Xref_Tmp=~s{<bibxref>(\w+)\]<\/bibxref>}{<bibxref>$1<\/bibxref>\]}gsi;

$Bib_Xref_Tmp=~s{\](\s*)<\/bibxref>}{<\/bibxref>\]$1}gsi;

$Bib_Xref_Tmp=~s{\](\s*)<\/onlinebibxref>}{<\/onlinebibxref>\]$1}gsi;

$Bib_Xref_Tmp=~s{\)(\s*)<\/bibxref>}{<\/bibxref>\)$1}gsi;

$Bib_Xref_Tmp=~s{\)(\s*)<\/onlinebibxref>}{<\/onlinebibxref>\)$1}gsi;

$Bib_Xref_Tmp=~s{<bibxref>\(}{\(<bibxref>}gsi;

$Bib_Xref_Tmp=~s{<bibxref>\[}{\[<bibxref>}gsi;

$Bib_Xref_Tmp=~s{<onlinebibxref>\(}{\(<onlinebibxref>}gsi;

$Bib_Xref_Tmp=~s{<onlinebibxref>\[}{\[<onlinebibxref>}gsi;


$Bib_Xref_Tmp=~s{<bibxref>\[(\w+)<\/bibxref>}{\[<bibxref>$1<\/bibxref>}gsi;

$Bib_Xref_Tmp=~s{<bibxref>(\w+)\)<\/bibxref>}{<bibxref>$1<\/bibxref>\)}gsi;

$Bib_Xref_Tmp=~s{<bibxref>\((\w+)<\/bibxref>}{\(<bibxref>$1<\/bibxref>}gsi;	

$Bib_Xref_Tmp=~s{<bibxref><bold>(.*?)<\/bold><\/bibxref>}{<bold><bibxref>$1<\/bibxref><\/bold>}gsi;

	
$Bib_Xref_Tmp=~s{<bibxref>(.*?)<\/bibxref>}{&Bib_xref($1)}gesi;

$Bib_Xref_Tmp=~s{<onlinebibxref>(.*?)<\/onlinebibxref>}{&Bib_xref($1)}gesi;




my $Bib_Xref_Tmp2=$Bib_Xref_Tmp;




while($Bib_Xref_Tmp2=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;

	my $Content=$3;

	$Content=~s{\&(\w+);}{\.}gsi;
	
	$Content=~s{<bibxref>(.*?)<\/bibxref>}{\[tag1\]$1\[\/tag1]}gsi;

	$Content=~s{<onlinebibxref>(.*?)<\/onlinebibxref>}{\[tag1\]$1\[\/tag1]}gsi;
	
	
	$Content=~s{<([^\>]+)\>}{}gsi;

	

	
	$Content=~s{\[tag1\](.*?)\[\/tag1]}{<1>$1<\/1>}gsi;

	

	while($Content=~m{<1>(.*?)<\/1>}gsi)
	{
		my $cnum = index($Content, "$1") + 1;

		
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum check the bibxref style pattern");
	}
}

}

$Fig_Xref_Tmp=~s{\–}{\&ndash;}gsi;

$Fig_Xref_Tmp=~s{<figxref>(.*?)<\/figxref>}{&OUP_Figxref($1)}gesi;

	
	
	$Fig_Xref_Tmp=~s{<figxref>(.*?)<\/figxref>}{&OUP_Figxref1($1)}gesi;

	$Fig_Xref_Tmp=~s{<figxref>(.*?)<\/figxref>}{&OUP_Figxref2($1)}gesi;

	$Fig_Xref_Tmp=~s{<figxref>(.*?)<\/figxref>}{&OUP_Figxref3($1)}gesi;

	$Fig_Xref_Tmp=~s{<figxref>and }{and <figxref>}gsi;

	$Fig_Xref_Tmp=~s{<tabxref>(.*?)<\/tabxref>}{&OUP_Tabxref($1)}gesi;

	
	
	$Fig_Xref_Tmp=~s{<tabxref>(.*?)<\/tabxref>}{&OUP_Tabxref1($1)}gesi;

	$Fig_Xref_Tmp=~s{<tabxref>(.*?)<\/tabxref>}{&OUP_Tabxref2($1)}gesi;

	$Fig_Xref_Tmp=~s{<tabxref>and }{and <tabxref>}gsi;




$Fig_Xref_Tmp=~s{<figxref> }{ <figxref>}gsi;

$Fig_Xref_Tmp=~s{ <\/figxref>}{<\/figxref> }gsi;

$Fig_Xref_Tmp=~s{<figxref\/>}{}gsi;

$Fig_Xref_Tmp=~s{<\/FigXref>}{}gsi;

$Fig_Xref_Tmp=~s{\&\#xA0;}{ }gsi;

$Fig_Xref_Tmp=~s{\&\#x00A0;}{ }gsi;



$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figure(s?) (\d+)(\w?)(\(?)(\w?)(\.?)(\w?)(\)?))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Image(s?) (\d+)(\w?)(\(?)(\w?)(\.?)(\w?)(\)?))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"I$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Image(s?) (\d+)(\w?)(\(?)(\w?)(\.?)(\w?)(\)?))}{$1<xref ref-type=\"fig\" rid=\"I$4\">$2<\/xref>}gsi;



$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig(s) (\d))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig(s) (\d\d))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig(s?) (\d))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig(s?) (\d\d))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;





$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig(s?) (\d+)([a-z]?)(\(?)(\w?)(\.?)(\w+)(\)?))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig\.(s?) (\d+)(\)?))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig\.(s?) (\d+)([a-z]?)(\(?)(\w?)(\.?)(\w+)(\)?))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig\.(s?) \((\d+)\))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;



$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figs\.(s?) (\d+)([a-z]?)(\(?)(\w?)(\.?)(\w+)(\)?))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>((\(?)(\d+)(\w?)(\)?))<\/figxref>}{<xref ref-type=\"fig\" rid=\"F$3\">$1<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>((\[?)(\d+)(\w?)(\]?))<\/figxref>}{<xref ref-type=\"fig\" rid=\"F$3\">$1<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(ex(s?)(\.?)(\d+)(\w?))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"E$5$6\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(exx(s?)(\.?)(\d+)(\w?))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"E$5\">$2<\/xref>}gsi;



$Fig_Xref_Tmp=~s{<figxref>(\(?)(example(s?) (\.?)(\d+)(\w?))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"E$5$6\">$2<\/xref>}gsi;





$Fig_Xref_Tmp=~s{<figxref>(\(?)(illus(s?)(\.?)(\d+)(\w?))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"F$5\">$2<\/xref>}gsi;



$Fig_Xref_Tmp=~s{<figxref>(\(?)(Illustration(s?) (\.?)(\d+)(\w?))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"F$5\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{rid=\"I(\d+)\">(Image(s?) (\d+))<\/xref>(\s?)(et)(\s?)<xref ref\-type=\"fig\" rid=\"F}{rid=\"I$1\">$2<\/xref>$5$6$7<xref ref\-type=\"fig\" rid=\"I}gsi;

$Fig_Xref_Tmp=~s{rid=\"I(\d+)\">(Image(s?) (\d+))<\/xref>(\s?)(and)(\s?)<xref ref\-type=\"fig\" rid=\"F}{rid=\"I$1\">$2<\/xref>$5$6$7<xref ref\-type=\"fig\" rid=\"I}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figure(s?) (\d+)(\(?)<italic>(\w?)<\/italic>(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(<bold>Figure(s?) (\d+)(\(?)<italic>(\w?)<\/italic>(\)?)<\/bold>)}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figure(s?) (\d+)(\(?)<bold>(\w?)<bold>(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figure(s?) (\d+)(\(?)(\w?)(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(<bold>Figure(s?) (\d+)(\(?)(\w?)(\)?)<\/bold>)}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(<bold>Figure(s?) (\d+)(\(?)(\w?)(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figure(s?) (\d+)(\w?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(<bold>Figure(s?) (\d+)(\w?)<\/bold>)}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figuur(s?) (\d+)(\(?)(\w?)(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figura(s?) (\d+)(\(?)(\w?)(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;


$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig(s?) (\d+)(\(?)<italic>(\w?)<\/italic>(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figure(s?) (\d+)(\(?)<italic>(\w?)<\/italic>(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(<bold>Fig(s?) (\d+)(\(?)<italic>(\w?)<\/italic>(\)?)<\/bold>)}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig(s?) (\d+)(\(?)<bold>(\w?)<\/bold>(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(<bold>Fig(s?) (\d+)(\(?)(\w?)(\)?)<\/bold>)}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(<bold>Fig(s?) (\d+)(\(?)(\w?)(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig(s?) (\d+)(\(?)(\w?)(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig(s?) (\d+)(\w?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig\.(s?) (\d+)(\(?)<italic>(\w?)<\/italic>(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(<bold>Fig\.(s?) (\d+)(\(?)<italic>(\w?)<\/italic>(\)?)<\/bold>)}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig\.(s?) (\d+)(\(?)<italic>(\w?)<\/italic>(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig\.(s?) (\d+)(\(?)<bold>(\w?)<\/bold>(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig\.(s?) (\d+)(\(?)(\w?)(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(<bold>Fig\.(s?) (\d+)(\(?)(\w?)(\)?)<\/bold>)}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(<bold>Fig\.(s?) (\d+)(\(?)(\w?)(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig\.(\s?)(\d+)(\w?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figs\.(s?) (\d+)(\(?)<italic>(\w?)<\/italic>(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(<bold>Figs\.(s?) (\d+)(\(?)<italic>(\w?)<\/italic>(\)?)<\/bold>)}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figs\.(s?) (\d+)(\(?)<bold>(\w?)<\/bold>(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figs\.(s?) (\d+)(\(?)(\w?)(\)?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(<italic>Figs\.(s?) (\d+)(\(?)(\w?)(\)?)<\/italic>)}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;	
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figs\.(\s?)(\d+)(\w?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;


$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figure(s?) (\w+)(\d))}{$1<xref ref-type=\"fig\" rid=\"F$4$5\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig(s?) (\w+)(\d))}{$1<xref ref-type=\"fig\" rid=\"F$4$5\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Fig\.(\s?)(\w+)(\d))}{$1<xref ref-type=\"fig\" rid=\"F$4$5\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Figs\.(\s?)(\w+)(\d))}{$1<xref ref-type=\"fig\" rid=\"F$4$5\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(scheme (\d+))}{$1<xref ref-type=\"fig\" rid=\"SCH$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(schematic (\d+))}{$1<xref ref-type=\"fig\" rid=\"SCH$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(plate (\d+))}{$1<xref ref-type=\"fig\" rid=\"PLA$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(plates (\d+))}{$1<xref ref-type=\"fig\" rid=\"PLA$3\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(scheme(s?) (\d+))}{$1<xref ref-type=\"fig\" rid=\"SCH$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Picture (\d+))}{$1<xref ref-type=\"fig\" rid=\"PIC$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Diagram (\d+))}{$1<xref ref-type=\"fig\" rid=\"D$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Photo (\d+))}{$1<xref ref-type=\"fig\" rid=\"PHO$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Photos (\d+))}{$1<xref ref-type=\"fig\" rid=\"PHO$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Graph(s?) (\d+))}{$1<xref ref-type=\"fig\" rid=\"G$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(<bold>scheme (\d+)<\/bold>)}{$1<xref ref-type=\"fig\" rid=\"SCH$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(video (\d+))}{$1<xref ref-type=\"fig\" rid=\"V$3\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Chart (\d+))}{$1<xref ref-type=\"fig\" rid=\"CH$3\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Charts (\d+))}{$1<xref ref-type=\"fig\" rid=\"CH$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(imagen (\d+))}{$1<xref ref-type=\"fig\" rid=\"F$3\">$2<\/xref>}gsi;



$Fig_Xref_Tmp=~s{<figxref>(\(?)(video\, supplemental Digital Content (\d+))}{$1<xref ref-type=\"fig\" rid=\"V$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)<bold>(video\, supplemental Digital Content (\d+))<\/bold>}{$1<xref ref-type=\"fig\" rid=\"V$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(<bold>video (\d+)<\/bold>)}{$1<xref ref-type=\"fig\" rid=\"V$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(<bold>video (\d+)<\/bold>)}{$1<xref ref-type=\"fig\" rid=\"V$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<p([^\>]*)\><figxref>(\(?)(Figure(s?) (\d+)(\w?))}{<p>$2<xref ref-type=\"fig\" rid=\"F$5\">$3<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<p([^\>]*)\><figxref>(\(?)(Fig(s?) (\d+)(\w?))}{<p>$2<xref ref-type=\"fig\" rid=\"F$5\">$3<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<p([^\>]*)\><figxref>(\(?)(Fig\.(\s?)(\d+)(\w?))}{<p>$2<xref ref-type=\"fig\" rid=\"F$5\">$3<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<p([^\>]*)\><figxref>(\(?)(scheme (\d+))}{<p>$2<xref ref-type=\"fig\" rid=\"SCH$4\">$3<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<p([^\>]*)\><figxref>(\(?)(video (\d+))}{<p>$2<xref ref-type=\"fig\" rid=\"V$4\">$3<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(illus(s?) (\d+)(\w?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(ex(s?) (\d+)(\w?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(illus\.(\s?)(\d+)(\w?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(ex\.(\s?)(\d+)(\w?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(exx\.(\s?)(\d+)(\w?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(example\.(\s?)(\d+)(\w?))}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(scheme (\d+))}{$1<xref ref-type=\"fig\" rid=\"SCH$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(video (\d+))}{$1<xref ref-type=\"fig\" rid=\"V$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<p([^\>]*)\><figxref>(\(?)(Figure(s?) (\d+)(\w?))}{<p>$2<xref ref-type=\"fig\" rid=\"F$5\">$3<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<p([^\>]*)\><figxref>(\(?)(Fig(s?) (\d+)(\w?))}{<p>$2<xref ref-type=\"fig\" rid=\"F$5\">$3<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<p([^\>]*)\><figxref>(\(?)(Fig(s?)\. (\d+)(\w?))}{<p>$2<xref ref-type=\"fig\" rid=\"F$5\">$3<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<p([^\>]*)\><figxref>(\(?)(Fig\.(\s?)(\d+)(\w?))}{<p>$2<xref ref-type=\"fig\" rid=\"F$5\">$3<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<p([^\>]*)\><figxref>(\(?)(scheme (\d+))}{<p>$2<xref ref-type=\"fig\" rid=\"SCH$4\">$3<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<p([^\>]*)\><figxref>(\(?)(video (\d+))}{<p>$2<xref ref-type=\"fig\" rid=\"V$4\">$3<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Exhibit(s?) (\d+)(\w?)(\(?)(\w?)(\.?)(\w+)(\)?))<\/figxref>}{$1<xref ref-type=\"fig\" rid=\"F$4\">$2<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<figxref>(\(?)(Map (\d+))}{$1<xref ref-type=\"fig\" rid=\"MAP$3\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<figxref>(\(?)(Map(s?) (\d+))}{$1<xref ref-type=\"fig\" rid=\"MAP$4\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<Figxref>(\(?)(Chart(s?) ([A-Z])(\d+))}{$1<xref ref-type=\"fig\" rid=\"F$4$5\">$2<\/xref>}gsi;
$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\-([A-z]+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\-<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>$4}gsi;


	
	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash;(\d+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash;<xref ref-type=\"fig\" rid=\"F$3\">$3<\/xref>$4}gsi;

	$Fig_Xref_Tmp=~s{<figxref>(\d+)(\w+)\&ndash;<figxref>([A-Z]+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$1$2\&ndash;$3<\/xref>$5}gsi;

	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\&ndash;)<Figxref>([A-Z])([\;\,\.\)\s]+)<Figxref>(\w+)\&ndash;<Figxref>([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3<xref ref-type=\"fig\" rid=\"F$1\">$4<\/xref>$5<xref ref\-type=\"fig\" rid=\"F$1\">$6</xref>\&ndash;<xref ref\-type=\"fig\" rid=\"F$1\">$7<\/xref>$8}gsi;
	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash;([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2\&ndash;$3<\/xref>$4}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\,?)(\s?)(\,?)([A-Z])\&ndash;([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6\&ndash;$7<\/xref>$8}gsi;


	
	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\,?)(\s?)(\,?)<Figxref>([A-Z])\&ndash;<Figxref>([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6\&ndash;$7<\/xref>$8}gsi;


	
	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(and)(\s?)<Figxref>([A-Z])\&ndash;<Figxref>([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6\&ndash;$7<\/xref>$8}gsi;

	
	
	$Fig_Xref_Tmp=~s{<Figxref>(\d+)([A-Z])\&ndash\;([A-Z])}{<xref ref-type=\"fig\" rid=\"F$1\">$1$2\&ndash;$3<\/xref>}gsi;

	$Fig_Xref_Tmp=~s{<Figxref>(\d+)([A-Z])\&ndash\;<Figxref>([A-Z])}{<xref ref-type=\"fig\" rid=\"F$1\">$1$2\&ndash;$3<\/xref>}gsi;

	
	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(and)(\s?)<Figxref>([A-Z])\&ndash;<Figxref>([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6\&ndash;$7<\/xref>$8}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>(\s?)(\,)(\s?)<figxref>(\w)([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking1($1,$7)."$8"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>(\s?)(\,)(\s?)<figxref>(\w)([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking1($1,$7)."$8"}gesi;



$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>(\s?)(\,)(\s?)<figxref>(\w)([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking1($1,$7)."$8"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,)(\s?)<figxref>(\w)([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking1($1,$7)."$8"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,)(\s?)<figxref>(\w)([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking1($1,$7)."$8"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,)(\s?)<figxref>(\w)([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking1($1,$7)."$8"}gesi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,)(\s?)<figxref>\[\[italic\]\](\w)\[\[\/italic\]\]([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking4($1,$7)."$8"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,)(\s?)<figxref>\[\[italic\]\](\w)\[\[\/italic\]\]([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking4($1,$7)."$8"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,)(\s?)<figxref>\[\[italic\]\](\w)\[\[\/italic\]\]([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking4($1,$7)."$8"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,)(\s?)<figxref>\[\[italic\]\](\w)\[\[\/italic\]\]([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking4($1,$7)."$8"}gesi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref> and <figxref>(\d+)(\,)}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref> and <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;



$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref> and <figxref>([A-Z])(\d+)\(([a-z])\)}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref> and <xref ref-type=\"fig\" rid=\"F$4$5\">$4$5<\/xref>\($6\)}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>, and <figxref>(\d+)(\,)}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>, and <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>, and <figxref>(\d+)\[\[bold\]\](\,)}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>, and <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>\[\[bold\]\]$5}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref> and <figxref>(\d+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref> and <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref> en <figxref>(\d+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref> en <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref> and <figxref>(\d+)\[\[bold\]\]([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref> and <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>, and <figxref>(\d+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref> and <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>, and <figxref>(\d+)\[\[bold\]\]([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref> and <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;



$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>([A-z])([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking1($1,$8)."$9"}gesi;


$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>\[\[italic\]\]([A-z])\[\[\/italic\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking4($1,$8)."$9"}gesi;


$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>\[\[italic\]\]([A-z])\[\[\/italic\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking4($1,$8)."$9"}gesi;


$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>\[\[italic\]\]([A-z])\[\[\/italic\]\]\[\[\/bold\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking4($1,$8)."<\/bold>$9"}gesi;



$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>(\d+)([A-z])([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking2($8,$9)."$10"}gesi;





$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>(\d+)\[\[italic\]\]([A-z])\[\[\/italic\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking3($8,$9)."$10"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\&ndash;)<Figxref>([A-Z])([\;\,\.\)\s]+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3<xref ref-type=\"fig\" rid=\"F$1\">$4<\/xref>$5}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\&ndash;)<Figxref>(\d+)([\;\,\.\)\s]+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3<xref ref-type=\"fig\" rid=\"F$4\">$5<\/xref>$5}gsi;


#$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(\&amp;) <figxref>(\d+)([A-z])([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking2($8,$9)."$10"}gesi;


#$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(\&amp;) <figxref>([A-z])(\d+)([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking2($8,$9)."$10"}gesi;




#$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>([A-z])(\d+)([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking2($8,$9)."$10"}gesi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F([A-Z])(\d+)\">([^\<]+)<\/xref>(\s?)(and)(\s?)<figxref>([A-z])(\d+)([\;\,\.\)\s]+)}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6<xref ref-type=\"fig\" rid=\"F$7$8\">$7$8<\/xref>$9}gsi;



#$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\w+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>([A-z])(\d+)([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking2($8,$9)."$10"}gesi;





#$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(\&amp;) <figxref>(\d+)\[\[italic\]\]([A-z])\[\[\/italic\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking2($8,$9)."$10"}gesi;




$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref> and <figxref>(\d+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref> and <xref ref-type=\"fig\" rid=\"F$3\">$3<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"CH(\d+)\">([^\<]+)\<\/xref> and <figxref>(\d+)}{<xref ref-type=\"fig\" rid=\"CH$1\">$2<\/xref> and <xref ref-type=\"fig\" rid=\"CH$3\">$3<\/xref>}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref> and <figxref><sup>(\d+)<\/sup>}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref> and <xref ref-type=\"fig\" rid=\"F$3\">$3<\/xref>}gsi;



$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash\;<figxref>(\d+)(\,)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$3\">$3<\/xref>$4}gsi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)through(\s?)<figxref>(\d+)(\,)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3through$4<xref ref-type=\"fig\" rid=\"F$5\">$5<\/xref>$6}gsi;



$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>\&ndash\;<figxref>(\d+)([A-z])([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>\&ndash\;".&Figure_Linking2($4,$5)."$6"}gesi;



$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash\;<figxref>(\d+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$3\">$3<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)through(\s?)<figxref>(\d+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3through$4<xref ref-type=\"fig\" rid=\"F$5\">$5<\/xref>$6}gsi;



$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash\;<figxref>([A-z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>$4}gsi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash\;<FigXref>([A-z])([\;\,\.\)\;\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>$4}gsi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash\;<figxref>([A-z])([\;\,\.\)\;\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>$4}gsi;




$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)<figxref>(\d+)([A-z])([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking2($7,$8)."$9"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)<figxref>(\d+)([A-z])([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking2($7,$8)."$9"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)<figxref>(\d+)([A-z])([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking2($7,$8)."$9"}gesi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,)(\s?)<figxref>(\d+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$6\">$6<\/xref>}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\w+)(\d+)\">([^\<]+)\<\/xref>\((\w)\) and <figxref>([A-Z])(\d+)\((\w+)\)}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>\($4\) and <xref ref-type=\"fig\" rid=\"F$5$6\">$5$6<\/xref>\($7\)}gsi;




$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)(and) <figxref>\[\[italic\]\]([A-z])\[\[\/italic\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking4($1,$8)."$9"}gesi;


$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>\[\[italic\]\]([A-z])\[\[\/italic\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking4($1,$8)."$9"}gesi;



$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>\[\[italic\]\]([A-z])\[\[\/italic\]\]\[\[\/bold\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking4($1,$8)."<\/bold>$9"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)<figxref>([A-z]+)([\;\,\.\:\)\]\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>$7}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)<figxref>([A-z]+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)<figxref>([A-z]+)([\;\,\.\:\)\]\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>$7}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)<figxref>([A-z]+)([\;\,\.\:\)\]\s\<])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>$7}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(and)(\s?)<figxref>([A-z]+)([\;\,\.\:\)\]\s\<])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>$7}gsi;


	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)<figxref>([A-z]+)([\;\,\.\)\:\]\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>$7}gsi;


	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(to)(\s?)<figxref>([A-z]+)([\;\,\.\)\:\]\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>$7}gsi;

	
	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)<figxref>([A-z]+)\&ndash;([A-z]+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$1\">$7<\/xref>}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)<figxref>([A-z]+)\&ndash;<figxref>([A-z]+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$1\">$7<\/xref>}gsi;

	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)<figxref>([A-z]+)\&ndash;<figxref>([A-z]+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$1\">$7<\/xref>}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash;<figxref>([A-z]+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash;<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash;<figxref>([A-z]+)\&}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash;<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>\&}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)<figxref>([A-z]+)(\))}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>$7}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)<figxref>\(([A-z]+)(\))}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">\($6\)<\/xref>}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(and)(\s?)<figxref>\(([A-z]+)(\))}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">\($6\)<\/xref>}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(and)(\s?)<figxref>([A-z]+)(\:)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>$7}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)<figxref>([A-z]+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)<figxref>([A-z]+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&prime;\&prime;\&prime;(\s?)(\,?)(\s?)<figxref>([A-z]+)\&prime;\&prime;\&prime;}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&prime;\&prime;\&prime;$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>\&prime;\&prime;\&prime;}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&\#x02BA\;(\s?)(\,?)(\s?)<figxref>([A-z]+)\&prime;}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&\#x02BA\;$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>\&prime;}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&prime;(\s?)(\,?)(\s?)<figxref>([A-z]+)\&prime;}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&prime;$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>\&prime;}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&prime;(\s?)(and)(\s?)<figxref>([A-z]+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&prime;$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>}gsi;

	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)<figxref>([A-z]+)\&prime;}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>\&prime;}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&prime;\&prime;\&prime;(\s?)(\,?)(\s?)<figxref>([A-z]+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&prime;\&prime;\&prime;$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>&ndash;<FigXref>([A-z]+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>&ndash;$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&prime;(\s?)(\,?)(\s?)<figxref>([A-z]+)\&prime;}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&prime;$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>\&prime;}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&prime;(\s?)(\,?)(\s?)<figxref>([A-z]+)\&prime;}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&prime;$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>\&prime;}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&prime;(\s?)(\;?)(\s?)<figxref>([A-z]+)\&prime;}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&prime;$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6<\/xref>\&prime;}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&prime;(\s?)(\;?)(\s?)<figxref>(\d+)([A-z]+)\&prime;}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&prime;$3$4$5<xref ref-type=\"fig\" rid=\"F$6\">$6$7<\/xref>\&prime;}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&prime;\&ndash;<figxref>([A-z]+)\&prime;}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&prime;\&ndash;<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>\&prime;}gsi;
	
$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(and)(\s?)<Figxref>([A-Z])\&ndash;<Figxref>([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6\&ndash;$7<\/xref>$8}gsi;
	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash;<figxref>([A-z]+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash;<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>}gsi;
	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F([^\"]+)\">([^\<]+)\<\/xref>((\s?)<figxref>&ndash;(\s?))<xref ref-type=\"fig\" rid=\"F([^\"]+)\">([^\<]+)\<\/xref>}{&Fig_Ndash($1,$2,$6,$7,$3)}gesi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F([^\"]+)\">([^\<]+)\<\/xref>((\s?)\-(\s?))<xref ref-type=\"fig\" rid=\"F([^\"]+)\">([^\<]+)\<\/xref>}{&Fig_Ndash($1,$2,$6,$7,$3)}gesi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F([^\"]+)\">([^\<]+)\<\/xref>((\s?)&ndash;(\s?))<xref ref-type=\"fig\" rid=\"F([^\"]+)\">([^\<]+)\<\/xref>}{&Fig_Ndash($1,$2,$6,$7,$3)}gesi;

	
	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref> \&amp; <figxref>([A-z])([\;\,\.\)\;\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>$4}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref> \&amp; <figxref>([A-z])(\d+)([\;\,\.\)\;\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$1\">$3$4<\/xref>$5}gsi;


	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\-([A-z]+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\-<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>$4}gsi;

	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\-<figxref>([A-z]+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\-<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>$4}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\-<figxref>([A-z]+)(\&prime\;)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\-<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>$4}gsi;


	
	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash;(\d+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash;<xref ref-type=\"fig\" rid=\"F$3\">$3<\/xref>$4}gsi;

	$Fig_Xref_Tmp=~s{<figxref>(\d+)(\w+)\&ndash;<figxref>([A-Z]+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$1$2\&ndash;$3<\/xref>$5}gsi;

	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\&ndash;)<Figxref>([A-Z])([\;\,\.\)\s]+)<Figxref>(\w+)\&ndash;<Figxref>([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3<xref ref-type=\"fig\" rid=\"F$1\">$4<\/xref>$5<xref ref\-type=\"fig\" rid=\"F$1\">$6</xref>\&ndash;<xref ref\-type=\"fig\" rid=\"F$1\">$7<\/xref>$8}gsi;
	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash;([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2\&ndash;$3<\/xref>$4}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\,?)(\s?)(\,?)([A-Z])\&ndash;([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6\&ndash;$7<\/xref>$8}gsi;


	
	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\,?)(\s?)(\,?)<Figxref>([A-Z])\&ndash;<Figxref>([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6\&ndash;$7<\/xref>$8}gsi;


	
	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(and)(\s?)<Figxref>([A-Z])\&ndash;<Figxref>([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6\&ndash;$7<\/xref>$8}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,)(\s?)<Figxref>([A-Z]) and <Figxref>([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6 and $7<\/xref>$8}gsi;

	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\,?)(\s?)(and)(\s?)<Figxref>([A-Z])\&ndash;<Figxref>([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5$6<xref ref-type=\"fig\" rid=\"F$1\">$7&ndash;$8<\/xref>$9}gsi;

	
	
	
	$Fig_Xref_Tmp=~s{<Figxref>(\d+)([A-Z])\&ndash\;([A-Z])}{<xref ref-type=\"fig\" rid=\"F$1\">$1$2\&ndash;$3<\/xref>}gsi;

	$Fig_Xref_Tmp=~s{<Figxref>(\d+)([A-Z])\&ndash\;<Figxref>([A-Z])}{<xref ref-type=\"fig\" rid=\"F$1\">$1$2\&ndash;$3<\/xref>}gsi;

	
	
	$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(and)(\s?)<Figxref>([A-Z])\&ndash;<Figxref>([A-Z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$1\">$6\&ndash;$7<\/xref>$8}gsi;

	
$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>(\s?)(\,)(\s?)<figxref>(\w)([\;\,\.\)\,\s])}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6<xref ref-type=\"fig\" rid=\"F$1\">$7</xref>$8}gsi;






$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>(\s?)(\,)(\s?)<figxref>(\w)([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking1($1,$7)."$8"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>(\s?)(\,)(\s?)<figxref>(\w)([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking1($1,$7)."$8"}gesi;



$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>(\s?)(\,)(\s?)<figxref>(\w)([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking1($1,$7)."$8"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,)(\s?)<figxref>(\w)([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking1($1,$7)."$8"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,)(\s?)<figxref>(\w)([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking1($1,$7)."$8"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,)(\s?)<figxref>(\w)([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking1($1,$7)."$8"}gesi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,)(\s?)<figxref>\[\[italic\]\](\w)\[\[\/italic\]\]([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking4($1,$7)."$8"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,)(\s?)<figxref>\[\[italic\]\](\w)\[\[\/italic\]\]([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking4($1,$7)."$8"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,)(\s?)<figxref>\[\[italic\]\](\w)\[\[\/italic\]\]([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking4($1,$7)."$8"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,)(\s?)<figxref>\[\[italic\]\](\w)\[\[\/italic\]\]([\;\,\.\) ])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking4($1,$7)."$8"}gesi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref> and <figxref>(\d+)(\,)}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref> and <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>\[\[\/bold\]\] and \[\[bold\]\]<figxref>(\d+)(\[)}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>\[\[\/bold\]\] and \[\[bold\]\]<xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;



$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref> and <figxref>([A-Z])(\d+)\(([a-z])\)}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref> and <xref ref-type=\"fig\" rid=\"F$4$5\">$4$5<\/xref>\($6\)}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>, and <figxref>(\d+)(\,)}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>, and <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>, and <figxref>(\d+)\[\[bold\]\](\,)}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>, and <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>\[\[bold\]\]$5}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref> and <figxref>(\d+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref> and <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;



$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"V(\d+)(\w?)\">([^\<]+)\<\/xref> and <figxref>(\d+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"V$1$2\">$3<\/xref> and <xref ref-type=\"fig\" rid=\"V$4\">$4<\/xref>$5}gsi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"V(\d+)(\w?)\">([^\<]+)\<\/xref> and (\d+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"V$1$2\">$3<\/xref> and <xref ref-type=\"fig\" rid=\"V$4\">$4<\/xref>$5}gsi;



$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref> en <figxref>(\d+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref> en <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref> and <figxref>(\d+)\[\[bold\]\]([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref> and <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>, and <figxref>(\d+)([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref> and <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>, and <figxref>(\d+)\[\[bold\]\]([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref> and <xref ref-type=\"fig\" rid=\"F$4\">$4<\/xref>$5}gsi;



$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>([A-z])([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking1($1,$8)."$9"}gesi;


$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>\[\[italic\]\]([A-z])\[\[\/italic\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking4($1,$8)."$9"}gesi;


$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>\[\[italic\]\]([A-z])\[\[\/italic\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking4($1,$8)."$9"}gesi;


$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>\[\[italic\]\]([A-z])\[\[\/italic\]\]\[\[\/bold\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking4($1,$8)."<\/bold>$9"}gesi;



$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>(\d+)([A-z])([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking2($8,$9)."$10"}gesi;





$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>(\d+)\[\[italic\]\]([A-z])\[\[\/italic\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking3($8,$9)."$10"}gesi;




$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\&ndash;)<Figxref>([A-Z])([\;\,\.\)\s]+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3<xref ref-type=\"fig\" rid=\"F$1\">$4<\/xref>$5}gsi;



#$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(\&amp;) <figxref>(\d+)([A-z])([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking2($8,$9)."$10"}gesi;


#$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(\&amp;) <figxref>([A-z])(\d+)([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking2($8,$9)."$10"}gesi;




#$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>([A-z])(\d+)([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking2($8,$9)."$10"}gesi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F([A-Z])(\d+)\">([^\<]+)<\/xref>(\s?)(and)(\s?)<figxref>([A-z])(\d+)([\;\,\.\)\s]+)}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6<xref ref-type=\"fig\" rid=\"F$7$8\">$7$8<\/xref>$9}gsi;



#$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\w+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>([A-z])(\d+)([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking2($8,$9)."$10"}gesi;





#$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(\&amp;) <figxref>(\d+)\[\[italic\]\]([A-z])\[\[\/italic\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking2($8,$9)."$10"}gesi;

		
$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref> and <figxref>(\d+)([A-Z])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref> and <xref ref-type=\"fig\" rid=\"F$3\">$3$4<\/xref>}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref> and <figxref>(\d+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref> and <xref ref-type=\"fig\" rid=\"F$3\">$3<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"CH(\d+)\">([^\<]+)\<\/xref> and <figxref>(\d+)}{<xref ref-type=\"fig\" rid=\"CH$1\">$2<\/xref> and <xref ref-type=\"fig\" rid=\"CH$3\">$3<\/xref>}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref> and <figxref><sup>(\d+)<\/sup>}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref> and <xref ref-type=\"fig\" rid=\"F$3\">$3<\/xref>}gsi;



$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash\;<figxref>(\d+)(\,)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$3\">$3<\/xref>$4}gsi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)through(\s?)<figxref>(\d+)(\,)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3through$4<xref ref-type=\"fig\" rid=\"F$5\">$5<\/xref>$6}gsi;



#$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>\&ndash\;<figxref>(\d+)([A-z])([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>\&ndash\;".&Figure_Linking2($4,$5)."$6"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash\;<figxref>(\d+)([A-Z])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$3\">$3$4<\/xref>}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash\;<figxref>(\d+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$3\">$3<\/xref>}gsi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash\;<figxref>([A-Z])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)through(\s?)<figxref>(\d+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3through$4<xref ref-type=\"fig\" rid=\"F$5\">$5<\/xref>$6}gsi;



$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash\;<figxref>([A-z])([\;\,\.\)\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>$4}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash\;<FigXref>([A-z])([\;\,\.\)\;\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>$4}gsi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>\&ndash\;<figxref>([A-z])([\;\,\.\)\;\s])}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>\&ndash\;<xref ref-type=\"fig\" rid=\"F$1\">$3<\/xref>$4}gsi;




$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)<figxref>(\d+)([A-z])([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking2($7,$8)."$9"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)<figxref>(\d+)([A-z])([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking2($7,$8)."$9"}gesi;

$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)<figxref>(\d+)([A-z])([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6".&Figure_Linking2($7,$8)."$9"}gesi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\d+)\">([^\<]+)\<\/xref>(\s?)(\,)(\s?)<figxref>(\d+)}{<xref ref-type=\"fig\" rid=\"F$1\">$2<\/xref>$3$4$5<xref ref-type=\"fig\" rid=\"F$6\">$6<\/xref>}gsi;


$Fig_Xref_Tmp=~s{<xref ref-type=\"fig\" rid=\"F(\w+)(\d+)\">([^\<]+)\<\/xref>\((\w)\) and <figxref>([A-Z])(\d+)\((\w+)\)}{<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>\($4\) and <xref ref-type=\"fig\" rid=\"F$5$6\">$5$6<\/xref>\($7\)}gsi;




$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)\<\/xref>(\s?)(\,?)(\s?)(and) <figxref>\[\[italic\]\]([A-z])\[\[\/italic\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking4($1,$8)."$9"}gesi;


$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>\[\[italic\]\]([A-z])\[\[\/italic\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking4($1,$8)."$9"}gesi;

	


$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F(\d+)(\w?)\">([^\<]+)<\/xref>(\s?)(\,?)(\s?)(and) <figxref>\[\[italic\]\]([A-z])\[\[\/italic\]\]\[\[\/bold\]\]([\;\,\.\)\s])}{"<xref ref-type=\"fig\" rid=\"F$1$2\">$3<\/xref>$4$5$6$7 ".&Figure_Linking4($1,$8)."<\/bold>$9"}gesi;




	
my $Fig_Xref_Tmp2=$Fig_Xref_Tmp;




while($Fig_Xref_Tmp2=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;

	my $Content=$3;

	

	$Content=~s{\&(\w+);}{\.}gsi;
	
	$Content=~s{<figxref>(.*?)<\/figxref>}{\[tag1\]$1\[\/tag1]}gsi;

	
	$Content=~s{<([^\>]+)\>}{}gsi;

	

	
	$Content=~s{\[tag1\](.*?)\[\/tag1]}{<1>$1<\/1>}gsi;


	
	

	while($Content=~m{<1>(.*?)<\/1>}gsi)
	{
		my $cnum = index($Content, "$1") + 1;
	
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum check the figxref style pattern $1");
	}
}

$Fig_Xref_Tmp=~s{<CommentReference(\d+)\/>}{}gsi;

$Fig_Xref_Tmp=~s{<query>(.*?)<\/query>}{}gsi;

$Fig_Xref_Tmp=~s{<\/figurenumber>(\s?)<CommentReference(\d+)\/>(\s?)<figurenumber>}{$1$3<CommentReference$2\/>}gsi;
$Fig_Xref_Tmp=~s{<\/figurenumber>(\s?)<query>(.*?)<\/query>(\s?)<figurenumber>}{$1$3<query>$2<\/query>}gsi;
$Fig_Xref_Tmp=~s{<figurenumber><bold>(.*?)<\/bold>}{<figurenumber>$1}gsi;

$Fig_Xref_Tmp=~s{<\/figurenumber>(\.?)}{$1<\/figurenumber>}gsi;

$Fig_Xref_Tmp=~s{</FigureNumber> <FigureNumber>}{ }gsi;
$Fig_Xref_Tmp=~s{<sc><figurenumber>}{<figurenumber>}gsi;


$Fig_Xref_Tmp=~s{<\/figurenumber><\/sc>}{<\/figurenumber>}gsi;

$Fig_Xref_Tmp=~s{<\/figurenumber><figurenumber>}{}gsi;

$Fig_Xref_Tmp=~s{<videocaption>}{<figurecaption>}gsi;
$Fig_Xref_Tmp=~s{<\/videocaption>}{<\/figurecaption>}gsi;
$Fig_Xref_Tmp=~s{<videocaption\/>}{<figurecaption\/>}gsi;

$Fig_Xref_Tmp=~s{<videonumber>}{<figurenumber>}gsi;
$Fig_Xref_Tmp=~s{<\/videonumber>}{<\/figurenumber>}gsi;
$Fig_Xref_Tmp=~s{<videonumber\/>}{<figurenumber\/>}gsi;

$Fig_Xref_Tmp=~s{<italic>(.*?)<\/italic>}{$1}gsi;

$Fig_Xref_Tmp=~s{<figureCaption>\n*\[([^\>]+)\]}{}gsi;

$Fig_Xref_Tmp=~s{<figureCaption><figurenumber>(\d+)(\.?)<\/figurenumber>(\s?)(.*?)<\/figureCaption>}{<fig id=\"F$1\" position=\"float\" fig-type=\"figure\"><label>$1$2\&ensp\;<\/label><caption><p>$4<\/p><\/caption><graphic xlink\:href=\"$FileName\_F000$1.eps\"\/><\/fig>}gsi;

$Fig_Xref_Tmp=~s{<figureCaption><figurenumber>(\d+)(\w)(\&ndash;\w)(\.?)<\/figurenumber>(\s?)(.*?)<\/figureCaption>}{<fig id=\"F$1\" position=\"float\" fig-type=\"figure\"><label>$1$2$3$4\&ensp\;<\/label><caption><p>$5<\/p><\/caption><graphic xlink\:href=\"$FileName\_F000$1.eps\"\/><\/fig>}gsi;

$Fig_Xref_Tmp=~s{<figureCaption><figurenumber>(\d+)(\w)<\/figurenumber>(\s?)(.*?)<\/figureCaption>}{<fig id=\"F$1\" position=\"float\" fig-type=\"figure\"><label>$1$2\&ensp\;<\/label><caption><p>$4<\/p><\/caption><graphic xlink\:href=\"$FileName\_F000$1.eps\"\/><\/fig>}gsi;



$Fig_Xref_Tmp=~s{<figureCaption><figurenumber>(ex)(\.?)(\d+)(\w?)(\.?)<\/figurenumber>(\s?)(.*?)<\/figureCaption>}{<fig id=\"E$3$4\" position=\"float\" fig-type=\"figure\"><label>$1$2$3$4$5\&ensp\;<\/label><caption><p>$7<\/p><\/caption><graphic xlink\:href=\"$FileName\_E000$3$4.eps\"\/><\/fig>}gsi;

$Fig_Xref_Tmp=~s{<figureCaption><figurenumber>(\w+)(\s?)(\.?)(\s?)(\d)(\(?)(<\w+>)(\w?)(<\/\w+>)(\)?)(.*?)<\/figurenumber>(\s?)(.*?)<\/figureCaption>}{<fig id=\"F$5$8\" position=\"float\" fig-type=\"figure\"><label>$1$2$3$4$5$6$7$8$9$10$11\&ensp\;<\/label><caption><p>$13<\/p><\/caption><graphic xlink\:href=\"$FileName\_F000$5$8.eps\"\/><\/fig>}gsi;

$Fig_Xref_Tmp=~s{<figureCaption><figurenumber>(\w+)(\s?)(\.?)(\s?)(\d\d\d)(\(?)(\w?)(\)?)(.*?)<\/figurenumber>(\s?)(.*?)<\/figureCaption>}{<fig id=\"F$5$7\" position=\"float\" fig-type=\"figure\"><label>$1$2$3$4$5$6$7$8$9\&ensp\;<\/label><caption><p>$11<\/p><\/caption><graphic xlink\:href=\"$FileName\_F0$5$7.eps\"\/><\/fig>}gsi;



$Fig_Xref_Tmp=~s{<figureCaption><figurenumber>(\w+)(\s?)(\.?)(\s?)(\d)(\(?)(\w?)(\)?)(.*?)<\/figurenumber>(\s?)(.*?)<\/figureCaption>}{<fig id=\"F$5$7\" position=\"float\" fig-type=\"figure\"><label>$1$2$3$4$5$6$7$8$9\&ensp\;<\/label><caption><p>$11<\/p><\/caption><graphic xlink\:href=\"$FileName\_F000$5$7.eps\"\/><\/fig>}gsi;



$Fig_Xref_Tmp=~s{<figureCaption><figurenumber>(\w+)(\s?)(\.?)(\s?)(\d\d)(\(?)(\w?)(\)?)(.*?)<\/figurenumber>(\s?)(.*?)<\/figureCaption>}{<fig id=\"F$5$7\" position=\"float\" fig-type=\"figure\"><label>$1$2$3$4$5$6$7$8$9\&ensp\;<\/label><caption><p>$11<\/p><\/caption><graphic xlink\:href=\"$FileName\_F00$5$7.eps\"\/><\/fig>}gsi;




#Figure format A1
$Fig_Xref_Tmp=~s{<figureCaption><figurenumber>(\w+)(\s?)(\.?)(\s?)(\w)(\(?)(\d?)(\)?)(.*?)<\/figurenumber>(\s?)(.*?)<\/figureCaption>}{<fig id=\"F$5$7\" position=\"float\" fig-type=\"figure\"><label>$1$2$3$4$5$6$7$8$9\&ensp\;<\/label><caption><p>$11<\/p><\/caption><graphic xlink\:href=\"$FileName\_F000$5$7.eps\"\/><\/fig>}gsi;


$Fig_Xref_Tmp=~s{<figureCaption><figurenumber>(\w+)(\s?)(\.?)(\s?)(\w)(\(?)(\d\d\d)(\)?)(.*?)<\/figurenumber>(\s?)(.*?)<\/figureCaption>}{<fig id=\"F$5$7\" position=\"float\" fig-type=\"figure\"><label>$1$2$3$4$5$6$7$8$9\&ensp\;<\/label><caption><p>$11<\/p><\/caption><graphic xlink\:href=\"$FileName\_F0$5$7.eps\"\/><\/fig>}gsi;


$Fig_Xref_Tmp=~s{<figureCaption><figurenumber>(\w+)(\s?)(\.?)(\s?)(\w)(\(?)(\d\d)(\)?)(.*?)<\/figurenumber>(\s?)(.*?)<\/figureCaption>}{<fig id=\"F$5$7\" position=\"float\" fig-type=\"figure\"><label>$1$2$3$4$5$6$7$8$9\&ensp\;<\/label><caption><p>$11<\/p><\/caption><graphic xlink\:href=\"$FileName\_F00$5$7.eps\"\/><\/fig>}gsi;



$Fig_Xref_Tmp=~s{<figureCaption><figurenumber>(\w+)(\s?)(\w+)(\s?)(\.?)(\s?)(\d)(\(?)(\w?)(\)?)(.*?)<\/figurenumber>(\s?)(.*?)<\/figureCaption>}{<fig id=\"F$7$8\" position=\"float\" fig-type=\"figure\"><label>$1$2$3$4$5$6$7$8$9$10$11\&ensp\;<\/label><caption><p>$13<\/p><\/caption><graphic xlink\:href=\"$FileName\_F000$7$8.eps\"\/><\/fig>}gsi;






$Fig_Xref_Tmp=~s{<figureCaption><figurenumber>(\w+)(\.?)<\/figurenumber>(\s?)(.*?)<\/figureCaption>}{<fig id=\"F$1\" position=\"float\" fig-type=\"figure\"><label>$1$2\&ensp\;<\/label><caption><p>$4<\/p><\/caption><graphic xlink\:href=\"$FileName\_F000$1.eps\"\/><\/fig>}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(\<bold\>?)(Scheme (\d+))}{<fig id=\"SCH$4\" position=\"float\" fig-type=\"figure\"><label>$2$3}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Scheme (\d+))}{<fig id=\"SCH$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(\<bold\>?)(Schematic (\d+))}{<fig id=\"SCH$4\" position=\"float\" fig-type=\"figure\"><label>$2$3}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Schematic (\d+))}{<fig id=\"SCH$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(\<bold\>?)(Flowchart (\d+))}{<fig id=\"FL$4\" position=\"float\" fig-type=\"figure\"><label>$2$3}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Flowchart (\d+))}{<fig id=\"FL$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(\<bold\>?)(Plate (\d+))}{<fig id=\"PLA$4\" position=\"float\" fig-type=\"figure\"><label>$2$3}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Plate (\d+))}{<fig id=\"PLA$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(\<bold\>?)(Plates (\d+))}{<fig id=\"PLA$4\" position=\"float\" fig-type=\"figure\"><label>$2$3}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Plates (\d+))}{<fig id=\"PLA$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;




$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(\<bold\>?)(Video (\d+))}{<fig id=\"V$4\" position=\"float\" fig-type=\"figure\"><label>$2$3}gsi;


$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(\<bold\>?)(Video (\d+))}{<fig id=\"V$4\" position=\"float\" fig-type=\"figure\"><label>$2$3}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(\<bold\>?)(Ex (\d+))}{<fig id=\"E$4\" position=\"float\" fig-type=\"figure\"><label>$2$3}gsi;



$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Ex\. (\d+))}{<fig id=\"E$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Exx\. (\d+))}{<fig id=\"E$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;


$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Image (\d+))}{<fig id=\"I$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Images (\d+))}{<fig id=\"I$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(\<bold\>?)(Video Graphic (\d+))}{<fig id=\"V$4\" position=\"float\" fig-type=\"figure\"><label>$2$3}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Video Graphic (\d+))}{<fig id=\"V$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Video (\d+))}{<fig id=\"V$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(\<bold\>?)(Picture (\d+))}{<fig id=\"PIC$4\" position=\"float\" fig-type=\"figure\"><label>$2$3}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Picture (\d+))}{<fig id=\"PIC$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Photo (\d+))}{<fig id=\"PHO$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Map (\d+))}{<fig id=\"MAP$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;


$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Chart (\d+))}{<fig id=\"CH$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Diagram (\d+))}{<fig id=\"D$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;


$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Graph (\d+))}{<fig id=\"G$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;

$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(Model (\d+))}{<fig id=\"M$3\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;


$Fig_Xref_Tmp=~s{<fig id=\"F(\d+)\" position=\"float\" fig-type=\"figure\"><label>(A\d+)}{<fig id=\"A$1\" position=\"float\" fig-type=\"figure\"><label>$2}gsi;




my $Schg='0';

$Fig_Xref_Tmp=~s{<fig id=\"SCH(\d+)\"(.*?)<graphic xlink:href=\"([^\"]+)\"\/>}{"<fig id=\"SCH$1\" $2<graphic xlink:href=\"$FileName\_SCH".(sprintf("%04d", ++$Schg)).".eps\"\/>"}esgi;

my $PLA='0';

$Fig_Xref_Tmp=~s{<fig id=\"PLA(\d+)\"(.*?)<graphic xlink:href=\"([^\"]+)\"\/>}{"<fig id=\"PLA$1\" $2<graphic xlink:href=\"$FileName\_PLA".(sprintf("%04d", ++$PLA)).".eps\"\/>"}esgi;

my $Vchg='0';



$Fig_Xref_Tmp=~s{<fig id=\"V(\d+)\"(.*?)<graphic xlink:href=\"([^\"]+)\"\/>}{"<fig id=\"V$1\" $2<graphic xlink:href=\"$FileName\_V".(sprintf("%04d", ++$Vchg)).".eps\"\/>"}esgi;


my $Mchg='0';



$Fig_Xref_Tmp=~s{<fig id=\"M(\d+)\"(.*?)<graphic xlink:href=\"([^\"]+)\"\/>}{"<fig id=\"M$1\" $2<graphic xlink:href=\"$FileName\_MD".(sprintf("%04d", ++$Mchg)).".eps\"\/>"}esgi;


my $Picchg='0';



$Fig_Xref_Tmp=~s{<fig id=\"PIC(\d+)\"(.*?)<graphic xlink:href=\"([^\"]+)\"\/>}{"<fig id=\"PIC$1\" $2<graphic xlink:href=\"$FileName\_PIC".(sprintf("%04d", ++$Picchg)).".eps\"\/>"}esgi;



my $Picchg='0';



$Fig_Xref_Tmp=~s{<fig id=\"PHO(\d+)\"(.*?)<graphic xlink:href=\"([^\"]+)\"\/>}{"<fig id=\"PHO$1\" $2<graphic xlink:href=\"$FileName\_PHO".(sprintf("%04d", ++$Picchg)).".eps\"\/>"}esgi;

my $Echg='0';

#$Fig_Xref_Tmp=~s{<fig id=\"E(\d+)\"(.*?)<graphic xlink:href=\"([^\"]+)\"\/>}{"<fig id=\"E$1\" $2<graphic xlink:href=\"$FileName\_E".(sprintf("%04d", ++$Echg)).".eps\"\/>"}esgi;



my $Mapchg='0';



$Fig_Xref_Tmp=~s{<fig id=\"MAP(\d+)\"(.*?)<graphic xlink:href=\"([^\"]+)\"\/>}{"<fig id=\"MAP$1\" $2<graphic xlink:href=\"$FileName\_MAP".(sprintf("%04d", ++$Mapchg)).".eps\"\/>"}esgi;

my $Ichg='0';

$Fig_Xref_Tmp=~s{<fig id=\"I(\d+)\"(.*?)<graphic xlink:href=\"([^\"]+)\"\/>}{"<fig id=\"I$1\" $2<graphic xlink:href=\"$FileName\_I".(sprintf("%04d", ++$Ichg)).".eps\"\/>"}esgi;

my $Chartchg='0';

$Fig_Xref_Tmp=~s{<fig id=\"CH(\d+)\"(.*?)<graphic xlink:href=\"([^\"]+)\"\/>}{"<fig id=\"CH$1\" $2<graphic xlink:href=\"$FileName\_CH".(sprintf("%04d", ++$Chartchg)).".eps\"\/>"}esgi;


my $Digchg='0';

$Fig_Xref_Tmp=~s{<fig id=\"D(\d+)\"(.*?)<graphic xlink:href=\"([^\"]+)\"\/>}{"<fig id=\"D$1\" $2<graphic xlink:href=\"$FileName\_D".(sprintf("%04d", ++$Digchg)).".eps\"\/>"}esgi;


my $Grag='0';

$Fig_Xref_Tmp=~s{<fig id=\"G(\d+)\"(.*?)<graphic xlink:href=\"([^\"]+)\"\/>}{"<fig id=\"G$1\" $2<graphic xlink:href=\"$FileName\_G".(sprintf("%04d", ++$Grag)).".eps\"\/>"}esgi;


$Fig_Xref_Tmp=~s{<graphic xlink\:href=\"$FileName\_F000(\d\d).eps\"\/>}{<graphic xlink\:href=\"$FileName\_F00$1.eps\"\/>}gsi;

$Fig_Xref_Tmp=~s{<graphic xlink\:href=\"$FileName\_F000(\d\d)\-(\d+).eps\"\/>}{<graphic xlink\:href=\"$FileName\_F00$1\-$2.eps\"\/>}gsi;



#$Fig_Xref_Tmp=~s{<\/fig>\n<fig><caption>(.*?)<\/caption><\/fig>}{$1<\/fig>}gsi;
#$Fig_Xref_Tmp=~s{<\/fig>\n<fig><caption>(.*?)<\/caption><\/fig>}{$1<\/fig>}gsi;
#$Fig_Xref_Tmp=~s{<\/fig>\n<fig><caption>(.*?)<\/caption><\/fig>}{$1<\/fig>}gsi;



$Fig_Xref_Tmp=~s{<\/figuresource>\n<figuresource>}{<\/figuresource><figuresource>}gsi;

$Fig_Xref_Tmp=~s{<\/fig>\n(<figuresource>(.*?)<\/figuresource>)}{$1<\/fig>}gsi;

$Fig_Xref_Tmp=~s{<figuresource>(.*?)<\/figuresource>}{<p content-type="source">$1<\/p>}gsi;

$Fig_Xref_Tmp=~s{<\/fig-note>\n<fig-note>}{<\/fig-note><fig-note>}gsi;

my $Affiliation_Path11=$ARGV[0];

	if($Affiliation_Path11=~m{(JData\\LWW|JData_NEW\\LWW)}gsi)
	{
		$Fig_Xref_Tmp=~s{<fig id=\"Fe\" position=\"float\" fig-type=\"figure\"><label>Figure\.\&ensp\;</label><caption>(.*?)<\/fig>}{}gsi;

	}

$Fig_Xref_Tmp=~s{<\/caption><graphic ([^\>]+)><\/fig>(\n?)<fig-note>(.*?)<\/fig-note>\n}{<\/caption><fig-note>$3<\/fig-note><graphic $1><\/fig>}gsi;

$Fig_Xref_Tmp=~s{<\/caption><graphic ([^\>]+)><p content\-type=\"source\">(.*?)<\/p><\/fig>(\n?)<fig\-note>(.*?)<\/fig\-note>\n}{<\/caption><graphic $1><p content-type=\"source\">$2<\/p><fig-note>$4<\/fig-note><\/fig>}gsi;;



my $Intellect_Path1=$ARGV[0];

if($Intellect_Path1=~m{Intellect}si)
{

	my $Fig_Tmp=$Fig_Xref_Tmp;

	my $Fig_Tmp1=$Fig_Xref_Tmp;

	my $Fig_Tmp2=$Fig_Xref_Tmp;

	$Fig_Xref_Tmp=~s{(<xref ref\-type=\"fig\" rid=\"([^\"]+)\">(\w+) (\w+)</xref>)}{&Intellect_Part_Figure($1,$2,$4,$Fig_Xref_Tmp)}gesi;

	$Fig_Xref_Tmp=~s{(<xref ref\-type=\"fig\" rid=\"([^\"]+)\">(\w+)</xref>)}{&Intellect_Part_Figure($1,$2,$3,$Tmp)}gesi;

	
	while($Fig_Tmp=~m{<fig id=\"([^\"]+)\" position=\"float\" fig\-type=\"figure\"><label>Figure(s?) (\d+) and (\d+)}gsi)
	{
		my $ID=$1;
		my $Part_Fig=$4;

		
		
		$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F$Part_Fig\">}{<xref ref\-type=\"fig\" rid=\"$ID\">}gsi;
	}

	
	while($Fig_Tmp1=~m{<fig id=\"([^\"]+)\" position=\"float\" fig\-type=\"figure\"><label>Figure(s?) (\d+)\&ndash;(\d+)}gsi)
	{
		my $ID=$1;
		my $Part_Fig=$4;

		
		
		$Fig_Xref_Tmp=~s{<xref ref\-type=\"fig\" rid=\"F$Part_Fig\">}{<xref ref\-type=\"fig\" rid=\"$ID\">}gsi;
	}
}


my $Fig_Xref_Tmp3=$Fig_Xref_Tmp;

my $Fig_Xref_Tmp4=$Fig_Xref_Tmp;

my $Fig_Xref_Tmp41=$Fig_Xref_Tmp;




while($Fig_Xref_Tmp3=~m{<([^\>]+)\><fig id=\"(\w+)\"}gsi)
{
	my $Paragraph_No=$1;

	my $Id=$2;

	my $Fig_Xref_Tmp4=$Fig_Xref_Tmp;
	
	if($Fig_Xref_Tmp4!~m{<xref ref\-type=\"fig\" rid=\"$Id\">}gsi)
	{
		
	
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Figure citation is missing for $Id. or Check the figure number pattern or format in figure caption'");
	}
}


while($Fig_Xref_Tmp41=~m{<xref ref\-type=\"fig\" rid=\"(\w+)\">}gsi)
{
	my $Paragraph_No=$1;

	my $Id=$1;

	my $Fig_Xref_Tmp4=$Fig_Xref_Tmp;

	
	
	if($Fig_Xref_Tmp4!~m{<fig id=\"$Id\"}gsi)
	{
		
	
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the figure citation $Id. Figure caption is missing'");
	}
}


my $Fig_Xref_Tmp5=$Fig_Xref_Tmp;


my $Fig="01";

while($Fig_Xref_Tmp5=~m{<fig id=\"([^\"]+)\"}gsi)
{
	my $Id=$1;
	my $Id1=$Id;
	$Id=~s{(.*)f(\d+)$}{$2}gsi;

	
	if($Id lt $Fig)
	{
	#	$Err="1";
#push(@Error,"\~Para No:1 Col No:1 check Figure sequence id $Id1");


		
	}

	$Fig=$Id;

	
}

$Tab_Xref_Tmp=~s{<tabxref>(.*?)<\/tabxref>}{&OUP_Tabxref($1)}gesi;
	
$Tab_Xref_Tmp=~s{<tabxref>(.*?)<\/tabxref>}{&OUP_Tabxref1($1)}gesi;

$Tab_Xref_Tmp=~s{<tabxref>(.*?)<\/tabxref>}{&OUP_Tabxref2($1)}gesi;

$Tab_Xref_Tmp=~s{<tabxref>and }{and <tabxref>}gsi;


$Tab_Xref_Tmp=~s{<figxref> }{ <figxref>}gsi;

$Tab_Xref_Tmp=~s{ <\/figxref>}{<\/figxref> }gsi;

$Tab_Xref_Tmp=~s{<figxref\/>}{}gsi;

$Tab_Xref_Tmp=~s{<\/FigXref>}{}gsi;
$Tab_Xref_Tmp=~s{<tabxref> }{ <tabxref>}gsi;

$Tab_Xref_Tmp=~s{ <\/tabxref>}{<\/tabxref> }gsi;

$Tab_Xref_Tmp=~s{<tabxref\/>}{}gsi;

$Tab_Xref_Tmp=~s{<\/tabxref>}{}gsi;

$Tab_Xref_Tmp=~s{<Tabxref>(\(?)(Table(s?) (\d+)(\w?))}{$1<xref ref-type=\"table\" rid=\"T$4\">$2<\/xref>}gsi;

$Tab_Xref_Tmp=~s{<Tabxref>(\(?)(Exhibit(s?) (\d+)(\w?))}{$1<xref ref-type=\"table\" rid=\"T$4\">$2<\/xref>}gsi;



$Tab_Xref_Tmp=~s{<Tabxref>(\(?)(<bold>Table(s?) (\d+)(\w?)<\/bold>)}{$1<xref ref-type=\"table\" rid=\"T$4\">$2<\/xref>}gsi;

$Tab_Xref_Tmp=~s{<Tabxref>(\(?)(<bold>Table(s?) (\d+)<italic>(\w?)<\/italic><\/bold>)}{$1<xref ref-type=\"table\" rid=\"T$4\">$2<\/xref>}gsi;

$Tab_Xref_Tmp=~s{<Tabxref>(\(?)(Table(s?) (\d+)<italic>(\w?)<\/italic>)}{$1<xref ref-type=\"table\" rid=\"T$4\">$2<\/xref>}gsi;


$Tab_Xref_Tmp=~s{<Tabxref>(\(?)(Chart(s?) (\d+)(\w?))}{$1<xref ref-type=\"table\" rid=\"CH$4\">$2<\/xref>}gsi;

$Tab_Xref_Tmp=~s{<Tabxref>(\(?)(Annex(s?))(\)?)<\/Tabxref>}{<xref ref-type="table" rid="AN$4">$2<\/xref>}si;

$Tab_Xref_Tmp=~s{<Tabxref>(\(?)(Chart(s?) (\d+)<italic>(\w?)<\/italic>)}{$1<xref ref-type=\"table\" rid=\"CH$4\">$2<\/xref>}gsi;

$Tab_Xref_Tmp=~s{<Tabxref>(\(?)(<bold>Chart(s?) (\d+)<italic>(\w?)<\/italic><\/bold>)}{$1<xref ref-type=\"table\" rid=\"CH$4\">$2<\/xref>}gsi;

$Tab_Xref_Tmp=~s{<Tabxref>(\(?)(<bold>Chart(s?) (\d+)(\w?)<\/bold>)}{$1<xref ref-type=\"table\" rid=\"CH$4\">$2<\/xref>}gsi;


$Tab_Xref_Tmp=~s{<Tabxref>(\?)(Tab(s?) (\d+)(\w?))}{$1<xref ref-type=\"table\" rid=\"T$4\">$2<\/xref>}gsi;

$Tab_Xref_Tmp=~s{<Tabxref>(\?)(<bold>Tab(s?) (\d+)(\w?)<\/bold>)}{$1<xref ref-type=\"table\" rid=\"T$4\">$2<\/xref>}gsi;

$Tab_Xref_Tmp=~s{<Tabxref>(\?)(<bold>Tab(s?) (\d+)<italic>(\w?)<\/italic><\/bold>)}{$1<xref ref-type=\"table\" rid=\"T$4\">$2<\/xref>}gsi;


$Tab_Xref_Tmp=~s{<Tabxref>(\(?)(Tab(s?) \[\[\[del\]\]\](.*?)\[\[\[\/del\]\]\]\[\[\[ins\]\]\](\w+)(\w?)\[\[\[\/ins\]\]\])}{$1<xref ref-type=\"table\" rid=\"T$5\">$2<\/xref>}gsi;
$Tab_Xref_Tmp=~s{<p([^\>]*)\><Tabxref>(\(?)(Table(s?) (\d+)(\w?))}{<p>$2<xref ref-type=\"table\" rid=\"T$5\">$3<\/xref>}gsi;

$Tab_Xref_Tmp=~s{<p([^\>]*)\><Tabxref>(\(?)(Table(s?) \[\[\[del\]\]\](.*?)\[\[\[\/del\]\]\]\[\[\[ins\]\]\](\d+)(\w?)\[\[\[\/ins\]\]\])}{<p>$2<xref ref-type=\"table\" rid=\"T$6\">$3<\/xref>}gsi;

$Tab_Xref_Tmp=~s{<p([^\>]*)\><Tabxref>(\(?)(Chart(s?) (\d+)(\w?))}{<p>$2<xref ref-type=\"table\" rid=\"T$5\">$3<\/xref>}gsi;
$Tab_Xref_Tmp=~s{<p([^\>]*)\><Tabxref>(\?)(Tab(s?) (\d+)(\w?))}{<p>$2<xref ref-type=\"table\" rid=\"T$5\">$3<\/xref>}gsi;



$Tab_Xref_Tmp=~s{<Tabxref>(Tab(\w+)(\.?)(\s?)([A-Z\d]+))}{&Table_Link1($1,$5)}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking1($7,$8)."$9"}gesi;



$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>(\d+)\[\[italic\]\](\w)\[\[\/italic\]\]([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking3($7,$8)."$9"}gesi;


$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>(\d+)(\w)([\;\,\.\) \<])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking1($7,$8)."$9"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>(\d+)\[\[italic\]\](\w)\[\[\/italic\]\]([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking3($7,$8)."$9"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>(\d+)([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>$3$4$5<xref ref-type=\"table\" rid=\"T$6\">$6<\/xref>$7}gsi;



#$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking1($7,$8)."$9"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>(\d+)\[\[italic\]\](\w)\[\[\/italic\]\]([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking3($7,$8)."$9"}gesi;



$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking1($7,$8)."$9"}gesi;



$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>(\d+)\[\[italic\]\](\w)\[\[\/italic\]\]([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking3($7,$8)."$9"}gesi;



$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)\<\/xref>(\s?)(\,)(\s?)<TabXref>(\d+)([\,\;\:\.\)])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking1($1,$7)."$8"}gesi;




$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(and)(\s?)<TabXref>(\d+)([\,\;\:\.\)])}{<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6<xref ref-type=\"table\" rid=\"T$7\">$7<\/xref>$8}gsi;




$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>\[\[italic\]\](\w)\[\[\/italic\]\]([\,\;\:\.\)])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking3($1,$7)."$8"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>(\w)([\,\;\:\.\)])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking1($1,$7)."$8"}gesi;


$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>\[\[italic\]\](\w)\[\[\/italic\]\]([\,\;\:\.\)])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking3($1,$7)."$8"}gesi;


$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>(\w)([\,\;\:\.\)])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking1($1,$7)."$8"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>\[\[italic\]\](\w)\[\[\/italic\]\]([\,\;\:\.\)])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking3($1,$7)."$8"}gesi;



$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>(\w)([\,\;\:\.\)])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking1($1,$7)."$8"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>\[\[italic\]\](\w)\[\[\/italic\]\]([\,\;\:\.\)])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6".&Table_Linking3($1,$7)."$8"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref> and <TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref> and". &Table_Linking1($4,$5)."$6"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref> and <TabXref>(\d+)\[\[italic\]\](\w)\[\[\/italic\]\]([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref> and". &Table_Linking3($4,$5)."$6"}gesi;



$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref> and <TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref> and". &Table_Linking1($4,$5)."$6"}gesi;




$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref> and <TabXref>(\d+)\[\[italic\]\](\w)\[\[\/italic\]\]([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref> and". &Table_Linking3($4,$5)."$6"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref> and <TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref> and". &Table_Linking1($4,$5)."$6"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref> \&amp; <TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref> \&amp;". &Table_Linking1($4,$5)."$6"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref> and <TabXref>(\d+)([\;\,\.\)\] ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref> and <xref ref-type=\"table\" rid=\"T$3\">$3<\/xref>$4}gsi;



$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\w\d+)\">([^\>]+)<\/xref> and <TabXref>([A-Z])(\d+)([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref> and <xref ref-type=\"table\" rid=\"T$3$4\">$3$4<\/xref>$5}gsi;



$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref>\-<TabXref>(\d+)([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>\&ndash\;<xref ref-type=\"table\" rid=\"T$3\">$3<\/xref>$4}gsi;


$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref>\&\#x2013;<TabXref>(\d+)([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>\&ndash\;<xref ref-type=\"table\" rid=\"T$3\">$3<\/xref>$4}gsi;







$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref>\-<TabXref>(\d+)([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>\-<xref ref-type=\"table\" rid=\"T$3\">$3<\/xref>$4}gsi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref> through <TabXref>(\d+)([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref> through <xref ref-type=\"table\" rid=\"T$3\">$3<\/xref>$4}gsi;



$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref> to <TabXref>(\d+)([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref> to <xref ref-type=\"table\" rid=\"T$3\">$3<\/xref>$4}gsi;




$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>\-<TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>\-".&Table_Linking1($4,$5)."$6"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>\-<TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>\-". &Table_Linking1($4,$5)."$6"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>\-<TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>\-". &Table_Linking1($4,$5)."$6"}gesi;



$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref> through <TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref> through ". &Table_Linking1($4,$5)."$6"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref> to <TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref> to ". &Table_Linking1($4,$5)."$6"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref> through <TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref> through ". &Table_Linking1($4,$5)."$6"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref> to <TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref> to ". &Table_Linking1($4,$5)."$6"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref> through <TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref> through ". &Table_Linking1($4,$5)."$6"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref> to <TabXref>(\d+)(\w)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref> to ". &Table_Linking1($4,$5)."$6"}gesi;


$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref>\-<TabXref>(\d+)(\w)([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>\-<xref ref-type=\"table\" rid=\"T$3\">$3$4<\/xref>$5}gsi;


$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref>\-<TabXref>(\d+)}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>\-<xref ref-type=\"table\" rid=\"T$3\">$3<\/xref>}gsi;



$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref>(\s?)(\,)(\s?)<TabXref>(\d+)}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>$3$4$5<xref ref-type=\"table\" rid=\"T$6\">$6<\/xref>}gsi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T([A-Z]+)\">([^\>]+)<\/xref> and <TabXref>([A-Z]+)([\;\,\.\)\: ])}{"<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref> and <xref ref-type=\"table\" rid=\"T$1\">$3<\/xref>$4}gsi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref> and <TabXref>([A-Z]+)([\;\,\.\)\: ])}{"<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref> and <xref ref-type=\"table\" rid=\"T$1\">$3<\/xref>$4}gsi;


#$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref> and <TabXref>([A-Z]+)([\;\,\.\)\: ])}{"<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref> and ". &Table_Linking2($3)."$4"}ges;



$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T([A-Z]+)\">([^\>]+)<\/xref>\, and <TabXref>([A-Z]+)([\;\,\.\) ])}{"<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>\, and ". &Table_Linking2($3)."$4"}ges;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref>\, and <TabXref>(\d+)([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>\, and <xref ref-type=\"table\" rid=\"T$3\">$3<\/xref>$4}gsi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T([A-Z]+)\">([^\>]+)<\/xref>\-<TabXref>([A-Z]+)([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>\-<xref ref-type=\"table\" rid=\"T$3\">$3<\/xref>$4}gsi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T([A-Z]+)\">([^\>]+)<\/xref>\-<TabXref>([A-Z]+)([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>\-<xref ref-type=\"table\" rid=\"T$3\">$3<\/xref>$4}gsi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T([A-Z]+)(\d+)\">([^\>]+)<\/xref>\-<TabXref>([A-Z])(\d+)([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>\-<xref ref-type=\"table\" rid=\"T$4$5\">$4$5<\/xref>$6}gsi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref>\-<TabXref>([A-Z])([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>\-<xref ref-type=\"table\" rid=\"T$1\">$3<\/xref>$4}gsi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref> and <TabXref>(\d+)(\w)(\-)}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref> and ". &Table_Linking1($4,$5)."$6"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\,?)(\s?)(\,?)<TabXref>(\w)(\s)}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6". &Table_Linking1($1,$7)."$8"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref>\-<TabXref>([A-Z])([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>\-<xref ref-type=\"table\" rid=\"T$1\">$3<\/xref>$4}gsi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref> and <TabXref>(\d+)(\w)(\-)}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref> and ". &Table_Linking1($4,$5)."$6"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)(\w?)\">([^\>]+)<\/xref>(\,?)(\s?)(\,?)<TabXref>(\w)(\s)}{"<xref ref-type=\"table\" rid=\"T$1$2\">$3<\/xref>$4$5$6". &Table_Linking1($1,$7)."$8"}gesi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\>]+)<\/xref>\-<TabXref>([A-Z])([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>\-<xref ref-type=\"table\" rid=\"T$1\">$3<\/xref>$4}gsi;

$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T(\d+)\">([^\<]+)\<\/xref>\-<TabXref>(\d+)([\;\,\.\) ])}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>\-<xref ref-type=\"table\" rid=\"T$3\">$3<\/xref>$4}gsi;

$Tab_Xref_Tmp=~s{<xref ref\-type=\"table\" rid=\"T(\d+)\">([^\<]+)\<\/xref>\–(\d+)}{<xref ref-type=\"table\" rid=\"T$1\">$2<\/xref>\-<xref ref-type=\"table\" rid=\"T$3\">$3<\/xref>}gsi;



$Tab_Xref_Tmp=~s{<xref ref-type=\"table\" rid=\"T([^\"]+)\">([^\<]+)\<\/xref>((\s?)\&ndash;(\s?))<xref ref-type=\"table\" rid=\"T([^\"]+)\">([^\<]+)\<\/xref>}{&Table_Ndash($1,$2,$6,$7,$3)}gesi;




my $Tab_Xref_Tmp2=$Tab_Xref_Tmp;




while($Tab_Xref_Tmp2=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;

	my $Content=$3;

	$Content=~s{\&(\w+);}{\.}gsi;
	
	$Content=~s{<tabxref>(.*?)<\/tabxref>}{\[tag1\]$1\[\/tag1]}gsi;

	
	$Content=~s{<([^\>]+)\>}{}gsi;

	

	
	$Content=~s{\[tag1\](.*?)\[\/tag1]}{<1>$1<\/1>}gsi;

	

	while($Content=~m{<1>(.*?)<\/1>}gsi)
	{
		my $cnum = index($Content, "$1") + 1;
	
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:$cnum check the tabxref style pattern");
	}
}


$Tab_Xref_Tmp=~s{ {1,}}{ }gsi;



$Tab_Xref_Tmp=~s{<TableNumber>(.*?)<\/TableNumber>\n<TableCaption>}{<TableCaption><Tablenumber>$1<\/Tablenumber>}gsi;

$Tab_Xref_Tmp=~s{<TableCaption> <tablenumber>}{<TableCaption><Tablenumber>}gsi;




$Tab_Xref_Tmp=~s{<\/tablenumber>(\s?)<CommentReference(\d+)\/>([^\<]+)\<tablenumber>}{$1$3<CommentReference$2\/>}gsi;

$Tab_Xref_Tmp=~s{<\/tablenumber>(\s?)<query>(.*?)<\/query>([^\<]+)\<tablenumber>}{$1$3<query>$2<\/query>}gsi;

$Tab_Xref_Tmp=~s{</TableNumber>\[\[\[del\]\]\]([^\[]*)\[\[\[\/del\]\]\]<TableNumber>}{\[\[\[del\]\]\]$1\[\[\[\/del\]\]\]}gsi;

$Tab_Xref_Tmp=~s{</TableNumber>\[\[\[ins\]\]\]([^\[]*)\[\[\[\/ins\]\]\]<TableNumber>}{\[\[\[ins\]\]\]$1\[\[\[\/ins\]\]\]}gsi;

$Tab_Xref_Tmp=~s{<TableNumber/>}{}gsi;

$Tab_Xref_Tmp=~s{<tablecaption><tablenumber>Appendix (\w+)(\s?)(\.?)(\w+)(\.?)(\(?)(\w?)(\)?)(\.?)(.*?)<\/tablenumber>(\s?)(\.?)(.*?)<\/tablecaption>}{<table\-wrap id=\"TA$4$7\" position=\"float\"><label>Appendix $1$2$3$4$5$6$7$8$9$10\&ensp\;<\/label><caption><p>$13<\/p><\/caption>}gsi;
$Tab_Xref_Tmp=~s{<sc><tablenumber>}{<tablenumber>}gsi;


$Tab_Xref_Tmp=~s{<\/tablenumber><\/sc>}{<\/tablenumber>}gsi;

$Tab_Xref_Tmp=~s{<\/tablenumber><tablenumber>}{}gsi;


$Tab_Xref_Tmp=~s{<\/tablenumber>(\s?)<CommentReference(\d+)\/>([^\<]*)\<tablenumber>(.*?)<\/tablenumber>}{$1$3$4<\/tablenumber><CommentReference$2\/>}gsi;

$Tab_Xref_Tmp=~s{<\/tablenumber>(\s?)<query>(.*?)<\/query>([^\<]*)\<tablenumber>(.*?)<\/tablenumber>}{$1$3$4<\/tablenumber><query>$2<\/query>}gsi;


$Tab_Xref_Tmp=~s{<tablenumber><bold>(.*?)<\/bold><\/tablenumber>}{<tablenumber>$1<\/tablenumber>}gsi;

$Tab_Xref_Tmp=~s{<\/tablenumber>(\.?)}{$1<\/tablenumber>}gsi;

$Tab_Xref_Tmp=~s{<TableCaption><tablenumber>(TABLE)(\.?)(\s?)<\/tablenumber>(.*?)<\/tableCaption>}{<table\-wrap><label>$1$2<\/label><caption><p>$4<\/p><\/caption>}gsi;


$Tab_Xref_Tmp=~s{<tablecaption><tablenumber>(\w+)(\s?)(\.?)(\w+)(\.?)(\(?)(\w?)(\)?)(\.?)(.*?)<\/tablenumber>(\s?)(\.?)(.*?)<\/tablecaption>}{<table\-wrap id=\"T$4$7\" position=\"float\"><label>$1$2$3$4$5$6$7$8$9$10\&ensp\;<\/label><caption><p>$13<\/p><\/caption>}gsi;



$Tab_Xref_Tmp=~s{<tablecaption><tablenumber><bold>(\w+)(\s?)(\.?)(\w)(\(?)(\w?)(\)?)(.*?)<\/bold><\/tablenumber>(\s?)(\.?)(\&\w+;?)(.*?)<\/tablecaption>}{<table\-wrap id=\"T$4$7\" position=\"float\"><label>$1$2$3$4$5$6$7$8\&ensp\;<\/label><caption><p>$12<\/p><\/caption>}gsi;

#$Tab_Xref_Tmp=~s{<table frame=\"(\w+)\" orient=\"port\"\/>(.*?)<table\/>}{"<oasis:table frame=\"topbot\" orient=\"port\">".&table($2)."<\/oasis:table>\n<\/table\-wrap>"}gesi;


$Tab_Xref_Tmp=~s{<TableCaption>(.*?)<\/tableCaption>}{<table\-wrap><caption><p>$1<\/p><\/caption>}gsi;

$Tab_Xref_Tmp=~s{(<table\-wrap([^\>]+)\>)(<label>(.*?)<\/label>)<caption><p>(.*?)<pi (\w+)\/><query>(.*?)<\/query><\/p><\/caption>}{$1<\?\l$6 \l$6\?>$3<caption><p>$5<query>$7<\/query><\/p><\/caption>}gsi;



$Tab_Xref_Tmp=~s{<Table\-wrap id=\"T(\d+)\" position=\"float\"><label>(\<bold\>?)(Chart (\d+))}{<table\-wrap id=\"CH$4\" position=\"float\"><label>$2$3}gsi;



$Tab_Xref_Tmp=~s{<Table\-wrap id=\"T(\d+)\" position=\"float\">(<\?\w+ \w+\?>)<label>(Chart (\d+))}{<table\-wrap id=\"CH$4\" position=\"float\">$2<label>$3}gsi;

$Tab_Xref_Tmp=~s{<Table\-wrap id=\"T(\d+)\" position=\"float\"><label>(Annex (\d+))}{<table\-wrap id=\"AN$3\" position=\"float\"><label>$2}gsi;

$Tab_Xref_Tmp=~s{<Table\-wrap id=\"T(\d+)\" position=\"float\"><label>(\<bold\>?)(Annex (\d+))}{<table\-wrap id=\"AN$4\" position=\"float\"><label>$2$3}gsi;



$Tab_Xref_Tmp=~s{<Table\-wrap id=\"T(\d+)\" position=\"float\">(<\?\w+ \w+\?>)<label>(Annex (\d+))}{<table\-wrap id=\"AN$4\" position=\"float\">$2<label>$3}gsi;

my $Tab_Xref_Tmp3=$Tab_Xref_Tmp;

my $Tab_Xref_Tmp4=$Tab_Xref_Tmp;



while($Tab_Xref_Tmp3=~m{<([^\>]+)\><table\-wrap id=\"(\w+)\"}gsi)
{
	my $Paragraph_No=$1;

	my $Id=$2;

	my $Tab_Xref_Tmp4=$Tab_Xref_Tmp;

	
	if($Tab_Xref_Tmp4!~m{<xref ref\-type=\"table\" rid=\"$Id\">}gsi)
	{
		
	
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Table citation is missing for $Id. or check the table number pattern or format in table caption $Id.'");
	}
}



while($Tab_Xref_Tmp4=~m{<xref ref\-type=\"table\" rid=\"([^\"]+)\">}gsi)
{
	my $Paragraph_No=$1;

	my $Id=$1;

	my $Fig_Xref_Tmp4=$Tab_Xref_Tmp;
	
	if($Fig_Xref_Tmp4!~m{<table-wrap id=\"$Id\"}gsi)
	{
		
	
	
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Check the table citation $Id. Table caption is missing'");
	}
}



my $Paths=$ARGV[0];

if($Paths=~m{AESTHJ}gsi)
{

	my $Level_Tmp=$Tmp;	

	if($Level_Tmp=~m{<([^\>]+)\><Keyword([^\>]*)\>}gsi)
	{
		my $Paragraph_No=$1;
		$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Keyword style is not allowed for AESTHJ'");
		
	}
	
}



my $Path=$ARGV[0];

if($Path=~m{ASJOUR}gsi)
{
	while($Tmp=~m{<bibxref>(.*?)<\/bibxref>}gsi)
	{
		my $Bib_Xref=$1;

		if($Bib_Xref=~m{\–}gsi)
		{
			
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Ranges not allowed in bibxref style for ASJOUR Journal");
		}

		

		
	}

	while($Tmp=~m{<figxref>(.*?)<\/figxref>}gsi)
	{
		my $Bib_Xref=$1;

		if($Bib_Xref=~m{video}gsi)
		{
			
$Err="1";
push(@Error,"\~Para No:1 Col No:1 Figxref Style applied For video citation. Apply Videoxref style.");
		}

		

		
	}

my $Level_Tmp=$Tmp;	

	if($Level_Tmp=~m{<([^\>]+)\><([^\>]+)\>Level of Evidence}gsi)
	{
		my $Style=$2;

		if($Style!~m{FMNotesText}gsi)
		{
			

		
		
		my $Paragraph_No=$1;
		$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning: Check the level of evidence style. Style should be FM_Notes_Text");
		}
	}
	


my $Suppl_Tmp=$Tmp;



if($Suppl_Tmp=~m{<([^\>]+)\><SupplementaryMaterialCaption>(.*?)<\/SupplementaryMaterialCaption>}gsi)
{
	my $Paragraph_No=$1;
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Supplementary caption is not allowed for journal ASJOUR");
}

my $FM_Article_Type=$Tmp;

$FM_Article_Type=~s{<(\d+)><FMArticleType>}{<(\d+)><ArticleType>}si;

$FM_Article_Type=~s{<FMArticleType>(.*?)<\/FMArticleType>}{}si;

$FM_Article_Type=~s{<(\d+)><ArticleType>}{<(\d+)><FMArticleType>}si;

$FM_Article_Type=~s{<query>(.*?)<\/query>}{}gsi;

if($FM_Article_Type!~m{<([^\>]+)\><FMArticleType>(Body Contouring|Breast Surgery|Cosmetic Medicine|Facial Surgery|Genital Aesthetic Surgery|Oculoplastic Surgery|Research|Rhinoplasty|SoMe and Behavioral Science|My Way)<\/FMArticleType>}gsi)
{

	my $Paragraph_No=$1;

	push(@Error,"\~Para No:1 Col No:1 Warning: Check the FMArticletype. It should be either ody Contouring, Breast Surgery, Cosmetic Medicine, Facial Surgery, Genital Aesthetic Surgery,Oculoplastic Surgery,Research,Rhinoplasty,SoMe and Behavioral Science,My Way");
}

my $Article_Type_Tmp=$Tmp;

while($Article_Type_Tmp=~m{<([^\>]+)\><FMArticleType>(.*?)<\/FMArticleType>}gsi)
	{
		my $Title=$2;
		my $Paragraph_No=$1;

		

		if($Title=~m{([A-Z][A-Z])}gs)
		{

			$Err="1";
		
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check the case sensitive in FMArticle type");
			
		}
		
	}


my $Author_Name=$Tmp;

my $Recto_Running=$Tmp;

if($Author_Name=~m{<fmausurname>(.*?)<\/fmausurname>}gsi)
{
	my $Surname=$1;

	if($Recto_Running!~m{<FMRunningHeadRecto>$Surname}gsi)
	{
		push(@Error,"\~Para No:1 Col No:1 Recto running head should be author surname and et al for ASJOUR Journal");
	}
	
}
	
	
}

my $Path33=$ARGV[0];

if($Path33=~m{BIOLIN}gsi)
{
	

my $Suppl_Tmp=$Tmp;



while($Suppl_Tmp=~m{<([^\>]+)\><HeadB>(.*?)<\/HeadB>}gsi)
{
	my $Paragraph_No=$1;

	my $Content_B=$2;

	my $Content_B1=$2;

	if($Content_B!~m{<smallcaps>}gsi)
	{

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Small cap style is missing for HeadB");
	}

	if($Content_B1=~m{^<smallcaps>}gsi)
	{

		
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Check Small cap formatting applied for all letters");
	}
	
}

	
	
}

my $Path1=$ARGV[0];

if($Path1=~m{ASJOFJ}gsi)
{

	my $FM_Article_Type=$Tmp;

$FM_Article_Type=~s{<(\d+)><FMArticleType>}{<(\d+)><ArticleType>}si;

$FM_Article_Type=~s{<FMArticleType>(.*?)<\/FMArticleType>}{}si;

$FM_Article_Type=~s{<(\d+)><ArticleType>}{<(\d+)><FMArticleType>}si;

$FM_Article_Type=~s{<query>(.*?)<\/query>}{}gsi;
	
	if($FM_Article_Type!~m{<([^\>]+)\><FMArticleType>(Cosmetic Medicine|Breast Surgery|Research|Body Contouring|Facial Surgery|Rhinoplasty|Oculoplastic Surgery|Genital Aesthetic Surgery|SoMe and Behavioral Science|Commentaries|Editorials)<\/FMArticleType>}gsi)
{

	my $Paragraph_No=$1;

	push(@Error,"\~Para No:1 Col No:1 Warning: Check the FMArticletype. It should be either Cosmetic Medicine,Breast Surgery,Research,Body Contouring,Facial Surgery,Rhinoplasty,Oculoplastic Surgery,Genital Aesthetic Surgery,SoMe and Behavioral Science,Commentaries,Editorials");
}

my $Level_Tmp=$Tmp;	

	if($Level_Tmp=~m{<([^\>]+)\><([^\>]+)\>Level of Evidence}gsi)
	{
		my $Style=$2;

		if($Style!~m{FMNotesText}gsi)
		{
			

		
		
		my $Paragraph_No=$1;
		$Err="1";
			push(@Error,"\~Para No:$Paragraph_No Col No:1 Warning: Check the level of evidence style. Style should be FM_Notes_Text");
		}
	}


}

my $Ab_Tmp=$Tmp;



while($Ab_Tmp=~m{<([^\>]+)\><(FMAbstractHead|FMAbstractParaFlushLeft|FMAbstractParaInd|FMAbstractSectionHeadDisplayed|FMLayAbstractHead|FMLayAbstractParaFlushLeft|FMLayAbstractParaInd)>(.*?)<\/\2>\n<(\d+)><(ParaFlushLeft|ParaInd|BL1|BL2|BL3|BL4|BL5|OL1|OL2|OL3|OL4|OL5|ListPara|UL1|UL2|UL3)>(.*?)<\/\5>\n<(FMAbstractHead|FMAbstractParaFlushLeft|FMAbstractParaInd|FMAbstractSectionHeadDisplayed|FMLayAbstractHead|FMLayAbstractParaFlushLeft|FMLayAbstractParaInd)>}gsi)
{
	my $Paragraph_No=$4;
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 Para flush left style found after $2 style");
}

	
my $Ab_Tmp1=$Tmp;



while($Ab_Tmp1=~m{<([^\>]+)\><(FMAbstractHead|FMLayAbstractHead)>(.*?)<\/\2>\n<(\d+)><([^\>]+)\>(.*?)<\/\5>}gsi)
{
	my $Paragraph_No=$4;

	my $Child_Element=$5;
	my $Abstract_Style=$2;

	if($Child_Element!~m{(FMAbstractParaFlushLeft|FMAbstractParaInd|FMTransAbstractParaInd|FMGrapAbstractParaInd|FMGrapAbstractParaFlushLeft|FMVideoAbstractParaInd|FMVideoAbstractParaFlushLeft|FMLayAbstractParaFlushLeft|FMLayAbstractParaInd)}gsi)
	{
	
$Err="1";
push(@Error,"\~Para No:$Paragraph_No Col No:1 $Child_Element style found after $Abstract_Style style");

	}
}


			






while($Entity_Tmp=~m{<([^\>]+)\><([^\>]+)\>(.*?)<\/\2>}gsi)
{
	my $Paragraph_No=$1;

	my $Content=$3;

	
		

	if($Content=~m{(<err font)}gsi)
	{
		my $cnum = index($Content, "$1") + 1;
	
	
#$Err="1";
#push(@Error,"\~Para No:$Paragraph_No Col No:$cnum Symbol font entity found.");
	}
}




my $Final_Error=join("\n",@Error);

my $Final_E1=$Final_Error;





if($Final_E1 eq "")
{
	$Final_Error="~Para No:1 Col No:1 Warning: No Validation error found";
}

$Final_Error=~s{\n{1,}}{\n}gsi;




my @E=split("\n",$Final_Error);

my $C_ount="1";
my @W;
foreach my $Value(@E)
{
	$Value=~s{\'}{}gsi;

	$Value=~s{\"}{}gsi;

	
	
	$Value=~s{Para No\:(.*?) Col No\:(\d+)(.*?) (.*)$}{}gsi;


	
	my $E_tag="\{\"ID\" : \"$C_ount\",\"severity\" : \"ERROR\",\"message\" : \"$3 $4\",\"additionalLocations\" : 0,\"locations\" : \[ \{\"path\" \: \"$1\",\"line\" : 1,\"column\" : \"$2\",\"context\" \: \"Word\"\} \]\}";

	$E_tag=~s{\"ERROR\",\"message\" : \"(\s*)Warning\:}{\"WARNING\",\"message\" \: \"Warning\:}gsi;

	$E_tag=~s{\"ERROR\",\"message\" \: \" \"\,}{\"WARNING\",\"message\" \: \"Warning\:}gsi;

	

	push(@W,$E_tag);
	
	$C_ount++;
}

my $Final_Json_Error=join(",",@W);



my $Log_File1=$Log_File;

$Log_File1=~s{\.log}{\.json}gsi;

unlink("$Log_File1");


if($Final_Json_Error ne "")
{

open (XML1, ">$Log_File1") || die "Can't create XML file '$Log_File': $!\n";
{
 
       
    print XML1 "\[$Final_Json_Error\]";
}
close(XML1);

}

$Final_Error=~s{Unwanted style math\/ found}{Check the math equation format}gsi;

my $Final_E11=$Final_Error;



if($Final_E11 eq "")
{
	$Final_Error="~Para No:1 Col No:1 No Validation error found";
}

exit(0);

my @Html_Error=split("~",$Final_Error);

my $Log_File1=$Log_File;

$Log_File1=~s{\.log}{\.err}gsi;

unlink("$Log_File1");


if($Final_Error ne "")
{

open (XML1, ">$Log_File") || die "Can't create XML file '$Log_File': $!\n";
{
 
       
    print XML1 $Final_Error;
}
close(XML1);



my @suffixes=(".log",".xml");
my $Log_FileName=basename($Log_File, @suffixes);





copy("$Log_File","\\\\j-fs01\\OUP_Journals-L\\Production\\01_Tools\\FL_Validation\\$Log_FileName\-Time$Year1.log");

if($Err eq "1")
{

open (XML, ">$Log_File1") || die "Can't create XML file '$Log_File1': $!\n";
{
 
       
    print XML "";
}
close(XML);
	
}

my @Warning;
my @Err;

foreach my $Value(@Html_Error)
{
	my $Warnings=$Value;
	my $Error=$Value;
	

	if($Warnings=~m{Warning\:}gsi)
	{
		push(@Warning,$Value);
	}
	else
	{
		push(@Err,$Value);
	}
			  


}

my $Final_E=join("\n",@Err);

my @Lin=split("\n",$Final_E);

my $Final_E111=join("\n",@Warning);

my @Lin1=split("\n",$Final_E111);




my @Errors;
my @Errors1;

foreach my $Value(@Lin)
{
	$Value="<tr align=\"left\" bgcolor=\"#ffb3b3\"><td style=\"word-wrap: break-word\"><b>$Value</b><\/td><\/tr>";

	push(@Errors,$Value);
}

my $Final_Error1=join("\n",@Errors);

my @Err1;

if($Final_Error1 ne "")
{
	
$Final_Error1="<br/><br/><table rules=\"rows\" style=\"width:100\%\">\n<tr align=\"center\" size=\"30\" bgcolor=\"#FFFF00\"><td colspan=\"2\"><font size=\"5\">Style Validation Error</font></td></tr>$Final_Error1<\/table>";

push(@Err1,$Final_Error1);
}

foreach my $Value(@Lin1)
{
	$Value="<tr align=\"left\" bgcolor=\"#ffb3b3\"><td style=\"word-wrap: break-word\"><b>$Value</b><\/td><\/tr>";

	push(@Errors1,$Value);
}

my $Final_Error2=join("\n",@Errors1);
if($Final_Error2 ne "")
{
	
$Final_Error2="<br/><br/><table rules=\"rows\" style=\"width:100\%\">\n<tr align=\"center\" size=\"30\" bgcolor=\"#FFFF00\"><td colspan=\"2\"><font size=\"5\">Style Validation Warning</font></td></tr>$Final_Error2<\/table>";

push(@Err1,$Final_Error2);
}



my $Final_E=join("\n",@Err1);




my $HTML_Err_File=$Log_File;

$HTML_Err_File=~s{\.log}{\.html}gsi;

if($Final_E ne "")
{

$Final_E="<html><head><style>table,th,td{font-family: \"Times New Roman\", \"Times\", sans-serif; border:1px solid black; padding: 10px; height:35px;}</style></head><body>$Final_E<\/body><\/html>";

open (XML, ">$HTML_Err_File") || die "Can't create XML file '$HTML_Err_File': $!\n";
{
 
       
    print XML $Final_E;
}
close(XML);
}




copy("$HTML_Err_File","\\\\j-fs01\\OUP_Journals-L\\Production\\01_Tools\\FL_Validation\\$Log_FileName\-Time$Year1.html");

}



sub Table
{
	my $Table=shift;

	$Table=~s{<tgroup ([^\>]+)\>}{}gsi;

	$Table=~s{<colspec ([^\>]+)\>}{}gsi;

	$Table=~s{<tbody>(.*?)<\/tbody>}{$1}gsi;

	$Table=~s{<row>}{$1}gsi;
	

	$Table=~s{\n<\/entry>}{<\/entry>}gsi;

	$Table=~s{<\/tgroup>}{}gsi;

	$Table=~s{<tgroup\/>}{}gsi;
	
	return $Table;
}

sub CleanUp
{
	my $clean=shift;
	
	while($clean=~m{<\/(\w+)><(\w+)\/><(\w+)>}gs)
	{
		
	if($1 eq $2 && $1 eq $3)
	{
		$clean=~s{<\/$1><$1\/><$1>}{ }gsi;
	}
}

        while($clean=~m{<\/(\w+)><(\w+)\/>(\s+)<(\w+)>}gs)
	{
		
	if($1 eq $2 && $1 eq $4)
	{
		$clean=~s{<\/$1><$1\/>$3<$1>}{ }gsi;
	}
	}
	while($clean=~m{<\/(\w+)><(\w+)>}gs)
   	{
   		
	if ($1 eq $2)
	{
		
		$clean=~s{<\/$1><$2>}{}si;
	}
			
	}
	while($clean=~m{<\/(\w+)> <(\w+)>}gs)
	{
		
	if ($1 eq $2)
	{
		
		$clean=~s{<\/$1> <$2>}{ }si;
		
	}
			
	}
	while($clean=~m{<(\w+)><\/(\w+)>}gs)
	{
		
	if ($1 eq $2)
	{
		
		$clean=~s{(<$1>)(<\/$2>)}{}si;
		
	}
			
	}

	
	return $clean;
}

sub lineno
{
	my ($pre) = @_;
	my $lno = $pre =~ s/\n/\n/gs;
	$pre =~ /\n$/ ? $pre = "" :  $pre =~ s/^.+?\n([^\n]+)$/$1/gs;
	my $linesp=$lno+1;
	my $colsp=length($pre)+1; #=length($pre)+1;
	if(length($linesp)<=6)
	{
		$linesp=substr("",0,6-length($linesp)).$linesp;
	}
	if(length($colsp)<=6)
	{
		$colsp=substr("",0,6-length($colsp)).$colsp;
	}
	#return "$XML_File [".$linesp.":".$colsp."]   ";
	return "$linesp";
}


sub CleanUp
{
	my $clean=shift;
	#$clean=~s{<corresp>(.*?)<\/corresp>}{$1}gsi;
	$clean=~s{<NG\-}{<}gsi;
	$clean=~s{<\/NG\-}{<\/}gsi;
	$clean=~s{<br\/>}{\n}gsi;
	$clean=~s{<br \/>}{\n}gsi;
	$clean=~s{\n{1,}}{\n}gsi;
	$clean=~s{ {1,}}{ }gsi;
	$clean=~s{ <\/italic>}{<\/italic> }gsi;
	$clean=~s{ <\/bold>}{<\/bold> }gsi;
	$clean=~s{ <\/sup>}{<\/sup> }gsi;
	$clean=~s{ <\/sub>}{<\/sub> }gsi;
	$clean=~s{<para>(.*?)<\/para>}{<p>$1<\/p>}gsi;
	$clean=~s{<para\/>}{}gsi;
	$clean=~s{<art\-title>}{<arttitle>}gsi;
	$clean=~s{<\/art\-title>}{<\/arttitle>}gsi;
	$clean=~s{<kwd\-title>}{<kwdtitle>}gsi;
	$clean=~s{<\/kwd\-title>}{<\/kwdtitle>}gsi;
	$clean=~s{<publisher-loc>}{<publisherloc>}gsi;
	$clean=~s{<\/publisher-loc>}{<\/publisherloc>}gsi;
	$clean=~s{<publisher-name>}{<publishername>}gsi;
	$clean=~s{<\/publisher-name>}{<\/publishername>}gsi;
	$clean=~s{\.</page>}{</page>.}gsi;

	
	#$clean=~s{<allcaps>}{}gsi;
	#$clean=~s{<\/allcaps>}{}gsi;
	#$clean=~s{<allcaps\/>}{}gsi;
	$clean=~s{<allcapsbold>}{}gsi;
	$clean=~s{<\/allcapsbold>}{}gsi;
	$clean=~s{<allcapsbold\/>}{}gsi;
	$clean=~s{<p\/>}{}gsi;

	$clean=~s{<contrib contrib-type="author" corresp="no">(.*?)<\/contrib>}{<contribN>$1<\/contribN>}gsi;
	$clean=~s{<contrib contrib-type="author" corresp="yes">(.*?)<\/contrib>}{<contribY>$1<\/contribY>}gsi;

	#$clean=~s{<contrib contrib-type=\"author non\-byline\" corresp=\"no\">(.*?)<\/contrib>}{<contribAN>$1<\/contribAN>}gsi;
	#$clean=~s{<contrib contrib-type="author non\-byline" corresp=\"yes\">(.*?)<\/contrib>}{<contribAY>$1<\/contribAY>}gsi;
	

	
	$clean=~s{<sup><footnote>}{}gsi;
	$clean=~s{<\/footnote><\/sup>}{}gsi;
	$clean=~s{<sup\/>}{}gsi;
	$clean=~s{<xname\/>}{}gsi;
	$clean=~s{<fmaucollab\/>}{}gsi;
	
	while($clean=~m{<\/(\w+)><(\w+)\/><(\w+)>}gs)
	{
		
	if($1 eq $2 && $1 eq $3)
	{
		$clean=~s{<\/$1><$1\/><$1>}{ }gsi;
	}
}

        while($clean=~m{<\/(\w+)><(\w+)\/>(\s+)<(\w+)>}gs)
	{
		
	if($1 eq $2 && $1 eq $4)
	{
		$clean=~s{<\/$1><$1\/>$3<$1>}{ }gsi;
	}
	}
	while($clean=~m{<\/(\w+)><(\w+)>}gs)
   	{
   		
	if ($1 eq $2)
	{
		
		$clean=~s{<\/$1><$2>}{}si;
	}
			
	}
	while($clean=~m{<\/(\w+)> <(\w+)>}gs)
	{
		
	if ($1 eq $2)
	{
		
		$clean=~s{<\/$1> <$2>}{ }si;
		
	}
			
	}
	while($clean=~m{<(\w+)><\/(\w+)>}gs)
	{
		
	if ($1 eq $2)
	{
		
		$clean=~s{(<$1>)(<\/$2>)}{}si;
		
	}
			
	}

	$clean=~s{<arttitle>}{<art\-title>}gsi;
	$clean=~s{<\/arttitle>}{<\/art\-title>}gsi;
	$clean=~s{<kwdtitle>}{<kwd\-title>}gsi;
	$clean=~s{<\/kwdtitle>}{<\/kwd\-title>}gsi;
	$clean=~s{<publisherloc>}{<publisher-loc>}gsi;
	$clean=~s{<\/publisherloc>}{<\/publisher-loc>}gsi;
	$clean=~s{<publishername>}{<publisher-name>}gsi;
	$clean=~s{<\/publishername>}{<\/publisher-name>}gsi;
	$clean=~s{<bold> <\/bold>}{ }gsi;
	$clean=~s{<sup> <\/sup>}{ }gsi;
	$clean=~s{<italic> <\/italic>}{ }gsi;
	$clean=~s{<\/bold> <bold>}{ }gsi;
	$clean=~s{<\/bold><bold>}{}gsi;
	$clean=~s{<\/italic> <italic>}{ }gsi;
	$clean=~s{<\/italic><italic>}{}gsi;
	$clean=~s{<bold> }{ <bold>}gsi;
	$clean=~s{<italic> }{ <italic>}gsi;
	$clean=~s{ <\/italic> }{<\/italic> }gsi;
	$clean=~s{<authorChar>}{<author>}gsi;
	$clean=~s{<\/authorChar>}{<\/author>}gsi;
	$clean=~s{<authorChar\/>}{}gsi;
	$clean=~s{</bold></URL><bold>\.</bold>}{</bold></URL><bold>\.<\/bold1>}gsi;
	$clean=~s{<bold>([\.\,\:\;\)\(]?)<\/bold>}{$1}gsi;
	$clean=~s{<italic>([\.\,\:\;\)\(]?)<\/italic>}{$1}gsi;
	$clean=~s{<\/bold1>}{<\/bold>}gsi;
	$clean=~s{<contribN>(.*?)<\/contribN>}{<contrib contrib-type="author" corresp="no">$1<\/contrib>}gsi;
	$clean=~s{<contribY>(.*?)<\/contribY>}{<contrib contrib-type="author" corresp="yes">$1<\/contrib>}gsi;
	$clean=~s{<contribAN>(.*?)<\/contribAN>}{<contrib contrib-type="author non\-byline" corresp="no">$1<\/contrib>}gsi;
	$clean=~s{<contribAY>(.*?)<\/contribAY>}{<contrib contrib-type="author non\-byline" corresp="yes">$1<\/contrib>}gsi;

	
	
	
	$clean=~s{\n{1,}}{\n}gsi;
	return $clean;
}


sub Aff_Xref
{
	my $Xref=shift;

	

	$Xref=~s{\,}{<\/affxref>\,<affxref>}gsi;
	$Xref=~s{\–}{<\/affxref>\–<affxref>}gsi;

	
	
	return $Xref;
}

sub Tabfn_Xref
{
	my $Xref=shift;

	

	$Xref=~s{\,}{<\/tabfnxref>\,<tabfnxref>}gsi;
	$Xref=~s{\–}{<\/tabfnxref>\–<tabfnxref>}gsi;
	$Xref=~s{\,}{<\/tabfnxrefonline>\,<tabfnxrefonline>}gsi;
	$Xref=~s{\–}{<\/tabfnxrefonline>\–<tabfnxrefonline>}gsi;

	
	
	return $Xref;
}

sub Bib_xref
{
	my $Xref=shift;

	

	$Xref=~s{\–}{\&ndash;}gsi;

	
	
	$Xref=~s{<sup>}{}gsi;
	$Xref=~s{<\/sup>}{}gsi;
	if($Xref=~m{^(\d+)\,}gsi)
	{
		$Xref=~s{^(.*?)$}{&Xref_Comma($1)}gesi;
	}
	elsif($Xref=~m{^\((\d+)\,}gsi)
	{
		$Xref=~s{^\((.*?)$}{"\(".&Xref_Comma($1)}gesi;
	}
	elsif($Xref=~m{^\[(\d+)\,}gsi)
	{
		$Xref=~s{^\[(.*?)$}{"\[".&Xref_Comma($1)}gesi;
	}
	elsif($Xref=~m{^(\d+)\&ndash;(\d+)}gsi)
	{
		$Xref=~s{^(\d+)\&ndash;(\d+)}{&xref($1,$2)}gesi;
	}
	
	elsif($Xref=~m{^(\d+)\-(\d+)}gsi)
	{
		$Xref=~s{^(\d+)\-(\d+)}{&xref_hyphen($1,$2)}gesi;
	}
	elsif($Xref=~m{^\((\d+)\&ndash;(\d+)}gsi)
	{
		$Xref=~s{^\((\d+)\&ndash;(\d+)}{"\(".&xref($1,$2)}gesi;
	}
	elsif($Xref=~m{^\((\d+)\-(\d+)}gsi)
	{
		$Xref=~s{^\((\d+)\-(\d+)}{"\(".&xref_hypen($1,$2)}gesi;
	}
	elsif($Xref=~m{^\[(\d+)\&ndash;(\d+)}gsi)
	{
		$Xref=~s{^\[(\d+)\&ndash;(\d+)}{"\[".&xref($1,$2)}gesi;
	}
	elsif($Xref=~m{^\[(\d+)\-(\d+)}gsi)
	{
		$Xref=~s{^\[(\d+)\-(\d+)}{"\[".&xref_hyphen($1,$2)}gesi;
	}

	if($Xref=~m{^(\d+)$}gsi)
	{
		$Xref=~s{^(.*?)$}{&Xref_Comma($1)}gesi;
	}
	if($Xref=~m{^\((\d+)\)$}gsi)
	{
		$Xref=~s{^\((.*?)\)$}{"\(".&Xref_Comma($1)."\)"}gesi;
	}
	if($Xref=~m{^\[(\d+)\]$}gsi)
	{
		
		
		$Xref=~s{^\[(.*?)\]$}{"\[".&Xref_Comma($1)."\]"}gesi;
		
	}
	if($Xref=~m{(\d+)\&ndash;(\d+)}gsi)
	{
		
		$Xref=~s{(\d+)\&ndash;(\d+)}{&xref($1,$2)}gesi;
	}
	

	
	if($Xref=~m{<\/xref>(\,?)(\d+)(.*?)(\)?)(\]?)}gsi)
	{
		
		
		$Xref=~s{<\/xref>(\,?)(\d+)(.*?)(\)?)(\]?)}{"<\/xref>$1".&Xref_Comma($2.$3)."$4$5"}gesi;
		
	}
	


	
	#$Xref=~s{^(.*?)$}{<sup>$1<\/sup>}gsi;

	if($Xref!~m{<xref}gsi)
	{
		$Xref="<bibxref>$Xref<\/bibxref>";
	}

	
	
	return $Xref;
}


sub Bib_xref_sup
{
	my $Xref=shift;

	
	
	if($Xref=~m{^(\d+)\,}gsi)
	{
		$Xref=~s{^(.*?)$}{&Xref_Comma($1)}gesi;
	}
	elsif($Xref=~m{^\((\d+)\,}gsi)
	{
		$Xref=~s{^\((.*?)$}{"\(".&Xref_Comma($1)}gesi;
	}
	elsif($Xref=~m{^\[(\d+)\,}gsi)
	{
		$Xref=~s{^\[(.*?)$}{"\[".&Xref_Comma($1)}gesi;
	}
	elsif($Xref=~m{^(\d+)\&ndash;(\d+)}gsi)
	{
		$Xref=~s{^(\d+)\&ndash;(\d+)}{&xref($1,$2)}gesi;
	}
	elsif($Xref=~m{(\d+)\&ndash;(\d+)$}gsi)
	{
		$Xref=~s{(\d+)\&ndash;(\d+)$}{&xref($1,$2)}gesi;
	}
	elsif($Xref=~m{^\((\d+)\&ndash;(\d+)\)}gsi)
	{
		$Xref=~s{^\((\d+)\&ndash;(\d+)\)}{"\(".&xref($1,$2)."\)"}gesi;
	}
	elsif($Xref=~m{^\[(\d+)\&ndash;(\d+)\]}gsi)
	{
		$Xref=~s{^\[(\d+)\&ndash;(\d+)\]}{"\[".&xref($1,$2)."\]"}gesi;
	}


	
	if($Xref=~m{^(\d+)$}gsi)
	{
		$Xref=~s{^(.*?)$}{&Xref_Comma($1)}gesi;
	}
	if($Xref=~m{^\((\d+)\)$}gsi)
	{
		$Xref=~s{^\((.*?)\)$}{"\(".&Xref_Comma($1)."\)"}gesi;
	}
	if($Xref=~m{^\[(\d+)\]$}gsi)
	{
		$Xref=~s{^\[(.*?)\]$}{"\[".&Xref_Comma($1)."\]"}gesi;
	}
	
	elsif($Xref=~m{^\((\d+)\&ndash;(\d+)\)}gsi)
	{
		$Xref=~s{^\((\d+)\&ndash;(\d+)\)}{"\(".&xref($1,$2)."\)"}gesi;
	}
	elsif($Xref=~m{(\d+)\&ndash;(\d+)}gsi)
	{
		$Xref=~s{(\d+)\&ndash;(\d+)}{&xref($1,$2)}gesi;
	}

	if($Xref=~m{(\d+)\,}gsi)
	{
		$Xref=~s{(\d+)\,}{&Xref_Comma($1).","}gesi;
	}
	if($Xref=~m{(\d+)$}gsi)
	{
		$Xref=~s{(\d+)$}{&Xref_Comma($1)}gesi;
	}

	if($Xref=~m{(\d+)\]$}gsi)
	{
		$Xref=~s{(\d+)\]$}{&Xref_Comma($1)."\]"}gesi;
	}

	if($Xref=~m{(\d+)\)$}gsi)
	{
		$Xref=~s{(\d+)\)$}{&Xref_Comma($1)."\)"}gesi;
	}
	
	if($Xref!~m{<xref}gsi)
	{
		$Xref=~s{^(.*?)$}{<bibxref>$1<\/bibxref>}si;
	}

	
	
	return $Xref;
}

sub Xref_Comma
   
{
	my $Xref=shift;

	

	my @Comma=split(",",$Xref);
	my @Com_Split;
	foreach my $Comma_Value(@Comma)
	{
		my $Comma_Valu=$Comma_Value;
		$Comma_Value=~s{\s}{}si;
		
		$Comma_Value="<xref ref-type=\"bibr\" rid=\"CIT000$Comma_Value\">$Comma_Valu<\/xref>";

		push(@Com_Split,$Comma_Value);
		
	}

	my $Final_Value=join(",",@Com_Split);
	$Final_Value=~s{CIT([0])([0])([0])([0-9][0-9])}{CIT$2$3$4}gsi;

	$Final_Value=~s{CIT([0])([0])([0])([0])([0-9][0-9])}{CIT$3$4$5}gsi;

	$Final_Value=~s{CIT([0])([0])([0-9][0-9][0-9])}{CIT$1$3}gsi;

	
	
	$Final_Value=~s{<xref ref-type=\"bibr\" rid=\"([^\"]+)\">(\d+)\&ndash\;(\d+)<\/xref>}{&xref($2,$3)}gesi;
	$Final_Value=~s{<xref ref-type=\"bibr\" rid=\"([^\"]+)\">(\s?)(\d+)\&ndash\;(\d+)<\/xref>}{"$2".&xref($3,$4)}gesi;
	$Final_Value=~s{<xref ref-type=\"bibr\" rid=\"([^\"]+)\">(\d+)\&ndash\;(\d+)\]<\/xref>}{&xref($2,$3)."\]"}gesi;
	$Final_Value=~s{<xref ref-type=\"bibr\" rid=\"([^\"]+)\">(\s?)(\d+)\&ndash\;(\d+)\]<\/xref>}{"$2".&xref($3,$4)."\]"}gesi;
	$Final_Value=~s{<xref ref-type=\"bibr\" rid=\"([^\"]+)\">(\d+)\&ndash\;(\d+)\)<\/xref>}{&xref($2,$3)."\)"}gesi;
	$Final_Value=~s{<xref ref-type=\"bibr\" rid=\"([^\"]+)\">(\s?)(\d+)\&ndash\;(\d+)\)<\/xref>}{"$2".&xref($3,$4)."\)"}gesi;


	$Final_Value=~s{<xref ref-type=\"bibr\" rid=\"([^\"]+)\">(\d+)\-(\d+)<\/xref>}{&xref_hyphen($2,$3)}gesi;
	$Final_Value=~s{<xref ref-type=\"bibr\" rid=\"([^\"]+)\">(\s?)(\d+)\-(\d+)<\/xref>}{"$2".&xref_hyphen($3,$4)}gesi;
	$Final_Value=~s{<xref ref-type=\"bibr\" rid=\"([^\"]+)\">(\d+)\-(\d+)\]<\/xref>}{&xref_hyphen($2,$3)."\]"}gesi;
	$Final_Value=~s{<xref ref-type=\"bibr\" rid=\"([^\"]+)\">(\s?)(\d+)\-(\d+)\]<\/xref>}{"$2".&xref_hyphen($3,$4)."\]"}gesi;
	$Final_Value=~s{<xref ref-type=\"bibr\" rid=\"([^\"]+)\">(\d+)\-(\d+)\)<\/xref>}{&xref_hyphen($2,$3)."\)"}gesi;
	$Final_Value=~s{<xref ref-type=\"bibr\" rid=\"([^\"]+)\">(\s?)(\d+)\-(\d+)\)<\/xref>}{"$2".&xref_hyphen($3,$4)."\)"}gesi;

	
	
	return $Final_Value;
	
}

sub Xref_Comma_bracket
{
	my $Xref=shift;

	my @Comma=split(",",$Xref);
	my @Com_Split;
	foreach my $Comma_Value(@Comma)
	{
		my $Comma_Valu=$Comma_Value;
		$Comma_Value=~s{\s}{}si;
		$Comma_Value="<xref ref-type=\"bibr\" rid=\"CIT000$Comma_Value\">\($Comma_Valu\)<\/xref>";

		push(@Com_Split,$Comma_Value);
		
	}

	
	
	my $Final_Value=join(",",@Com_Split);

	$Final_Value=~s{CIT([0])([0])([0])([0-9][0-9])}{CIT$2$3$4}gsi;

	$Final_Value=~s{CIT([0])([0])([0])([0])([0-9][0-9])}{CIT$3$4$5}gsi;

	$Final_Value=~s{CIT([0])([0])([0-9][0-9][0-9])}{CIT$1$3}gsi;

	$Final_Value=~s{<xref ref-type=\"bibr\" rid=\"([^\"]+)\">(\(?)(\d+)\&ndash\;(\d+)(\)?)<\/xref>}{&xref($3,$4,$5,$6)}gesi;
		
	return $Final_Value;
	
}

sub xref
{
	my $startx=shift;
	my $endx=shift;
	$startx=~s{CIT}{}gsi;
	$endx=~s{CIT}{}gsi;
	
	my @Array_Id;

	my $xref;
	$startx=~s{^([0]+)(\d+)$}{$2}gsi;
	$endx=~s{^([0]+)(\d+)$}{$2}gsi;
	
	for(my $i=$startx;$i<=$endx;$i++)
	{
		push(@Array_Id,"CIT000$i");
	}
				
	my $Final_Id=join(" ",@Array_Id);

	$Final_Id=~s{CIT([0])([0])([0])([0-9][0-9])}{CIT$2$3$4}gsi;

	$Final_Id=~s{CIT([0])([0])([0])([0])([0-9][0-9])}{CIT$3$4$5}gsi;

	$Final_Id=~s{CIT([0])([0])([0-9][0-9][0-9])}{CIT$1$3}gsi;

	

		if($Tmp=~m{<publisher>\n<publisher\-name>IOP Publishing([^\<]*)\<\/publisher\-name>}si)
		{
		$xref="<xref ref-type=\"bibr\" rid=\"CIT000$startx\">$startx<\/xref>\&ndash\;<xref ref-type=\"bibr\" rid=\"CIT000$endx\">$endx<\/xref>";
		$xref=~s{CIT([0])([0])([0])([0-9][0-9])}{CIT$2$3$4}gsi;

		$xref=~s{CIT([0])([0])([0])([0])([0-9][0-9])}{CIT$3$4$5}gsi;

		$xref=~s{CIT([0])([0])([0-9][0-9][0-9])}{CIT$1$3}gsi;

		}
		else
		{
			$xref="<xref ref-type=\"bibr\" rid=\"$Final_Id\">$startx\&ndash\;$endx<\/xref>";
		}


	
		
	return $xref;

	
}

sub Reference
{
	my $reference=shift;

	
	

	
	
	$reference=~s{<\/query><query>}{}gsi;	


	
	
	$reference=~s{\[\[\[del\]\]\]}{<del>}gsi;
	$reference=~s{\[\[\[\/del\]\]\]}{<\/del>}gsi;

	$reference=~s{\[\[\[ins\]\]\]}{<ins>}gsi;
	$reference=~s{\[\[\[\/ins\]\]\]}{<\/ins>}gsi;

	
	
	$reference=~s{\&lt;institution\&gt;}{<institution>}gsi;

	$reference=~s{\&lt;\/institution\&gt;}{<\/institution>}gsi;
	
	$reference=~s{(<del>([^\>]+)\<\/del>)(<Refnumber>)}{$3$1}gsi;

	if($Tmp=~m{<publisher>\n<publisher-name>Lippincott Williams \&amp\; Wilkins</publisher-name>}si)
	{
	
	$reference=~s{\[}{lwwopen}gsi;

	$reference=~s{\]}{lwwclose}gsi;

	$reference=~s{<ins>}{\[\[\[ins\]\]\]}gsi;
	$reference=~s{<\/ins>}{\[\[\[\/ins\]\]\]}gsi;

	
	}
	
	
	$reference=~s{<del>}{\[\[\[del\]\]\]}gsi;
	$reference=~s{<\/del>}{\[\[\[\/del\]\]\]}gsi;


	
	
	$reference=~s{<\/Refnumber>([^\<]+)\<Refnumber>}{$1}gsi;

	$reference=~s{<\/Refnumber>([^\<]+)\<Refnumber>}{$1}gsi;

	$reference=~s{<\/Refnumber> }{<\/Refnumber>}gsi;

	$reference=~s{<\/refnumber><refnumber>}{}gsi;

	$reference=~s{<Refnumber>([^\<]+)\<\/Refnumber>\[\[\[ins\]\]\] \[\[\[\/ins\]\]\]}{<Refnumber>$1<\/Refnumber>}gsi;
	
	$reference=~s{<Refnumber\/>}{}gsi;

	$reference=~s{<(\w+)\/>}{}gsi;
		
	$reference=~s{^(\d+)\.}{<Refnumber>$1\.<\/Refnumber>}gsi;

	$reference=~s{^(\d+)\[\[\[del\]\]\](\.?)(\s?)\[\[\[\/del\]\]\]}{<label>\[\[\[del\]\]\]$1$2\[\[\[\/del\]\]\]<\/label>}gsi;

	$reference=~s{^(\d+)\[\[\[ins\]\]\](\.?)(\s?)\[\[\[\/ins\]\]\]}{<label>\[\[\[ins\]\]\]$1$2\[\[\[\/ins\]\]\]<\/label>}gsi;
	$reference=~s{^(\d+)(\.)(\s)}{<label>$1$2<\/label>}gsi;

	
	$reference=~s{^\[(\d+)\](\.?)(\s?)}{<label>\[$1\]$2<\/label>}gsi;

	
	

	$reference=~s{^\[(\d+)\]\[\[\[del\]\]\](\.?)(\s?)\[\[\[\/\del\]\]\]}{<label>\[$1\[\[\[del\]\]\]\]$2\[\[\[\/del\]\]\]<\/label>}gsi;

	$reference=~s{^\[(\d+)\]\[\[\[ins\]\]\](\.?)(\s?)\[\[\[\/ins\]\]\]}{<label>\[$1\[\[\[ins\]\]\]\]$2\[\[\[\/ins\]\]\]<\/label>}gsi;
	
	$reference=~s{<Refnumber>(\d+)<\/Refnumber>\.}{<Refnumber>$1\.<\/Refnumber>}gsi;
	
	$reference=~s{^<sup>(\d+)(\.?)<\/sup>}{<label><sup>$1$2<\/sup><\/label>}gsi;

	

	$reference=~s{<Refnumber>(\d+)<\/Refnumber>\[\[\[del\]\]\](\.?)(\s?)\[\[\[\/del\]\]\]}{<label>$1\[\[\[del\]\]\]$2\[\[\[\/del\]\]\]<\/label>}gsi;


	$reference=~s{<Refnumber>(\d+)\[\[\[ins\]\]\](\.?)(\s?)\[\[\[\/ins\]\]\]<\/Refnumber>}{<label>$1\[\[\[ins\]\]\]$2\[\[\[\/ins\]\]\]<\/label>}gsi;

	
	$reference=~s{<Refnumber>(\d+)(\.?)(\s?)<\/Refnumber>}{<label>$1$2<\/label>}gsi;

	
	
	$reference=~s{<Refnumber><sup>(\d+)(\.?)(\s?)<\/sup><\/Refnumber>}{<label><sup>$1$2<\/sup><\/label>}gsi;

	$reference=~s{<Refnumber>\[(\d+)\](\.?)(\s?)<\/Refnumber>}{<label>\[$1\]$2<\/label>}gsi;

	
	$reference=~s{^\[\[\[ins\]\]\](\d+)(\.?)(\s?)\[\[\[\/ins\]\]\]}{<label><ins>$1$2<\/ins><\/label>}gsi;

	$reference=~s{^\[\[\[del\]\]\](\d+)(\.?)(\s?)\[\[\[\/del\]\]\]}{<label><del>$1$2<\/del><\/label>}gsi;
	
	$reference=~s{^<refnumber>\[\[\[ins\]\]\](\d+)(\.?)(\s?)\[\[\[\/ins\]\]\]<\/refnumber>}{<label><ins>$1$2<\/ins><\/label>}gsi;

	$reference=~s{^<refnumber>\[\[\[del\]\]\](\d+)(\.?)(\s?)\[\[\[\/del\]\]\]<\/refnumber>}{<label><del>$1$2<\/del><\/label>}gsi;
	
	
	$reference=~s{^<refnumber>(.*?)<\/refnumber>}{<label>$1<\/label>}gsi;


	$reference=~s{^\&ast;<label>(.*?)<\/label>}{<label>\&ast;$1<\/label>}gsi;

	$reference=~s{<\/surname>(\[\[\[(\w+)\]\]\])}{$1<\/surname>}gsi;


	
	
	$reference=~s{<sc>(and)(\s?)<refauGivenName>([^\<]+)\</refauGivenName></sc>}{<sc>$1$2<\/sc><refauGivenName>$3</refauGivenName>}gsi;



	
	
	$reference=~s{<sc>([\.\,\:\;\s]?)(<ref(\w+)>([^\<]+)</ref(\w+)>)([\.\,\:\;\s]?)</sc>}{$1<ref$3><sc>$4<\/sc><\/ref$5>$6}gsi;

	
	
	$reference=~s{<\/surname>(\[\[\[\/(\w+)\]\]\])}{$1<\/surname>}gsi;


	$reference=~s{<\/given-names>(\[\[\[(\w+)\]\]\])}{$1<\/given-names>}gsi;
	
	$reference=~s{<\/given-names>(\[\[\[\/(\w+)\]\]\])}{$1<\/given-names>}gsi;

	$reference=~s{(\[\[\[\/(\w+)\]\]\])<surname>}{<surname>$1}gsi;

	$reference=~s{(\[\[\[\/(\w+)\]\]\])<given-names>}{<given-names>$1}gsi;

	
	$reference=~s{<\/surname>(\[\[\[\/(\w+)\]\]\])}{$1<\/surname>}gsi;
	
	$reference=~s{<\/given-names>(\[\[\[\/(\w+)\]\]\])}{$1<\/given-names>}gsi;
	
	
	$reference=~s{<Refnum\/>}{}gsi;

	$reference=~s{<bold\/>}{}gsi;

	$reference=~s{<bold>(\,?)(\s?)(and)(\s?)<\/bold>}{$1$2$3$4}gsi;

	

	$reference=~s{<bold>(\s?)([\.\,]+)(\s?)<\/bold>}{$1$2$3$4}gsi;

	$reference=~s{<italic>(\,?)(\s?)(and)(\s?)<\/italic>}{$1$2$3$4}gsi;

	

	$reference=~s{<italic>(\s?)([\.\,]+)(\s?)<\/italic>}{$1$2$3$4}gsi;

	
	$reference=~s{<refnumber>(.*?)<\/refnumber>}{$1}gsi;
	
	$reference=~s{<RefGivenname\/>}{}gsi;
	$reference=~s{<refauSurname\/>}{}gsi;

	$reference=~s{<refauGivenName>(\s+)<\/refauGivenName>}{$1}gsi;
	$reference=~s{<refauGivenName>(\s+)}{$1<refauGivenName>}gsi;

	
	
	if($Tmp=~m{<p content\-type=\"indent\">\&lt;IOP_Tex_Conversion\&gt;</p>}si)
	{
	
	$reference=~s{<refausurname>\s+<\/refausurname>}{ }gsi;
	$reference=~s{<refausurname>\,\s+}{\, <refausurname>}gsi;
	}
	else
	{
	$reference=~s{<refausurname>\s+<\/refausurname>}{}gsi;	
	}
	
	$reference=~s{<refauSurname>(.*?)<\/refauSurname>}{<surname>$1<\/surname>}gsi;
	

	$reference=~s{<refauGivenName>(.*?)<\/refauGivenName>}{<given-names>$1<\/given-names>}gsi;

	$reference=~s{<refpubdateYear>(.*?)<\/refpubdateYear>}{<year>$1<\/year>}gsi;

	$reference=~s{<refpubdateSeason>(.*?)<\/refpubdateSeason>}{<year>$1<\/year>}gsi;

	$reference=~s{<refpubdateDay>(.*?)<\/refpubdateDay>}{<year>$1<\/year>}gsi;

	$reference=~s{<refpubdatemonth>(.*?)<\/refpubdatemonth>}{<x>$1<\/x>}gsi;

	$reference=~s{\(<year>(\d+)<\/year>\)}{<year>\($1\)<\/year>}gsi;
	
	$reference=~s{<reftitleArticle>(.*?)<\/reftitleArticle>}{<article-title>$1<\/article-title>}gsi;

	$reference=~s{<refseriesTitle>(.*?)<\/refseriesTitle>}{<article-title><series>$1<\/series><\/article-title>}gsi;

	$reference=~s{<reftitleJournal>(.*?)<\/reftitleJournal>}{<source>$1<\/source>}gsi;

	$reference=~s{<reftitlethesis>(.*?)<\/reftitlethesis>}{<thesis-title>$1<\/thesis-title>}gsi;

	$reference=~s{<reftitleTransThesis>(.*?)<\/reftitleTransThesis>}{<thesis-title>$1<\/thesis-title>}gsi;

	$reference=~s{<reftitleTransThesis>(.*?)<\/reftitleTransThesis>}{<thesis-title>$1<\/thesis-title>}gsi;

	$reference=~s{<refvolumeNumber>(.*?)<\/refvolumeNumber>}{<volume>$1<\/volume>}gsi;

	$reference=~s{<refsupplement>(.*?)<\/refsupplement>}{<supplement>$1<\/supplement>}gsi;
	$reference=~s{<refpageFirst>(.*?)<\/refpageFirst>}{<fpage>$1<\/fpage>}gsi;

	$reference=~s{<refpageLast>(.*?)<\/refpageLast>}{<lpage>$1<\/lpage>}gsi;

	$reference=~s{<reftitleBook>(.*?)(\.?)<\/reftitleBook>}{<book\-title>$1<\/book\-title>$2}gsi;

	$reference=~s{<reftitleChapter>(.*?)<\/reftitleChapter>}{<article\-title>$1<\/article\-title>}gsi;

	$reference=~s{<refconferenceName>(.*?)<\/refconferenceName>}{<conf-name>$1<\/conf-name>}gsi;

	$reference=~s{<refconferencePlace>(.*?)<\/refconferencePlace>}{<conf-loc>$1<\/conf-loc>}gsi;

	$reference=~s{<refconferencedate>(.*?)<\/refconferencedate>}{<conf-date>$1<\/conf-date>}gsi;

	$reference=~s{<refpublisherName>(.*?)<\/refpublisherName>}{<publisher-name>$1<\/publisher-name>}gsi;

	$reference=~s{<refpublisherLocation>(.*?)<\/refpublisherLocation>}{<publisher-loc>$1<\/publisher-loc>}gsi;

	$reference=~s{<reftitlePatent>(.*?)<\/reftitlePatent>}{<source>$1<\/source>}gsi;

	$reference=~s{<refidPatentNumber>(.*?)<\/refidPatentNumber>}{<patent>$1<\/patent>}gsi;

	$reference=~s{<refidISBN>(.*?)<\/refidISBN>}{<isbn>$1<\/isbn>}gsi;

	$reference=~s{<refidISSN>(.*?)<\/refidISSN>}{<issn>$1<\/issn>}gsi;

	$reference=~s{<refauCollab>(\s?)(\;?)(\s?)(.*?)<\/refauCollab>}{$1$2$3<collab>$4<\/collab>}gsi;
	
	$reference=~s{<refauCollab>(.*?)<\/refauCollab>}{<collab>$1<\/collab>}gsi;

	$reference=~s{<refedCollab>(.*?)<\/refedCollab>}{<collab>$1<\/collab>}gsi;

	$reference=~s{<refguestedCollab>(.*?)<\/refguestedCollab>}{<collab>$1<\/collab>}gsi;
	
	$reference=~s{<Refedition>(.*?)<\/Refedition>}{<edition>$1<\/edition>}gsi;

	$reference=~s{<refissueNumber>(.*?)<\/refissueNumber>}{<issue>$1<\/issue>}gsi;

	$reference=~s{<refaccessDate>(.*?)<\/refaccessDate>}{<ref-comment>$1<\/ref-comment>}gsi;

	$reference=~s{<refidDOI>(.*?)<\/refidDOI>}{<pub-id pub-id-type=\"doi\">$1</pub-id>}gsi;

	$reference=~s{<refidPMID>(.*?)<\/refidPMID>}{<pub-id pub-id-type=\"pmid\">$1</pub-id>}gsi;

	$reference=~s{<reftitleWebsite>(.*?)<\/reftitleWebsite>}{<ref-comment>$1<\/ref-comment>}gsi;

	$reference=~s{<reftitletransbook>(.*?)<\/reftitletransbook>}{<trans-title>$1<\/trans-title>}gsi;
	
	$reference=~s{<reftitleTransJournal>(.*?)<\/reftitleTransJournal>}{<trans-source>$1<\/trans-source>}gsi;

	$reference=~s{<reftitleTransArticle>(.*?)<\/reftitleTransArticle>}{<trans-title>$1<\/trans-title>}gsi;

	
	$reference=~s{<refetal>(\s?)(.*?)<\/refetal>}{$1<etal>$2<\/etal>}gsi;

	
	
	
	$reference=~s{<refauSuffix>(.*?)<\/refauSuffix>}{<suffix>$1<\/suffix>}gsi;

	$reference=~s{<refedSuffix>(.*?)<\/refedSuffix>}{<suffix>$1<\/suffix>}gsi;

	$reference=~s{<suffix>(\s)}{$1<suffix>}gsi;


	
	$reference=~s{<sc>([\s\,\;\:\.]+)<\/sc>}{$1}gsi;


	
	
	$reference=~s{<bold>([\s\,\;\:\.]*)and(\s?)<\/bold>}{$1and$2}gs;

	$reference=~s{<bold>([\s\,\;\:\.]*)\&amp;(\s?)<\/bold>}{$1\&amp;$2}gs;

	

	$reference=~s{<given-names>([^\<]+)\</given-names>(\s?)</sc>}{<\/sc><given-names>$1</given-names>$2}gsi;

	my $IOP_Ref_Tmp3=$Tmp;
		
		if($IOP_Ref_Tmp3=~m{<p content\-type=\"indent\">\&lt;IOP_Tex_Conversion\&gt;</p>}si)
		{
			$reference=~s{<RefUrl>(\s?)(.*?)<\/RefUrl>}{<refcomments><uri xlink\:href=\"$2\">$2<\/uri><\/refcomments>}gsi;
			$reference=~s{<Url>(\s?)(.*?)<\/Url>}{<refcomments><uri xlink\:href=\"$2\">$2<\/uri><\/refcomments>}gsi;
		}

	
		
	$reference=~s{<RefUrl>(\s?)(.*?)<\/RefUrl>}{<uri xlink\:href=\"$2\">$2<\/uri>}gsi;

	$reference=~s{<reftitleTransWebsite>(\s?)(.*?)<\/reftitleTransWebsite>}{<uri xlink\:href=\"$2\">$2<\/uri>}gsi;
		
	$reference=~s{ (et al)(\.)(\,?)}{ <etal><italic>$1</italic><\/etal>$2$3}gsi;

	$reference=~s{<etal><italic>(et al)(\.)(\,?)<\/italic><\/etal>}{<etal><italic>$1<\/italic><\/etal>$2$3}gsi;
	
	$reference=~s{<italic>(et al)(\.)(\,?)<\/italic>}{<etal><italic>$1<\/italic><\/etal>$2$3}gsi;

	$reference=~s{<etal><bold><etal><italic>(et al)</italic></etal>\.</bold></etal>}{<etal><bold><italic>$1\.</italic></bold></etal>}gsi;

	$reference=~s{<etal><bold><etal><italic>(et al\.)</italic></etal></bold></etal>}{<etal><bold><italic>$1\.</italic></bold></etal>}gsi;

	$reference=~s{<etal><bold><italic>(et al)</italic></bold>\.</etal>}{<etal>$1\.</etal>}gsi;

	$reference=~s{<etal><bold><italic>(et al\.)</italic></bold></etal>}{<etal>$1</etal>}gsi;

	

	

	$reference=~s{<\/given-names>(\.)}{$1<\/given-names>}gsi;

	
	
	#$reference=~s{<surname>(.*?)<\/surname>(\s?)(\,?)(\.?)(\,?)(\s?)<given-names>(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><surname>$1<\/surname>$2$3$4$5$6<given-names>$7<\/given-names>$8$9$10$11$12<\/name>}gsi;

		
	$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<year>}{$1<person-group>$3<\/given-names><\/person-group>$4$5$6$7$8<year>}gsi;

	$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)(\(?)<year>}{$1<person-group>$3<\/given-names><\/person-group>$4$5$6$7$8$9<year>}gsi;

	
	
	$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/surname>(\s?)(\,?)(\.?)(\,?)(\s?)(\(?)<year>}{$1<person-group>$3<\/surname><\/person-group>$4$5$6$7$8$9<year>}gsi;

	
	$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<year>}{$1<person-group>$3<\/given-names><\/person-group>\[\[\[ins\]\]\]$4$5$6$7$8\[\[\[\/ins\]\]\]<year>}gsi;

	$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>\[\[\[del\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/del\]\]\]<year>}{$1<person-group>$3<\/given-names><\/person-group>\[\[\[del\]\]\]$4$5$6$7$8\[\[\[\/del\]\]\]<year>}gsi;



	
		$reference=~s{^(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<year>}{<person-group>$1<\/given-names><\/person-group>$2$3$4$5$6<year>}gsi;

		$reference=~s{^(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)(\(?)<year>}{<person-group>$1<\/given-names><\/person-group>$2$3$4$5$6$7<year>}gsi;

		#$reference=~s{^(.*?)<\/surname>(\s?)(\,?)(\.?)(\,?)(\s?)<year>}{<person-group>$1<\/surname><\/person-group>$2$3$4$5$6<year>}gsi;

		#$reference=~s{^(.*?)<\/surname>(\s?)(\,?)(\.?)(\,?)(\s?)(\(?)<year>}{<person-group>$1<\/surname><\/person-group>$2$3$4$5$6$7<year>}gsi;


		$reference=~s{^(.*?)<\/given-names>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<year>}{<person-group>$1<\/given-names><\/person-group><x>\[\[\[ins\]\]\]$2$3$4$5$6\[\[\[\/ins\]\]\]<\/x><year>}gsi;


		$reference=~s{^(.*?)<\/given-names>\[\[\[del\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/del\]\]\]<year>}{<person-group>$1<\/given-names><\/person-group><x>\[\[\[del\]\]\]$2$3$4$5$6\[\[\[\/del\]\]\]<\/x><year>}gsi;

		
		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)(\()<year>}{$1<person-group>$3<\/given-names><\/person-group>$4$5$6$7$8$9<year>}gsi;

		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)(\()<year>}{$1<person-group>$3<\/given-names><\/person-group>$4$5$6$7$8$9<year>}gsi;

			
		$reference=~s{^(.*?)<\/given-names>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)(\(?)\[\[\[\/ins\]\]\]<year>}{<person-group>$1<\/given-names><\/person-group><x>\[\[\[ins\]\]\]$2$3$4$5$6$7\[\[\[\/ins\]\]\]<\/x><year>}gsi;


		$reference=~s{^(.*?)<\/given-names>\[\[\[del\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)(\(?)\[\[\[\/del\]\]\]<year>}{<person-group>$1<\/given-names><\/person-group><x>\[\[\[del\]\]\]$2$3$4$5$6$7\[\[\[\/del\]\]\]<\/x><year>}gsi;

		
		
		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<article-title>}{$1<person-group>$3<\/given-names><\/person-group>$4$5$6$7$8$9<article-title>}gsi;

		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\:?)(\,?)(\s?)\[\[\[\/ins\]\]\]<article-title>}{$1<person-group>$3<\/given-names><\/person-group><x>\[\[\[ins\]\]\]$4$5$6$7$8$9\[\[\[\/ins\]\]\]<\/x><article-title>}gsi;


		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>\[\[\[del\]\]\](\s?)(\,?)(\.?)(\:?)(\,?)(\s?)\[\[\[\/del\]\]\]<article-title>}{$1<person-group>$3<\/given-names><\/person-group><x>\[\[\[del\]\]\]$4$5$6$7$8$9\[\[\[\/del\]\]\]<\/x><article-title>}gsi;

		
		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<source>}{$1<person-group>$3<\/given-names><\/person-group>$4$5$6$7$8<source>}gsi;

		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<source>}{$1<person-group>$3<\/given-names><\/person-group><x>\[\[\[ins\]\]\]$4$5$6$7$8\[\[\[\/ins\]\]\]<\/x><source>}gsi;


		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>\[\[\[del\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/del\]\]\]<source>}{$1<person-group>$3<\/given-names><\/person-group><x>\[\[\[del\]\]\]$4$5$6$7$8\[\[\[\/del\]\]\]<\/x><source>}gsi;

		
		$reference=~s{^(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<article-title>}{<person-group>$1<\/given-names><\/person-group>$2$3$4$5$6<article-title>}gsi;

		$reference=~s{^(.*?)<\/given-names>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<article-title>}{<person-group>$1<\/given-names><\/person-group><x>\[\[\[ins\]\]\]$2$3$4$5$6\[\[\[\/ins\]\]\]<\/x><article-title>}gsi;

		$reference=~s{^(.*?)<\/given-names>\[\[\[del\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/del\]\]\]<article-title>}{<person-group>$1<\/given-names><\/person-group><x>\[\[\[del\]\]\]$2$3$4$5$6\[\[\[\/del\]\]\]<\/x><article-title>}gsi;


		$reference=~s{<given\-names>(\[\[\[del\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/del\]\]\])<\/given\-names>}{$1}gsi;

		$reference=~s{<given\-names>(\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\])<\/given\-names>}{$1}gsi;
		
		
		

		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<collab>}{$1<person-group>$3<\/given-names><\/person-group>$4$5$6$7$8<collab>}gsi;

		

		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<collab>}{$1<person-group>$3<\/given-names><\/person-group><x>\[\[\[ins\]\]\]$4$5$6$7$8\[\[\[\/ins\]\]\]<\/x><collab>}gsi;


		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>\[\[\[del\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/del\]\]\]<collab>}{$1<person-group>$3<\/given-names><\/person-group><x>\[\[\[del\]\]\]$4$5$6$7$8\[\[\[\/del\]\]\]<\/x><collab>}gsi;

		
		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>(\s?)(\;?)(\.?)(\,?)(\s?)<collab>}{$1<person-group>$3<\/given-names><\/person-group>$4$5$6$7$8<collab>}gsi;


		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>\[\[\[ins\]\]\](\s?)(\;?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<collab>}{$1<person-group>$3<\/given-names><\/person-group><x>\[\[\[ins\]\]\]$4$5$6$7$8\[\[\[\/ins\]\]\]<\/x><collab>}gsi;


		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>\[\[\[del\]\]\](\s?)(\;?)(\.?)(\,?)(\s?)\[\[\[\/del\]\]\]<collab>}{$1<person-group>$3<\/given-names><\/person-group><x>\[\[\[del\]\]\]$4$5$6$7$8\[\[\[\/del\]\]\]<\/x><collab>}gsi;


		
		$reference=~s{^(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<collab>}{<person-group>$1<\/given-names><\/person-group>$2$3$4$5$6<collab>}gsi;

		
		
		$reference=~s{^(.*?)<\/given-names>\[\[\[ins\]\]\](\s?)(\;?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<collab>}{<person-group>$1<\/given-names><\/person-group><x>\[\[\[ins\]\]\]$2$3$4$5$6\[\[\[\/ins\]\]\]<\/x><collab>}gsi;

		$reference=~s{^(.*?)<\/given-names>\[\[\[del\]\]\](\s?)(\;?)(\.?)(\,?)(\s?)\[\[\[\/del\]\]\]<collab>}{<person-group>$1<\/given-names><\/person-group><x>\[\[\[del\]\]\]$2$3$4$5$6\[\[\[\/del\]\]\]<\/x><collab>}gsi;

			
		$reference=~s{^(.*?)<\/given-names>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<ref-comment>}{<person-group>$1<\/given-names><\/person-group><x>\[\[\[ins\]\]\]$2$3$4$5$6\[\[\[\/ins\]\]\]<\/x><ref-comment>}gsi;

		$reference=~s{^(.*?)<\/given-names>\[\[\[del\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/del\]\]\]<ref-comment>}{<person-group>$1<\/given-names><\/person-group><x>\[\[\[del\]\]\]$2$3$4$5$6\[\[\[\/del\]\]\]<\/x><ref-comment>}gsi;



		$reference=~s{^(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<ref-comment>}{<person-group>$1<\/given-names><\/person-group>$2$3$4$5$6<ref-comment>}gsi;

		$reference=~s{^(.*?)<\/given-names>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<ref-comment>}{<person-group>$1<\/given-names><\/person-group><x>\[\[\[ins\]\]\]$2$3$4$5$6\[\[\[\/ins\]\]\]<\/x><ref-comment>}gsi;

		$reference=~s{^(.*?)<\/given-names>\[\[\[del\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/del\]\]\]<ref-comment>}{<person-group>$1<\/given-names><\/person-group><x>\[\[\[ins\]\]\]$2$3$4$5$6\[\[\[\/ins\]\]\]<\/x><ref-comment>}gsi;

		
		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<ref-comment>}{$1<person-group>$3<\/given-names><\/person-group>$4$5$6$7$8<ref-comment>}gsi;

		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<ref-comment>}{$1<person-group>$3<\/given-names><\/person-group><x>\[\[\[ins\]\]\]$4$5$6$7$8\[\[\[\/ins\]\]\]<\/x><ref-comment>}gsi;

		$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>\[\[\[del\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/del\]\]\]<ref-comment>}{$1<person-group>$3<\/given-names><\/person-group><x>\[\[\[del\]\]\]$4$5$6$7$8\[\[\[\/del\]\]\]<\/x><ref-comment>}gsi;

		

$reference=~s{^(.*?)<\/suffix>\[\[\[ins\]\]\](\s?)(\.?)(\s?)(\(?)\[\[\[\/ins\]\]\]<year>}{<person-group>$1<\/suffix><x>$2$3<\/x><\/person-group><x>\[\[\[ins\]\]\]$4$5\[\[\[\/ins\]\]\]<\/x><year>}gsi;

$reference=~s{^(.*?)<\/suffix>\[\[\[del\]\]\](\s?)(\.?)(\s?)(\(?)\[\[\[\/del\]\]\]<year>}{<person-group>$1<\/suffix><x>$2$3<\/x><\/person-group><x>\[\[\[del\]\]\]$4$5\[\[\[\/del\]\]\]<\/x><year>}gsi;



$reference=~s{^(.*?)<\/suffix>(\s?)(\.?)(\s?)(\(?)<year>}{<person-group>$1<\/suffix><x>$2$3<\/x><\/person-group>$4$5<year>}gsi;

$reference=~s{^(.*?)<\/suffix>\[\[\[ins\]\]\](\s?)(\.?)(\s?)(\(?)\[\[\[\/ins\]\]\]<year>}{<person-group>$1<\/suffix><x>$2$3<\/x><\/person-group><x>\[\[\[ins\]\]\]$4$5\[\[\[\/ins\]\]\]<\/x><year>}gsi;

$reference=~s{^(.*?)<\/suffix>\[\[\[del\]\]\](\s?)(\.?)(\s?)(\(?)\[\[\[\/del\]\]\]<year>}{<person-group>$1<\/suffix><x>$2$3<\/x><\/person-group><x>\[\[\[del\]\]\]$4$5\[\[\[\/del\]\]\]<\/x><year>}gsi;

		
		
		$reference=~s{^(.*?)<\/given-names>(\s?)<ref-comment>(.*?)<\/ref-comment>(\s?)(\.?)(\s?)(\(?)<year>}{<person-group>$1<\/given-names>$2<etal>$3<\/etal><x>$4$5<\/x><\/person-group>$6$7<year>}gsi;

		
		#$reference=~s{^(<label>(.*?)<\/label>?)(.*?)<\/given-names>(\s?)<etal>(.*?)<\/etal>}{$1<person-group>$3<\/given-names>$4<etal>$5<\/etal><\/person-group>}gsi;

		
		
		$reference=~s{^(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<etal>(.*?)<\/etal>}{<person-group>$1<\/given-names>$2$3$4$5$6<etal>$7<\/etal><\/person-group>}gsi;

		$reference=~s{^(.*?)<\/given-names>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<etal>(.*?)<\/etal>}{<person-group>$1<\/given-names><x>\[\[\[ins\]\]\]$2$3$4$5$6\[\[\[\/ins\]\]\]<\/x><etal>$7<\/etal><\/person-group>}gsi;

		
		$reference=~s{^(.*?)<\/given-names>\[\[\[del\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/del\]\]\]<etal>(.*?)<\/etal>}{<person-group>$1<\/given-names>\[\[\[del\]\]\]$2$3$4$5$6\[\[\[\/del\]\]\]<etal>$7<\/etal><\/person-group>}gsi;


		$reference=~s{^(.*?)<\/given-names>\[\[\[del\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/del\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)<etal>(.*?)<\/etal>}{<person-group>$1<\/given-names>\[\[\[del\]\]\]$2$3$4$5$6\[\[\[\/del\]\]\]$7$8$9$10$11<etal>$12<\/etal><\/person-group>}gsi;

		
		
		$reference=~s{^(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[del\]\]\]([^\[]+)\[\[\[\/del\]\]\]<etal>(.*?)<\/etal>}{<person-group>$1<\/given-names>$2$3$4$5$6\[\[\[del\]\]\]$7\[\[\[\/del\]\]\]<etal>$8<\/etal><\/person-group>}gsi;

		$reference=~s{^(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[ins\]\]\]([^\[]+)\[\[\[\/ins\]\]\]<etal>(.*?)<\/etal>}{<person-group>$1<\/given-names>$2$3$4$5$6\[\[\[del\]\]\]$7\[\[\[\/del\]\]\]<etal>$8<\/etal><\/person-group>}gsi;

		$reference=~s{^(.*?)<\/suffix>(\s?)(\,?)(\.?)(\,?)(\s?)<etal>(.*?)<\/etal>}{<person-group>$1<\/suffix>$2$3$4$5$6<etal>$7<\/etal><\/person-group>}gsi;

		$reference=~s{^(.*?)<\/suffix>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<etal>(.*?)<\/etal>}{<person-group>$1<\/suffix><x>\[\[\[ins\]\]\]$2$3$4$5$6\[\[\[\/ins\]\]\]<\/x><etal>$7<\/etal><\/person-group>}gsi;


		$reference=~s{^(.*?)<\/suffix>\[\[\[del\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/del\]\]\]<etal>(.*?)<\/etal>}{<person-group>$1<\/suffix><x>\[\[\[del\]\]\]$2$3$4$5$6\[\[\[\/del\]\]\]<\/x><etal>$7<\/etal><\/person-group>}gsi;

		
		$reference=~s{^(.*?)<\/suffix>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<article-title>}{<person-group>$1<\/suffix>$2$3$4$5$6$7<\/person-group><article-title>}gsi;


		$reference=~s{^(.*?)<\/suffix>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\:?)(\,?)(\s?)\[\[\[\/ins\]\]\]<article-title>}{<person-group>$1<\/suffix><x>\[\[\[ins\]\]\]$2$3$4$5$6$7\[\[\[\/ins\]\]\]<\/x><\/person-group><article-title>}gsi;

		$reference=~s{^(.*?)<\/suffix>\[\[\[del\]\]\](\s?)(\,?)(\.?)(\:?)(\,?)(\s?)\[\[\[\/del\]\]\]<article-title>}{<person-group>$1<\/suffix><x>\[\[\[del\]\]\]$2$3$4$5$6$7\[\[\[\/del\]\]\]<\/x><\/person-group><article-title>}gsi;



		
				
		$reference=~s{<\/surname>(\s?)<CommentReference(\d+)\/>}{<CommentReference$2/><\/surname>$1}gsi;

		$reference=~s{<\/surname>(\s?)<query>(.*?)<\/query>}{<query>$2<\/query><\/surname>$1}gsi;


		$reference=~s{<given\-names>(\s?)\,(\s?)</given-names>}{$1\,$2}gsi;

		
		
		$reference=~s{<sc>(\s?)(\,)(\s?)<\/sc>}{$1$2$3}gsi;


		
		
		
		if($reference=~m{<\/given-names>(\.?)(\s?)([\,\;]+)(\s)<given-names>}gsi)
		{
			

			$reference=~s{<given\-names>}{<givenname>}gsi;

			$reference=~s{<\/given\-names>}{<\/givenname>}gsi;
			
			
			$reference=~s{<(sur|given)name>([^\<]+)\<\/(sur|given)name>(\s?)(\,?)(\.?)(\,?)(\s?)<(sur|given)name>([^\<]+)\<\/(sur|given)name>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><$1name>$2<\/$3name>$4$5$6$7$8<$9name>$10<\/$11name>$12$13$14$15$16<\/name>}gsi;

			
			
		}


		
			
		
		if($reference=~m{<\/given\-names>(\s?)([\,\;]?)(\s?)(and|&amp;|\&)(\s?)<given\-names>}gsi)
		{

			
			
			
		
			
			#$reference=~s{<given-names>([^\<]+)\<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><givennames>$1<\/givennames>$2$3$4$5$6<sur\-name>$7<\/sur\-name>$8$9$10$11$12<\/name>}gsi;

			$reference=~s{<given\-names>}{<givenname>}gsi;

			$reference=~s{<\/given\-names>}{<\/givenname>}gsi;
			
			
			$reference=~s{<(sur|given)name>([^\<]+)\<\/(sur|given)name>(\s?)(\,?)(\.?)(\,?)(\s?)<(sur|given)name>([^\<]+)\<\/(sur|given)name>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><$1name>$2<\/$3name>$4$5$6$7$8<$9name>$10<\/$11name>$12$13$14$15$16<\/name>}gsi;

			
			
		}

		if($reference=~m{<\/given\-names>(\s?)([\,\;]?)(\s?)<sc>(and|&amp;|\&)<\/sc>(\s?)<given\-names>}gsi)
		{

			
			
			
		
			
			#$reference=~s{<given-names>([^\<]+)\<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><givennames>$1<\/givennames>$2$3$4$5$6<sur\-name>$7<\/sur\-name>$8$9$10$11$12<\/name>}gsi;

			$reference=~s{<given\-names>}{<givenname>}gsi;

			$reference=~s{<\/given\-names>}{<\/givenname>}gsi;
			
			
			$reference=~s{<(sur|given)name>([^\<]+)\<\/(sur|given)name>(\s?)(\,?)(\.?)(\,?)(\s?)<(sur|given)name>([^\<]+)\<\/(sur|given)name>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><$1name>$2<\/$3name>$4$5$6$7$8<$9name>$10<\/$11name>$12$13$14$15$16<\/name>}gsi;

			
			
		}

		
		
		if($reference=~m{<\/given\-names>(\s?)([\,\;]?)(\s?)<suffix>([^\<]+)\<\/suffix>(\s?)([\,\;]?)(\s?)<given\-names>}gsi)
		{

			
			
			
		
			
			#$reference=~s{<given-names>([^\<]+)\<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><givennames>$1<\/givennames>$2$3$4$5$6<sur\-name>$7<\/sur\-name>$8$9$10$11$12<\/name>}gsi;

			$reference=~s{<given\-names>}{<givenname>}gsi;

			$reference=~s{<\/given\-names>}{<\/givenname>}gsi;
			
			
			$reference=~s{<(sur|given)name>([^\<]+)\<\/(sur|given)name>(\s?)(\,?)(\.?)(\,?)(\s?)<(sur|given)name>([^\<]+)\<\/(sur|given)name>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><$1name>$2<\/$3name>$4$5$6$7$8<$9name>$10<\/$11name>$12$13$14$15$16<\/name>}gsi;

			
			
		}

		
		if($reference=~m{<\/given\-names>(\s?)([\,\;]?)(\s?)<suffix>([^\<]+)\<\/suffix>([\,\s\;]+)(and)(\s?)<given\-names>}gsi)
		{

			
			
			
		
			
			#$reference=~s{<given-names>([^\<]+)\<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><givennames>$1<\/givennames>$2$3$4$5$6<sur\-name>$7<\/sur\-name>$8$9$10$11$12<\/name>}gsi;

			$reference=~s{<given\-names>}{<givenname>}gsi;

			$reference=~s{<\/given\-names>}{<\/givenname>}gsi;
			
			
			$reference=~s{<(sur|given)name>([^\<]+)\<\/(sur|given)name>(\s?)(\,?)(\.?)(\,?)(\s?)<(sur|given)name>([^\<]+)\<\/(sur|given)name>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><$1name>$2<\/$3name>$4$5$6$7$8<$9name>$10<\/$11name>$12$13$14$15$16<\/name>}gsi;

			
			
		}
		

		
		
		
		
		
		$reference=~s{<surname>([^\>]+)<\/surname>(\s?)(\,?)(\.?)(\,?)(\s?)<given-names>([^\>]+)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><surname>$1<\/surname>$2$3$4$5$6<given-name>$7<\/given-name>$8$9$10$11$12<\/name>}gsi;

		
		
		$reference=~s{<surname>([^\>]+)<\/surname>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<given-names>([^\>]+)<\/given-names>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]}{<name><surname>$1<\/surname><x>\[\[\[ins\]\]\]$2$3$4$5$6\[\[\[\/ins\]\]\]<\/x><given-name>$7<\/given-name><x>\[\[\[ins\]\]\]$8$9$10$11$12\[\[\[\/ins\]\]\]<\/x><\/name>}gsi;

		$reference=~s{<surname>([^\>]+)<\/surname><italic>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<\/italic><given-names>([^\>]+)<\/given-names><italic>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<\/italic>}{<name><surname>$1<\/surname><x>\[\[\[ins\]\]\]$2$3$4$5$6\[\[\[\/ins\]\]\]<\/x><given-name>$7<\/given-name><x><italic>\[\[\[ins\]\]\]$8$9$10$11$12\[\[\[\/ins\]\]\]<\/italic><\/x><\/name>}gsi;

		$reference=~s{<surname>([^\>]+)<\/surname>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<given-names>([^\>]+)<\/given-names><x>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<\/x>}{<name><surname>$1<\/surname><x>\[\[\[ins\]\]\]$2$3$4$5$6\[\[\[\/ins\]\]\]<\/x><given-name>$7<\/given-name><x>\[\[\[ins\]\]\]$8$9$10$11$12\[\[\[\/ins\]\]\]<\/x><\/name>}gsi;


		

		
		$reference=~s{<surname>([^\>]+)<\/surname>\[\[\[ins\]\]\]([^\[]+)\[\[\[\/ins\]\]\]<given-names>([^\>]+)<\/given-names><x>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<\/x>}{<name><surname>$1<\/surname><x>\[\[\[ins\]\]\]$2\[\[\[\/ins\]\]\]<\/x><given-name>$3<\/given-name><x>\[\[\[ins\]\]\]$4$5$6$7$8\[\[\[\/ins\]\]\]<\/x><\/name>}gsi;

		$reference=~s{<surname>([^\>]+)<\/surname>\[\[\[del\]\]\]([^\[]+)\[\[\[\/del\]\]\]<given-names>([^\>]+)<\/given-names><x>\[\[\[ins\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/ins\]\]\]<\/x>}{<name><surname>$1<\/surname><x>\[\[\[del\]\]\]$2\[\[\[\/del\]\]\]<\/x><given-name>$3<\/given-name><x>\[\[\[del\]\]\]$4$5$6$7$8\[\[\[\/del\]\]\]<\/x><\/name>}gsi;

		$reference=~s{<surname>([^\>]+)<\/surname>\[\[\[(\w+)\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/(\w+)\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)<given-names>([^\>]+)<\/given-names>\[\[\[(\w+)\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/(\w+)\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)}{<name><surname>$1<\/surname><x>\[\[\[$2\]\]\]$3$4$5$6$7\[\[\[\/$8\]\]\]$9$10$11$12$13<\/x><given-name>$14<\/given-name><x>\[\[\[$15\]\]\]$16$17$18$19$20\[\[\[\/$21\]\]\]$22$23$24$25$26<\/x><\/name>}gsi;

		


		$reference=~s{<surname>([^\>]+)<\/surname>\[\[\[(\w+)\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/(\w+)\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)<given-names>([^\>]+)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><surname>$1<\/surname><x>\[\[\[$2\]\]\]$3$4$5$6$7\[\[\[\/$8\]\]\]$9$10$11$12$13<\/x><given-name>$14<\/given-name><x>$15$16$17$18$19<\/x><\/name>}gsi;

		

		$reference=~s{<surname>([^\>]+)<\/surname>(\s?)(\,?)(\s?)\[\[\[(\w+)\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)\[\[\[\/(\w+)\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)<given-names>([^\>]+)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><surname>$1<\/surname><x>$2$3$4\[\[\[$5\]\]\]$6$7$8$9$10\[\[\[\/$11\]\]\]$12$13$14$15$16<\/x><given-name>$17<\/given-name><x>$18$19$20$21$22<\/x><\/name>}gsi;

		$reference=~s{<surname>([^\>]+)<\/surname>(\s?)(\,?)(\s?)\[\[\[(\w+)\]\]\](.*?)\[\[\[\/(\w+)\]\]\](\s?)(\,?)(\.?)(\,?)(\s?)<given-names>([^\>]+)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><surname>$1<\/surname><x>$2$3$4\[\[\[$5\]\]\]$6\[\[\[\/$7\]\]\]$8$9$10$11$12<\/x><given-name>$13<\/given-name><x>$14$15$16$17$18<\/x><\/name>}gsi;


		

		$reference=~s{<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\,?)(\s?)<suffix>([^\<]+)<\/suffix>(\s?)(\,?)(\.?)(\,?)(\s?)<given-names>([^\<]+)\<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><surname>$1<\/surname>$2$3$4$5$6<suffix>$7<\/suffix><x>$8$9$10$11$12</x><given-name>$13<\/given-name>$14$15$16$17$18<\/name>}gsi;

		
			
		
		
		

		$reference=~s{<name>(\s?)<surname>([^\<]+)<\/surname></name>([^\<]+)<name>([^\<]+)<given-names>([^\<]+)<\/given-names><\/name>}{$1<name><surname>$2<\/surname>$3$4<given-name>$5<\/given-name><\/name>}gsi;


		
		

		
		
		$reference=~s{<\/name>(\s?)([\,\.\;]?)(\s?)<surname>(.*?)<\/surname>}{<\/name>$1$2$3<name><surname>$4<\/surname><\/name>}gsi;

		$reference=~s{<\/name>(\s?)([\,\.\;]?)(\s?)<surname>(.*?)<\/surname>}{<\/name>$1$2$3<name><surname>$4<\/surname><\/name>}gsi;

		$reference=~s{<\/name>(\s?)(\&amp;)(\s?)<surname>(.*?)<\/surname>}{<\/name>$1$2$3<name><surname>$4<\/surname><\/name>}gsi;

		$reference=~s{<\/name>(\s?)(\&amp;)(\s?)<surname>(.*?)<\/surname>}{<\/name>$1$2$3<name><surname>$4<\/surname><\/name>}gsi;

		$reference=~s{<\/name>(\s)(and)(\s)<surname>(.*?)<\/surname>}{<\/name>$1$2$3<name><surname>$4<\/surname><\/name>}gsi;

		$reference=~s{<\/name>(\s)(and)(\s)<surname>(.*?)<\/surname>}{<\/name>$1$2$3<name><surname>$4<\/surname><\/name>}gsi;

		
		

		$reference=~s{<person\-group ([^\>]+)\><surname>(.*?)</surname>(\s?)(\,)(\s?)<name>}{<person\-group $1><name><surname>$2<\/surname><\/name>$3$4$5<name>}gsi;

		

		

		$reference=~s{<refedSurname>([^\<]+)\<\/refedSurname>([\.\,\:\;\s\(]+)<Suffix>([^\<]+)\<\/Suffix>([\.\,\:\;\s\)]+)<refedGivenName>([^\<]+)\<\/refedGivenName>}{<name_Ed><surname>$1<\/surname>$2<suffix>$3<\/suffix>$4<given-names>$5<\/given-names><\/name_Ed>}gsi;

		#$reference=~s{<refedGivenName>(.*?)<\/refedGivenName>([\.\,\:\;\s\(]+)<Suffix>(.*?)<\/Suffix>([\.\,\:\;\s\)]+)<refedSurname>(.*?)<\/refedSurname>}{<name_Ed><given-names>$1<\/given-names>$2<suffix>$3<\/suffix>$4<surname>$5<\/surname><\/name_Ed>}gsi;

		
		
		#$reference=~s{<refedSurname>([^\<]+)\<\/refedSurname>([\.\,\:\;\s]+)<refedGivenName>([^\<]+)\<\/refedGivenName>}{<name_Ed><surname>$1<\/surname>$2<given-names>$3<\/given-names><\/name_Ed>}gsi;

		
		
		#$reference=~s{<refedSurname>([^\<]+)\<\/refedSurname>\[\[\[ins\]\]\](\s?)([\.\,\:\;\s]?)(\s?)\[\[\[\/ins\]\]\]<refedGivenName>([^\<]+)\<\/refedGivenName>}{<name_Ed><surname>$1<\/surname><x>\[\[\[ins\]\]\]$2$3$4\[\[\[\/ins\]\]\]<\/x><given-names>$5<\/given-names><\/name_Ed>}gsi;

		
		

		#$reference=~s{<refedGivenname>(.*?)<\/refedGivenname>([\.\,\:\;\s]+)<refedSurName>(.*?)<\/refedSurName>}{<name_Ed><given-names>$1<\/given-names>$2<surname>$3<\/surname><\/name_Ed>}gsi;


		#$reference=~s{<refedGivenName>(.*?)<\/refedGivenName>([\.\,\:\;\s]+)<refedSurname>(.*?)<\/refedSurname>}{<name_Ed><surname>$1<\/surname>$2<given-names>$3<\/given-names><\/name_Ed>}gsi;

		
		
		$reference=~s{<refedGivenName>(.*?)<\/refedGivenName>}{<name_Ed><given-names>$1<\/given-names><\/name_Ed>}gsi;

		$reference=~s{<refedSurname>(.*?)<\/refedSurname>}{<name_Ed><surname>$1<\/surname><\/name_Ed>}gsi;

		
		
		
	$reference=~s{<name_Ed>}{<person-group person-group-type="editor"><name_Ed>}si;

	my $re1=$reference=~s{<\/name_Ed>}{<\/name_Ed>}gsi;

	my $counts ='1';

		$reference=~s/<\/name_Ed>/'<\/name_Ed'.$counts++.'>'/segi;
	
		$reference=~s{<\/name_Ed$re1>}{<\/name><\/person-group>}gsi;


		

		my $IOP_Ref_Tmp1=$Tmp;

		
		if($IOP_Ref_Tmp1=~m{<p content\-type=\"indent\">\&lt;IOP_Tex_Conversion\&gt;</p>}si)
		{

			$reference=~s{<\/name_Ed$re1>}{<\/name><\/person-group>}gsi;
			$reference=~s{<\/name_Ed(\d+)>}{<\/name_Ed>}gsi;

			$reference=~s{<name_Ed>}{<name_Ed>}gsi;
			$reference=~s{<name_Ed><given-names>([^\<]+)\</given-names></name_Ed> <name_Ed><surname>([^\<]+)\</surname></name_Ed>}{<name><given-names>$1</given-names> <surname>$2</surname><\/name>}gsi;

			$reference=~s{<name_Ed><given-names>([^\<]+)\</given-names></name_Ed> <name_Ed><surname>([^\<]+)\</surname></name>}{<name><given-names>$1</given-names> <surname>$2</surname><\/name>}gsi;

			$reference=~s{<\/name_Ed(\d+)>}{<\/name>}gsi;

			$reference=~s{<name_Ed>}{<name>}gsi;

			
			
			

		
		}


		
		

		

		
		$reference=~s{<\/name_Ed(\d+)>}{<\/name>}gsi;

		$reference=~s{<name_Ed>}{<name>}gsi;

		
		
		



		$reference=~s{<refdirectorGivenName>(.*?)<\/refdirectorGivenName>}{<name_Dr><given-names>$1<\/given-names><\/name_Dr>}gsi;

		$reference=~s{<refdirectorSurname>(.*?)<\/refdirectorSurname>}{<name_Dr><surname>$1<\/surname><\/name_Dr>}gsi;
		

	$reference=~s{<name_Dr>}{<person-group person-group-type="director"><name_Dr>}si;

	my $re1=$reference=~s{<\/name_Dr>}{<\/name_Dr>}gsi;

	my $counts ='1';

		$reference=~s/<\/name_Dr>/'<\/name_Dr'.$counts++.'>'/segi;
	
		$reference=~s{<\/name_Dr$re1>}{<\/name><\/person-group>}gsi;

		$reference=~s{<\/name_Dr(\d+)>}{<\/name>}gsi;

		$reference=~s{<name_Dr>}{<name>}gsi;

		
		
		

#Trans Author

		$reference=~s{<reftransSurname>(.*?)<\/reftransSurname>([\.\,\:\;\s]?)<reftransGivenName>(.*?)<\/reftransGivenName>}{<name_Td><surname>$1<\/surname>$2<given-names>$3<\/given-names><\/name_Td>}gsi;





		$reference=~s{<reftransGivenName>(.*?)<\/reftransGivenName>}{<name_Td><given-names>$1<\/given-names><\/name_Td>}gsi;

		$reference=~s{<reftransSurname>(.*?)<\/reftransSurname>}{<name_Td><surname>$1<\/surname><\/name_Td>}gsi;

		$reference=~s{<reftransedGivenName>(.*?)<\/reftransedGivenName>}{<name_Td><given-names>$1<\/given-names><\/name_Td>}gsi;

		$reference=~s{<reftransedSurname>(.*?)<\/reftransedSurname>}{<name_Td><surname>$1<\/surname><\/name_Td>}gsi;
		

	$reference=~s{<name_Td>}{<person-group person-group-type="translator"><name_Td>}si;

	my $re2=$reference=~s{<\/name_Td>}{<\/name_Td>}gsi;

	my $counts1 ='1';

		$reference=~s/<\/name_Td>/'<\/name_Td'.$counts1++.'>'/segi;
	
		$reference=~s{<\/name_Td$re2>}{<\/string\-name><\/person-group>}gsi;

		$reference=~s{<\/name_Td(\d+)>}{<\/string\-name>}gsi;

		$reference=~s{<name_Td>}{<string\-name>}gsi;


		

		$reference=~s{<name>(\s)}{$1<name>}gsi;
		$reference=~s{<etal>(.*?)<\/etal><\/name><\/person-group>}{<\/name><etal>$1<\/etal><\/person-group>}gsi;

		$reference=~s{eds<\/person-group>}{<\/person-group><x>eds<\/x>}gsi;

	$reference=~s{ed<\/person-group>}{<\/person-group><x>ed<\/x>}gsi;

	$reference=~s{</person-group>(\,)(\s?)eds\.(\s)}{<\/person-group><x>$1$2<\/x><x>eds\.<\/x><x>$3<\/x>}gsi;

	$reference=~s{</person-group>(\,)(\s?)ed\.(\s)}{<\/person-group><x>$1$2<\/x><x>ed\.<\/x><x>$3<\/x>}gsi;


	
	$reference=~s{(In): <name>}{<ref-comment>$1<\/ref-comment><x>\: <\/x><person-group><name>}gs;

		
		$reference=~s{<given-names>(\s+)}{<given-names>}gsi;
		$reference=~s{<surname>(\s+)}{<surname>}gsi;

		$reference=~s{<given-names>\.<\/given-names>}{\.}gsi;
		$reference=~s{<surname>\.<\/surname>}{\.}gsi;
	
		$reference=~s{<person-group>\.<\/person-group>}{}gsi;

		

	
		
		$reference=~s{(\s?)<\/name>(\s?)<suffix>(.*?)<\/suffix>}{<x>$1$2<\/x><suffix>$3<\/suffix><\/name>}gsi;


		
		
		$reference=~s{(\s?)<\/name>(\s?)(\[\[\[del\]\]\]([^\[]+)\[\[\[\/del\]\]\])(\s?)<suffix>(.*?)<\/suffix>}{<x>$1$2$3$5</x><suffix>$6<\/suffix><\/name>}gsi;

		

		
		#([\.\,\:\;\s\(]+)

		$reference=~s{(\s?)<\/name>([\.\,\:\;\s\(]+)<suffix>(.*?)<\/suffix>}{<x>$1$2<\/x><suffix>$3<\/suffix><\/name>}gsi;

		$reference=~s{<x>(\s?)<\/x><\/name>([\.\,\:\;\s\(]*)<suffix>(.*?)<\/suffix>}{<x>$1$2<\/x><suffix>$3<\/suffix><\/name>}gsi;
		
		
		$reference=~s{<\/name><\/person\-group>(\s)([\.\,\:\;\s\(]+)<suffix>(.*?)<\/suffix>}{$1$2<suffix>$3<\/suffix><\/name><\/person-group>}gsi;

		$reference=~s{<\/name><\/person\-group>(\s?)([\.\,\:\;\s\(]+)<suffix>(.*?)<\/suffix>}{$1$2<suffix>$3<\/suffix><\/name><\/person-group>}gsi;


	
	#$reference=~s{^<label>(.*?)<\/label><collab>(.*?)<\/collab>}{<person\-group><collab>$1<\/collab><\/person\-group>}gsi;


		

#Single surname

		
		$reference=~s{^(<label>(.*?)<\/label>)(\s?)<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<etal>([^\<]+)\<\/etal>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<source>}{$1<person-group><name><surname>$3$4<\/surname><\/name>$5$6$7$8$9$10<etal>$11<\/etal><\/person-group>$12$13$14$15$16$17<source>}gsi;

		

		$reference=~s{^(<label>(.*?)<\/label>)(\s?)<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<etal>([^\<]+)\<\/etal>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<year>}{$1<person-group><name><surname>$3$4<\/surname><\/name>$5$6$7$8$9$10<etal>$11<\/etal><\/person-group>$12$13$14$15$16$17<year>}gsi;

		$reference=~s{^<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<etal>([^\<]+)\<\/etal>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<year>}{<person-group><name><surname>$1<\/surname><\/name>$2$3$4$5$6$7<etal>$8<\/etal><\/person-group>$9$10$11$12$13$14<year>}gsi;

		$reference=~s{^<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<year>}{<person-group><name><surname>$1<\/surname><\/name>$2$3$4$5$6$7<\/person-group><year>}gsi;

		$reference=~s{^(<label>(.*?)<\/label>)(\s?)<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<etal>([^\<]+)\<\/etal>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<article-title>}{$1<person-group><name><surname>$3$4<\/surname><\/name>$5$6$7$8$9$10<etal>$11<\/etal><\/person-group>$12$13$14$15$16$17<article-title>}gsi;

		$reference=~s{^(<label>(.*?)<\/label>)(\s?)<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<etal>([^\<]+)\<\/etal>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<collab>}{$1<person-group><name><surname>$3$4<\/surname><\/name>$5$6$7$8$9$10<etal>$11<\/etal><\/person-group>$12$13$14$15$16$17<collab>}gsi;

		$reference=~s{^(<label>(.*?)<\/label>)(\s?)<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<etal>([^\<]+)\<\/etal>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<ref-comment>}{$1<person-group><name><surname>$3$4<\/surname><\/name>$5$6$7$8$9$10<etal>$11<\/etal><\/person-group>$12$13$14$15$16$17<ref-comment>}gsi;


		
		
		$reference=~s{^(<label>(.*?)<\/label>)(\s?)<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<source>}{$1<person-group><name><surname>$3$4<\/surname><\/name>$5$6$7$8$9$10<\/person-group><source>}gsi;


		#$reference=~s{^<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<etal>([^\<]+)\<\/etal>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<year>}{<person-group><name><surname>$1<\/surname><\/name>$2$3$4$5$6$7<etal>$8<\/etal><\/person-group>$9$10$11$12$13$14<year>}gsi;
		
		$reference=~s{^<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<book\-title>}{<person\-group><name><surname>$1<\/surname><\/name><\/person-group>$2$3$4$5$6$7<book\-title>}gsi;

		
		
		$reference=~s{^<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<etal>([^\<]+)\<\/etal>}{<person\-group><name><surname>$1<\/surname><\/name>$2$3$4$5$6$7<etal>$8<\/etal><\/person-group>}gsi;

		
		$reference=~s{^(<label>(.*?)<\/label>)(\s?)<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<year>}{$1<person-group><name><surname>$3$4<\/surname><\/name>$5$6$7$8$9$10<\/person-group><year>}gsi;

		$reference=~s{^(<label>(.*?)<\/label>)(\s?)<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<etal>([^\<]+)\<\/etal>}{$1<person-group><name><surname>$3$4<\/surname><\/name>$5$6$7$8$9$10<etal>$11<\/etal><\/person-group>}gsi;

		$reference=~s{^(<label>(.*?)<\/label>)(\s?)<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<article-title>}{$1<person-group><name><surname>$3$4<\/surname><\/name>$5$6$7$8$9$10<\/person-group><article-title>}gsi;

		$reference=~s{^(<label>(.*?)<\/label>)(\s?)<surname>([^\<]+)\<\/surname>(\s?)(\,?)(\.?)(\:?)(\,?)(\s?)<collab>}{$1<person-group><name><surname>$3$4<\/surname><\/name>$5$6$7$8$9$10<\/person-group><collab>}gsi;


		$reference=~s{<reftransGivenName>(.*?)<\/reftransGivenName>(\s?)(\,?)(\.?)(\,?)(\s?)<reftransSurname>(.*?)<\/reftransSurname>(\s?)(\,?)(\.?)(\,?)(\s?)}{<string-name><given-names>$1<\/given-names>$2$3$4$5$6<surname>$7<\/surname>$8$9$10$11$12<\/string-name>}gsi;

		

		$reference=~s{<person-group person-group-type="author"><given-names>(.*?)</given-names></person-group>}{<person-group person-group-type="author"><name><given-names>$1</given-names><\/name></person-group>}gsi;

		
		
	$reference=~s{(\w\w)>, <}{$1><x>\, <\/x><}gsi;

	
	$reference=~s{(\w\w)>\. <}{$1><x>\. <\/x><}gsi;
	$reference=~s{(\w\w)> (\w)}{$1><x> <\/x>$2}gsi;

	$reference=~s{(\w\w)>\[\[\[ins\]\]\], \[\[\[\/ins\]\]\]<}{$1><x>\[\[\[ins\]\]\]\, \[\[\[\/ins\]\]\]<\/x><}gsi;
	$reference=~s{(\w\w)>\[\[\[ins\]\]\]\. \[\[\[\/ins\]\]\]<}{$1><x>\[\[\[ins\]\]\]\. \[\[\[\/ins\]\]\]<\/x><}gsi;

	

	$reference=~s{<\/name><\/string\-name>}{<\/string\-name>}gsi;
	
	
	$reference=~s{<\/publisher-loc>(\:?)(\,?)(\.?)(\s?)}{<\/publisher-loc><x>$1$2$3$4<\/x>}gsi;


	
	$reference=~s{<\/publisher-name>(\:?)(\,?)(\.?)(\s?)}{<\/publisher-name><x>$1$2$3$4<\/x>}gsi;


	#Given name with surname


	
		if($reference!~m{\"editor\"}gsi)
		{
		
		$reference=~s{<given-names>(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<surname>(.*?)<\/surname>(\s?)(\,?)(\.?)(\,?)(\s?)}{<name><given-names>$1<\/given-names>$2$3$4$5$6<surname>$7<\/surname>$8$9$10$11$12<\/name>}gsi;

		}
		
		
		$reference=~s{<given-name>}{<given-names>}gsi;

		$reference=~s{<\/given-name>}{<\/given-names>}gsi;

		$reference=~s{(\w+)<\/given-names>(\.)}{$1$2<\/given-names>}gsi;

		

		
		$reference=~s{<\/name>(\s?)([\,\.]?)(\s?)<given-names>(.*?)<\/given-names>}{<\/name>$1$2$3<name><given-names>$4<\/given-names><\/name>}gsi;

		

		#$reference=~s{(\[\[\[\/(\w([^\]]*))\]\]\])(\s?)([\,\:\;\.]?)(\s?)}{$4$5$6$1}gsi;

		
		
		$reference=~s{\&(\w+)\;}{\&$1\[semico\]}gsi;
		$reference=~s{<source>(.*?)([\,\:\;\.]?)<\/source>}{<source>$1<\/source>$2}gsi;
		$reference=~s{<year>(.*?)([\,\:\;\.]?)<\/year>}{<year>$1<\/year>$2}gsi;
		$reference=~s{<volume>(.*?)([\,\:\;\.]?)<\/volume>}{<volume>$1<\/volume>$2}gsi;
		$reference=~s{<issue>(.*?)([\,\:\;\.]?)<\/issue>}{<issue>$1<\/issue>$2}gsi;
		$reference=~s{<fpage>(.*?)([\,\:\;\.]?)<\/fpage>}{<fpage>$1<\/fpage>$2}gsi;
		$reference=~s{<lpage>(.*?)([\,\:\;\.]?)<\/lpage>}{<lpage>$1<\/lpage>$2}gsi;
		
		
		$reference=~s{<article\-title>(.*?)<\/article\-title>([\,\:\;\.]?)}{<article-title>$1$2<\/article-title>}gsi;

		
		$reference=~s{(<\w\w([^\>]*)>)(\s?)([\,\:\;\.]?)(\s?)}{$3$4$5$1}gsi;
		
		#$reference=~s{^(<label>(.*?)<\/label>)(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<source>}{$1<person-group>$3<\/given-names><\/person-group>$4$5$6$7$8<source>}gsi;

		
		#$reference=~s{^(.*?)<\/given-names>(\s?)(\,?)(\.?)(\,?)(\s?)<article-title>}{<person-group>$1<\/given-names><\/person-group>$2$3$4$5$6<article-title>}gsi;

		

		if($reference!~m{<person\-group}si)
		{
			if($reference=~m{<name>}si)
			{
				$reference=~s{<name>}{<name_Pd>}gsi;
				$reference=~s{<\/name>}{<\/name_Pd>}gsi;
				$reference=~s{<name_Pd>}{<person-group person-group-type="author"><name_Pd>}si;

				my $re1=$reference=~s{<\/name_Pd>}{<\/name_Pd>}gsi;

				my $counts ='1';

				$reference=~s/<\/name_Pd>/'<\/name_Pd'.$counts++.'>'/segi;
	
				$reference=~s{<\/name_Pd$re1>}{<\/name><\/person-group>}gsi;

				$reference=~s{<\/name_Pd(\d+)>}{<\/name>}gsi;

				$reference=~s{<name_Pd>}{<name>}gsi;

			}
		}
		

		$reference=~s{<givenname>}{<given\-names>}gsi;

		$reference=~s{<\/givenname>}{<\/given\-names>}gsi;


		
		
	$reference=~s{<eperson\-group}{<person\-group}gsi;
	$reference=~s{<eName>}{<name>}gsi;
	$reference=~s{<\/eName>}{<\/name>}gsi;

	
		
	
	
	$reference=~s{(<\/\w\w([^\>]*)\>)\.(\s?)(<\w\w([^\>]*)>)}{$1<x>\.$3<\/x>$4}gsi;
	$reference=~s{(<\/\w\w([^\>]*)\>)\:(\s?)(<\w\w([^\>]*)>)}{$1<x>\:$3<\/x>$4}gsi;
	$reference=~s{(<\/\w\w([^\>]*)\>)\)\.(\s?)(<\w\w([^\>]*)>)}{$1<x>\)\.$3<\/x>$4}gsi;
	$reference=~s{(<\/\w\w([^\>]*)\>)(\s?)\((\s?)(<\w\w([^\>]*)>)}{$1<x>$3\($4<\/x>$5}gsi;
	

	$reference=~s{(<\/\w\w([^\>]*)\>)\;(\s?)(<\w\w([^\>]*)>)}{$1<x>\;$3<\/x>$4}gsi;
	$reference=~s{(<\/\w\w([^\>]*)\>)\)\;(\s?)(<\w\w([^\>]*)>)}{$1<x>\)\;$3<\/x>$4}gsi;

	$reference=~s{(<\/\w\w([^\>]*)\>)\,(\s?)(<\w\w([^\>]*)>)}{$1<x>\,$3<\/x>$4}gsi;
	$reference=~s{(<\/\w\w([^\>]*)\>\))\,(\s?)(<\w\w([^\>]*)>)}{$1<x>\,$3<\/x>$4}gsi;
	$reference=~s{(<\/\w\w([^\>]*)\>\))(\s?)\,(\s?)(<\w\w([^\>]*)>)}{$1<x>$3\,$4<\/x>$5}gsi;
	$reference=~s{(<\/\w\w([^\>]*)\>)\:(\s?)(<\w\w([^\>]*)>)}{$1<x>\:$3<\/x>$4}gsi;

	$reference=~s{(<\/\w\w([^\>]*)\>)\:(\s?)(<\/\w\w([^\>]*)>)}{$1<x>\:$3<\/x>$4}gsi;
	$reference=~s{(<\/\w\w([^\>]*)\>)\,(\s?)(<\/\w\w([^\>]*)>)}{$1<x>\,$3<\/x>$4}gsi;
	$reference=~s{(<\/\w\w([^\>]*)\>)\.(\s?)(<\/\w\w([^\>]*)>)}{$1<x>\.$3<\/x>$4}gsi;
	$reference=~s{(<\/\w\w([^\>]*)\>)(\s?)\,(\s?)(<\/\w\w([^\>]*)>)}{$1<x>$3\,$4<\/x>$5}gsi;
	$reference=~s{(<\/\w\w([^\>]*)\>)\)\:(\s?)(<\w\w([^\>]*)>)}{$1<x>\)\:$3<\/x>$4}gsi;
	$reference=~s{(<\/\w\w([^\>]*)\>)\)\:(\s?)(<\/\w\w([^\>]*)>)}{$1<x>\)\:$3<\/x>$4}gsi;
	$reference=~s{(<\/\w\w([^\>]*)\>)(\s+)(<\w\w([^\>]*)>)}{$1<x>$3<\/x>$4}gsi;
	$reference=~s{(<\/\w\w([^\>]*)\>)(\s+)(<\/\w\w([^\>]*)>)}{$1<x>$3<\/x>$4}gsi;
	
	$reference=~s{(<\/\w\w([^\>]*)\>)(\s)(<\w\w([^\>]*)>)}{$1<x>$3<\/x>$4}gsi;

	$reference=~s{ (<\/\w\w([^\>]*)\>)}{$1<x> <\/x>}gsi;

	$reference=~s{(<\/\w\w([^\>]*)\>)([\,\:\;\.]?)(\s?)(\w+)([\,\:\;\.]?)(\s?)(<\w\w([^\>]*)>)}{$1<x>$3$4$5$6$7<\/x>$8}gsi;

	$reference=~s{<volume>(\s?)(.*?)(\s?)<\/volume>}{<x>$1<\/x><volume>$2<\/volume><x>$3<\/x>}gsi;
	
	$reference=~s{\.$}{<x>\.<\/x>}gsi;
	$reference=~s{\:$}{<x>\:<\/x>}gsi;

	$reference=~s{<x><\/x>}{}gsi;


	$reference=~s{\[semico\]}{\;}gsi;

	$reference=~s{<x>(.*?)<\/x><x>(.*?)<\/x>}{<x>$1$2<\/x>}gsi;

	
	$reference=~s{>(\s?)\&ndash;(\s?)<}{><x>$1\&ndash;$2<\/x><}gsi;
	
	$reference=~s{<surname>(.*?)\&(\w+)</surname><x>\; </x>}{<surname>$1\&$2\;<\/surname><x> <\/x>}gsi;

	$reference=~s{<surname>(\s?)(\.)(\s?)<\/surname>}{<x>$1$2$3<\/x>}gsi;

	$reference=~s{<surname>(\s?)(\,)(\s?)<\/surname>}{<x>$1$2$3<\/x>}gsi;
	$reference=~s{<surname>(\s?)(\:)(\s?)<\/surname>}{<x>$1$2$3<\/x>}gsi;

	$reference=~s{<surname><x>,(\s?)</x></surname>}{<x>,$1</x>}gsi;

	$reference=~s{<surname><x>.(\s?)</x></surname>}{<x>.$1</x>}gsi;
	
	#$reference=~s{<source><italic>(.*?)<\/italic><\/source>}{<source>$1<\/source>}gsi;

	
	
	
	
	$reference=~s{<givennames>}{<given\-names>}gsi;
	$reference=~s{<\/givennames>}{<\/given\-names>}gsi;

	$reference=~s{<sur\-name>}{<surname>}gsi;
	$reference=~s{<\/sur\-name>}{<\/surname>}gsi;

	$reference=~s{<sc>and</sc>}{<x><sc>and<\/sc><\/x>}gsi;

	
	
	$reference=~s{<\/name>(\s?)and(\s?)<name>}{<\/name><x>$1and$2<\/x><name>}gsi;
	
	$reference=~s{<\/name>(\.?)(\,)(\s?)and(\s?)<name>}{<\/name><x>$1$2$3and$4<\/x><name>}gsi;
	
	$reference=~s{<\/name>(\s?)\[\[\[ins\]\]\](\s?)and(\s?)\[\[\[\/ins\]\]\](\s?)<name>}{<\/name><x>$1<ins>$2and$3<\/ins>$4<\/x><name>}gsi;
	$reference=~s{<\/name>(\s?)\[\[\[del\]\]\](\s?)and(\s?)\[\[\[\/del\]\]\](\s?)<name>}{<\/name><x>$1<del>$2and$3<\/del>$4<\/x><name>}gsi;

	$reference=~s{<\/name>(\s?)\[\[\[del\]\]\](\s?)(\,?)(\s?)\[\[\[\/del\]\]\](\s?)and(\s?)<name>}{<\/name><x>$1<del>$2$3$4<\/del>$5and$6<\/x><name>}gsi;

	$reference=~s{</name>\[\[\[ins\]\]\],\[\[\[\/ins\]\]\]\[\[\[del\]\]\] and \[\[\[/del\]\]\]<name>}{<\/name><x>\[\[\[ins\]\]\],\[\[\[\/ins\]\]\]\[\[\[del\]\]\] and \[\[\[/del\]\]\]<\/x><name>}gsi;

	$reference=~s{<\/name><\/string\-name>}{<\/string\-name>}gsi;
	
	$reference=~s{<\/name>(\s?)&amp;(\s?)<name>}{<\/name><x>$1&amp;$2<\/x><name>}gsi;
	$reference=~s{<\/name>\[\[\[ins\]\]\](\s?)&amp;(\s?)\[\[\[\/ins\]\]\]<name>}{<\/name><x>$1&amp;$2<\/x><name>}gsi;
	$reference=~s{<\/name>\[\[\[del\]\]\](\s?)&amp;(\s?)\[\[\[\/del\]\]\]<name>}{<\/name><x>\[\[\[del\]\]\]$1&amp;$2\[\[\[\/del\]\]\]<\/x><name>}gsi;
	$reference=~s{<\/name>([\.\,\;\:]?)(\s?)&amp;(\s?)([\.\,\;\:]?)<name>}{<\/name><x>$1$2&amp;$3$4<\/x><name>}gsi;

	$reference=~s{<\/name><x>([^\<]+)\</x>(\s?)and(\s?)<name>}{<\/name><x>$1$2and$3<\/x><name>}gsi;
	$reference=~s{<\/name>(\s?)&amp;(\s?)<name>}{<\/name><x>$1&amp;$2<\/x><name>}gsi;
	$reference=~s{<\/name><x>([^\<]+)\</x>(\s?)&amp;(\s?)<name>}{<\/name><x>$1$2&amp;$3<\/x><name>}gsi;
	$reference=~s{<\/name>([\.\,\;\:]?)(\s?)&amp;(\s?)([\.\,\;\:]?)<name>}{<\/name><x>$1$2&amp;$3$4<\/x><name>}gsi;
	$reference=~s{<\/name><x>([^\<]+)\</x>([\.\,\;\:]?)(\s?)&amp;(\s?)([\.\,\;\:]?)<name>}{<\/name><x>$1$2$3&amp;$4$5<\/x><name>}gsi;

	$reference=~s{<\/name>(\s?)\[\[\[del\]\]\]([^\[]+)\[\[\[\/del\]\]\](\s?)<name>}{<\/name><x>$1<del>$2<\/del>$3<\/x><name>}gsi;
	$reference=~s{<\/name>(\s?)\[\[\[ins\]\]\]([^\[]+)\[\[\[\/ins\]\]\](\s?)<name>}{<\/name><x>$1<ins>$2<\/ins>$3<\/x><name>}gsi;

	$reference=~s{<\/name>(\s?)\[\[\[del\]\]\]([^\[]+)\[\[\[\/del\]\]\]([^\<]+)\<name>}{<\/name><x>$1<del>$2<\/del>$3<\/x><name>}gsi;

	$reference=~s{<\/name>(\s?)\[\[\[ins\]\]\]([^\[]+)\[\[\[\/ins\]\]\]([^\<]+)\<name>}{<\/name><x>$1<ins>$2<\/ins>$3<\/x><name>}gsi;
	
	$reference=~s{<x>(.*?)</x>(ed)([\.\,])}{<x>$1<\/x>$2$3}gsi;

	$reference=~s{<x><\/x>}{}gsi;

	
	$reference=~s{<x>(.*?)<\/x><x>(.*?)<\/x>}{<x>$1$2<\/x>}gsi;


	
	
	$reference=~s{<person\-group person\-group-type=\"author\">\&mdash\;([^\<]+)\</person-group>}{<person\-group person\-group-type=\"author\"><name><surname>\&mdash\;$1<\/surname><\/name></person-group>}gsi;

	$reference=~s{<person\-group person\-group-type=\"author\">\&mdash\;([^\<]+)\</person-group>}{<person\-group person\-group-type=\"author\"><name><surname>\&mdash\;$1<\/surname><\/name></person-group>}gsi;

	$reference=~s{<person\-group person\-group-type=\"author\">\&ast\;(\s?)<name>}{<person\-group person\-group-type=\"author\"><name><surname>\&ast\;<\/surname><\/name>$1<name>}gsi;

	$reference=~s{<person\-group person\-group-type=\"author\">\&mdash\;\&mdash\;(\s?)<name>}{<person\-group person\-group-type=\"author\"><name><surname>\&mdash\;\&mdash;<\/surname><\/name>$1<name>}gsi;

	$reference=~s{<person\-group person\-group-type=\"author\">\&mdash\;(\s?)<name>}{<person\-group person\-group-type=\"author\"><name><surname>\&mdash\;\&mdash;<\/surname><\/name>$1<name>}gsi;

	$reference=~s{<person\-group person\-group-type=\"author\">\&mdash\;\.(\s?)<name>}{<person\-group person\-group-type=\"author\"><name><surname>\&mdash\;\.<\/surname><\/name>$1<name>}gsi;

	$reference=~s{<person\-group person\-group-type=\"author\">\&mdash\;\&mdash\;\.(\s?)<name>}{<person\-group person\-group-type=\"author\"><name><surname>\&mdash\;\&mdash\;\.<\/surname><\/name>$1<name>}gsi;

	$reference=~s{<person\-group person\-group-type=\"author\">\&mdash\;\&mdash\;\&mdash\;\.(\s?)<name>}{<person\-group person\-group-type=\"author\"><name><surname>\&mdash\;\&mdash\;\&mdash\;\.<\/surname><\/name>$1<name>}gsi;

	$reference=~s{<person\-group person\-group-type=\"author\">\&mdash\;\.(\s?)<name>}{<person\-group person\-group-type=\"author\"><name><surname>\&mdash\;\.<\/surname><\/name>$1<name>}gsi;

	$reference=~s{<person\-group person\-group-type=\"author\">\&mdash\;\&mdash\;\&mdash\;(\s?)<name>}{<person\-group person\-group-type=\"author\"><name><surname>\&mdash\;\&mdash\;\&mdash\;<\/surname><\/name>$1<name>}gsi;

	$reference=~s{<person\-group person\-group-type=\"author\"><surname>([^\<]+)\<\/surname></person-group>}{<person\-group person\-group-type=\"author\"><name><surname>$1<\/surname><\/name></person-group>}gsi;

	#Surname only in end of author group

		
		
		$reference=~s{<x>([^\<]+)\<\/x><\/name><\/person\-group><x>([^\<]+)\<\/x><surname>([^\<]+)\<\/surname>}{<\/name><x>$1$2<\/x><name><surname>$3<\/surname><\/name><\/person\-group>}gsi;
		
	
	
	$reference=~s{\&(\w+)\;}{\&$1\[semico\]}gsi;
	
	$reference=~s{(\s?)([\,\.\:\;]+)(\s?)<x>}{<x>$1$2$3}gsi;

	
	
	
	
	
	$reference=~s{<\/name><x>(\s?)(\.?)(\,?)(\s?)<\/x><suffix>(.*?)<\/suffix>}{<x>$1$2$3$4<\/x><suffix>$5<\/suffix><\/name>}gsi;

	$reference=~s{<\/name><\/person\-group>(\s?)(\.?)(\,?)(\s?)<suffix>(.*?)<\/suffix>}{<x>$1$2$3$4<\/x><suffix>$5<\/suffix><\/name><\/person\-group>}gsi;


	$reference=~s{<x>([^\<]+)\<\/x><\/name><suffix>([^\<]+)\<\/suffix><\/name><\/person\-group>}{<x>$1<\/x><suffix>$2<\/suffix><\/name><\/person\-group>}gsi;
	
	
	$reference=~s{<sc>(<\w([^\>]+)\>)}{$1<sc>}gsi;

	$reference=~s{(<\/\w([^\>]+)\>)<\/sc>}{<\/sc>$1}gsi;

	$reference=~s{(<\w\w([^\>]*)>)<x>([^\<]*)\<\/x>}{<x>$3<\/x>$1}gsi;

	$reference=~s{<x>([^\<]*)\<\/x>(<\/\w\w([^\>]*)>)}{$2<x>$1<\/x>}gsi;


	$reference=~s{\[\[\[ins\]\]\]<\/surname><x>}{<\/surname><x>\[\[\[ins\]\]\]}gsi;

	$reference=~s{</x><given-names>\[\[\[\/ins\]\]\]}{\[\[\[\/ins\]\]\]<\/x><given-names>}gsi;

	$reference=~s{\[\[\[del\]\]\]<\/surname><x>}{<\/surname><x>\[\[\[del\]\]\]}gsi;

	$reference=~s{</x><given-names>\[\[\[\/del\]\]\]}{\[\[\[\/del\]\]\]<\/x><given-names>}gsi;

	$reference=~s{<name><name>}{<name>}gsi;

	$reference=~s{\[semico\]}{\;}gsi;

	if($Tmp=~m{<publisher>\n<publisher-name>Lippincott Williams \&amp\; Wilkins</publisher-name>}si)
{
	
	$reference=~s{<italic>}{\(\(\(italic\)\)\)}gsi;
	$reference=~s{<\/italic>}{\(\(\(\/italic\)\)\)}gsi;
	$reference=~s{<bold>}{\(\(\(bold\)\)\)}gsi;
	$reference=~s{<\/bold>}{\(\(\(\/bold\)\)\)}gsi;
	$reference=~s{<sup>}{\(\(\(sup\)\)\)}gsi;
	$reference=~s{<\/sup>}{\(\(\(\/sup\)\)\)}gsi;
	$reference=~s{<sub>}{\(\(\(sub\)\)\)}gsi;
	$reference=~s{<\/sub>}{\(\(\(\/sub\)\)\)}gsi;
	$reference=~s{<sc>}{\(\(\(sc\)\)\)}gsi;
	$reference=~s{<\/sc>}{\(\(\(\/sc\)\)\)}gsi;

	

	
	
	$reference=~s{<(\w([^\>]*))>}{\[\[\[$1\]\]\]}gsi;
	$reference=~s{<\/(\w([^\>]*))>}{\[\[\[\/$1\]\]\]}gsi;
	$reference=~s{(\[\[\[\/(\w([^\]]*))\]\]\])([^\[]+)(\[\[\[(\w([^\]]*))\]\]\])}{$1<ref-comment>$4<\/ref-comment>$5}gsi;

	
		
	$reference=~s{\[\[\[}{<}gsi;
	$reference=~s{\]\]\]}{>}gsi;
	$reference=~s{\(\(\(}{<}gsi;
	$reference=~s{\)\)\)}{>}gsi;

	$reference=~s{lwwopen}{\[}gsi;

	$reference=~s{lwwclose}{\]}gsi;
	

	$reference=~s{<\(italic>}{\(<italic>}gsi;
	$reference=~s{<\(sup>}{\(<sup>}gsi;

	$reference=~s{(<uri xlink\:href=\"([^\"]+)\">(.*?)<\/uri>)}{<ref-comment>$1<\/ref-comment>}gsi;
	
	$reference=~s{</ref-comment><x>([^\<]*)\</x><ref-comment>}{$1}gsi;


	my $Collab_count=$reference=~s{<collab>}{<collab>}gsi;

	

	if($Collab_count >= 2)
	{
	$reference=~s{<\/person-group><x>([^\<]*)\<\/x><collab>}{<\/person-group><x>$1<\/x><person\-group><collab>}gsi;

	$reference=~s{<\/collab><x>([^\<]*)\<\/x><name>}{<\/collab><\/person-group><x>$1\<\/x><person\-group person\-group-type=\"author\"><name>}gsi;

	$reference=~s{<person\-group person\-group-type=\"author\"><person\-group>}{<person-group person-group-type="author">}gsi;

	}
	else
	{

		
		$reference=~s{^<collab>(.*?)<\/collab>}{<person\-group person-group-type="author"><collab>$1<\/collab><\/person\-group>}gsi;
		#$reference=~s{<\/person-group><x>([^\<]*)\<\/x><collab>(.*?)<\/collab>}{<\/person-group><x>$1<\/x><person\-group><collab>$2<\/collab><\/person-group>}gsi;

		#$reference=~s{<\/collab><\/person-group><x>([^\<]*)\<\/x><name>}{<\/collab><\/person-group><x>$1\<\/x><person\-group person\-group-type=\"author\"><name>}gsi;

		#$reference=~s{<\/collab><x>([^\<]*)\<\/x><name>}{<\/collab><\/person-group><x>$1\<\/x><person\-group person\-group-type=\"author\"><name>}gsi;

		#$reference=~s{<person\-group person\-group-type=\"author\"><person\-group>}{<person-group person-group-type="author">}gsi;
	}
}


$reference=~s{<sc>(<\w([^\>]+)\>)}{$1<sc>}gsi;



$reference=~s{<sc><\/sc>}{}gsi;

if($Tmp=~m{<publisher>\n<publisher-name>OUP</publisher-name>}si || $Tmp=~m{<publisher>\n<publisher-name>Oxford University Press</publisher-name>}si || $Tmp=~m{<publisher>\n<publisher-name>Lippincott Williams \&amp\; Wilkins</publisher-name>}si || $Tmp=~m{<publisher>\n<publisher-name>Policy Press University of Bristol</publisher-name>}si)
{

	$reference=~s{\&\#xF0FE\;}{}gsi;

	$reference=~s{\&\#xF0FD\;}{}gsi;
	
	my $Count_B=$reference=~s{\[\[\[del\]\]\]}{\[\[\[del\]\]\]}gsi;
	if($Count_B eq 1)
	{
		$reference=~s{^(\[\[\[del\]\]\](.*?)\[\[\[\/del\]\]\])$}{<reftrack>$1<\/reftrack>}gsi;
		
		
	}


	$reference=~s{<person\-group person\-group-type=\"author\"><person\-group>}{<person-group person-group-type="author">}gsi;
	$reference=~s{<person\-group person\-group-type=\"author\"><x>([^\<]+)\<\/x><person\-group>}{<person-group person-group-type="author">}gsi;


	
	$reference=~s{<person\-group person\-group\-type=\"(\w+)\"><label>(.*?)<\/label>}{<label>$2<\/label><person-group person-group-type=\"$1\">}gsi;

	
	
	$reference=~s{<person\-group person\-group-type=\"author\"><person\-group>}{<person-group person-group-type="author">}gsi;
	$reference=~s{<person\-group person\-group-type=\"author\"><x>([^\<]+)\<\/x><person\-group>}{<person-group person-group-type="author">}gsi;

	$reference=~s{<\/person\-group><\/person\-group>}{<\/person\-group>}gsi;

	my $Collab_count=$reference=~s{<collab>}{<collab>}gsi;



	if($Collab_count >= 2)
	{

		
		
	$reference=~s{<\/person-group><x>([^\<]*)\<\/x><collab>(.*?)<\/collab>}{<\/person-group><x>$1<\/x><person\-group><collab>$2<\/collab><\/person\-group>}gsi;

	$reference=~s{<\/collab><x>([^\<]*)\<\/x><name>}{<\/collab><\/person-group><x>$1\<\/x><person\-group person\-group-type=\"author\"><name>}gsi;

	$reference=~s{<\/name><x>([^\<]*)\<\/x><collab>(.*?)<\/collab>}{<\/name><\/person-group><x>$1\<\/x><person\-group person\-group-type=\"author\"><collab>$2<\/collab><\/person-group>}gsi;

	$reference=~s{<person\-group person\-group-type=\"author\"><person\-group>}{<person-group person-group-type="author">}gsi;



	}
	else
	{

		
		$reference=~s{^<collab>(.*?)<\/collab>}{<person\-group person-group-type="author"><collab>$1<\/collab><\/person\-group>}gsi;
		$reference=~s{<\/person-group><x>([^\<]*)\<\/x><collab>(.*?)<\/collab>}{<\/person-group><x>$1<\/x><person\-group><collab>$2<\/collab><\/person-group>}gsi;

		$reference=~s{<\/collab><\/person-group><x>([^\<]*)\<\/x><name>}{<\/collab><\/person-group><x>$1\<\/x><person\-group person\-group-type=\"author\"><name>}gsi;

		$reference=~s{<\/collab><x>([^\<]*)\<\/x><name>}{<\/collab><\/person-group><x>$1\<\/x><person\-group person\-group-type=\"author\"><name>}gsi;

		$reference=~s{<\/collab><\/person-group><x>([^\<]*)\<\/x>(\s?)(and)(\s?)<name>}{<\/collab><\/person-group><x>$1$2$3$4<\/x><person\-group person\-group-type=\"author\"><name>}gsi;

		$reference=~s{<person\-group person\-group-type=\"author\"><person\-group>}{<person-group person-group-type="author">}gsi;
	}
	
	

	

}

$reference=~s{<person\-group person\-group\-type=\"author\">(<surname>\&mdash([^\<]+)</surname>)</person\-group>}{<person\-group person\-group\-type=\"author\"><name>$1<\/name></person\-group>}gsi;

$reference=~s{</x>\&hellip\;(\s?)<name>}{\&hellip\;$1<\/x><name>}gsi;

$reference=~s{</x>\&hellip\; \&amp;(\s?)<name>}{\&hellip\; \&amp;$1<\/x><name>}gsi;

$reference=~s{</name>\&hellip\;(\s?)<name>}{<\/name><x>\&hellip\;$1<\/x><name>}gsi;

$reference=~s{</name>(\,?)(\s?)\&hellip\;(\s?)<name>}{<\/name><x>$1$2\&hellip\;$3<\/x><name>}gsi;

$reference=~s{</name>(\,?)(\s?)\&hellip\; \&amp;(\s?)<name>}{<\/name><x>$1$2\&hellip\; \&amp;$3<\/x><name>}gsi;








my $IOP_Ref_Tmp=$Tmp;
if($IOP_Ref_Tmp=~m{<p content\-type=\"indent\">\&lt;IOP_Tex_Conversion\&gt;</p>}si)
{


	

$reference=~s{AQ\:}{IOPAQ}gs;





$reference=~s{(\s)(arXiv([^\:]*))\:([^\<]+)\<}{$1<refcomment>$2:<ext-link ext-link-type="arxiv" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://arxiv.org/abs/$4">$4</ext-link></refcomment>\<}gsi;


$reference=~s{(\()(arXiv([^\:]*))\:([^\<]+)\<}{<refcomment>$1$2:<ext-link ext-link-type="arxiv" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://arxiv.org/abs/$4">$4</ext-link></refcomment>\<}gsi;



$reference=~s{<refcomment>(arXiv (\w+))<\/refcomment>}{<comment>$1<\/comment>}gsi;


$reference=~s{<refcomment>(arXiv([^\:]*))\:([^\<]+)\<}{<refcomment>$1$2:<ext-link ext-link-type="arxiv" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://arxiv.org/abs/$3">$3</ext-link>\<}gsi;



$reference=~s{IOPAQ}{AQ:}gs;


#$reference=~s{(arXiv([^\:]*))\:([^\<]+)\<}{<refcomment>$1:<ext-link ext-link-type="arxiv" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://arxiv.org/abs/$3">$3</ext-link></refcomment>\<}gs;






$reference=~s{ pp }{<x> pp </x>}gsi;

$reference=~s{<\/x>pp }{<\/x><x>pp </x>}gsi;

$reference=~s{<x><x>}{<x>}gsi;

$reference=~s{<\/x><\/x>}{<\/x>}gsi;

$reference=~s{<\/x> }{ <\/x>}gsi;

my $Count_Person=$reference=~s{<person\-group}{<person\-group}gsi;


			my $re=$reference;
			if($Count_Person eq 1)
			{
				if($re=~m{(\(ed\)| ed )}gsi)
				{
					
					$reference=~s{<person\-group person\-group\-type=\"author\">}{<person\-group person\-group\-type=\"editor\">}gsi;
				}
			}

$reference=~s{<\/collab><x>([^\<]+)\<\/x><collab>}{$1}gsi;

$reference=~s{<\/collab><x>([^\<]+)\<\/x>and <collab>}{$1and }gsi;



$reference=~s{<\/([^\>]+)\>et al(\.?)}{<\/$1><etal>et al$2</etal>}gsi;

$reference=~s{<\/([^\>]+)\>et(\.?) al(\.?)}{<\/$1><etal>et$2 al$3</etal>}gsi;



			
my $Collab_count=$reference=~s{<collab>}{<collab>}gsi;

	
	

	if($Collab_count >= 2)
	{

	
		
	$reference=~s{<\/person-group><x>([^\<]*)\<\/x><collab>}{<x>$1<\/x><collab>}gsi;

	$reference=~s{<\/collab><x>([^\<]*)\<\/x><name>}{<\/collab><\/person-group><x>$1\<\/x><person\-group person\-group-type=\"author\"><name>}gsi;

	$reference=~s{<person\-group person\-group-type=\"author\"><person\-group>}{<person-group person-group-type="author">}gsi;

	}
	else
	{

	
		$reference=~s{^<collab>(.*?)<\/collab>}{<person\-group person-group-type="author"><collab>$1<\/collab><\/person\-group>}gsi;
		$reference=~s{<\/person-group><x>([^\<]*)\<\/x><collab>(.*?)<\/collab>}{<x>$1<\/x><collab>$2<\/collab><\/person-group>}gsi;

		$reference=~s{<\/collab><\/person-group><x>([^\<]*)\<\/x><name>}{<\/collab><\/person-group><x>$1\<\/x><person\-group person\-group-type=\"author\"><name>}gsi;

		

		$reference=~s{<\/collab><x>([^\<]*)\<\/x><name>}{<\/collab><\/person-group><x>$1\<\/x><person\-group person\-group-type=\"author\"><name>}gsi;

		$reference=~s{<person\-group person\-group-type=\"author\"><person\-group>}{<person-group person-group-type="author">}gsi;

		
	}
	


}

$reference=~s{(arXiv)(\s?)\:(\s?)<uri xlink:href=\"([^\"]+)\">([^\<]+)\</uri>}{$1$2\:$3<ext-link ext-link-type="arxiv" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://arxiv.org/abs/$4">$4</ext-link>}gsi;


$reference=~s{<refcomment>(.*?)</comment></refcomment>}{$1<\/comment>}gsi;

$reference=~s{<refcomment>(.*?)<\/refcomment>}{<comment>$1<\/comment>}gsi;

$reference=~s{<refcomment>(.*?)<refcomment>}{<refcomment>$1}gsi;

$reference=~s{<refcomment><refcomment>}{<comment>}gsi;

$reference=~s{<\/refcomment><\/refcomment>}{<\/comment>}gsi;




$reference=~s{<comment><refcomment>}{<comment>}gsi;
$reference=~s{</comment></refcomment>}{</comment>}gsi;



$reference=~s{(\s?)(<comment>(.*?)<\/comment>)<\/article\-title>}{<\/article\-title><x>$1<\/x>$2}gsi;

$reference=~s{(\s?)(<refcomment>(.*?)<\/refcomment>)<\/article\-title>}{<\/article\-title><x>$1<\/x>$2}gsi;

$reference=~s{<lpage>\&ndash\;(.*?)<\/lpage>}{<x>\&ndash;<\/x><lpage>$1<\/lpage>}gsi;

$reference=~s{<fpage>(.*?)\&ndash\;<\/fpage>}{<fpage>$1<\/fpage><x>\&ndash;<\/x>}gsi;



$reference=~s{\)</ext\-link>}{</ext-link>\)}gsi;

$reference=~s{\)\">([^\<]+)<\/ext\-link>}{\">$1<\/ext\-link>}gsi;





my $IOP_Ref_Tmp2=$Tmp;
my $IOP_Ref_Tmp3=$Tmp;
my $IOP_Ref_Tmp4=$Tmp;
if($IOP_Ref_Tmp2=~m{<p content\-type=\"indent\">\&lt;IOP_Tex_Conversion\&gt;</p>}si)
{
	$reference=~s{<article\-title><series>(.*?)<\/series><\/article\-title>}{<series>$1<\/series>}gsi;

	

	$reference=~s{ (vol) (.*?)<\/series>}{ $1 <named\-content content\-type=\"series\-vol\">$2</named\-content><\/series>}gsi;

	$reference=~s{</series><x> </x><comment>(vol)</comment><x> </x><volume>(\w+)</volume>}{ <named\-content content\-type=\"series-vol\">$1 $2</named\-content></series>}gsi;

	if($reference!~m{<person\-group}gsi)
	{
	$reference=~s{(<collab>(.*?)<\/collab>)}{<person\-group person\-group\-type=\"author\">$1<\/person\-group>}gsi;
	}
	$reference=~s{<comment>}{<comm>}gsi;
	$reference=~s{<\/comment>}{<\/comm>}gsi;

	$reference=~s{(<\/\w\w([^\>]*)\>)\)(\s*)\((<\w\w([^\>]*)>)}{$1<x>\)$3\(<\/x>$4}gsi;
	
}
else
{
	$reference=~s{<article\-title><series>(.*?)<\/series><\/article\-title>}{<article\-title>$1<\/article\-title>}gsi;
}

$reference=~s{<\/name><\/name>}{<\/name>}gsi;
$reference=~s{</name><x> </x></name>}{</name><x> </x>}gsi;

		
$reference=~s{<ins><sc>(.*?)<\/ins><\/sc>}{<ins><sc>$1<\/sc><\/ins>}gsi;
		
$reference=~s{\)$}{<x>\)<\/x>}gsi;

$reference=~s{<refcomment>}{}gsi;

$reference=~s{<\/refcomment>}{}gsi;

$reference=~s{<fpage><bold>([^\<]+)<\/bold><\/fpage>}{<fpage>$1<\/fpage>}gsi;

$reference=~s{<lpage><bold>([^\<]+)<\/bold><\/lpage>}{<lpage>$1<\/lpage>}gsi;

$reference=~s{</collab></person-group></sc>}{</sc></collab></person-group>}gsi;

$reference=~s{<person\-group person\-group\-type=\"(\w+)\"><label>(.*?)<\/label>}{<label>$2<\/label><person-group person-group-type=\"$1\">}gsi;

	
	
	$reference=~s{<person\-group person\-group-type=\"author\"><person\-group>}{<person-group person-group-type="author">}gsi;
	$reference=~s{<person\-group person\-group-type=\"author\"><x>([^\<]+)\<\/x><person\-group>}{<person-group person-group-type="author">}gsi;

	$reference=~s{<\/person\-group><\/person\-group>}{<\/person\-group>}gsi;

	$reference=~s{<x>([^\<]+)\<\/x><\/etal>}{$1<\/etal>}gsi;

	$reference=~s{<bold><\/bold>}{}gsi;



$reference=~s{<\/ref\-comment><ref\-comment>}{}gsi;


#Surname only in the begining of the reference


$reference=~s{<person\-group person\-group\-type=\"author\"><surname>([^\<]+)\</surname><x>([^\<]+)\</x><name>}{<person-group person\-group\-type=\"author\"><name><surname>$1</surname><\/name><x>$2</x><name>}gsi;



$reference=~s{^<surname>([^\<]+)\</surname>}{<person-group person-group-type="author"><name><surname>$1<\/surname><\/name><\/person-group>}gsi;

$reference=~s{<etal><sc>([^\<]+)\<\/etal><\/sc>}{<etal><sc>$1<\/sc><\/etal>}gsi;

$reference=~s{\&\#x(\w+)<\/([^\>]+)\><x>\;}{\&\#x$1\;<\/$2><x>}gsi;

$reference=~s{\&\#x(\w+)<\/([^\>]+)\><([^\>]+)\>\;}{\&\#x$1\;<\/$2><$3>}gsi;

$reference=~s{\&\#x(\w+)<\/([^\>]+)\>\;}{\&\#x$1\;<\/$2>}gsi;




	return $reference;
}

sub OUP_Part_Label
{
	my $Label=shift;


	if($Label=~m{CEGenius F\&amp\;R Part Label}gsi)
	{
		
		
		$Label=~s{<citationref>(.*?)<\/citationref>}{<partref>$1<\/partref>}gsi;

		
		$Label=~s{(\s?)CEGenius F\&amp\;R Part Label(\s?)}{}gsi;
		#$Label=~s{<partref>(\s*)}{<partref>}gsi;
		$Label=~s{ <\/partref>}{<\/partref>}gsi;
		
		
		
		
	}

	return $Label;
	
}

sub Citation
{
	my $Citation=shift;

	
	
	
my @entity;
my %entity;



if($Citation=~m{\:(\[?)(\d+|\w+)}si)
{
	
	
	while($Citation=~m{\"(CIT([^\"]+))\"}gsi)
	{
	my $figname = $1;

	
	
        $entity{$figname}='';
        push(@entity,$figname);
	}

@entity =grep(!$entity{$_}++,@entity);
my $enty = join(",",sort { $a cmp $b }@entity);	



$Citation="<citationId>$enty<\/citationId>";
}




return $Citation;
}

sub Bib
{
	my $bib=shift;

	#$bib=~s{\[\[\[([^\]]+)\]\]\]}{<$1>}gsi;
	$bib=~s{\<([^\>]+)\>}{\[\[\[ob:italic$1\]\]\]}gsi;
	
	return $bib;
}

sub Linking
{
	my $Id=shift;
	my $Citation=shift;

	$Citation=~s{\–(\d+)}{}gsi;

	
	
	my $Id1=$Id;
	
	my $Count=$Citation=~s{([0-9][0-9][0-9][0-9])}{$1}gsi;

	
	if($Count eq "1")
	{
		
		my @Ref=split(",",$Id);

		foreach my $Value(@Ref)
		{
		
			$Value=~s{\:(.*?)$}{}si;
			if($Citation=~m{([\,\;]+)b$}si)
			{
				$Citation=~s{([\,\;]+)b$}{$1<xref ref-type=\"bibr\" rid=\"$Value\">b<\/xref>}gsi;
			}
			else
			{
				$Citation="<xref ref-type=\"bibr\" rid=\"$Value\">$Citation<\/xref>";    
			}

			
			$Citation=~s{,<xref ref-type="bibr" rid=\"([^\"]+)\">b</xref><\/xref>}{<\/xref>\,<xref ref-type="bibr" rid=\"$1\">b</xref>}gsi;
		}
		

		#if($Id1=~m{$Id1}gsi)
		#{
			
		#}
		#$Citation="<xref ref-type=\"bibr\" rid=\"$Id\">$Citation<\/xref>";    
	}
	else
	{

		
		
		my @Ref=split(",",$Id);

		foreach my $Value(@Ref)
		{
			
						
			if($Value=~m{CIT(\d+)\:(.*)}si)
			{
			my $Year=$2;
			my $I=$1;

			
			
			$Citation=~s{$Year\,}{<xref ref\-type=\"bibr\" rid=\"CIT$I\">$Year<\/xref>\,}si;

			$Citation=~s{$Year\;}{<xref ref\-type=\"bibr\" rid=\"CIT$I\">$Year<\/xref>\;}si;

			$Citation=~s{$Year\:}{<xref ref\-type=\"bibr\" rid=\"CIT$I\">$Year<\/xref>\:}si;

			$Citation=~s{$Year$}{<xref ref\-type=\"bibr\" rid=\"CIT$I\">$Year<\/xref>}si;

			$Citation=~s{^([A-z])$}{<xref ref\-type=\"bibr\" rid=\"CIT$I\">$1<\/xref>}si;
			
			}

			
		}

		
		#$Citation=~s{((.*?)([a-z])([\,\s]+))(<xref ref-type=\"bibr\" rid=\"([^\"]+)\">)}{$5$1}si;

		
		
		if($Citation=~m{([0-9][0-9][0-9][0-9])\s?\[([0-9][0-9][0-9][0-9]\])}si)
		{
			if($Id=~m{CIT(\d+)\:(.*)}si)
			{
			my $Year=$2;
			my $I=$1;
			$Citation="<xref ref-type=\"bibr\" rid=\"CIT$I\">$Citation<\/xref>";
			}
		}

		if($Citation=~m{\[([0-9][0-9][0-9][0-9])\]\s?([0-9][0-9][0-9][0-9])}si)
		{
			if($Id=~m{CIT(\d+)\:(.*)}si)
			{
			my $Year=$2;
			my $I=$1;
			$Citation="<xref ref-type=\"bibr\" rid=\"CIT$I\">$Citation<\/xref>";
			}

			
		}


		
		
		$Citation=~s{((.*?))(<xref ref-type=\"bibr\" rid=\"([^\"]+)\">)}{$3$1}si;

		
		
	}

	my $Cit=$Citation;

	$Cit=~s{<xref ref-type=\"bibr\" rid=\"([^\"]+)\">(.*?)<\/xref>}{}gsi;

	my $Cit1=$Cit;

	
	
	while($Cit1=~m{(([0-9][0-9][0-9][0-9])(\w?))}gsi)
	{
		

		my $Va=$1;

		
		
		$Citation=~s{$Va}{<xref ref-type=\"bibr\" rid=\"000\">$Va<\/xref>}gsi;

		
	}
		

	
	return $Citation;
}

sub Figure_Linking1
{
	my $Fig_Id=shift;
	my $Fig_Let=shift;

	
	my $Figure=$Fig_Id.$Fig_Let;
	

	
	
	
	
if($Tmp=~m{<fig id=\"F($Fig_Id)($Fig_Let)\"}gsi)
{

	my $Fig=$1;
	my $Let=$2;

	
	
	$Figure="<xref ref-type=\"fig\" rid=\"F$Fig$Let\">$Fig_Let<\/xref>";
	
	
}
else
{
	
	
	$Figure="<xref ref-type=\"fig\" rid=\"F$Fig_Id\">$Fig_Let<\/xref>";
	
}

return $Figure;

}


sub Figure_Linking4
{
	my $Fig_Id=shift;
	my $Fig_Let=shift;

	
	my $Figure=$Fig_Id.$Fig_Let;
	

	
	
	
	
if($Tmp=~m{<fig id=\"F($Fig_Id)($Fig_Let)\"}gsi)
{

	my $Fig=$1;
	my $Let=$2;

	
	
	$Figure="<xref ref-type=\"fig\" rid=\"F$Fig$Let\">\[\[italic\]\]$Fig_Let\[\[\/italic\]\]<\/xref>";
	
	
}
else
{
	
	
	$Figure="<xref ref-type=\"fig\" rid=\"F$Fig_Id\"><italic>$Fig_Let<\/italic><\/xref>";
	
}

return $Figure;

}

sub Figure_Linking2
{
	my $Fig_Id=shift;
	my $Fig_Let=shift;

	
	my $Figure=$Fig_Id.$Fig_Let;
	

	
	
	
	
if($Tmp=~m{<fig id=\"F($Fig_Id)($Fig_Let)\"}gsi)
{

	my $Fig=$1;
	my $Let=$2;

	
	
	$Figure="<xref ref-type=\"fig\" rid=\"F$Fig$Let\">$Fig_Let<\/xref>";
	
	
}
else
{
	
	
	$Figure="<xref ref-type=\"fig\" rid=\"F$Fig_Id\">$Figure<\/xref>";
	
}

return $Figure;

}


sub Figure_Linking3
{
	my $Fig_Id=shift;
	my $Fig_Let=shift;

	
	my $Figure=$Fig_Id."<italic>$Fig_Let<\/italic>";
	

	
	
	
	
if($Tmp=~m{<fig id=\"F($Fig_Id)($Fig_Let)\"}gsi)
{

	my $Fig=$1;
	my $Let=$2;

	
	
	$Figure="<xref ref-type=\"fig\" rid=\"F$Fig$Let\">$Fig_Let<\/xref>";
	
	
}
else
{
	
	
	$Figure="<xref ref-type=\"fig\" rid=\"F$Fig_Id\">$Figure<\/xref>";
	
}

return $Figure;

}

sub Table_Linking1
{
	my $Fig_Id=shift;
	my $Fig_Let=shift;

	my $Figure=$Fig_Id.$Fig_Let;

		
if($Tmp=~m{<table\-wrap id=\"T($Fig_Id)($Fig_Let)\"}gsi)

{

	my $Fig=$1;
	my $Let=$2;

	
	
	$Figure="<xref ref-type=\"table\" rid=\"T$Fig$Let\">$Fig_Id$Fig_Let<\/xref>";
	
	
}
else
{
	$Figure="<xref ref-type=\"table\" rid=\"T$Fig_Let\">$Fig_Id$Fig_Let<\/xref>";
}


return $Figure;

}

sub Table_Linking3
{
	my $Fig_Id=shift;
	my $Fig_Let=shift;

	my $Figure=$Fig_Id."<italic>$Fig_Let<\/italic>";

		
if($Tmp=~m{<table\-wrap id=\"T($Fig_Id)($Fig_Let)\"}gsi)

{

	my $Fig=$1;
	my $Let=$2;

	
	
	$Figure="<xref ref-type=\"table\" rid=\"T$Fig$Let\">$Fig_Id<italic>$Fig_Let<\/italic><\/xref>";
	
	
}
else
{
	$Figure="<xref ref-type=\"table\" rid=\"T$Fig_Let\">$Fig_Id<italic>$Fig_Let<\/italic><\/xref>";
}
return $Figure;

}


sub Table_Linking2
{
	my $Fig_Id=shift;

	

	my $Figure=$Fig_Id;

		
if($Tmp=~m{<table\-wrap id=\"T($Fig_Id)\"}gsi)

{

	my $Fig=$1;
	

	
	
	$Figure="<xref ref-type=\"table\" rid=\"T$Fig\">$Fig_Id<\/xref>";
	
	
}
else
{
	$Figure="<xref ref-type=\"table\" rid=\"T$Fig_Id\">$Fig_Id<\/xref>";
}
return $Figure;

}
sub Table_Link
{
	my $Figure=shift;
	my $Fig_Id=shift;
	my $Fig_Let=shift;

	
	
	
while($Tmp=~m{<table-wrap id=\"T($Fig_Id)($Fig_Let)\"}gsi)
{
	

	my $Fig=$1;
	my $Let=$2;

		
	$Figure=~s{(Tab(\w*)(\.?)(\s?)($Fig)(\.?)(\s?)(\(?)($Let)(\)?))}{<xref ref-type=\"table\" rid=\"T$5$9\">$1<\/xref>}si;
	
	
}
return $Figure;

}

sub Table_Link1
{
	my $Figure=shift;
	my $Fig_Id=shift;
	
	
	
		
while($Tmp=~m{<table-wrap id=\"T($Fig_Id)\"}gsi)
{

	my $Fig=$1;
	my $Let=$2;

	
		
	$Figure=~s{(Tab(\w*)(\.?)(\s?)($Fig)(\.?)(\s?))}{<xref ref-type=\"table\" rid=\"T$5\">$1<\/xref>}si;
	
	
}
return $Figure;

}

sub Row
{
	my $Row_Count=shift;
	
	my $Row=shift;

	$Row=~s{<entry }{<$Row_Count><entry }gsi;
	
	return $Row;
}

sub Fig_Ndash
{

	my $Start=shift;
	
	my $First=shift;
	my $End=shift;
	my $Second=shift;
	my $Ndash=shift;
	my @Array_Id;
	my @Data;

	for(my $i=$Start;$i<=$End;$i++)
	{
		push(@Array_Id,"F$i");
		push(@Data,"<duplicate><xref ref-type=\"fig\" rid=\"F$i\">$First$Ndash$Second<\/xref><\/duplicate>");
	}

	my $Final_Id=join(" ",@Array_Id);

	my $Final_Data=join("",@Data);

	

	$Final_Id="<xref ref-type=\"fig\" rid=\"$Final_Id\">$First$Ndash$Second<\/xref>$Final_Data";
	
	return $Final_Id;
}

sub Ref_Citation
{
	my $Citation=shift;

	my $Citation1=$Citation;
	my $Citation2=$Citation;
	if($Citation1=~m{<italic>}gsi)
	{
	$Citation="";
	}
	if($Citation2!~m{et al}gsi)
	{
	$Citation="";
	}
	return $Citation;
}

sub Ref_Givename
{
	my $Given_Name=shift;

	$Given_Name=~s{\,}{<\/refauGivenName>\,<refauGivenName>}gsi;

		
	return $Given_Name;
}

sub Ref_edGivename
{
	my $Given_Name=shift;

	

	$Given_Name=~s{\,}{<\/refedGivenName>\,<refedGivenName>}gsi;
	
	return $Given_Name;
}


sub Fm_Givename
{
	my $Given_Name=shift;

	$Given_Name=~s{\,}{<\/fmauGivenName>\,<fmauGivenName>}gsi;
	$Given_Name=~s{\,}{<\/fmcorrGivenName>\,<fmcorrGivenName>}gsi;
	
	return $Given_Name;
}

sub xref_hyphen
{
	my $startx=shift;
	my $endx=shift;
	$startx=~s{CIT}{}gsi;
	$endx=~s{CIT}{}gsi;
	
	my @Array_Id;

	my $xref;
	$startx=~s{^([0]+)(\d+)$}{$2}gsi;
	$endx=~s{^([0]+)(\d+)$}{$2}gsi;
	
	for(my $i=$startx;$i<=$endx;$i++)
	{
		push(@Array_Id,"CIT000$i");
	}
				
	my $Final_Id=join(" ",@Array_Id);

	$Final_Id=~s{CIT([0])([0])([0])([0-9][0-9])}{CIT$2$3$4}gsi;

	$Final_Id=~s{CIT([0])([0])([0])([0])([0-9][0-9])}{CIT$3$4$5}gsi;

	$Final_Id=~s{CIT([0])([0])([0-9][0-9][0-9])}{CIT$1$3}gsi;

	

		if($Tmp=~m{<publisher>\n<publisher\-name>IOP Publishing([^\<]*)\<\/publisher\-name>}si)
		{
		$xref="<xref ref-type=\"bibr\" rid=\"CIT000$startx\">$startx<\/xref>\&ndash\;<xref ref-type=\"bibr\" rid=\"CIT000$endx\">$endx<\/xref>";
		$xref=~s{CIT([0])([0])([0])([0-9][0-9])}{CIT$2$3$4}gsi;

		$xref=~s{CIT([0])([0])([0])([0])([0-9][0-9])}{CIT$3$4$5}gsi;

		$xref=~s{CIT([0])([0])([0-9][0-9][0-9])}{CIT$1$3}gsi;

		}
		else
		{
			$xref="<xref ref-type=\"bibr\" rid=\"$Final_Id\">$startx\-$endx<\/xref>";
		}


	
		
	return $xref;

	
}

sub Delete_Para
{
	my $Para=shift;

	
	my $Del_Count=$Para=~s{<del>}{<del>}gsi;

	if($Del_Count eq "1")
	{
		$Para="";
	}
	
	return $Para;
}

sub OUP_Figxref
{
	my $Fig_Xref=shift;

	my @Fig=split(",",$Fig_Xref);

	my @F;
	foreach my $Value(@Fig)
	{
		push(@F,"<figxref>$Value<\/figxref>");
	}

	my $Final_Fig=join(",",@F);

	$Final_Fig=~s{<figxref> }{ <figxref>}gsi;

	$Final_Fig=~s{ <\/figxref>}{<\/figxref> }gsi;
	
	
	
	
	return $Final_Fig;
}

sub OUP_Figxref1
{
	my $Fig_Xref=shift;

	my @Fig=split(" and ",$Fig_Xref);

	my @F;
	foreach my $Value(@Fig)
	{
		push(@F,"<figxref>$Value<\/figxref>");
	}

	my $Final_Fig=join(" and ",@F);

	$Final_Fig=~s{<figxref> }{ <figxref>}gsi;

	$Final_Fig=~s{ <\/figxref>}{<\/figxref> }gsi;
	
	
	
	
	return $Final_Fig;
}

sub OUP_Figxref2
{
	my $Fig_Xref=shift;

	my @Fig=split("\-",$Fig_Xref);

	my @F;
	foreach my $Value(@Fig)
	{
		push(@F,"<figxref>$Value<\/figxref>");
	}

	my $Final_Fig=join("\-",@F);

	$Final_Fig=~s{<figxref> }{ <figxref>}gsi;

	$Final_Fig=~s{ <\/figxref>}{<\/figxref> }gsi;
	
	
	
	
	return $Final_Fig;
}


sub OUP_Figxref3
{
	my $Fig_Xref=shift;

	my @Fig=split("&ndash;",$Fig_Xref);

	my @F;
	foreach my $Value(@Fig)
	{
		push(@F,"<figxref>$Value<\/figxref>");
	}

	my $Final_Fig=join("&ndash;",@F);

	$Final_Fig=~s{<figxref> }{ <figxref>}gsi;

	$Final_Fig=~s{ <\/figxref>}{<\/figxref> }gsi;
	
	
	
	
	return $Final_Fig;
}


sub OUP_Tabxref
{
	my $Fig_Xref=shift;

	my @Fig=split(",",$Fig_Xref);

	my @F;
	foreach my $Value(@Fig)
	{
		push(@F,"<tabxref>$Value<\/tabxref>");
	}

	my $Final_Fig=join(",",@F);

	$Final_Fig=~s{<tabxref> }{ <tabxref>}gsi;

	$Final_Fig=~s{ <\/tabxref>}{<\/tabxref> }gsi;
	
	
	
	
	return $Final_Fig;
}

sub OUP_Tabxref1
{
	my $Fig_Xref=shift;

	my @Fig=split(" and ",$Fig_Xref);

	my @F;
	foreach my $Value(@Fig)
	{
		push(@F,"<tabxref>$Value<\/tabxref>");
	}

	my $Final_Fig=join(" and ",@F);

	$Final_Fig=~s{<tabxref> }{ <tabxref>}gsi;

	$Final_Fig=~s{ <\/tabxref>}{<\/tabxref> }gsi;
	
	
	
	
	return $Final_Fig;
}

sub OUP_Tabxref2
{
	my $Fig_Xref=shift;

	my @Fig=split("\-",$Fig_Xref);

	my @F;
	foreach my $Value(@Fig)
	{
		push(@F,"<tabxref>$Value<\/tabxref>");
	}

	my $Final_Fig=join("\-",@F);

	$Final_Fig=~s{<tabxref> }{ <tabxref>}gsi;

	$Final_Fig=~s{ <\/tabxref>}{<\/tabxref> }gsi;
	
	
	
	
	return $Final_Fig;
}

sub asciiize {
    return $_[0] if (ord($_[0]) < 128);     
    return sprintf('&#x%04X;', ord($_[0])); 
}

sub Intellect_Part_Figure
	{
		my $Citation=shift;

		my $ID=shift;

		my $Part_ID=shift;

		my $Tmp=shift;

		
	
	if($Citation=~m{<xref ref\-type=\"([^\"]+)\" rid=\"([^\"]+)\">(\w+) (\w+)}gsi)
	{
		
		if($Tmp=~m{<fig id=\"F$Part_ID\"}gsi)
		{
			$Citation=~s{<xref ref\-type=\"([^\"]+)\" rid=\"([^\"]+)\">(\w+) ($Part_ID)<\/xref>}{<xref ref\-type=\"$1\" rid=\"F$Part_ID\">$3 $4<\/xref>}gsi;
		}

		
	}

	if($Citation=~m{<xref ref\-type=\"([^\"]+)\" rid=\"([^\"]+)\">(\w+)</xref>}gsi)
	{
		
		if($Tmp=~m{<fig id=\"F$Part_ID\"}gsi)
		{
			$Citation=~s{<xref ref\-type=\"([^\"]+)\" rid=\"([^\"]+)\">($Part_ID)<\/xref>}{<xref ref\-type=\"$1\" rid=\"F$Part_ID\">$3<\/xref>}gsi;
		}

		
	}

	

	return $Citation;
	}
sub Affiliation_Cit
{
	my $Aff=shift;

	my $Aff1=shift;

	$Aff1=~s{(.)}{<$Aff>$1<\/$Aff>}gsi;
	
	return $Aff1;
}

sub asciiize {
    return $_[0] if (ord($_[0]) < 128);     
    return sprintf('&#x%04X;', ord($_[0])); 
}

sub Abbreviation
{
	my $Abbrev=shift;

	$Abbrev=~s{<AbbreviationExpansion>}{<cegAbbreviationExpansion>}gsi;

	$Abbrev=~s{<\/AbbreviationExpansion>}{<\/cegAbbreviationExpansion>}gsi;

	$Abbrev=~s{<Abbreviation>}{<cegAbbreviation>}gsi;

	$Abbrev=~s{<\/Abbreviation>}{<\/cegAbbreviation>}gsi;

	
	return $Abbrev;
}

sub Table_Ndash
{

	my $Start=shift;
	
	my $First=shift;
	my $End=shift;
	my $Second=shift;
	my $Ndash=shift;
	my @Array_Id;
	my @Data;

	
	
	my $T="to";
	for(my $i=$Start;$i<=$End;$i++)
	{
		push(@Array_Id,"T$i");
		push(@Data,"<duplicate><xref ref-type=\"table\" rid=\"T$i\">$First$Ndash$Second<\/xref><\/duplicate>");
	}

	my $Final_Id=join(" ",@Array_Id);

	my $Final_Data=join("",@Data);

	

	$Final_Id="$Final_Data";
	
	return $Final_Id;
}


#my $Post_XML="D:\\tools\\Jaws\\XHTML_To_XML\\CIR.111111\\WORD\\pbio.3003095.postxml";

#$Post_XML=~s/\_\.xhtml$/\.postxml/i;

#my $Final_File="D:\\tools\\Jaws\\XHTML_To_XML\\CIR.111111\\WORD\\pbio.3003095.xml";

#$Final_File=~s/\_\.xhtml$/\.xml/i;


#system("$File_Path\\saxon.bat \"$XML_File\" \"$Post_XML\"");





#system("perl -w $File_Path\/Style_Conversion.pl \"$XML_File\" \"$ARGV[2]\"");

#system("$File_Path\/Style_Conversion.exe \"$XML_File\" \"$ARGV[2]\"");


sub Para_Style
{
	my $Para=shift;

	my $Style_Para=shift;

	if($Style_Para=~m{data\-name=\"([^\"]+)\"}gsi)
	{
		my $Style=$1;

		$Style=~s{\†}{}gsi;
		$Style=~s{\‡}{}gsi;
		$Style=~s{\_}{}gsi;
		$Style=~s{ }{}gsi;

		$Para="<$Style>$Para</$Style>";
	}

	$Para=~s{<span(\d+) ([^\>]+)\><\/span\1>}{}gsi;
	$Para=~s{<span(\d+) ([^\>]+)\>(.*?)<\/span\1>}{&Character_Style($3,$2)}gesi;
	
	
	return $Para;
}

sub Character_Style
{
	my $Para=shift;

	my $Style_Para=shift;

	if($Style_Para=~m{data\-name=\"([^\"]+)\"}gsi)
	{
		my $Style=$1;

		$Style=~s{\†}{}gsi;
		$Style=~s{\‡}{}gsi;
		$Style=~s{\_}{}gsi;
		$Style=~s{ }{}gsi;

		

		$Para="<$Style>$Para</$Style>";

		
	}

	
	
	
	return $Para;
}

sub Span_Check
{
	my $Span=shift;

	if($Span!~m{ data\-name=\"([^\"]+)\"}gsi)
	{
		$Span=~s{<span(\d+)([^\>]+)\>}{}gsi;
	}
	return $Span;
}

sub SecLevel
{
        my $secCont=shift;
        $secCont=~s#\n+#\n#gsi;
        $secCont=~s#\n#<enter>#gsi;
        $secCont=~s#<#\n<#gsi;
        $secCont=~s#>#>\n#gsi;
        my @Array=split("\n",$secCont);

        my $num='1';
        for (my $i=0; $i<scalar(@Array); $i++)
        {
                if ($Array[$i]=~m#<span#si)
                {
                    $Array[$i]=~s#<span#<span$num#si;
                    $num++;
                }
                if ($Array[$i]=~m#</span>#si)
                {
                    $num--;
                    $Array[$i]=~s#</span>#</span$num>#si;
                }
        }

        $secCont=join("",@Array);
        $secCont=~s#<enter>#\n#gsi;
        return $secCont;
}

sub DelLevel
{
        my $secCont=shift;
        $secCont=~s#\n+#\n#gsi;
        $secCont=~s#\n#<enter>#gsi;
        $secCont=~s#<#\n<#gsi;
        $secCont=~s#>#>\n#gsi;
        my @Array=split("\n",$secCont);

        my $num='1';
        for (my $i=0; $i<scalar(@Array); $i++)
        {
                if ($Array[$i]=~m#<del#si)
                {
                    $Array[$i]=~s#<del#<del$num#si;
                    $num++;
                }
                if ($Array[$i]=~m#</del>#si)
                {
                    $num--;
                    $Array[$i]=~s#</del>#</del$num>#si;
                }
        }

        $secCont=join("",@Array);
        $secCont=~s#<enter>#\n#gsi;
        return $secCont;
}
