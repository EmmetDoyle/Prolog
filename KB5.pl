%Knowlege Base 5 from Learn Prolog Now Chapter 1

loves(vincent,mia). 
loves(marsellus,mia). 
loves(pumpkin,honey_bunny). 
loves(honey_bunny,pumpkin). 
    
jealous(X,Y):-  loves(X,Z),  loves(Y,Z).