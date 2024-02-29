int citys = ...;
int regions = ...;

range cityRange = 1..citys;
range regionRange = 1..regions;

int lockboxCost = ...;
int maxPerLockbox = ...;

float lostInterest[regionRange, cityRange] = ...;


dvar int y[cityRange] in 0..1;
dvar int x[regionRange, cityRange] in 0..1;

minimize sum(c in cityRange) lockboxCost * y[c] + 
	sum(r in regionRange, c in cityRange) lostInterest[r, c] * x[r, c];
	
	
subject to {
  
  forall (r in regionRange){
    maxCT: sum (c in cityRange) x[r, c] == maxPerLockbox;
  }
  
  forall(r in regionRange, c in cityRange){
    lockboxCT: x[r, c] <= y[c];
  }
/*  
  forall (c in cityRange){
    lockboxCT: sum (r in regionRange) x[r, c] <= citys * y[c];
  }
*/
}



