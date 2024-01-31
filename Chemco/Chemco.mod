dvar float+ a; // amount of A purchased
dvar float+ b1; // amount of B produced from A
dvar float+ b2; // amount of B produced from C
dvar float+ c1; // amount of C sold
dvar float+ c2; // amount of C processed into B and D
dvar float+ c; // amount of C produced from A
dvar float+ d; // amount of D produced from C

maximize (12 * (b1 + b2)) + (16 * c1) + (26 * d) - ((6 + 3) * a) - (1 * c2);

subject to {
  0.6 * a == b1;
  0.4 * a == c;
  c1 + c2 == c;
  0.4 * c2 == b2;
  0.6 * c2 == d;
  
  (3 * a) + (1 * c2) <= 200;
  b1 + b2 <= 30;
  c1 <= 60;
  d <= 40;
}



