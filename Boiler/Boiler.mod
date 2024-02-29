int boilers = ...;
int turbines = ...;

range boilerRange = 1..boilers;
range turbineRange = 1..turbines;

int maxEnergy = ...;;

float boilerCost[boilerRange] = ...;
float turbineCost[turbineRange] = ...;

float kwh[turbineRange] = ...;

float boilerMin[boilerRange] = ...;
float boilerMax[boilerRange] = ...;

float turbineMin[turbineRange] = ...;
float turbineMax[turbineRange] = ...;

dvar float+ b[boilerRange];
dvar float+ t[turbineRange];
dvar int k[boilerRange] in 0..1;
dvar int y[turbineRange] in 0..1;

minimize (sum (i in boilerRange) boilerCost[i] * b[i]) + 
		 (sum (i in turbineRange) turbineCost[i] * t[i]);
	
subject to{
  
  kwhCT: sum(i in turbineRange) kwh[i] * t[i] == maxEnergy;
  
  equalsCT: sum(i in boilerRange) b[i] == sum(i in turbineRange) t[i];
  
  boilerCT: 
  forall(i in boilerRange){
    b[i] >= boilerMin[i] * k[i];
    b[i] <= boilerMax[i] * k[i];
  }
  
  turbineCT:
  forall(i in turbineRange){
    t[i] >= turbineMin[i] * y[i];
    t[i] <= turbineMax[i] * y[i];
  }
  
}
	
	
	
	
