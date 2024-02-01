int years = ...;
int products = ...;

int lengths[1..years] = ...;
int returns[1..products] = ...;

dvar float+ a[1..(years + 1) - lengths[1]];
dvar float+ b[1..(years + 1) - lengths[2]];
dvar float+ c[1..(years + 1) - lengths[3]];

maximize 1.5 * a[4] + 3.3 * b[3] + 4.5 * c[2];

subject to {
  
  
  forall(i in 1..years) a[i] <= 50;
}


