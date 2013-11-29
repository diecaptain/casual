#!/usr/bin/perl -w
#program to assess a class with n people.
#The script follows simple fuzzy logic
#Defuzzification values are the improving factors to be specified
#Script can be used to check the grace marks to be awarded on a general scale
#script can be used to check the increase or decrease in assignments of a class
#Author Name : Kranthi K. Pamarthi
#Author Alias : diecaptain
#Alpha Version 1.0

print "Enter the marks into the marks array here : \n";
chomp(@marks = <STDIN>);
print "\nEnter the maximum marks of the test here : \n";
chomp($g = <STDIN>); #maximum marks
print "Enter the defuzzification value for low performance here : \n";
chomp($low = <STDIN>); #low performance deffuzify factor
print "Enter the defuzzification value for average performance here : \n";
chomp($avg = <STDIN>); #average performance deffuzify factor
print "Enter the defuzzification value for high performance here : \n";
chomp($high = <STDIN>); #high performance deffuzify factor
$n = @marks;
$h = $g/2;
print "The maximum marks for the exam are $g \n";
print "The total number of students appeared for the test are $n \n";
print "The individual marks of students are @marks \n";
print "The increment in number of assignments on low performance is $low \n";
print "The increment in number of assignments on average performance is $avg \n";
print "The increment in number of assignments on high performance is $high \n";
#########################################################
#averageness membership functions
#########################################################
for ($i = 0;$i < $n;$i++)
  {
   if ( $marks[$i] <= $h )
    {
     $mem_avg[$i] = $marks[$i]/$h;
    }
     elsif ( $marks[$i] > $h )
         { 
          $mem_avg[$i] = 2-$marks[$i]/$h;
          }
    }
     print "The average membership functions of the students are : @mem_avg \n ";
##################################################################
#Lowness membership functions
##################################################################
for ($i = 0;$i < $n;$i++)
  {
   if ( $marks[$i] <= $h )
    {
     $mem_low[$i] = $marks[$i]/$h;
    }
     elsif ( $marks[$i] > $h )
         { 
          $mem_low[$i] = '0';
          }
    }
     print "The low membership functions of the students are : @mem_low \n ";
####################################################################
#highness membership functions
####################################################################
for ($i = 0;$i < $n;$i++)
  {
   if ( $marks[$i] <= $h )
    {
     $mem_high[$i] = '0';
    }
     elsif ( $marks[$i] > $h )
         { 
          $mem_high[$i] = $marks[$i]/$h-1;
          }
    }
     print "The highness membership functions of the students are : @mem_high \n ";
#########################################################################
#degree of averageness calculation
#########################################################################
$deg_avg = 0;
foreach $num1(@mem_avg)
      {
	  $deg_avg += $num1;
      }
      print "The degree of averageness is : $deg_avg \n";
#########################################################################
#degree of lowness calculation
#########################################################################
$deg_low = 0;
foreach $num2(@mem_low)
      {
	  $deg_low += $num2;
      }
      print "The degree of lowness is : $deg_low \n";
#########################################################################
#degree of highness calculation
#########################################################################
$deg_high = 0;
foreach $num3(@mem_high)
      {
	  $deg_high += $num3;
      }
      print "The degree of highness is : $deg_high \n";
#########################################################################
#membership function calculation
#########################################################################
$sum = 0;
foreach (@marks)
      {
	  $sum += $_;
      }
      $mem = $sum/$n;
      print "The membership function is: $mem \n";
##############################################################
#Averageness error correct intersection point
##############################################################
if($mem <= $h)
 {
     $err_avg = $mem/$h;
 }
 elsif($mem > $h)
     {
      $err_avg = 2-$mem/$h;
     }
      print "The averageness error correct is : $err_avg \n";
####################################################################
#Lowness error correction intersection point
#################################################################### 
if($mem <= $h)
 {
     $err_low = 1-$mem/$h;
 }
 elsif($mem > $h)
     {
      $err_low = '0';
     }
      print "The lowness error correct is : $err_low \n";
###################################################################
#Highness error correct intersection points
###################################################################
if($mem <= $h)
 {
     $err_high = '0';
 }
 elsif($mem > $h)
     {
      $err_high = $mem/$h-1;
     }
      print "The highness error correct is : $err_high \n";
####################################################################
#output of assessment
####################################################################
$temp1 = $err_low+$err_avg+$err_high;
$lowness = $low*$err_low;
$averageness = $avg*$err_avg;
$highness = $high*$err_high;
$temp2 = $lowness+$averageness+$highness;
$ass = $temp2/$temp1;
print "\n The assessment of the given data is : $ass \n";
if( $ass == '0' )
  {
      print "The class performance is average. There is no requirement to increase or decrease the number of assignements. Thank You!!! \n\n";
  }
   elsif( $ass < '0' )
       {
	   print "The class performance is good. This implies that the number of assignements can be reduced by an approximate of $ass numbers. Great going folks!!! \n\n";
       }
        elsif( $ass > '0' )
            {
             print "THe class performance is poor. This implies that the number of assignements are to be increased by an approximate of $ass numbers. Pick up your mettle students!!! \n\n";
            }
             print "\nThat is all folks!!!\n";
#########################################################################
#The End
######################################################################### 
