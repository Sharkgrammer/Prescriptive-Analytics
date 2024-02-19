int canoes = ...;
int departments = ...;
int hours = ...;

range canoeRange = 1..canoes;
range depRange = 1..departments;

float profit[canoeRange] = ...;
int depStaff[depRange] = ...;

float canoeHours[canoeRange, depRange] = ...;

float minLux = ...;
float maxLux = ...;

dvar int+ x[canoeRange];

maximize sum(c in canoeRange) profit[c] * x[c];

subject to {
  
  hoursCT:
  forall(d in depRange){
    sum (c in canoeRange) canoeHours[c, d] * x[c] <= depStaff[d] * hours;
  }
  
  luxMinCT: x[2] >= minLux * sum(c in canoeRange) x[c];
  luxMaxCT: x[2] <= maxLux * sum(c in canoeRange) x[c];
}