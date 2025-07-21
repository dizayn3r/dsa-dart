// LeetCode Problem 66: Plus One
// https://leetcode.com/problems/plus-one/

class Solution {
  /// Increments the large integer represented by [digits] by one
  /// and returns the resulting list of digits.
  List<int> plusOne(List<int> digits) {
    int n = digits.length;

    // Traverse from the last digit
    for (int i = n - 1; i >= 0; i--) {
      if (digits[i] < 9) {
        digits[i]++;
        return digits;
      }
      digits[i] = 0; // Set to 0 and continue loop for carry over
    }

    // If all digits were 9 (e.g. [9,9,9]), we need an extra digit at front
    digits.insert(0, 1);
    return digits;
  }
}

void main() {
  final solution = Solution();

  // Example 1
  print(solution.plusOne([1, 2, 3])); // Output: [1, 2, 4]

  // Example 2
  print(solution.plusOne([4, 3, 2, 1])); // Output: [4, 3, 2, 2]

  // Example 3
  print(solution.plusOne([9])); // Output: [1, 0]

  // Example 4
  print(solution.plusOne([9, 9, 9])); // Output: [1, 0, 0, 0]
}
