// LeetCode 1717: Maximum Score From Removing Substrings
// Problem: Given a string s and integers x and y, remove "ab" (for x points) or
// "ba" (for y points) any number of times. Return the maximum points possible.
// Example 1:
// Input: s = "cdbcbbaaabab", x = 4, y = 5
// Output: 19
// Explanation: Remove "ba" (5 points) -> "cdbcbbaaab", then "ab" (4 points) -> 
// "cdbcbbaa", then "ba" (5 points) -> "cdbcba", then "ba" (5 points) -> "cdbc".
// Total score = 5 + 4 + 5 + 5 = 19.
// Example 2:
// Input: s = "aabbaaxybbaabb", x = 5, y = 4
// Output: 20
// Constraints: 1 <= s.length <= 10^5, 1 <= x, y <= 10^4, s consists of lowercase English letters.

class Solution {
  int maximumGain(String s, int x, int y) {
    // Determine which substring to remove first based on point values
    String first = x >= y ? "ab" : "ba";
    int firstPoints = x >= y ? x : y;
    String second = x >= y ? "ba" : "ab";
    int secondPoints = x >= y ? y : x;

    // First pass: Remove the higher-point substring
    List<String> stack = [];
    int score = 0;

    // Process the string to remove the first substring
    for (int i = 0; i < s.length; i++) {
      if (stack.isNotEmpty && stack.last == first[0] && s[i] == first[1]) {
        // Found the first substring (e.g., "ab" or "ba"), remove it
        stack.removeLast();
        score += firstPoints;
      } else {
        // Add current character to stack
        stack.add(s[i]);
      }
    }

    // Convert stack to string for second pass
    StringBuffer intermediate = StringBuffer();
    for (String c in stack) {
      intermediate.write(c);
    }
    String remaining = intermediate.toString();

    // Second pass: Remove the second substring from the remaining string
    stack.clear();
    for (int i = 0; i < remaining.length; i++) {
      if (stack.isNotEmpty && stack.last == second[0] && remaining[i] == second[1]) {
        // Found the second substring, remove it
        stack.removeLast();
        score += secondPoints;
      } else {
        // Add current character to stack
        stack.add(remaining[i]);
      }
    }

    return score;
  }
}

// Main function to demonstrate the solution with examples
void main() {
  Solution solution = Solution();

  // Example 1
  String s1 = "cdbcbbaaabab";
  int x1 = 4, y1 = 5;
  int result1 = solution.maximumGain(s1, x1, y1);
  print('Example 1:');
  print('Input: s = "$s1", x = $x1, y = $y1');
  print('Output: $result1'); // Expected output: 19

  // Example 2
  String s2 = "aabbaaxybbaabb";
  int x2 = 5, y2 = 4;
  int result2 = solution.maximumGain(s2, x2, y2);
  print('Example 2:');
  print('Input: s = "$s2", x = $x2, y = $y2');
  print('Output: $result2'); // Expected output: 20
}
