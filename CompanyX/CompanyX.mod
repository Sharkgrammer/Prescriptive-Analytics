int product = ...;
int material = ...;

range productRange = 1..product;
range materialRange = 1..material;

int profit[productRange] = ...;
int rawMaterial[materialRange] = ...;

int productMaterial[materialRange, productRange] = ...;

dvar float+ x[productRange];

maximize sum(p in productRange) profit[p] * x[p];

subject to {
  
  materialCT: 
  forall(m in materialRange){
    sum (p in productRange) productMaterial[m, p] * x[p] <= rawMaterial[m];
  }
  
}