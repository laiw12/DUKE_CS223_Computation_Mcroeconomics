set STATES;
set BIDS;

## the amount tht the bidder is bidding
param v{ b in BIDS};

## the amount that the bidder must receive in that state if accepted
param p{ b in BIDS, s in STATES};

## 1 if the bid is accepted, 0 otherwise.
var accepted{ b in BIDS}, >=0,<=1;

## This is what we want to maximize 
var worst_case_profit;

maximize profit: worst_case_profit;

## the worst_case_profit must be smaller than the sum of the value of bids we accepted - the worst_case_loss for each state (upper bound)

s.t. worst_case_profit_constraint{s in STATES}: worst_case_profit <=  sum{b in BIDS}  accepted[b]* v[b] -  sum{b in BIDS} accepted[b]* p[b,s];


    



data;

set BIDS := b1 b2 b3 b4 b5;
set STATES := s1 s2 s3 s4;


param v := b1 3 b2 4 b3 5 b4 3 b5 1;

param p: s1 s2 s3 s4 :=
b1       0  0  11 0
b2       0  2  0  8
b3       9  9  0  0
b4       6  0  0  6
b5       0  0  0  10;
end;


