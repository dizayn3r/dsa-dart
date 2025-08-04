// LeetCode 128: Longest Consecutive Sequence
// Problem: Given an unsorted array of integers nums, return the length of the
// longest consecutive elements sequence. The algorithm must run in O(n) time.
// Example 1:
// Input: nums = [100,4,200,1,3,2]
// Output: 4
// Explanation: The longest consecutive sequence is [1,2,3,4], with length 4.
// Example 2:
// Input: nums = [0,3,7,2,5,8,4,6,0,1]
// Output: 9
// Example 3:
// Input: nums = [1,0,1,2]
// Output: 3
// Constraints: 0 <= nums.length <= 10^5, -10^9 <= nums[i] <= 10^9

class Solution {
  int longestConsecutive(List<int> nums) {
    // Create a HashSet from the input array to enable O(1) lookups
    final Set<int> set = Set.from(nums);
    // Initialize variable to track the maximum sequence length
    int maxLength = 0;

    // Iterate through each unique number in the set
    for (final n in set) {
      // Skip if n is not the start of a sequence (i.e., n-1 exists)
      if (set.contains(n - 1)) {
        continue;
      }
      // Initialize length for the current sequence starting at n
      int length = 1;

      // Count consecutive numbers (n+1, n+2, etc.) in the set
      while (set.contains(n + length)) {
        length++;
      }

      // Update maxLength if the current sequence is longer
      if (length > maxLength) {
        maxLength = length;
      }
    }

    // Return the length of the longest consecutive sequence
    return maxLength;
  }
}

// Main function to demonstrate the solution with examples
void main() {
  Solution solution = Solution();

  // Example 1
  List<int> nums1 = [100, 4, 200, 1, 3, 2];
  int result1 = solution.longestConsecutive(nums1);
  print('Example 1:');
  print('Input: $nums1');
  print('Output: $result1'); // Expected output: 4

  // Example 2
  List<int> nums2 = [0, 3, 7, 2, 5, 8, 4, 6, 0, 1];
  int result2 = solution.longestConsecutive(nums2);
  print('Example 2:');
  print('Input: $nums2');
  print('Output: $result2'); // Expected output: 9

  // Example 3
  List<int> nums3 = [1, 0, 1, 2];
  int result3 = solution.longestConsecutive(nums3);
  print('Example 3:');
  print('Input: $nums3');
  print('Output: $result3'); // Expected output: 3
}