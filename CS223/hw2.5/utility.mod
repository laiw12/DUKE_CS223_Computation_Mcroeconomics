
## the set of possible outcomes
set outcome;

## the probability distribution
set probability;

## the param of probability distribution of each outcom on lefthand side
param p1{ i in probability, j in outcome};

## the param of probability distribution of each outcome on righthand side
param p2{ i in probability, j in outcome};

## variable that indicates utility
var utility{ j in outcome}, >=0, <=1;

## the margin that we want to maximize
var margin, >=0;

maximize objective: margin;

## for each possible distribution we want to maximize the mragin. 
s.t. margin_constraint{i in probability}:  sum{ j in outcome} p1[i,j] * utility[j] >= sum{j in outcome} p2[i,j]*utility[j] + margin;






data; 

set outcome := a b c d ;
set probability :=  pa pb pc pd ;

param p1:     a    b    c    d := 
pa            0.1 0.2  0.3   0.4       
pb            0.4 0.4  0.1   0.1
pc            0.6 0.1  0.0   0.3
pd            0.4 0.3  0.2   0.1;


param p2:     a   b    c    d :=
pa           0.1 0.2  0.4  0.3 
pb           0.4 0.2  0.2  0.2
pc           0.4 0.3  0.3  0.0
pd           0.5 0.5  0.0  0.0;

end; 
