int loans = ...;
int maxMoney = ...;
float farmCommAllocation = ...;
float badDebtRatio = ...;
 
range loanRange = 1..loans;
 
float interest[loanRange] = ...;
float badDebt[loanRange] = ...;

dvar float x[loanRange];

maximize sum(l in loanRange)(interest[l] * ((1 - badDebt[l]) * x[l]) - (badDebt[l] * x[l]));

subject to {
  
  maxMonetCT: sum(l in loanRange) x[l] <= maxMoney;
  
  badDebtCT: (sum(l in loanRange) badDebt[l] * x[l]) / (sum(l in loanRange) x[l]) <= badDebtRatio;
  
  // Cannot generalise the last two constraints
  farmCommCT: x[4] + x[5] / (sum(l in loanRange) x[l]) <= farmCommAllocation;
  
  housingCT: x[3] - x[1] - x[2] >= 0;
}

