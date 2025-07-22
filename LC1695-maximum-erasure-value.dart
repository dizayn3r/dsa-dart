// LeetCode 1695: Maximum Erasure Value
// Problem: Given an array of positive integers nums, erase exactly one subarray
// containing unique elements. The score is the sum of the subarray's elements.
// Return the maximum possible score. A subarray is a contiguous subsequence of the array.
// Example 1:
// Input: nums = [4,2,4,5,6]
// Output: 17
// Explanation: The optimal subarray is [2,4,5,6], sum = 2 + 4 + 5 + 6 = 17.
// Example 2:
// Input: nums = [5,2,1,2,5,2,1,2,5]
// Output: 8
// Explanation: The optimal subarray is [5,2,1], sum = 5 + 2 + 1 = 8.

class Solution {
  int maximumUniqueSubarray(int[] nums) {
    // Set to track unique elements in the current window
    Set<int> seen = Set<int>();
    // Variable to store the maximum score (sum of unique subarray)
    int maxScore = 0;
    // Current sum of elements in the window
    int currSum = 0;
    // Left pointer for the sliding window
    int left = 0;

    // Iterate through the array with the right pointer
    for (int right = 0; right < nums.length; right++) {
      // While the current element is already in the set, shrink the window
      while (seen.contains(nums[right])) {
        // Remove the leftmost element from the set and subtract its value
        seen.remove(nums[left]);
        currSum -= nums[left];
        left++;
      }
      // Add the current element to the set and its value to the sum
      seen.add(nums[right]);
      currSum += nums[right];
      // Update maxScore if the current sum is larger
      maxScore = max(maxScore, currSum);
    }

    return maxScore;
  }
}

// Main function to demonstrate the solution with examples
void main() {
  Solution solution = Solution();
  
  // Example 1
  List<int> nums1 = [4, 2, 4, 5, 6];
  int result1 = solution.maximumUniqueSubarray(nums1);
  print('Example 1:');
  print('Input: $nums1');
  print('Output: $result1'); // Expected output: 17
  
  // Example 2
  List<int> nums2 = [5, 2, 1, 2, 5, 2, 1, 2, 5];
  int result2 = solution.maximumUniqueSubarray(nums2);
  print('Example 2:');
  print('Input: $nums2');
  print('Output: $result2'); // Expected output: 8
}
