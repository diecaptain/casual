#!/usr/bin/perl -w
#final script for santhosham
#script to check hex values of a string in pi and output
#use warnings;
#use strict;
use Math::BigFloat try => "GMP";
my $digits = int($ARGV[0] // 0) || 3490;
#print "Enter the string here : \n";
#chomp(my $wish = <STDIN>);
#$PI = 4.0 * atan2(1.0,1.0);
#print "Pi equals $PI.....\n";
#open (PI, ">pi.txt") || die "cannot create file : $!";
print "Using Taylor series of arctangent.";
	my $b = Math::BigFloat->new(0, undef, -$digits);
	my $x = 2 - sqrt($b + 3);
	my $f = -$x * $x;
	my $m = $x * ($b + 12);
	my $a = $m;
	my $k = 1;
	while (0 != $m) {
		$m *= $f;
		$k += 2;
		$a += $m / $k;
           }
	print "Pi is ", $a, ";\n";
print "The file is printed folks!!! \n";
#the wish array one character per line
#@wish = qw (h a p p y b i r t h d a y d a d d y);
open (ARRAY, ">array.txt") || die "cannot open the file :$!";
foreach $w1 (@wish)
      {
       print ARRAY "$w1\n";
       }
       close (ARRAY);
#program to find ascii values of an array
#print "Enter the array here : \n";
@list = qw(a b c d e f g h i j k l m n o p q r s t u v w x y z &);
#open (ASCII, ">ascii.txt") || die "cannot create file : $!";
foreach $l1 (@list)
      {
       $num = ord($l1);
       $ascii{$l1} = $num;
       print "$l1 ascii value is  $ascii{$l1}\n";
       }
#close (ASCII);
#check starts here
for ( $i = 0;$i < @wish;$i++ )
  {
   $alpha = $wish[$i];
   $string = $ascii{$alpha};
   $out = index($a,$string);
   print "$alpha is found here after $out decimals in the value of PI\n";
   $oldPATH = $ENV{"PATH"};
   $ENV{"PATH"} = "/usr/games";
   system " (xcowsay $alpha is found here after $out decimals in the value of PI)&" || die "connot execute :$!"
               $ENV{"PATH"} = $oldPATH;
   sleep 2;
                 } 
                   $oldPATH = $ENV{"PATH"};
                   $ENV{"PATH"} = "/usr/games";
                   system " (xcowsay --time=2 --cow-size=small It is amazing to know that our entire digital life is present in the number PI)&" || die "connot execute :$!";
sleep 2;
                  #insert path to images here in this array
                  # @image = qw();
                   for ($z = 0;$z < @image;$z++)
                     { 
                      system " (xcowsay --time=2 --image=$image[$z] --cow-size=small Happy Birthday daddy!!!)&" || die "connot execute :$!";
                      sleep 2;
		     }
                      $ENV{"PATH"} = $oldPATH;
