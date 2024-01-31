/*********************************************
 * OPL 22.1.1.0 Model
 * Author: Admin
 * Creation Date: 16 Jan 2024 at 21:41:18
 *********************************************/

 
dvar float+ x1;
dvar float+ x2;
 
maximize (3 * x1) + (5 * x2);

subject to {
  constraint1: x1 <= 4;
  
  constraint2: (2 * x2) <= 12;
  
  constraint3: (3 * x1) + (2 * x2) <= 18;
}