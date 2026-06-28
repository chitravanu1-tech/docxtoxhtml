use strict;
use warnings;
use Cwd;
use Cwd 'abs_path';

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

if($Body_Tmp=~m{<body ([^\>]+)\>(.*?)<\/body>}gsi)
{
	$Tmp="<body xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\">$2<\/body>";
}

#Cleanup



$Tmp=~s{<div ([^\>]+)\>(.*?)<\/div>}{$2}gsi;

$Tmp=~s{<div ([^\>]+)\>(.*?)<\/div>}{$2}gsi;

$Tmp=&SecLevel($Tmp);

$Tmp=&DelLevel($Tmp);


$Tmp=~s{<del(\d+) ([^\>]+)\>(.*?)<\/del\1>}{}gsi;

$Tmp=~s{latex=\"([^\"]+)\"}{}gsi;

$Tmp=~s{<span(\d+) data\-bkmark=\"para([^\"]+)\"></span\1>}{\[para$2\]}gsi;


$Tmp=~s{<script ([^\>]+)\>(.*?)<\/script>}{}gsi;

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


$Tmp=~s{<span8 ([^\>]+)\>(.*?)<\/span8>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span9 ([^\>]+)\>(.*?)<\/span9>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span10 ([^\>]+)\>(.*?)<\/span10>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span11 ([^\>]+)\>(.*?)<\/span11>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span12 ([^\>]+)\>(.*?)<\/span12>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span13 ([^\>]+)\>(.*?)<\/span13>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span14 ([^\>]+)\>(.*?)<\/span14>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span15 ([^\>]+)\>(.*?)<\/span15>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span16 ([^\>]+)\>(.*?)<\/span16>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span17 ([^\>]+)\>(.*?)<\/span17>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span18 ([^\>]+)\>(.*?)<\/span18>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span19 ([^\>]+)\>(.*?)<\/span19>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span20 ([^\>]+)\>(.*?)<\/span20>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span7 ([^\>]+)\>(.*?)<\/span7>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span6 ([^\>]+)\>(.*?)<\/span6>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span5 ([^\>]+)\>(.*?)<\/span5>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span4 ([^\>]+)\>(.*?)<\/span4>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span3 ([^\>]+)\>(.*?)<\/span3>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span2 ([^\>]+)\>(.*?)<\/span2>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span1 ([^\>]+)\>(.*?)<\/span1>}{&Character_Style($2,$1)}gesi;

$Tmp=~s{<span20>(.*?)<\/span20>}{$1}gsi;
$Tmp=~s{<span19>(.*?)<\/span19>}{$1}gsi;
$Tmp=~s{<span18>(.*?)<\/span18>}{$1}gsi;
$Tmp=~s{<span17>(.*?)<\/span17>}{$1}gsi;
$Tmp=~s{<span16>(.*?)<\/span16>}{$1}gsi;
$Tmp=~s{<span15>(.*?)<\/span15>}{$1}gsi;
$Tmp=~s{<span14>(.*?)<\/span14>}{$1}gsi;
$Tmp=~s{<span13>(.*?)<\/span13>}{$1}gsi;
$Tmp=~s{<span12>(.*?)<\/span12>}{$1}gsi;
$Tmp=~s{<span11>(.*?)<\/span11>}{$1}gsi;
$Tmp=~s{<span10>(.*?)<\/span10>}{$1}gsi;
$Tmp=~s{<span9>(.*?)<\/span9>}{$1}gsi;
$Tmp=~s{<span8>(.*?)<\/span8>}{$1}gsi;
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

$Tmp=~s{<meta ([^\>]+)\>}{}gsi;

$Tmp=~s{\&\#x200C\;}{}gsi;

$Tmp=~s{\&nbsp\;}{ }gsi;

$Tmp=~s{\&\#x00A0;}{ }gsi;

$Tmp=~s{\&amp;\#x00A0;}{ }gsi;

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



#my $Post_XML="D:\\tools\\Jaws\\XHTML_To_XML\\CIR.111111\\WORD\\pbio.3003095.postxml";

#$Post_XML=~s/\_\.xhtml$/\.postxml/i;

#my $Final_File="D:\\tools\\Jaws\\XHTML_To_XML\\CIR.111111\\WORD\\pbio.3003095.xml";

#$Final_File=~s/\_\.xhtml$/\.xml/i;


#system("$File_Path\\saxon.bat \"$XML_File\" \"$Post_XML\"");





system("perl -w $File_Path\/Style_Conversion.pl \"$XML_File\" \"$ARGV[2]\"");

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
