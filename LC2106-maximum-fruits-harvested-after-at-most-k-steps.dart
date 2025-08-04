class Solution {
  int maxTotalFruits(List<List<int>> fruits, int startPos, int k) {
    int n = fruits.length;
    int maxFruits = 0;

    // Precompute prefix sums for efficient range queries
    List<int> positions = [];
    List<int> amounts = [];
    List<int> prefixSum = [0];

    for (var fruit in fruits) {
      positions.add(fruit[0]);
      amounts.add(fruit[1]);
      prefixSum.add(prefixSum.last + fruit[1]);
    }

    // Try going left first, then right
    for (int leftSteps = 0; leftSteps <= k; leftSteps++) {
      int rightSteps = k - 2 * leftSteps; // Need to return from left
      if (rightSteps < 0) rightSteps = 0;

      int fruits_collected = 0;

      // Find leftmost reachable position
      int leftBound = startPos - leftSteps;
      // Find rightmost reachable position
      int rightBound = startPos + rightSteps;

      // Use binary search to find range of fruits we can collect
      int leftIdx = lowerBound(positions, leftBound);
      int rightIdx = upperBound(positions, rightBound) - 1;

      if (leftIdx <= rightIdx) {
        fruits_collected = prefixSum[rightIdx + 1] - prefixSum[leftIdx];
      }

      maxFruits = maxFruits > fruits_collected ? maxFruits : fruits_collected;
    }

    // Try going right first, then left
    for (int rightSteps = 0; rightSteps <= k; rightSteps++) {
      int leftSteps = k - 2 * rightSteps; // Need to return from right
      if (leftSteps < 0) leftSteps = 0;

      int fruits_collected = 0;

      // Find leftmost reachable position
      int leftBound = startPos - leftSteps;
      // Find rightmost reachable position
      int rightBound = startPos + rightSteps;

      // Use binary search to find range of fruits we can collect
      int leftIdx = lowerBound(positions, leftBound);
      int rightIdx = upperBound(positions, rightBound) - 1;

      if (leftIdx <= rightIdx) {
        fruits_collected = prefixSum[rightIdx + 1] - prefixSum[leftIdx];
      }

      maxFruits = maxFruits > fruits_collected ? maxFruits : fruits_collected;
    }

    return maxFruits;
  }

  // Binary search to find first position >= target
  int lowerBound(List<int> arr, int target) {
    int left = 0, right = arr.length;
    while (left < right) {
      int mid = left + (right - left) ~/ 2;
      if (arr[mid] < target) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    return left;
  }

  // Binary search to find first position > target
  int upperBound(List<int> arr, int target) {
    int left = 0, right = arr.length;
    while (left < right) {
      int mid = left + (right - left) ~/ 2;
      if (arr[mid] <= target) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    return left;
  }
}

// Test function with examples
void main() {
  Solution solution = Solution();

  // Example 1: fruits = [[2,8],[6,3],[8,6]], startPos = 5, k = 4
  List<List<int>> fruits1 = [[2,8],[6,3],[8,6]];
  int result1 = solution.maxTotalFruits(fruits1, 5, 4);
  print("Example 1 Result: $result1"); // Expected: 9
  print("Explanation: Move right to pos 6 (3 fruits) then pos 8 (6 fruits) = 9 total");

  // Example 2: fruits = [[0,9],[4,1],[5,7],[6,2],[7,4],[10,9]], startPos = 5, k = 4
  List<List<int>> fruits2 = [[0,9],[4,1],[5,7],[6,2],[7,4],[10,9]];
  int result2 = solution.maxTotalFruits(fruits2, 5, 4);
  print("\nExample 2 Result: $result2"); // Expected: 14
  print("Explanation: Collect at pos 5 (7), move left to 4 (1), right to 6 (2), right to 7 (4) = 14 total");

  // Example 3: fruits = [[0,3],[6,4],[8,5]], startPos = 3, k = 2
  List<List<int>> fruits3 = [[0,3],[6,4],[8,5]];
  int result3 = solution.maxTotalFruits(fruits3, 3, 2);
  print("\nExample 3 Result: $result3"); // Expected: 0
  print("Explanation: Cannot reach any fruit position within 2 steps from position 3");

  // Additional test case
  List<List<int>> fruits4 = [[1,3],[2,4],[3,5]];
  int result4 = solution.maxTotalFruits(fruits4, 2, 2);
  print("\nAdditional Test Result: $result4");
  print("Explanation: Start at 2, can reach positions 1,2,3 within 2 steps");
}