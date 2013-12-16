#!/usr/bin/perl -w
#Hodor Algorithm
#give the nature of hodor when asked
@limit = qw(happy sad brave fear);
print "Give the state of hodor now (happy,sad,brave,fear) :\n";
chomp($state = <STDIN>);
%state = qw(
happy   x 
sad   y 
brave   z 
fear   v
);
$correct = "maybe";
$i = 0;
while ($correct eq "maybe")
          {
           # keep checking til we know
           if ($limit[$i] eq $state)
            { # right?
             $correct = "yes";
             # yes!
             }
              elsif ($i < 3)
                  {
                   # more words to look at?
                   $i = $i + 1;
                   # look at the next word next time
                   }
                    else
                       {
                        # no more words, must be bad
                        print "State does not exist right now\n";
                        print "please enter the state again (happy,sad,brave,fear) :\n" ;
                        chomp($state = <STDIN>);
                        $i = 0;
                         }
                       }
                     print "Hodor voice will be like : $state{$state} \n";
