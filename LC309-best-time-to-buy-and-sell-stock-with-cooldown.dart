class Solution {
  int maxProfit(List<int> prices) {
    if (prices.isEmpty) return 0;

    int n = prices.length;

    // Initialize:
    // hold  - Max profit on day i if we hold a stock
    // sold  - Max profit on day i if we just sold a stock
    // rest  - Max profit on day i if we are in cooldown (did nothing)
    int hold = -prices[0]; // We bought a stock on day 0
    int sold = 0;          // No profit yet because we can't sell on day 0
    int rest = 0;          // No action taken

    for (int i = 1; i < n; i++) {
      int prevHold = hold;
      int prevSold = sold;
      int prevRest = rest;

      // Either we continue to hold, or we buy today after cooldown (rest)
      hold = (prevRest - prices[i]) > prevHold ? (prevRest - prices[i]) : prevHold;

      // If we sell today, we must have held a stock until yesterday
      sold = prevHold + prices[i];

      // If we rest today, we must have either sold yesterday or rested
      rest = prevSold > prevRest ? prevSold : prevRest;
    }

    // Final profit will be max of sold or rest (not hold, as we must not end with a stock in hand)
    return sold > rest ? sold : rest;
  }
}

void main() {
  var solution = Solution();
  print(solution.maxProfit([1, 2, 3, 0, 2])); // Output: 3
}

