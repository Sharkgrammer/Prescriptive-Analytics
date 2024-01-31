/*********************************************
 * OPL 22.1.1.0 Model
 * Author: Admin
 * Creation Date: 16 Jan 2024 at 22:26:59
 *********************************************/






int numProducts = ...;
int numPlants = ...;

range productIdx = 1..numProducts;
range plantIdx = 1..numPlants;
 
float profit[productIdx] = ...;
float plantCapacity[plantIdx] = ...;

float timePerBatch[plantIdx][productIdx] = ...;
 
dvar float+ x[productIdx];
 
maximize sum(i in productIdx) profit[i] * x[i];

subject to {
  
  forall (plant in plantIdx) {
    ct: sum (product in productIdx) 
    	timePerBatch[plant][product] * x[product] <= plantCapacity[plant];
  }
  
}
 
 
 