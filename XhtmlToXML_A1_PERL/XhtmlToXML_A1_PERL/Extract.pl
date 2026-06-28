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

print $File_Path;

$File_Path=~s{\/extract.exe}{}gsi;

$File_Path=~s{\\extract.exe}{}gsi;

$File_Path=~s{\/extract.pl}{}gsi;

$File_Path=~s{\\extract.pl}{}gsi;

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

if($Body_Tmp=~m{<body>(.*?)<\/body>}gsi)
{
	$Tmp="<body xmlns:w=\"http://schemas.openxmlformats.org/wordprocessingml/2006/main\">$1<\/body>";
}



my $Comment_Tmp=$Tmp;

#while($Comment_Tmp=~m{<span data\-comment=\"([^\"]+)\"([^\>]+)\>}gsi)
#{
	#my $C=$1;

	

	my $C_Tmp=$Tmp;

	while($C_Tmp=~m{<commentreference ([^\>]+)\>(.*?)</commentreference>}gsi)
	{
		my $Comments_Number=$1;

		my $Comments_Status=$1;

		my $Comment=$2;

		$Comment=~s{<p ([^\>]+)\>}{}gsi;

		$Comment=~s{<p>}{}gsi;

		$Comment=~s{<\/p>}{}gsi;
		

		if($Comments_Status!~m{data\-change=\"commentdeleted\"}gsi)
		{

		  
	        if($Comments_Number=~m{data\-commentvalue=\"([^\"]+)\"}gsi)
		{

			my $C=$1;

			
		

		#$Tmp=~s{(<span data\-comment=\"$C\"([^\>]+)\>)}{<w:r><w:rPr><w:rStyle w:val=\"Query\"/>$Comment</w:rPr></w:r>}gsi;

		$Tmp=~s{(<span data\-change="commentadded" data\-comment=\"$C\"([^\>]+)\>)}{$1<w:r><w:rPr><w:rStyle w:val=\"Query\"/>$Comment</w:rPr></w:r>}gsi;
		
		}
		}
	}

	
#}

$Tmp=~s{\n}{}gsi;

$Tmp=~s{\r}{}gsi;



$Tmp=~s{<div id=\"comment_"([^\>]+)\>(.*?)<\/div>}{}gsi;

my $Supp_Tmp=$Tmp;

my $S_Count="1";

while($Supp_Tmp=~m{ id=\"smr([^\"]+)\"}gsi)
{
	my $SID="smr$1";

	$Tmp=~s{ id=\"$SID\"}{ id=\"iop$S_Count\"}gsi;

	$Tmp=~s{\#$SID\"}{\#iop$S_Count\"}gsi;
	
	$S_Count++;
	
}

$Tmp=~s{ id=\"iop}{ id=\"smr}gsi;

$Tmp=~s{\#iop}{\#smr}gsi;


$Tmp=~s{<div ([^\>]+)\>}{}gsi;

$Tmp=~s{<div>}{}gsi;

$Tmp=~s{<\/div>}{}gsi;

$Tmp=~s{class=\"DACorrespondingauthorIndicator\"}{class=\"AffXref\"}gsi;

$Tmp=~s{class=\"DA_Currentaddress_Indicator\"}{class=\"AffXref\"}gsi;

$Tmp=~s{class=\"DA_Correspondingauthor_Indicator\"}{class=\"AffXref\"}gsi;

$Tmp=~s{class=\"DA_Equalcontribution_Indicator\"}{class=\"AffXref\"}gsi;

$Tmp=~s{class=\"DA_Equalcontribution_Indicator\"}{class=\"AffXref\"}gsi;

$Tmp=~s{class=\"CorrespondingauthorIndicator\"}{class=\"AffXref\"}gsi;

$Tmp=~s{class=\"Currentaddress_Indicator\"}{class=\"AffXref\"}gsi;

$Tmp=~s{class=\"DACurrentaddressIndicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{class=\"DA_CurrentaddressIndicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{class=\"HeadingNumber\"}{class=\"label\"}gsi;

$Tmp=~s{data\-name=\"DA_Correspondingauthor_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DACurrentaddressIndicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DA_CurrentaddressIndicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DA_CurrentaddressIndicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"Correspondingauthor_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DA_Equalcontribution_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DACorrespondingauthorIndicator\"}{class=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DA_Currentaddress_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DA_Correspondingauthor_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DA_Equalcontribution_Indicator\"}{data\-name=\"AffXref\"}gsi;


$Tmp=~s{data\-name=\"Deceasedauthor_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DA_Deceasedauthor_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"Equalauthorship_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DA_Equalauthorship_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"Equalcontribution_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"Groupauthorship_Collab_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"DA_Groupauthorship_Collab_Indicator\"}{data\-name=\"AffXref\"}gsi;

$Tmp=~s{data\-name=\"HeadingNumber\"}{data\-name=\"label\"}gsi;

$Tmp=~s{\&\#x200C;}{}gsi;

$Tmp=~s{\&\#}{\&amp;\#}gsi;

$Tmp=~s{\"\&amp;\#x2020;}{}gsi;

$Tmp=~s{\"\&amp;\#x2021;}{}gsi;

$Tmp=~s{<b>(.*?)<\/b>}{<w:r><w:rPr><w:rStyle w:val=\"bold\"/>$1</w:rPr></w:r>}gsi;




$Tmp=&SecLevel($Tmp);

$Tmp=&DelLevel($Tmp);

$Tmp=~s{latex=\"\n}{latex=\"}gsi;

#$Tmp=~s{(latex=\"([^\"]+)\")}{&Latex($1)}gesi;


$Tmp=~s{(<span(\d+) class=\"math\-content\"([^\>]*)\>)}{&Latex($1)}gesi;



$Tmp=~s{<span(\d+) data\-bkmark=\"para([^\"]+)\"></span\1>}{\[para$2\]}gsi;


$Tmp=~s{\[para([^\]]+)\](.*?)\[para\1\]}{$2\[para$1\]}gsi;



#$Tmp=~s{<math ([^\>]+)\><math>(.*?)<\/math><\/math>}{}gsi;

$Tmp=~s{<math>(.*?)<\/math>}{}gsi;

$Tmp=~s{<math ([^\>]+)\>(.*?)<\/math>}{}gsi;

$Tmp=~s{<\/math>}{}gsi;

$Tmp=~s{<del(\d+) ([^\>]+)\>(.*?)<\/del\1>}{}gsi;

$Tmp=~s{<del(\d+)\>(.*?)<\/del\1>}{}gsi;



#$Tmp=~s{<span(\d+) data\-bkmark=\"([^\"]+)\"></span\1>}{<w\:bookmarkStart w\:id=\"1\" w\:name=\"$2\"/>}gsi;


$Tmp=~s{<li ([^\>]+)\>(.*?)<\/li>}{<p $1>$2<\/p>}gsi;

$Tmp=~s{(<figcaption ([^\>]+)\>(.*?)<\/figcaption>)}{&Figure_Para($1)}gesi;

$Tmp=~s{<figcaption ([^\>]+)\>(.*?)<\/figcaption>}{<p $1>$2<\/p>}gsi;

$Tmp=~s{<figure>(.*?)<\/figure>}{$1}gsi;

$Tmp=~s{<ol>(.*?)<\/ol>}{$1}gsi;

$Tmp=~s{<ol ([^\>]+)\>(.*?)<\/ol>}{$2}gsi;

$Tmp=~s{<p ([^\>]+)\>(.*?)<\/p>}{&Para_Style($2,$1)}gesi;



$Tmp=~s{<span7 ([^\>]+)\>(.*?)<\/span7>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span6 ([^\>]+)\>(.*?)<\/span6>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span5 ([^\>]+)\>(.*?)<\/span5>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span4 ([^\>]+)\>(.*?)<\/span4>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span3 ([^\>]+)\>(.*?)<\/span3>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span2 ([^\>]+)\>(.*?)<\/span2>}{&Character_Style($2,$1)}gesi;
$Tmp=~s{<span1 ([^\>]+)\>(.*?)<\/span1>}{&Character_Style($2,$1)}gesi;



$Tmp=~s{<ins ([^\>]+)\>(.*?)<\/ins>}{$2}gsi;

$Tmp=~s{<a href=\"\#File(\s?)([^\"]+)\">(.*?)<\/a>}{<w:r><w\:t>\&lt\;target\&gt;$2\&lt\;\/target\&gt;$3\&lt\;urllink\&gt;<\/w\:t></w:r>}gsi;

#$Hyperlink=~s{}gsi;<w\:t>(.*?)<\/w\:t>}{<w\:t>\&lt\;target\&gt;$Target\&lt\;\/target\&gt;$1\&lt\;urllink\&gt;<\/w\:t>



$Tmp=~s{(<w\:p><w\:pPr><w\:pStyle w\:val=\"SupplementaryMaterialSource\"\/>(.*?)<\/w\:p>)}{&Suppl_Source($1)}gesi;

$Tmp=~s{(<a class=\"citationSupplMaterial\"([^\>]+)\>(.*?)<\/a>)}{&Supp_Xref($1).$3}gesi;

$Tmp=~s{(<a ([^\>]+)\>(.*?)<\/a>)}{&A_Span($1)}gesi;



$Tmp=~s{<a ([^\>]+)\>(.*?)<\/a>}{$2}gsi;


$Tmp=~s{<table ([^\>]+)\>}{<w\:p><table $1>}gsi;

$Tmp=~s{<\/table>}{<\/table><\/w\:p>}gsi;

#$Tmp=~s{(<w\:bookmarkStart w\:id=\"([^\"]+)\" w\:name=\"para([^\"]+)\"(.*?)<w\:t>)}{$1\[Supppara$3\]}gsi;

#$Tmp=~s{(<w\:bookmarkStart w\:id=\"([^\"]+)\" w\:name=\"para([^\"]+)\"(.*?)<w\:t ([^\>]+)\>)}{$1\[Supppara$3\]}gsi;


$Tmp=~s{(<w\:p ([^\>]+)\>(.*?)<\/w\:p>)}{&Plos_Author_Style($1)}gesi;

$Tmp=~s{(<w\:p>(.*?)<\/w\:p>)}{&Plos_Author_Style($1)}gesi;




$Tmp=~s{\n{1,}}{\n}gsi;

$Tmp=~s{ {1,}}{ }gsi;



open (XML, ">$XML_File") || die "Can't create XML file '$XML_File': $!\n";
{
 
       
    print XML $Tmp;
}
close(XML);

my $Post_XML=$ARGV[3];#"/home/pagemajik/Documents/PERL_PostscriptImage/XhtmlToXML_A1_PERL-local/PONE.111111/Word/pbio.0322707.postxml";

$Post_XML=~s/\_\.xhtml$/\.postxml/i;

my $Final_File=$ARGV[4];#"/home/pagemajik/Documents/PERL_PostscriptImage/XhtmlToXML_A1_PERL-local/PONE.111111/Word/pbio.0322707.xml";

$Final_File=~s/\_\.xhtml$/\.xml/i;

print "$File_Path\/saxon.sh \"$XML_File\" \"$Post_XML\"";


system("$File_Path\/saxon.bat \"$XML_File\" \"$Post_XML\"");


#print "perl -w $File_Path\/Conversion.pl \"$Post_XML\" \"$Final_File\" \"$Client_Name\" \"$Journal_Name\" \"$Jats\" \"$Source_Dir\"";

#system("perl -w $File_Path\/Conversion.pl \"$Post_XML\" \"$Final_File\" \"$Client_Name\" \"$Journal_Name\" \"$Jats\" \"$Source_Dir\"");     

system("perl -w $File_Path\/Conversion.pl \"$Post_XML\" \"$Final_File\" \"$Client_Name\" \"$Journal_Name\" \"$Jats\" \"$Source_Dir\" \"D:\\tools\\XHTML_XML_Conversion\\JATS_XML-Conversion\\Support Files\\Final_Conversion.ent\" \"D:\\tools\\XHTML_XML_Conversion\\JATS_XML-Conversion\\Support Files\\Thinspace.ini\" \"D:\\tools\\XHTML_XML_Conversion\\JATS_XML-Conversion\\Support Files\\IOP_Badbreak.ini\" \"D:\\tools\\XHTML_XML_Conversion\\JATS_XML-Conversion\\Support Files\\Elements.ini\" \"D:\\tools\\XHTML_XML_Conversion\\JATS_XML-Conversion\\Support Files\\pone.xml\" \"D:\\tools\\Jaws\\XHTML_To_XML\\CIR.111111\\FROM_CLIENT\\Accepted_manuscripts\\peer_review\\pbio.3003442_Peer_Review.json\" \"D:\\tools\\XHTML_XML_Conversion\\JATS_XML-Conversion\\Support Files\\EntityReplacement.ini\" \"D:\\tools\\Jaws\\JATS-Publishing-1-3-MathML3-DTD\\JATS-journalpublishing1-3-mathml3.dtd\" \"D:\\tools\\Jaws\\XHTML_To_XML\\CIR.111111\\WORD\\pone.0327542.log\" \" \" \"D:\\tools\\Jaws\\XHTML_To_XML\\meta.xml\" \"D:\\tools\\Jaws\\plos.ini\"");





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

		$Para="<w:p><w:pPr><w:pStyle w:val=\"$Style\"/></w:pPr><w:r><w:t>$Para</w:t></w:r></w:p>";
	}

	$Para=~s{<span(\d+) ([^\>]+)\><\/span\1>}{}gsi;
	$Para=~s{<span(\d+) ([^\>]+)\>(.*?)<\/span\1>}{&Character_Style($3,$2)}gesi;

	$Para=~s{<sub>(.*?)<\/sub>}{<w:r><w:rPr><w:rStyle w:val=\"sub\"/>$1</w:rPr></w:r>}gsi;

	$Para=~s{<sup>(.*?)<\/sup>}{<w:r><w:rPr><w:rStyle w:val=\"sup\"/>$1</w:rPr></w:r>}gsi;

	$Para=~s{<u>(.*?)<\/u>}{<w:r><w:rPr><w:rStyle w:val=\"underline\"/>$1</w:rPr></w:r>}gsi;

	$Para=~s{<b>(.*?)<\/b>}{<w:r><w:rPr><w:rStyle w:val=\"bold\"/>$1</w:rPr></w:r>}gsi;

	$Para=~s{<i>(.*?)<\/i>}{<w:r><w:rPr><w:rStyle w:val=\"italic\"/>$1</w:rPr></w:r>}gsi;

	$Para=~s{<i ([^\>]+)\>(.*?)<\/i>}{<w:r><w:rPr><w:rStyle w:val=\"italic\"/>$2</w:rPr></w:r>}gsi;

	$Para=~s{<b ([^\>]+)\>(.*?)<\/b>}{<w:r><w:rPr><w:rStyle w:val=\"bold\"/>$2</w:rPr></w:r>}gsi;

	$Para=~s{<sup ([^\>]+)\>(.*?)<\/sup>}{<w:r><w:rPr><w:rStyle w:val=\"sup\"/>$2</w:rPr></w:r>}gsi;

	$Para=~s{<sub ([^\>]+)\>(.*?)<\/sub>}{<w:r><w:rPr><w:rStyle w:val=\"sub\"/>$2</w:rPr></w:r>}gsi;

	$Para=~s{<u ([^\>]+)\>(.*?)<\/u>}{<w:r><w:rPr><w:rStyle w:val=\"underline\"/>$2</w:rPr></w:r>}gsi;


	print $Para."\n";
	return $Para;
}

sub Character_Style
{
	my $Para=shift;

	my $Style_Para=shift;

	my $Style_Para1=$Style_Para;

	if($Style_Para=~m{data\-name=\"([^\"]+)\"}gsi)
	{
		my $Style=$1;

		$Style=~s{\†}{}gsi;
		$Style=~s{\‡}{}gsi;
		$Style=~s{\_}{}gsi;
		$Style=~s{ }{}gsi;

		

		$Para="<w:r><w:rPr><w:rStyle w:val=\"$Style\"/>$Para</w:rPr></w:r>";

		
	}

	if($Style_Para1=~m{style=\"font\-family\:Courier New\"}gsi)
	{
		my $Style=$1;

		$Style=~s{\†}{}gsi;
		$Style=~s{\‡}{}gsi;
		$Style=~s{\_}{}gsi;
		$Style=~s{ }{}gsi;

		

		$Para="<w:r><w:rPr><w:rStyle w:val=\"monospace\"/>$Para</w:rPr></w:r>";

		
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

sub Suppl_Source
{
	my $Suppl=shift;

	$Suppl=~s{<a href=\"([^\"]+)\">(.*?)<\/a>}{\[ext\-link ext\-link\-type=\"uri\" href=\"$1\"\]$2\[\/ext\-link\]}gsi;

	
	
	return $Suppl;
}

sub Supp_Xref
{
	my $Supp=shift;

	

	if($Supp=~m{\#smr([^\"]+)\"}gsi)
	{
		$Supp="[Subxref$1\]";
	}

	
	
	return $Supp;
}

sub Latex
{
	my $Latex=shift;

	my $Latex1=$Latex;

	my $Latex2=$Latex;

	my $Eqn;

	my $Tex;

	if($Latex1=~m{latex=\"(.*?)\"}gsi)
	{
		$Tex=$1;
	}

	if($Latex2=~m{data\-filename=\"(\w+)\.tex\"}gsi)
	{
		$Eqn=$1;
	}
	else
	{
		$Eqn="Eqn0";
	}

	$Latex="\[tex\]$Tex\[\/tex\]\&amp;\#x003C\;\&amp;\#x003C\;$Eqn\&amp;\#x003E\;\&amp;\#x003E\;$Latex";

	
	
	return $Latex;
}

sub A_Span
{
	my $Span=shift;

	my $Span1=$Span;

	if($Span=~m{style=\"display\:none\;\"}gsi)
	{
		$Span="";
	}

	if($Span1=~m{style=\"display\:none\"}gsi)
	{
		$Span="";
	}
	
	return $Span;
}

 sub Plos_Author_Style
    {
	    my $Para=shift;
	    my $Para1=$Para;
	    my $Para2=$Para;
	    my $Para3=$Para;
	    my $Para4=$Para;

	   

	    if($Para1=~m{<w\:pStyle w:val=\"FMAuthors\"}gsi)
	    {
		    

		 $Para=~s{(<w\:r ([^\>]+)\>(.*?)<\/w\:r>)}{&Plos_Collab($1)}gesi;

		 $Para=~s{(<w\:r>(.*?)<\/w\:r>)}{&Plos_Collab($1)}gesi;
		  
	    }

	   
	    
	    
	    return $Para;
    }

 sub Plos_Collab
{
	my $Key=shift;

	my $Key1=$Key;

	my $Key2=$Key;

	my $Key3=$Key;


	
	

	   if($Key=~m{<w\:rStyle w:val=\"(fmaucollab)\"}gsi)
	    {

		   

		   if($Key1=~m{<i>}gsi)
		   {
		  
		   $Key=~s{<i>(.*?)<\/i>}{\[\[\[italic\]\]\]$1\[\[\[\/italic\]\]\]}gsi;
		   

		   
		   }

		   if($Key1=~m{<b>}gsi)
		   {
		  
		   $Key=~s{<b>(.*?)<\/b>}{\[\[\[bold\]\]\]$1\[\[\[\/bold\]\]\]}gsi;
		   
		   }

		  
	    }

	
	
	return $Key;
}

sub Figure_Para
{
	my $Figure=shift;

	$Figure=~s{<p ([^\>]+)\>(.*?)<\/p>}{<figcaption $1>$2<\/figcaption>}gsi;

	$Figure=~s{<figcaption ([^\>]+)\><figcaption ([^\>]+)\>}{<figcaption $1>}gsi;

	$Figure=~s{<\/figcaption><\/figcaption>}{<\/figcaption>}gsi;
	
	return $Figure;
}