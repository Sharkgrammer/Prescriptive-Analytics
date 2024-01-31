/*********************************************
 * OPL 22.1.1.0 Model
 * Author: Admin
 * Creation Date: 16 Jan 2024 at 14:57:42
 *********************************************/

 
 int nbproduct = ...;
 int nbfactory = ...;
 
 range product = 1..nbproduct;
 range factory = 1..nbfactory;
 
 float profit[product] = ...;
 
 float capacity[factory] = ...;
 
 float a[factory][product] = ...;
 
 dvar float+ x[product];
 
 maximize sum(p in product) profit[p]*x[p];
 subject to {
   forall(f in factory){
          ct: sum(p in product) a[f][p]*x[p] <= capacity[f];
   }
 }
 
 
 
 
 
 