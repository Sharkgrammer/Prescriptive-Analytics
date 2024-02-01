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
	inventory: i[0] == initInv;
	
	qDemand: forall(q in qRange) i[q - 1] + x[q] + y[q] - i[q] == demand[q];
	
	xProd: forall(q in qRange) x[q] <= maxNProd;
};
 
 
 
 
 
 
 
 
 