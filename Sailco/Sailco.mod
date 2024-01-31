int quarters = ...;
range qRange = 1..quarters;

float nPrice = ...;
float otPrice = ...;
float holdCost = ...;

float initInv = ...;
float maxNProd = ...;

float demand[qRange] = ...;
 
dvar float+ x[qRange];
dvar float+ y[qRange];
dvar float+ i[0..quarters];  
 
minimize sum(q in qRange) 
	((nPrice * x[q]) + (otPrice * y[q]) + (holdCost * i[q]));

subject to {
	i[0] == initInv;
	
	forall(q in qRange) i[q - 1] + x[q] + y[q] - i[q] == demand[q];
	
	forall(q in qRange) x[q] <= maxNProd;
};
 
 
 
 
 
 
 
 
 