
int fields = ...;
int maxFields = ...;

range fieldRange = 1..fields;

float costs[fieldRange] = ...;

dvar int x[fieldRange] in 0..1;


minimize sum(f in fieldRange) costs[f] * x[f];

subject to {
  
  maxCT: sum(f in fieldRange) x[f] == maxFields;
  
  x[5] + x[2] <= 1;
  x[5] + x[4] <= 1;
  
  x[2] + x[4] + x[6] <= 1;
  
  x[3] >= x[1];
  
}




