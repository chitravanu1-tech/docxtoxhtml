use strict;

use warnings;



my ($XML_File,$TXT_File,$ART_Name,$Tmp,$FileName,$ENT,$Thin,$Thin1,$Element_File,$Element);



$TXT_File="pbio.3003095.xhtml";

my $Json_File="pbio.3003095.json";
	  


open (TXT, $TXT_File) || die "Can't open file '$TXT_File': $!\n";

{ local $/; $_=<TXT>; $Tmp=$_; }

close(TXT);





$Tmp=~s{<span data\-bkmark=\"([^\"]+)\"></span>}{\[para_no$1\]}gsi;



$Tmp=&SecLevel($Tmp);



$Tmp=&DelLevel($Tmp);





$Tmp=~s{<del(\d+) ([^\>]+)\>(.*?)<\/del\1>}{}gsi;



$Tmp=~s{<p ([^\>]+)\>(.*?)<\/p>}{&Para_Style($2,$1)}gesi;



$Tmp=~s{<span7 ([^\>]+)\>(.*?)<\/span5>}{&Character_Style($2,$1)}gesi;

$Tmp=~s{<span6 ([^\>]+)\>(.*?)<\/span5>}{&Character_Style($2,$1)}gesi;

$Tmp=~s{<span5 ([^\>]+)\>(.*?)<\/span5>}{&Character_Style($2,$1)}gesi;

$Tmp=~s{<span4 ([^\>]+)\>(.*?)<\/span4>}{&Character_Style($2,$1)}gesi;

$Tmp=~s{<span3 ([^\>]+)\>(.*?)<\/span3>}{&Character_Style($2,$1)}gesi;

$Tmp=~s{<span2 ([^\>]+)\>(.*?)<\/span2>}{&Character_Style($2,$1)}gesi;

$Tmp=~s{<span1 ([^\>]+)\>(.*?)<\/span1>}{&Character_Style($2,$1)}gesi;



$Tmp=~s{<div ([^\>]+)\>}{}gsi;



$Tmp=~s{<div>}{}gsi;



$Tmp=~s{<\/div>}{}gsi;



$Tmp=~s{<ins ([^\>]+)\>(.*?)<\/ins>}{$2}gsi;







$Tmp=~s{<a ([^\>]+)\>(.*?)<\/a>}{$2}gsi;


my $Error_Count="1";     




my $Authors_Tmp=$Tmp;



while($Authors_Tmp=~m{<FMAuthors>(.*?)<\/FMAuthors>}gsi)

{

	my $Authors=$1;

	my $Authors1=$1;

	my $Authors2=$1;

	my $Authors3=$1;

	my $Authors4=$1;

	my $Authors5=$1;

	my $Authors6=$1;

	my $Authors7=$1;

	my $Authors8=$1;

	my $Authors9=$1;



	my $Authors_Citation=$Authors;



	$Authors=~s{<(fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmcorrSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmauDegree|fmauCollab|italic|bold|sup|sub|smallcaps|Affxref|fnxref|Affxrefonline|fnxrefonline|query|orcxref|fmAlterGivenName|fmAlterSurname|fmTransGivenName|fmTransSurname|fmTransname)>}{}gsi;



	$Authors=~s{<\/(fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmcorrSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmauDegree|fmauCollab|italic|bold|sup|sub|smallcaps|Affxref|fnxref|Affxrefonline|fnxrefonline|query|orcxref|fmAlterGivenName|fmAlterSurname|fmTransGivenName|fmTransSurname|fmTransname)>}{}gsi;



	$Authors=~s{<(fmauSurname|fmauGivenName|fmauPrefix|fmauSuffix|fmcorrSuffix|fmcorrSurname|fmcorrGivenName|fmcorrPrefix|fmcorrDegree|fmauDegree|fmauCollab|italic|bold|sup|sub|smallcaps|Affxref|fnxref|Affxrefonline|fnxrefonline|query|orcxref|fmAlterGivenName|fmAlterSurname|fmTransGivenName|fmTransSurname|fmTransname)\/>}{}gsi;



	my $Para_No;

	

	if($Authors_Citation=~m{\[para\_no([^\]]+)\]}gsi)

	{

		$Para_No=$1;



		
	}



	while($Authors=~m{<(\w([^\>]+))\>}gsi)

	{

		my $Character_Style=$1;



		my $cnum = index($Authors, $Character_Style) + 1;



		

		open (XML, ">>$Json_File") || die "Can't create XML file '$Json_File': $!\n";

			   {

 

       

			   print XML "\{\"ID\" : \"$Error_Count\",\"severity\" : \"ERROR\",\"message\" : \"Unwanted style $Character_Style found in fmauthors\",\"additionalLocations\" : 0,\"locations\" : \[ \{\"path\" : \"$Para_No\",\"line\" : 1,\"column\" : $cnum,\"context\" : \"Word\"\} \]\}";

			   }

			   close(XML);
		



	}


			   $Authors1=~s{<(\w([^\>]+))\>(.*?)<\/\1>}{}gsi;



	$Authors1=~s{(and)}{}gsi;



	$Authors1=~s{([\,\.\;\:\]\[\–]+)}{}gsi;



	print $Authors1."\n";
	while($Authors1=~m{(\w+)}gsi)

	{

		

		

		my $cnum = index($Authors, "$1") + 1;

		

		

			   open (XML, ">>$Json_File") || die "Can't create XML file '$Json_File': $!\n";

			   {

 

       

			   print XML "\{\"ID\" : \"$Error_Count\",\"severity\" : \"ERROR\",\"message\" : \"Free text found $Authors1\",\"additionalLocations\" : 0,\"locations\" : \[ \{\"path\" : \"$Para_No\",\"line\" : 1,\"column\" : $cnum,\"context\" : \"Word\"\} \]\}";

			   }

			   close(XML);

		$Error_Count++;
	}





	while($Authors1=~m{\(}gsi)

	{

		

		

		my $cnum = index($Authors, "$1") + 1;


			    open (XML, ">>$Json_File") || die "Can't create XML file '$Json_File': $!\n";

			   {

 

       

			   print XML "\{\"ID\" : \"$Error_Count\",\"severity\" : \"ERROR\",\"message\" : \"Free text \( is not allowed in \†FM_Authors\'\",\"additionalLocations\" : 0,\"locations\" : \[ \{\"path\" : \"$Para_No\",\"line\" : 1,\"column\" : $cnum,\"context\" : \"Word\"\} \]\}";

			   }

			   close(XML);
		

		
$Error_Count++;

	}



	while($Authors1=~m{\)}gsi)

	{

		

		

		my $cnum = index($Authors, "$1") + 1;

		


			    open (XML, ">>$Json_File") || die "Can't create XML file '$Json_File': $!\n";

			   {

 

       

			   print XML "\{\"ID\" : \"$Error_Count\",\"severity\" : \"ERROR\",\"message\" : \"\'Free text \) is not allowed in \†FM_Authors\'\",\"additionalLocations\" : 0,\"locations\" : \[ \{\"path\" : \"$Para_No\",\"line\" : 1,\"column\" : $cnum,\"context\" : \"Word\"\} \]\}";

			   }

			   close(XML);
		

		
$Error_Count++;




	}





	



				


}



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