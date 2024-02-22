int investments = ...;

range investRange = 1..investments;

float NPV[investRange] = ...;
float outflow[investRange] = ...;

float capital = ...;

dvar int x[investRange] in 0..1;

maximize sum(i in investRange) NPV[i] * x[i];

subject to {
  
  x[1] == (x[2] == 1);
  
  
  CT: sum (i in investRange) outflow[i] * x[i] <= capital;
  
}






