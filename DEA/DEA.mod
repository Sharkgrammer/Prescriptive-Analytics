int k = ...;
int inputCount = ...;
int outputCount = ...;
int dmuCount = ...;

range inputRange = 1..inputCount;
range outputRange = 1..outputCount;
range dmuRange = 1..dmuCount;

float inputs[inputRange, dmuRange] = ...;
float outputs[outputRange, dmuRange] = ...;

dvar float+ x[inputRange];
dvar float+ y[outputRange];

maximize sum(o in outputRange) outputs[o, k] * y[o];

subject to {
  
  dmuCT:
  forall(dmu in dmuRange){
    sum(o in outputRange) outputs[o, dmu] * y[o] 
    - sum(i in inputRange) inputs[i, dmu] * x[i] <= 0;
  }
  
  equals1CT: sum(i in inputRange) inputs[i, k] * x[i] == 1;
  
};