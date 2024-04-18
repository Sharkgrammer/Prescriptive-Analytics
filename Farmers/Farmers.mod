int crops = ...;
int requiredCrops = ...;

range cropRange = 1..crops;
range reqCropRange = 1..requiredCrops;

int maxAcre = ...;
int beetQuotaPrice = ...;
int beetMax = ...;

float shortfall[reqCropRange] = ...;
float requirements[reqCropRange] = ...;

float prices[cropRange] = ...;
float acreCosts[cropRange] = ...;
float acreYields[cropRange] = ...;

dvar float x[cropRange];
dvar float y[reqCropRange];
dvar float s[cropRange];
dvar float bq;

maximize
sum(c in reqCropRange)((prices[c] * s[c]) - (shortfall[c] - y[c]) - (acreCosts[c] * x[c])) +
((prices[crops] * s[crops]) + (beetQuotaPrice * bq) - (acreCosts[crops] * x[crops]));

subject to {
  
  MaxAcresCT:
  sum (c in cropRange) x[c] <= maxAcre;
  
  MinReqCT:
  forall (c in reqCropRange){
    (acreYields[c] * x[c]) + y[c] - s[c] >= requirements[c];
  }
  
  MaxBeetCT:
  s[crops] <= beetMax;
  
  TestCT:
  (acreYields[crops] * x[crops]) >= s[crops] + bq;
}





