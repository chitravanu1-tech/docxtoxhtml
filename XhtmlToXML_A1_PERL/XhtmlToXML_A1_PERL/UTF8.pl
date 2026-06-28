use strict;
use warnings;
use XML::Twig;

my($IN_File,$OUT_File,$Tmp);

$IN_File=$ARGV[0];
($OUT_File = $IN_File)=~s/\.xml$/\.out/i;

open (IN, "<:utf8", $IN_File) || die ("\nCould not open `$IN_File'\n");
{ local $/; $_=<IN>; $Tmp=$_; }
close(IN);

my $twig= new XML::Twig(keepEncoding=>1,keepSpaces=>1,pretty_print => 'indented');

unless ($twig->parse($Tmp)){ die	"\nParsing Error in $IN_File in $@ \n"; }

$Tmp =~ s/(.)/asciiize($1)/eg; 

sub asciiize {
    return $_[0] if (ord($_[0]) < 128);     
    return sprintf('&#x%04X;', ord($_[0])); 
}




open (XML, ">utf8",$OUT_File) || die "Can't create XML file '$OUT_File': $!\n";
{
        print XML $Tmp;
}




