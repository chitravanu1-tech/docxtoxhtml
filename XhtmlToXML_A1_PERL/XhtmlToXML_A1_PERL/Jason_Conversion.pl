use strict;
use warnings;
use File::Find;
use JSON;

my $Json_XML=$ARGV[0];
my $FileName=$ARGV[1];
my $Source_Dir=$ARGV[2];
my $doi=$ARGV[1];
my $Journal_File=$ARGV[3];
my $Cats_File=$ARGV[4];
my $XML_File=$ARGV[5];
my $ENT_File1=$ARGV[6];
my @Sub_Article;

my $R_Count="1";
my $Su_Count1="001";
my $Sub_Count="001";
my $SR_Count="100";
my @Supp_Rename_File;
my $Extension;

my $Jou;

my $Cats;

if(-e $Cats_File)
{

open(THN,$Cats_File) || die "Can't open file '$Cats_File': $!\n";
{ local $/; $_=<THN>; $Cats=$_; }
close(THN);

}


open(THN1,"$Journal_File") || die "Can't open file '$Journal_File': $!\n";
{ local $/; $_=<THN1>; $Jou=$_; }
close(THN1);


my $PLOS_Li;
	my $Licence_Cats=$Cats;

	if($Licence_Cats=~m{<custom\-meta id=\"copyright\-statement\_v(\d+)\">(.*?)<\/custom\-meta>}gsi)
	{
		my $Custom=$2;

		if($Custom=~m{<meta\-value>Yes}gsi)
		{
			
			$PLOS_Li="<license xlink:href=\"https://creativecommons.org/publicdomain/zero/1.0/\" xlink:type=\"simple\"><license-p>This is an open access article, free of all copyright, and may be freely reproduced, distributed, transmitted, modified, built upon, or otherwise used by anyone for any lawful purpose. The work is made available under the <ext-link ext-link-type=\"uri\" xlink:href=\"https://creativecommons.org/publicdomain/zero/1.0/\" xlink:type=\"simple\">Creative Commons CC0</ext-link> public domain dedication.</license-p>\n</license>";
		}
		else
		{
			
			$PLOS_Li="<license xlink:href=\"http://creativecommons.org/licenses/by/4.0/\" xlink:type=\"simple\">\n<license-p>This is an open access article distributed under the terms of the <ext-link ext-link-type=\"uri\" xlink:href=\"http://creativecommons.org/licenses/by/4.0/\" xlink:type=\"simple\">Creative Commons Attribution License</ext-link>, which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.</license-p>\n</license>";
		}
	}
	else
	{
			
		$PLOS_Li="<license xlink:href=\"http://creativecommons.org/licenses/by/4.0/\" xlink:type=\"simple\">\n<license-p>This is an open access article distributed under the terms of the <ext-link ext-link-type=\"uri\" xlink:href=\"http://creativecommons.org/licenses/by/4.0/\" xlink:type=\"simple\">Creative Commons Attribution License</ext-link>, which permits unrestricted use, distribution, and reproduction in any medium, provided the original author and source are credited.</license-p>\n</license>";
	}
	

$Jou=~s{\&amp;(\w+);}{\&$1\;}gsi;

my $Journal_Cats;

my ($Abbrev,$Publisher_Loc,$Copy_State,$Copy_Holder,$Copy_Year,$Journal_Title,$Publisher_Code,$ISSNpPub,$ISSNePub,$Journal_Sub_Title);

my ($Publisher_Name,$Licence);


if($Jou=~m{(<JournalName>(.*?)<\/JournalName>)}si)
{

$Journal_Cats=$2;
}

if($Jou=~m{(<PublisherName>(.*?)<\/PublisherName>)}si)
{
	$Publisher_Name=$2;
}

if($Jou=~m{(<PublisherCode>(.*?)<\/PublisherCode>)}si)
{

$Publisher_Code=$2;
}

if($Jou=~m{(<JournalTitle>(.*?)<\/JournalTitle>)}si)
{

$Journal_Title=$2;
}

if($Jou=~m{(<JournalSubTitle>(.*?)<\/JournalSubTitle>)}si)
{
	$Journal_Sub_Title=$2;
}

if($Jou=~m{(<JournalTitleAbbreviation>(.*?)<\/JournalTitleAbbreviation>)}si)
{
	$Abbrev=$2;
}



if($Jou=~m{(<ISSNPpub>(.*?)<\/ISSNPpub>)}si)
{
	$ISSNpPub=$2;
}

if($Jou=~m{(<ISSNEpub>(.*?)<\/ISSNEpub>)}si)
{
	$ISSNePub=$2;
}



if($Jou=~m{(<PublisherLocation>(.*?)<\/PublisherLocation>)}si)
{
	$Publisher_Loc=$2;
}

if($Jou=~m{(<CopyRightStatement>(.*?)<\/CopyRightStatement>)}si)
{
	$Copy_State=$2;
}

if($Jou=~m{(<CopyRightHolder>(.*?)<\/CopyRightHolder>)}si)
{
	$Copy_Holder=$2;
}

if($Jou=~m{(<CopyRightYear>(.*?)<\/CopyRightYear>)}si)
{
	
	$Copy_Year=$2;
	
	
}





my @J_files2;
	find(
	 sub {
		
		push(@J_files2,$File::Find::name)if /(.*?)$/},"$Source_Dir");



print print "JSON_File$Json_XML\n";

if(-e "$Json_XML")
{

	#system("perl /home/pagemajik/Documents/PERL_PostscriptImage/XhtmlToXML_A1_PERL/UTF8.pl \"$Json_XML\"");

open my $fh, '<', $Json_XML or die "Cannot open file: $!";
my $json_text = do { local $/; <$fh> };
close $fh;

$json_text=~s{\<(\d+)}{\&\#x003C;$1}gsi;

$json_text=~s{\<\&}{\&\#x003C;\&}gsi;

$json_text=~s{(<([^\>]+)\>)}{&Plos_Tag_Checking($1)}gesi;

$json_text=~s{\<}{\&\#x003C;}gsi;
$json_text=~s{\>}{\&\#x003E;}gsi;

$json_text=~s{iopopen}{\<}gsi;
$json_text=~s{iopclose}{\>}gsi;

# Decode the JSON string into a Perl data structure
my $data = decode_json($json_text);



$data=~s{\x0D}{}gsi;
$data=~s{\x0D}{}gsi;
$data=~s{\x02}{}gsi;





# Accessing the JSON data
# Decode the JSON data


# Loop through the revisions and print the revision number and submission date


my $R_Count="001";
my $R_Count1="0";

# Initialize index
my $i = 0;

my $letter_body = $data->{data}->{findDocument}->{acceptanceLetter}->{letterBody};

my $Transmission_Data = $data->{data}->{findDocument}->{transferredSubmissionData}->{transferredSubmissionDataId};



my $Box_Data;

if($Transmission_Data ne "")
{
	$Box_Data="<boxed-text id=\"$FileName\.box001\" position=\"float\" specific-use=\"prior_peer_review_unavailable\"><sec id=\"sec0122\"><title>Transfer Alert</title><p>This paper was transferred from another journal. As a result, its full editorial history (including decision letters, peer reviews and author responses) may not be present.</p></sec></boxed-text>";
}


my $firstname;
	my $lastname;
        my $role_name;

	my $Revision_C1;
	my $Head;

# Iterate through revisions
foreach my $revision (@{$data->{data}->{findDocument}->{revisions}}) {

	my $Review_Count="1";
	my $Revision_Date;
	my $Revision_Date1;
	my $Revision_Count;
	my @Supp;
	my $Letter;
	
	my $filename;
	my $filename_content;
	my $filename_content_Type;
	my $Author_Response_Content;

	my $Author_Notification_Date = $revision->{authornotificationdate};
	my $Acceptance_Date          = $revision->{acceptanceLetterDate};
	my $Revision_Submitted_Date  = $revision->{revisionSubmittedDate};

	$Revision_Date=$revision->{acceptanceLetterDate};
       if($Revision_Date eq "")
       {
       $Revision_Date=$revision->{authornotificationdate};
       }
       $Revision_Date1=$revision->{revisionSubmittedDate};
	

	if (exists $revision->{decisionLetter}->{letterBody}) {
        
       $Letter=$revision->{decisionLetter}->{letterBody};

      
         
    }

	if (exists $revision->{decisionLetter}->{attachments}) {
        my $attachments = $revision->{decisionLetter}->{attachments};
       foreach my $attachment (@$attachments) {
      

	my $F_Extension=$attachment->{filename};

	

	print $F_Extension."\n";

	my $E;
	my $E1;

	if($F_Extension=~m{\.(\w+)$}gsi)
	{
		$E=$1;
	}

		
		
		
		if($E=~m{doc$}gsi)
		{
			$E1="application/msword";
		}
		if($E=~m{docx$}gsi)
		{
			$E1="application/vnd.openxmlformats-officedocument.wordprocessingml.document";
		}
		elsif($E=~m{pdf}gsi)
		{
			$E1="application/pdf";
		}
		elsif($E=~m{^ai$}gsi)
		{
			$E1="application/vnd.adobe.illustrator";
		}
		elsif($E=~m{rtf}gsi)
		{
			$E1="application/rtf";
		}
		elsif($E=~m{xlsx}gsi)
		{
			$E1="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
		}
		elsif($E=~m{xltx}gsi)
		{
			$E1="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
		}
		elsif($E=~m{ods}gsi)
		{
			$E1="application/vnd.oasis.opendocument.spreadsheet";
		}
		elsif($E=~m{xlsb}gsi)
		{
			$E1="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
		}
		elsif($E=~m{xls$}gsi)
		{
			$E1="application/vnd.ms-excel";
		}
		elsif($E=~m{rar}gsi)
		{
			$E1="application/vnd.rar";
		}
		elsif($E=~m{csv}gsi)
		{
			$E1="text/csv";
		}
		elsif($E=~m{tif}gsi)
		{
			$E1="image/tiff";
		}
		elsif($E=~m{eps}gsi)
		{
			$E1="application/eps";
		}
		elsif($E=~m{png}gsi)
		{
			$E1="image/png";
		}
		elsif($E=~m{(txt|tsv|tre)}gsi)
		{
			$E1="text/plain";
		}
		elsif($E=~m{mp4}gsi)
		{
			$E1="video/mp4";
		}
		elsif($E=~m{jpeg}gsi)
		{
			$E1="video/jpeg";
		}
		elsif($E=~m{mpg}gsi)
		{
			$E1="video/mpeg";
		}
		elsif($E=~m{zip}gsi)
		{
			$E1="application/zip";
		}
		elsif($E=~m{gif}gsi)
		{
			$E1="image/gif";
		}
		elsif($E=~m{xml}gsi)
		{
			$E1="text/xml";
		}
		elsif($E=~m{html}gsi)
		{
			$E1="application/vnd.dtg.local.html";
		}
		elsif($E=~m{sav}gsi)
		{
			$E1="application/octet-stream";
		}
		elsif($E=~m{^(do|INV)$}gsi)
		{
			$E1="application/octet-stream";
		}
		elsif($E=~m{vcf}gsi)
		{
			$E1="text/vcard";
		}
		elsif($E=~m{fasta}gsi)
		{
			$E1="application/fasta";
		}
		elsif($E=~m{^js$}gsi)
		{
			$E1="application/java";
		}
		elsif($E=~m{^R$}gsi)
		{
			$E1="application/octet-stream";
		}
		

		elsif($E=~m{^DTA$}gsi)
		{
			$E1="application/x-stata-dta";
		}
		elsif($E=~m{^7Z$}gsi)
		{
			$E1="application/x-7z-compressed";
		}
		
		elsif($E=~m{^nex$}gsi)
		{
			$E1="application/x-nex";
		}
		elsif($E=~m{^tps$}gsi)
		{
			$E1="application/x-tps";
		}
		elsif($E=~m{^mat$}gsi)
		{
			$E1="application/octet-stream";
		}
		elsif($E=~m{^py$}gsi)
		{
			$E1="application/x-python-code";
		}
		elsif($E=~m{^avi$}gsi)
		{
			$E1="video/avi";
		}
		elsif($E=~m{^ipynb$}gsi)
		{
			$E1="application/x-ipynb+json";
		}
		elsif($E=~m{^nb$}gsi)
		{
			$E1="application/x-ipynb+json";
		}
		elsif($E=~m{^mov$}gsi)
		{
			$E1="video/quicktime";
		}
		elsif($E=~m{^gz$}gsi)
		{
			$E1="application/gzip";
		}
		elsif($E=~m{^odt$}gsi)
		{
			$E1="application/vnd.oasis.opendocument.text";
		}
		elsif($E=~m{^owl$}gsi)
		{
			$E1="application/owl+xml";
		}
		elsif($E=~m{^ris$}gsi)
		{
			$E1="application/x-research-info-systems";
		}
		elsif($E=~m{^pzfx$}gsi)
		{
			$E1="application/vnd.graphpad.pzfx";
		}
		

		
		
	push(@Supp,"<supplementary-material id=\"$FileName.s$Su_Count1\" mimetype=\"$E1\" position=\"float\" xlink:href=\"$FileName.s$Su_Count1\.$E\" xlink:type=\"simple\"><label>Attachment</label><caption><p>Submitted filename: <named-content content-type=\"submitted-filename\">$attachment->{filename}</named-content></p></caption></supplementary-material>");


	my $Copy_File=$attachment->{filename};

	my $Copy_File1="$FileName.s$Su_Count1\.$E";


	

	

	push(@Supp_Rename_File,"\"$Copy_File\": \"$Copy_File1\"");

	

	
		foreach my $F(@J_files2)
		 {

			 $F=~s{\/}{\\}gsi;

			  my $F1=$F;

			 
			 
			 if($F=~m{\Q$Copy_File\E}gsi)
			{

				 copy("$F","$Source_Dir\\suppl\\For_XML\\$Copy_File1");

				
				 

			}
		 }

	

	$Su_Count1++;
        
    }
    }

	
	
	my $Final_Sup=join("",@Supp);

	my $Revision_C=$revision->{revision};

	
    
        # Check if editorAssignments exists and has elements
        if (exists $revision->{editorAssignments} && @{$revision->{editorAssignments}}) {
            foreach my $assignment (@{$revision->{editorAssignments}}) {
                $firstname = $assignment->{editor}{firstname};
		$lastname = $assignment->{editor}{lastname};
                $role_name = $assignment->{editorRoleName};

              
            }
	    foreach my $assignment (@{$revision->{reviews}}) {
               $Review_Count++;
            }
        } else {
            print "No editor assignments found.\n";
        }

	 if (exists $revision->{authorResponseFiles} && @{$revision->{authorResponseFiles}}) {
            foreach my $assignment (@{$revision->{authorResponseFiles}}) {
                $filename = $assignment->{exportedFilename};
		$filename_content_Type = $assignment->{contentType};
		  
            }
        } else {
		 $filename="";
            print "No editor assignments found.\n";
        }


	 if (exists $revision->{authorResponseText}) {
    if (ref $revision->{authorResponseText} eq 'HASH') {
        # Handle single hash case
        my $response = $revision->{authorResponseText};

	print "Content_$response\n";
        if (exists $response->{responseToReviewers}) {
            #print "Exported Response: $response->{responseToReviewers}\n";
	    $filename_content = $response->{responseToReviewers};
        } else {
            #print "No 'responseToReviewers' key found in single authorResponseText.\n";
        }
    } elsif (ref $revision->{authorResponseText} eq 'ARRAY') {
        # Handle array case
        foreach my $response (@{$revision->{authorResponseText}}) {
            if (exists $response->{responseToReviewers}) {
                #print "Exported Response: $response->{responseToReviewers}\n";
		$filename_content = $response->{responseToReviewers};
            } else {
                #print "No 'responseToReviewers' key found in array authorResponseText.\n";
            }
        }
    } else {
        #print "'authorResponseText' exists but is not a hash or array. Type: " . ref($revision->{authorResponseText}) . "\n";
    }
} else {
    #print "'authorResponseText' does not exist in this revision.\n";
}

	

	 



	 my $Date_P;

	 if($Revision_Date=~m{(\d+)\-(\d+)\-(\d+)}gsi)
	 {
		  my $P_Months=$2;
		  my $P_Year=$1;
		  my $P_Date=$3;
		 my %Months_P=('01'=>'Jan','02'=>'Feb','03'=>'Mar','04'=>'Apr','05'=>'May','06'=>'Jun','07'=>'Jul','08'=>'Aug','09'=>'Sep','10'=>'Oct','11'=>'Nov','12'=>'Dec','1'=>'Jan','2'=>'Feb','3'=>'Mar','4'=>'Apr','5'=>'May','6'=>'Jun','7'=>'Jul','8'=>'Aug','9'=>'Sep');
		 
		$P_Months=$Months_P{$P_Months};

		$P_Date=~s{^0}{}si;

		$Date_P="$P_Date $P_Months $P_Year";

		

		
	 }

	  my $Date_P1;

	 if($Revision_Date1=~m{(\d+)\-(\d+)\-(\d+)}gsi)
	 {
		  my $P_Months=$2;
		  my $P_Year=$1;
		  my $P_Date=$3;
		 my %Months_P=('01'=>'Jan','02'=>'Feb','03'=>'Mar','04'=>'Apr','05'=>'May','06'=>'Jun','07'=>'Jul','08'=>'Aug','09'=>'Sep','10'=>'Oct','11'=>'Nov','12'=>'Dec','1'=>'Jan','2'=>'Feb','3'=>'Mar','4'=>'Apr','5'=>'May','6'=>'Jun','7'=>'Jul','8'=>'Aug','9'=>'Sep');
		 
		$P_Months=$Months_P{$P_Months};

		$P_Date=~s{^0}{}si;

		$Date_P1="$P_Date $P_Months $P_Year";

		

		
	 }

	 my $Letter1=$Letter;

	 if($Letter1!~m{<p>}gsi)
	 {
	 
	$Letter=~s{\n{1,}}{\n}gsi;
	$Letter=~s{ {1,}}{ }gsi;
	$Letter=~s{\n}{<\/p>\n<p>}gsi;
	$Letter=~s{<p><\/p>}{}gsi;

	
	
	 }

	

	$filename_content=~s{\r\n\r\n}{\n}gsi;
	$filename_content=~s{\r\n}{\n}gsi;
	$filename_content=~s{\t}{ }gsi; 
	$filename_content=~s{\n{1,}}{\n}gsi;
	$filename_content=~s{ {1,}}{ }gsi;
	$filename_content=~s{\n}{<\/p>\n<p>}gsi;
	$filename_content=~s{<p><\/p>}{}gsi;

	$Letter=~s{<b>([^\<]+)\<br([^\>]+)\>}{<b>$1<\/b><br$2><b>}gsi;

	$Letter=~s{<strong>([^\<]+)\<br([^\>]+)\>}{<strong>$1<\/strong><br$2><strong>}gsi;
	
	 
	 my $Article_T;
	if($Review_Count ne "1")
	{
		$Article_T="aggregated-review-documents";
	}
	else
	{
		$Article_T="editor-report";
	}
	 
	 

	 if($filename ne "")
	 {

		
		  my $Extension;
		 foreach my $F(@J_files2)
		 {

			 $F=~s{\/}{\\}gsi;
			 my $F1=$F;

			 
			 
			 if($F=~m{\Q$filename\E}gsi)
			{
				
				
				
				 if($F1=~m{\.(\w+)$}gsi)
				 {
					 $Extension=$1;
					 
					
				 }

				 my $Source_Dir1111=$ARGV[0];
				 $Source_Dir1111=~s{\\Word(.*)}{\\From_Client\\Accepted_manuscripts\\Suppl}si;

				 mkdir("$Source_Dir1111");
				 mkdir("$Source_Dir1111\\For_XML");

				 
				#copy("$F","$Source_Dir_1\\Suppl\\for_xml\\$FileName\.s$Su_Count1\.$Extension");
			 }
		 }
		 
		
	

	 $R_Count++;
	 $R_Count1++;

	 }

	 $filename_content_Type=~s{application/vnd.openxmlformats-officedocument.word$}{application/vnd.openxmlformats-officedocument.wordprocessingml.document}gsi;

	  $filename_content_Type=~s{application/vnd.openxmlformats-officedocument.spread$}{application/vnd.openxmlformats-officedocument.spreadsheetml.sheet}gsi;

	

	 my $E1=$filename;
	 my $E2=$filename;

	 if($E2=~m{\.(\w+)$}gsi)
	 {
		
					 $Extension=$1;
					 
					
				 
	 }

	 
		 $Head="<sub-article id=\"$FileName\.r$R_Count\" article-type=\"author\-comment\"><front-stub>\n<article-id pub-id-type=\"doi\">$doi\.r$R_Count</article-id>\n<title-group><article-title>Author response to Decision Letter $Revision_C</article-title></title-group><related-object id=\"rel-obj$R_Count\" link-type=\"rebutted-decision-letter\" document-id-type=\"doi\" document-id=\"$doi\" document-type=\"peer-reviewed-article\" object-id-type=\"doi\" object-id=\"$doi\.r$R_Count\" object-type=\"decision-letter\" /><custom-meta-group><custom-meta><meta-name>Submission Version</meta-name><meta-value>$Revision_C</meta-value></custom-meta></custom-meta-group></front-stub><body><p><named-content content-type=\"author-response-date\">$Date_P1</named-content></p>$Author_Response_Content<p>$filename_content</p><supplementary-material id=\"$FileName.s$Su_Count1\" xlink:href=\"$FileName\.s$Su_Count1\.$Extension\" position=\"float\" mimetype=\"$filename_content_Type\" xlink:type=\"simple\">\n<label>Attachment</label>\n<caption>\n<p>Submitted filename: <named-content content-type=\"submitted-filename\">$filename</named-content></p>\n</caption>\n</supplementary-material></body></sub-article>";

		my $Head1=$Head;
		
		 $Head=~s{<supplementary\-material id=\"$FileName.s$Su_Count1\" xlink:href=\"$FileName.s$Su_Count1\" position=\"float\" mimetype=\"\" xlink:type=\"simple\">\n<label>Attachment</label>\n<caption>\n<p>Submitted filename: <named\-content content-type=\"submitted-filename\"></named-content></p>\n</caption>\n</supplementary\-material>}{}gsi;

		   $Head=~s{<supplementary\-material id=\"([^\"]+)\" xlink:href=\"([^\"]+)\" position=\"float\" mimetype=\"\" xlink:type=\"simple\">\n<label>Attachment</label>\n<caption>\n<p>Submitted filename: <named\-content content-type=\"submitted-filename\"></named-content></p>\n</caption>\n</supplementary\-material>}{}gsi;
	

		 if($Head1=~m{<supplementary\-material id=\"$FileName.s$Su_Count1\" xlink:href=\"$FileName.s$Su_Count1\" position=\"float\" mimetype=\"\" xlink:type=\"simple\">\n<label>Attachment</label>\n<caption>\n<p>Submitted filename: <named-content content-type=\"submitted-filename\"></named-content></p>\n</caption>\n</supplementary\-material>}gsi)
		 {
			  
			 $Su_Count1=$Su_Count1-001;

			$Su_Count1=~s{^(\d)$}{00$1}si;

			 $Su_Count1=~s{^(\d\d)$}{0$1}si;

			
		 }


	 if($Head=~m{<sub\-article}gsi)
	 {
		 
         $R_Count++;
	 $R_Count1++;
	 $SR_Count++;
	 $Su_Count1++;
	 }

	  my $Heading="$Head\n<sub-article id=\"$FileName\.r$R_Count\" article-type=\"$Article_T\" specific-use=\"decision-letter\"><front-stub>\n<article-id pub-id-type=\"doi\">$doi\.r$R_Count</article-id>\n<title-group><article-title>Decision Letter $Revision_C</article-title></title-group><contrib-group><contrib contrib-type=\"author\"><name><surname>$lastname</surname><given-names>$firstname</given-names></name><role>$role_name</role></contrib></contrib-group><permissions><copyright-year>$Copy_Year</copyright-year><copyright-holder>$firstname $lastname</copyright-holder>$PLOS_Li</permissions><related-object id=\"rel-obj$R_Count\" link-type=\"peer-reviewed-article\" document-id-type=\"doi\" document-id=\"$doi\" document-type=\"article\" /><custom-meta-group><custom-meta><meta-name>Submission Version</meta-name><meta-value>$Revision_C</meta-value></custom-meta></custom-meta-group></front-stub><body><p><named-content content-type=\"letter-date\">$Date_P</named-content></p><p>$Letter<\/p>$Final_Sup</body></sub-article>";


	 
	  $Heading=~s{<p class=\"([^\"]+)\">}{<p>}gsi;
	   $Heading=~s{<p class=\"([^\"]+)\"([^\>]*)\>}{<p>}gsi;
	  $Heading=~s{<p style=\"([^\"]+)\">}{<p>}gsi;
	  $Heading=~s{<p ([^\>]*)\>}{<p>}gsi;
	  $Heading=~s{<p dir=\"([^\"]+)\"([^\>]*)\>}{<p>}gsi;
	  $Heading=~s{<p><p>}{<p>}gsi;

	
	  $Heading=~s{<\/p><\/p>}{<\/p>}gsi;
	  $Heading=~s{<i>(.*?)<\/i>}{<italic>$1<\/italic>}gsi;
	  $Heading=~s{<em>(.*?)<\/em>}{<italic>$1<\/italic>}gsi;
	  $Heading=~s{<em ([^\>]+)\>(.*?)<\/em>}{<italic>$2<\/italic>}gsi;
	  $Heading=~s{<b>(.*?)<\/b>}{<bold>$1<\/bold>}gsi;
	  $Heading=~s{<b>(.*?)<\/b>}{<bold>$1<\/bold>}gsi;
	  $Heading=~s{<strong>(.*?)<\/strong>}{<bold>$1<\/bold>}gsi;
	  $Heading=~s{<strong ([^\>]+)\>(.*?)<\/strong>}{<bold>$2<\/bold>}gsi;
	  $Heading=~s{<u>(.*?)<\/u>}{<underline>$1<\/underline>}gsi;
	  $Heading=~s{(<div ([^\>]+)\>)}{<\!\-\-$1\-\->}gsi;
	  $Heading=~s{(<div>)}{<\!\-\-$1\-\->}gsi;
	  $Heading=~s{(<\/div>)}{<\!\-\-$1\-\->}gsi;

	  $Heading=~s{<br ([^\>]+)\>}{<\/p><p>}gsi;
	  $Heading=~s{<br>}{<\/p><p>}gsi;
	  $Heading=~s{<br\/>}{<\/p><p>}gsi;
	  $Heading=~s{<br \/>}{<\/p><p>}gsi;
	  $Heading=~s{<br \/>}{<\/p><p>}gsi;
	  $Heading=~s{<\/br>}{<\/p><p>}gsi;
	
	  $Heading=~s{<hr \/>}{<p>\*\*\*\*\*\*\*\*\*\*</p>}gsi;
	  $Heading=~s{<hr ([^\>]+)\>}{<p>\*\*\*\*\*\*\*\*\*\*</p>}gsi;
	   $Heading=~s{<p>\&nbsp;</p>}{}gsi;
	
	  $Heading=~s{<a href=\"file([^\"]+)\"([^\>]*)\>(.*?)<\/a>}{$3}gsi;
	  $Heading=~s{<a>(.*?)<\/a>}{$1}gsi;
	  $Heading=~s{<a href=\"([^\"]+)\"([^\>]*)\>(.*?)<\/a>}{<ext\-link ext-link-type=\"uri\" xlink:href=\"$1\" xlink\:type=\"simple\">$3<\/ext\-link>}gsi;
	   $Heading=~s{<a id=\"([^\"]+)\"([^\>]*)\>}{}gsi;

	   $Heading=~s{<\/a>}{}gsi;

	  $Heading=~s{<span([^\>]*)\>}{}gsi;
	  $Heading=~s{<\/span>}{}gsi;
	  $Heading=~s{<span([^\>]*)\>(.*?)<\/span>}{$2}gsi;
	  $Heading=~s{<\/p>\n*<\/p></body></sub\-article>}{\n<\/p></body></sub-article>}gsi;
	  $Heading=~s{<p><\/p>}{}gsi;
	  $Heading=~s{<blockquote>(.*?)<\/blockquote>}{<disp\-quote><p>$1<\/p><\/disp\-quote>}gsi;
	  $Heading=~s{<ol>(.*?)<\/ol>}{<\/p><p><list list\-type=\"order\">$1<\/list><\/p><p>}gsi;
	  $Heading=~s{<ol ([^\>]+)\>(.*?)<\/ol>}{<\/p><p><list list\-type=\"order\">$2<\/list><\/p><p>}gsi;
	  $Heading=~s{<li>(.*?)<\/li>}{<list-item><p>$1</p><\/list-item>}gsi;
	  $Heading=~s{<li ([^\>]+)\>(.*?)<\/li>}{<list-item><p>$2</p><\/list-item>}gsi;
	  $Heading=~s{<ul>(.*?)<\/ul>}{<\/p><p><list list\-type=\"bullet\">$1<\/list><\/p><p>}gsi;
	  $Heading=~s{<ul ([^\>]+)\>(.*?)<\/ul>}{<\/p><p><list list\-type=\"bullet\">$2<\/list><\/p><p>}gsi;
	  $Heading=~s{<li>(.*?)<\/li>}{<list-item><p>$1</p><\/list-item>}gsi;
	  $Heading=~s{<s>(.*?)<\/s>}{<strike>$1<\/strike>}gsi;
	  $Heading=~s{(<font([^\>]+)\>)}{<\!\-\-$1\-\->}gsi;
	  $Heading=~s{(<\/font>)}{<\!\-\-$1\-\->}gsi;
	  $Heading=~s{(<style([^\>]+)\>(.*?)<\/style>)}{<\!\-\-$1\-\->}gsi;
	  $Heading=~s{<dl>(.*?)<\/dl>}{<def\-list>$1<\/def\-list>}gsi;
	  $Heading=~s{<dt>(.*?)<\/dt>}{<def\-item>$1<\/def\-item>}gsi;
	  $Heading=~s{(xlink\:href=\"([^\"]+)\")}{&Plos_Uri($1)}gesi;
	  
	  $Heading=~s{<ext\-link ext\-link\-type=\"uri\" xlink\:href=\"mailto\:([^\"]+)\" xlink\:type=\"simple\">(.*?)</ext-link>}{<email xlink:type=\"simple\">$2<\/email>}gsi;

	  $Heading=~s{<p>}{<\/p><p>}gsi;
	  $Heading=~s{<\/p>}{<\/p><p>}gsi;	   
		   
	  $Heading=~s{<p><\/p>}{}gsi;
	  $Heading=~s{<p><p>}{<p>}gsi;
	  $Heading=~s{<\/p><\/p>}{<\/p>}gsi;
	  $Heading=~s{<body></p>}{<body>}gsi;
	  $Heading=~s{<list\-item></p>}{<list-item>}gsi;
	  $Heading=~s{<list ([^\>]+)\></p>}{<list $1>}gsi;
	  $Heading=~s{<p><\/list\-item>}{<\/list-item>}gsi;
	  $Heading=~s{<list ([^\>]+)\><p>}{<list $1>}gsi;
	  $Heading=~s{<p><supplementary\-material}{<supplementary-material}gsi;
	  $Heading=~s{<p><p>}{<p>}gsi;
	  $Heading=~s{<p>\n*<\/body>}{<\/body>}gsi;
	  $Heading=~s{<caption>\n*<\/p>}{<caption>}gsi;
	  $Heading=~s{<p>\n*<\/caption>}{<\/caption>}gsi;
	  $Heading=~s{\&bdquo;}{\&ldquo;}gsi;
	  $Heading=~s{\&\#39\;}{\'}gsi;
	  $Heading=~s{<\!\-\-</div>\-\-></body>}{<!--</div>--><\/p><\/body>}gsi;
	  $Heading=~s{<\!\-\-</div>\-\-><supplementary}{<!--</div>--><\/p><supplementary}gsi;

	  if($Heading ne "")
	  {
		  $R_Count=$R_Count-1;
		  $R_Count++;
	  }
	  
	  push(@Sub_Article,$Heading);

	 
}

$letter_body=~s{\r\n\r\n}{\n}gsi;
$letter_body=~s{\r\n}{\n}gsi;
$letter_body=~s{\n{1,}}{\n}gsi;
$letter_body=~s{\t}{ }gsi;
$letter_body=~s{\n{1,}}{\n}gsi;
$letter_body=~s{ {1,}}{ }gsi;
$letter_body=~s{\n}{<\/p>\n<p>}gsi;
$letter_body=~s{<p class=\"([^\"]+)\">}{<p>}gsi;
$letter_body=~s{<p dir=\"([^\"]+)\"([^\>]*)\>}{<p>}gsi;
$letter_body=~s{<p style=\"([^\"]+)\"([^\>]*)\>}{<p>}gsi;
$letter_body=~s{<p><\/p>}{}gsi;
$letter_body=~s{<p><p>}{<p>}gsi;

$letter_body=~s{<\/p><\/p>}{<\/p>}gsi;
$letter_body=~s{<i>(.*?)<\/i>}{<italic>$1<\/italic>}gsi;
#$letter_body=~s{<i>(.*?)<i>}{<italic>$1<\/italic>}gsi;
$letter_body=~s{<em>(.*?)<\/em>}{<italic>$1<\/italic>}gsi;
$letter_body=~s{<em ([^\>]+)\>(.*?)<\/em>}{<italic>$2<\/italic>}gsi;
$letter_body=~s{<b>(.*?)<\/b>}{<bold>$1<\/bold>}gsi;
$letter_body=~s{<b>(.*?)<\/b>}{<bold>$1<\/bold>}gsi;
$letter_body=~s{<strong>(.*?)<\/strong>}{<bold>$1<\/bold>}gsi;
$letter_body=~s{<strong ([^\>]+)\>(.*?)<\/strong>}{<bold>$2<\/bold>}gsi;
$letter_body=~s{<u>(.*?)<\/u>}{<underline>$1<\/underline>}gsi;
$letter_body=~s{(<div\>)}{<\!\-\-$1\-\->}gsi;
$letter_body=~s{(<\/div>)}{<\!\-\-$1\-\->}gsi;
$letter_body=~s{(<div ([^\>]+)\>)}{<\!\-\-$1\-\->}gsi;
$letter_body=~s{<br ([^\>]+)\>}{<\/p><p>}gsi;
$letter_body=~s{<br\/>}{<\/p><p>}gsi;
$letter_body=~s{<br \/>}{<\/p><p>}gsi;
$letter_body=~s{<br \/>}{<\/p><p>}gsi;

$letter_body=~s{<hr \/>}{<p>\*\*\*\*\*\*\*\*\*\*</p>}gsi;
$letter_body=~s{<hr ([^\>]+)\>}{<p>\*\*\*\*\*\*\*\*\*\*</p>}gsi;
$letter_body=~s{<p>\&nbsp;</p>}{}gsi;

$letter_body=~s{<a href=\"file([^\"]+)\"([^\>]*)\>(.*?)<\/a>}{$3}gsi;
$letter_body=~s{<a href=\"([^\"]+)\"([^\>]*)\>(.*?)<\/a>}{<ext\-link ext-link-type=\"uri\" xlink:href=\"$1\" xlink\:type=\"simple\">$3<\/ext\-link>}gsi;
$letter_body=~s{<a>(.*?)<\/a>}{$1}gsi;
$letter_body=~s{<\/a>}{}gsi;
$letter_body=~s{<a id=\"([^\"]+)\"([^\>]*)\>}{}gsi;
$letter_body=~s{<span([^\>]*)\>}{}gsi;
$letter_body=~s{<\/span>}{}gsi;
$letter_body=~s{<span([^\>]*)\>(.*?)<\/span>}{$2}gsi;
$letter_body=~s{<\/p>\n*<\/p></body></sub\-article>}{\n<\/p></body></sub-article>}gsi;
$letter_body=~s{<p><\/p>}{}gsi;
$letter_body=~s{<blockquote>(.*?)<\/blockquote>}{<disp\-quote><p>$1<\/p><\/disp\-quote>}gsi;
$letter_body=~s{<ol>(.*?)<\/ol>}{<\/p><p><list list\-type=\"order\">$1<\/list><\/p><p>}gsi;
$letter_body=~s{<ol ([^\>]+)\>(.*?)<\/ol>}{<\/p><p><list list\-type=\"order\">$2<\/list><\/p><p>}gsi;
$letter_body=~s{<li>(.*?)<\/li>}{<list-item><p>$1</p><\/list-item>}gsi;
$letter_body=~s{<ul>(.*?)<\/ul>}{<\/p><p><list list\-type=\"bullet\">$1<\/list><\/p><p>}gsi;
$letter_body=~s{<ul ([^\>]+)\>(.*?)<\/ul>}{<\/p><p><list list\-type=\"bullet\">$2<\/list><\/p><p>}gsi;
$letter_body=~s{<li>(.*?)<\/li>}{<list-item><p>$1</p><\/list-item>}gsi;
$letter_body=~s{<li ([^\>]+)\>(.*?)<\/li>}{<list-item><p>$2</p><\/list-item>}gsi;
$letter_body=~s{<s>(.*?)<\/s>}{<strike>$1<\/strike>}gsi;
$letter_body=~s{(<font([^\>]+)\>)}{<\!\-\-$1\-\->}gsi;
$letter_body=~s{(<\/font>)}{<\!\-\-$1\-\->}gsi;
$letter_body=~s{(<style([^\>]+)\>(.*?)<\/style>)}{<\!\-\-$1\-\->}gsi;
$letter_body=~s{<dl>(.*?)<\/dl>}{<def\-list>$1<\/def\-list>}gsi;
$letter_body=~s{<dt>(.*?)<\/dt>}{<def\-item>$1<\/def\-item>}gsi;
$letter_body=~s{(xlink\:href=\"([^\"]+)\")}{&Plos_Uri($1)}gesi;

$letter_body=~s{<ext\-link ext\-link\-type=\"uri\" xlink\:href=\"mailto\:([^\"]+)\" xlink\:type=\"simple\">(.*?)</ext-link>}{<email xlink:type=\"simple\">$2<\/email>}gsi;

$letter_body=~s{<p>}{<\/p><p>}gsi;
$letter_body=~s{<\/p>}{<\/p><p>}gsi;	   

$letter_body=~s{<p><\/p>}{}gsi;
$letter_body=~s{<p><p>}{<p>}gsi;
$letter_body=~s{<\/p><\/p>}{<\/p>}gsi;
$letter_body=~s{<body></p>}{<body>}gsi;
$letter_body=~s{<list\-item></p>}{<list-item>}gsi;
$letter_body=~s{<list ([^\>]+)\></p>}{<list $1>}gsi;
$letter_body=~s{<list ([^\>]+)\><p>}{<list $1>}gsi;
$letter_body=~s{<p><\/list\-item>}{<\/list-item>}gsi;
$letter_body=~s{<p><supplementary\-material}{<supplementary-material}gsi;
$letter_body=~s{<p><p>}{<p>}gsi;
$letter_body=~s{<p>\n*<\/body>}{<\/body>}gsi;
$letter_body=~s{<caption>\n*<\/p>}{<caption>}gsi;
$letter_body=~s{<p>\n*<\/caption>}{<\/caption>}gsi;
$letter_body=~s{\&bdquo;}{\&ldquo;}gsi;
$letter_body=~s{\&\#39\;}{\'}gsi;
$letter_body=~s{\n}{}gsi;
$letter_body=~s{<p><\/p>}{}gsi;
$letter_body=~s{<p><\/p>}{}gsi;
$letter_body=~s{<\!\-\-</div>\-\-></body>}{<!--</div>--><\/p><\/body>}gsi;
$letter_body=~s{<\!\-\-</div>\-\-><supplementary}{<!--</div>--><\/p><supplementary}gsi;


 $R_Count= $R_Count + 1;

 $R_Count=~s{^(\d)$}{00$1}si;
 $R_Count=~s{^(\d\d)$}{0$1}si;


 
my $ACC_Heading="<sub-article article-type=\"editor-report\" id=\"$FileName\.r$R_Count\" specific-use=\"acceptance-letter\">\n<front-stub>\n<article-id pub-id-type=\"doi\">$doi\.r$R_Count</article-id>\n<title-group>\n<article-title>Acceptance letter</article-title>\n</title-group>\n<contrib-group>\n<contrib contrib-type=\"author\">\n<name><surname>$lastname</surname><given-names>$firstname</given-names></name><role>$role_name</role></contrib></contrib-group><permissions><copyright-year>$Copy_Year</copyright-year><copyright-holder>$firstname $lastname</copyright-holder>$PLOS_Li</permissions><related-object document-id=\"$doi\" document-id-type=\"doi\" document-type=\"article\" id=\"rel-obj0$R_Count\" link-type=\"peer-reviewed-article\"/></front-stub><body><p>$letter_body<\/p></body></sub-article>";


if($ACC_Heading=~m{<body>\n*<\/body>}gsi)
{
	$ACC_Heading="";
}


my $Final_Article=join("\n",@Sub_Article);


$Final_Article=~s{</front\-stub><body>}{</front\-stub><body>$Box_Data}si;

$Final_Article=~s{<p>\n<\/p>}{}gsi;

$Final_Article=~s{<p><\/p>}{}gsi;

$Final_Article=~s{\\u(\w+)}{\&\#x$1;}gsi;
$Final_Article=~s{\&\#x0091}{\&\#x2018;}gsi;
$Final_Article=~s{\&\#x0092}{\&\#x2019;}gsi;
$Final_Article=~s{\&\#x0093}{\&\#x201C;}gsi;
$Final_Article=~s{\&\#x0094}{\&\#x201D;}gsi;
$Final_Article=~s{\&\#x0099}{\&\#x2122;}gsi;
$Final_Article=~s{\&\#x009C}{\&\#x0153;}gsi;

$Final_Article=~s{\&\#x000([0-8]);}{\&\#xFFFD;<\!\-\-\&\#x000$1;\-\->}gsi;

$Final_Article=~s{\&\#x000([B-C]);}{\&\#xFFFD;<\!\-\-\&\#x000$1;\-\->}gs;

$Final_Article=~s{\&\#x000E;}{\&\#xFFFD;<\!\-\-\&\#x000E;\-\->}gs;

$Final_Article=~s{\&\#x008([0-9]);}{\&\#xFFFD;<\!\-\-\&\#x008$1;\-\->}gs;
$Final_Article=~s{\&\#x009([5-8]);}{\&\#xFFFD;<\!\-\-\&\#x009$1;\-\->}gs;
$Final_Article=~s{\&\#x009([A-B]);}{\&\#xFFFD;<\!\-\-\&\#x009$1;\-\->}gs;
$Final_Article=~s{\&\#x009([D-F]);}{\&\#xFFFD;<\!\-\-\&\#x009$1;\-\->}gs;

$Final_Article=~s{\&\#xE([0-9A-F]+);}{\&\#xFFFD;<\!\-\-\&\#xE$1;\-\->}gs;
$Final_Article=~s{\&\#xF([0-9A-F]+);}{\&\#xFFFD;<\!\-\-\&\#xF$1;\-\->}gs;

$ACC_Heading=~s{\&\#xE([0-9A-F]+);}{\&\#xFFFD;<\!\-\-\&\#xE$1;\-\->}gs;
$ACC_Heading=~s{\&\#xF([0-9A-F]+);}{\&\#xFFFD;<\!\-\-\&\#xF$1;\-\->}gs;

$Final_Article=~s{\&\#x10([0-9A-F]+);}{\&\#xFFFD;<\!\-\-\&\#x10$1;\-\->}gs;
$ACC_Heading=~s{\&\#x10([0-9A-F]+);}{\&\#xFFFD;<\!\-\-\&\#x10$1;\-\->}gs;



$Final_Article=~s{<i>([^\<]+)\<i>}{<italic>$1<\/italic>}gsi;

$Final_Article=~s{\"\-\-}{\"}gsi;



#my $ENT_File="\\\\j-fs02\\JData\\LWW\\FULL_ISSUE_XML\\EntityReplacement.ini";

$Final_Article=~s{(\&(\w+)\;)}{&Plos_Entity($1)}gesi;
$ACC_Heading=~s{(\&(\w+)\;)}{&Plos_Entity($1)}gesi;

$Final_Article=~s/(.)/asciiize($1)/eg;
$ACC_Heading=~s/(.)/asciiize($1)/eg;

$Final_Article=~s{<\/p>\n}{}gsi;
$Final_Article=~s{<p><\/p>}{}gsi;

$Final_Article=~s{\&\#x}{\[iopamp\]\#x}gsi;

$Final_Article=~s{\&(\w+);}{\[iopamp\]$1;}gsi;

$Final_Article=~s{\&}{\&\#x0026;}gsi;

$Final_Article=~s{\[iopamp\]}{\&}gsi;

$Final_Article=~s{\\u(\w+)}{\&\#x$1;}gsi;




#$Final_Article=~s{(<bold>)(http:\/\/[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;
#$Final_Article=~s{([\(\s]+)(http:\/\/[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;

#$Final_Article=~s{(<italic>)(http:\/\/[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;
#$Final_Article=~s{(<bold><italic>)(http:\/\/[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;
#$Final_Article=~s{(<p>)(http:\/\/[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;
#$Final_Article=~s{(<p>)(https:\/\/[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;




#$Final_Article=~s{([\(\s]+)(www\.[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;

#$Final_Article=~s{(<italic>)(www\.[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;
#$Final_Article=~s{(<bold>)(www\.[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;
#$Final_Article=~s{(<bold><italic>)(www\.[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;
#$Final_Article=~s{([\(\s]+)(https:\/[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;

#$Final_Article=~s{(<italic>)(https:\/[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;
#$Final_Article=~s{(<italic>)(www\.[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;
#$Final_Article=~s{(<bold><italic>)(www\.[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;
#$Final_Article=~s{(<p>)(www\.[^\s\<]+)}{$1<ext\-link ext-link-type=\"uri\" xlink:href=\"$2\">$2<\/ext-link>}gsi;

#$Final_Article=~s{([\(\s]+)(\(?)(https:\/\/[^\s]+)}{$1$2<ext\-link ext-link-type=\"uri\" xlink:href=\"$3\">$3<\/ext-link>}gsi;

#$Final_Article=~s{(<italic>)(\(?)(https:\/\/[^\s]+)}{$1$2<ext\-link ext-link-type=\"uri\" xlink:href=\"$3\">$3<\/ext-link>}gsi;
#$Final_Article=~s{(<bold>)(\(?)(https:\/\/[^\s]+)}{$1$2<ext\-link ext-link-type=\"uri\" xlink:href=\"$3\">$3<\/ext-link>}gsi;
#$Final_Article=~s{(<bold><italic>)(\(?)(https:\/\/[^\s]+)}{$1$2<ext\-link ext-link-type=\"uri\" xlink:href=\"$3\">$3<\/ext-link>}gsi;

#$Final_Article=~s{(<p>)(\(?)(https:\/\/[^\s]+)}{$1$2<ext\-link ext-link-type=\"uri\" xlink:href=\"$3\">$3<\/ext-link>}gsi;

#$Final_Article=~s{<ext\-link ext-link-type=\"uri\" xlink:href=\"<ob>}{<ext\-link ext-link-type=\"uri\" xlink:href=\"\(}gsi;




#$Final_Article=~s{\)(\.?)<\/ext-link>}{<\/ext-link>\)$1}gsi;
#$Final_Article=~s{(\.?)<\/ext-link>}{<\/ext-link>$1}gsi;

#$Final_Article=~s{\)(\,?)<\/ext-link>}{<\/ext-link>\)$1}gsi;





#$Final_Article=~s{\](\.?)<\/ext-link>}{<\/ext-link>\]$1}gsi;
#$Final_Article=~s{(\.?)<\/ext-link>}{<\/ext-link>$1}gsi;

#$Final_Article=~s{\](\,?)<\/ext-link>}{<\/ext-link>\]$1}gsi;

$Final_Article=~s{\n{1,}}{\n}gsi;
$Final_Article=~s{ {1,}}{ }gsi;

$Final_Article=~s{\]<\/ext-link>\]\]}{\]\]\]<\/ext-link>}gsi;

$Final_Article=~s{ xlink\:href=\"([^\"]+)\"\"}{ xlink:href=\"$1\"}gsi;

$Final_Article=~s{\<(\d+)}{\&\#x003C;$1}gsi;

$Final_Article=~s{\<\&}{\&\#x003C;\&}gsi;

$Final_Article=~s{\<\/\=}{\&\#x003C;/=}gsi;

$Final_Article=~s/\x02/-/g;

$ACC_Heading=~s{<\/p>\n}{}gsi;
$ACC_Heading=~s{<p><\/p>}{}gsi;

$ACC_Heading=~s{<p></p>}{}gsi;
$ACC_Heading=~s{<p><\/p>}{}gsi;





if($Final_Article ne "")
{
	$Final_Article=~s{<p>\&\#x00A0;</p>}{}gsi;
	$Final_Article=~s{<p \/>}{}gsi;
	$Final_Article=~s{<p\/>}{}gsi;
	$Final_Article=~s{<p>(\s*)<\/p>}{}gsi;
	$ACC_Heading=~s{<p>(\s*)<\/p>}{}gsi;
	$Final_Article=~s{<p>(\s*)<\/p>}{}gsi;
	$ACC_Heading=~s{<p>(\s*)<\/p>}{}gsi;
	$Final_Article=~s{<p>(\s*)<\/p>}{}gsi;
	$Final_Article=~s{<p>(\&\#x2003;+)</p>}{}gsi;
	$Final_Article=~s{<p><italic>(\s*)</italic></p>}{}gsi;
	$Final_Article=~s{<p><bold>(\s*)</bold></p>}{}gsi;
	$Final_Article=~s{<p><\!\-\-(\s*)<div style=\"([^\"]+)\">(\s*)\-\-></p>}{}gsi;
	$Final_Article=~s{<p>(\&\#x2003;\&\#x2003;\&\#x2003;)</p>}{}gsi;

	$ACC_Heading=~s{<p>(\&\#x2003;+)</p>}{}gsi;
	$ACC_Heading=~s{<p><italic>(\s*)</italic></p>}{}gsi;
	$ACC_Heading=~s{<p><bold>(\s*)</bold></p>}{}gsi;
	$ACC_Heading=~s{<p><\!\-\-(\s*)<div style=\"([^\"]+)\">(\s*)\-\-></p>}{}gsi;
	$ACC_Heading=~s{<p>(\&\#x2003;\&\#x2003;\&\#x2003;)</p>}{}gsi;
	
	$ACC_Heading=~s{<p \/>}{}gsi;
	$ACC_Heading=~s{<p\/>}{}gsi;
	$ACC_Heading=~s{<p>\&\#x00A0;</p>}{}gsi;
	$Final_Article=~s{<p>\&\#x0020;</p>}{}gsi;
	$ACC_Heading=~s{<p>\&\#x0020;</p>}{}gsi;
	$Final_Article=~s{<p>\&\#x1680;</p>}{}gsi;
	$ACC_Heading=~s{<p>\&\#x1680;</p>}{}gsi;
	$Final_Article=~s{<p>\&\#x200([0-9]);</p>}{}gsi;
	$ACC_Heading=~s{<p>\&\#x200([0-9]);</p>}{}gsi;
	$Final_Article=~s{<p>\&\#x200A;</p>}{}gsi;
	$ACC_Heading=~s{<p>\&\#x200A;</p>}{}gsi;
	$Final_Article=~s{<p>\&\#x202F;</p>}{}gsi;
	$ACC_Heading=~s{<p>\&\#x202F;</p>}{}gsi;
	$Final_Article=~s{<p>\&\#x205F;</p>}{}gsi;
	$ACC_Heading=~s{<p>\&\#x205F;</p>}{}gsi;
	$Final_Article=~s{<p>\&\#x3000;</p>}{}gsi;
	$ACC_Heading=~s{<p>\&\#x3000;</p>}{}gsi;
	my $Tmp="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE article PUBLIC \"-//NLM//DTD JATS (Z39.96) Journal Publishing DTD v1.3 20210610//EN\" \"http://jats.nlm.nih.gov/publishing/1.3/JATS-journalpublishing1-3.dtd\">\n<article><processing-meta><?NewLayout YES?>\n<custom-meta-group content-type=\"composition\">\n<custom-meta xlink:href=\"https://www.newgen.co/\" specific-use=\"newgen\">\n<meta-name>Composition Vendor</meta-name>\n<meta-value>Newgen KnowledgeWorks (P) Ltd.</meta-value>\n</custom-meta>\n</custom-meta-group>\n</processing-meta>\n<front>\n<journal-meta>\n<journal-id></journal-id>\n<issn></issn>\n</journal-meta>\n	<article-meta><title-group>\n<article-title></article-title>\n</title-group>\n<pub-date>\n<year></year>\n</pub-date>\n</article-meta>\n</front>\n<body></body>$Final_Article\n$ACC_Heading<\/article>";

	$Tmp=~s{(<sub\-article ([^\>]+)\>(.*?)<\/sub\-article>)}{&Sub_Article1($1)}esi;
	
	$Tmp=~s{(<sub\-article ([^\>]+)\>(.*?)<\/sub\-article>)}{&Sub_Article($1)}gesi;

$Tmp=~s{\r}{}gsi;
$Tmp=~s{\n{1,}}{\n}gsi;

$Tmp=~s{ {1,}}{ }gsi;


open (XML, ">$XML_File") || die "Can't create XML file '$XML_File': $!\n";
{
 
       
    print XML $Tmp;
}
close(XML);


	
	
	
}



}

sub Plos_Tag_Checking
{
	my $Tag=shift;

	
	
	if($Tag=~m{^\<(p|b|i|br|em|strong|u|div|hr|a|span|ol|li|ul|s|font|style|dl|dt|ext\-link|body|list\-item|blockquote|strike|s|sub|sup)\>$}gsi)
	{
		$Tag=~s{\<}{iopopen}gsi;
		$Tag=~s{\>}{iopclose}gsi;
	}
	elsif($Tag=~m{^\<(p|b|i|br|em|strong|u|div|hr|a|span|ol|li|ul|s|font|style|dl|dt|ext\-link|body|list\-item|blockquote|strike|s|sub|sup) ([^\>]+)\>$}gsi)
	{
		$Tag=~s{\<}{iopopen}gsi;
		$Tag=~s{\>}{iopclose}gsi;
	}
	elsif($Tag=~m{^\<\/(p|b|i|br|em|strong|u|div|hr|a|span|ol|li|ul|s|font|style|dl|dt|ext\-link|body|list\-item|blockquote|strike|s|sub|sup)\>$}gsi)
	{
		$Tag=~s{\<}{iopopen}gsi;
		$Tag=~s{\>}{iopclose}gsi;
	}
	
	else
	{
		$Tag=~s{\<}{\&\#x003C;}gsi;
		$Tag=~s{\>}{\&\#x003E;}gsi;
	}
	
	return $Tag
}

sub Plos_Uri
{
	my $Uri= shift;
	
	

	$Uri=~s{\&(\w+)\;}{iopamp$1;}gsi;

	$Uri=~s{\&\#}{iopamp\#}gsi;

	$Uri=~s{\&}{\&amp;}gsi;

	$Uri=~s{iopamp}{\&}gsi;    
	
	
	return $Uri;
}

sub Plos_Entity
{
	my $entity=shift;
	my $ENT1;
	my $ENT_File1=$ARGV[6];
open(ENT,$ENT_File1) || die "Can't open file '$ENT_File1': $!\n";	
{ local $/; $_=<ENT>; $ENT1=$_; }
close(ENT);

	while($ENT1=~m{$entity\=([^\n]*)\n}g)
	{
		$entity="$1";
	}
	return $entity;
}

sub asciiize {
    return $_[0] if (ord($_[0]) < 128);     
    return sprintf('&#x%04X;', ord($_[0])); 
}

sub Sub_Article
{
	my $Article=shift;

	$Article=~s{\.r(\d+)\"}{\.r$Sub_Count\"}gsi;

	$Article=~s{\.r(\d+)</article\-id>}{\.r$Sub_Count</article-id>}gsi;

	$Article=~s{rel\-obj(\d+)}{rel\-obj$Sub_Count}gsi;

	
	
	$Sub_Count++;
	
	return $Article;
}


sub Sub_Article1
{
	my $Article=shift;

	
	my $Article1=$Article;

	my $Article2=$Article;

	my $Article3=$Article;

	if($Article=~m{article\-type=\"author\-comment\"}gsi)
	{
		
		if($Article2!~m{<\/named\-content><\/p>\n*<p>}gsi)
		{
			if($Article2!~m{<boxed}gsi)
		{
			$Article=~s{ article\-type=\"author\-comment\">}{ article\-type=\"author\-comment\" specific-use=\"rebutted-decision-letter-unavailable\">}gsi;

			$Article=~s{<related\-object ([^\>]+)\>}{}gsi;
		}
		}
	}
	
	
	
	return $Article;
}
