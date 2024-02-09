


int currency = ...;
range curRange = 1..currency;

float convert[curRange, curRange] = ...;
float init[curRange] = ...;
float finish[curRange] = ...;

dvar float+ x[curRange, curRange];
dvar float+ y[curRange];

maximize sum(c in curRange) 
	((convert[c, 1] + (1 / convert[1, c])) / 2) * y[c];


subject to {
  
	initCT: forall(i in curRange){
			  	 sum(j in curRange) x[i, j] == init[i];
			};
			
	finishCT: forall(c in curRange){
			  	 y[c] >= finish[c];
			};
			
	totalCT: forall(i in curRange){
				sum(j in curRange) convert[j, i] * x[j, i] == y[i];
			};

};