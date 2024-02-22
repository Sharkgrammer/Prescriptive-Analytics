int months = ...;

range monthsRange = 1..months;

float holdingCost = ...;
float orderCost = ...;
float orderMax = ...;
float initInventory = ...;

float demand[monthsRange] = ...;

dvar float+ Q[monthsRange];
dvar float+ i[0..months];

dvar int x[monthsRange] in 0..1;

minimize sum(m in monthsRange) ((orderCost * x[m]) + (holdingCost * i[m]));

subject to {
  initCT: i[0] == initInventory;
  
  forall(m in monthsRange){
    orderedCT: Q[m] <= orderMax * x[m];
    
    demandCT: i[m-1] + Q[m] - i[m] == demand[m];	
  }
}


