
// Commented code in this file is explained in the data file
// It is a possible way to generalise the constraints for this problem

int subjects = ...;
int minSubject = ...;

range subjectsRange = 1..subjects;

/*
Extra variables to help with the messy generlisation

int mathCount = ...;
range mathRange = 1..mathCount;
int math[mathRange] = ...;

int reqCount = ...;
int reqAmount = ...;
range reqRange = 1..reqAmount;
int requirments[reqRange][1..reqCount] = ...;
*/

dvar int x[subjectsRange] in 0..1;

minimize sum(s in subjectsRange) x[s];

subject to {
  
  minMath: x[1] + x[2] + x[3] + x[4] + x[7] >= minSubject;
  
  minResearch: x[2] + x[4] + x[5] + x[7] >= minSubject;
  
  minComputer: x[3] + x[5] + x[6] >= minSubject;

  calcReq: x[1] >= x[4];
  progReq1: x[6] >= x[3];
  progReq2: x[6] >= x[5];
  statsReq: x[4] >= x[7];
  
  /*
  A messy way to generalise the min (just for math) and requirement constraints
  
  minMath: sum(m in mathRange) x[math[m]] >= minSubject;
  
  forall(c in reqRange){
    reqCT: x[requirments[c][1]] >= x[requirments[c][2]];
  }
  */
}