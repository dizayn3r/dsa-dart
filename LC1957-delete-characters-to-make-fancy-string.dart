// LeetCode 1957: Delete Characters to Make Fancy String
// Problem: Given a string s, a fancy string is a string where there are no three
// consecutive identical characters. Return a fancy string by deleting the minimum
// number of characters from s. You can delete characters from any position.
// Example:
// Input: s = "leeetcode"
// Output: "leetcode"
// Explanation: Remove one 'e' from "lee" to get "le", so the result is "leetcode".
// No three consecutive characters are identical in the output.

class Solution {
  String makeFancyString(String s) {
    // Initialize a StringBuffer to build the result string efficiently
    StringBuffer result = StringBuffer();
    // Store the last character processed to track consecutive characters
    String lastChar = '';
    // Count consecutive occurrences of the current character
    int count = 0;

    // Iterate through each character in the input string
    for (int i = 0; i < s.length; i++) {
      // Get the current character
      String currentChar = s[i];
      // Check if current character matches the last processed character
      if (currentChar == lastChar) {
        // Increment count for consecutive character
        count++;
      } else {
        // Reset count for new character and update lastChar
        count = 1;
        lastChar = currentChar;
      }

      // Only append character if we have fewer than 3 consecutive occurrences
      if (count <= 2) {
        result.write(currentChar);
      }
      // If count > 2, skip appending to avoid three consecutive identical characters
    }

    // Convert StringBuffer to String and return the result
    return result.toString();
  }
}

// Main function to demonstrate the solution with an example
void main() {
  // Create an instance of the Solution class
  Solution solution = Solution();
  
  // Example input
  String input = "leeetcode";
  // Process the input using makeFancyString
  String output = solution.makeFancyString(input);
  
  // Print the input and output for demonstration
  print('Input: $input');
  print('Output: $output'); // Expected output: "leetcode"
}
