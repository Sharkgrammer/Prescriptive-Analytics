int days = ...;
int daysOff = ...;
range rangeDays = 1..days;
int nDemand[rangeDays] = ...;


dvar int+ x[rangeDays];

minimize sum (d in rangeDays) x[d];

subject to {
  
  forall(d in rangeDays){
	    ct: sum(i in (d + daysOff + 1)..(d + days)) 
			x[((i - 1) mod days) + 1] >= nDemand[d];    	
  }
  
}



