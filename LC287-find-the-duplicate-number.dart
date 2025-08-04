// LeetCode 287: Find the Duplicate Number
// Problem: Given an array of n + 1 integers where each integer is in the range [1, n],
// find the single number that appears two or more times. Solve without modifying the array
// and using only constant extra space.
// Example 1:
// Input: nums = [1,3,4,2,2]
// Output: 2
// Example 2:
// Input: nums = [3,1,3,4,2]
// Output: 3
// Example 3:
// Input: nums = [3,3,3,3,3]
// Output: 3
// Constraints: 1 <= n <= 10^5, nums.length == n + 1, 1 <= nums[i] <= n

class Solution {
  int findDuplicate(List<int> nums) {
    // Initialize tortoise and hare pointers at the first element
    int tortoise = nums[0];
    int hare = nums[0];

    // Phase 1: Find the intersection point of tortoise and hare
    do {
      // Tortoise moves one step
      tortoise = nums[tortoise];
      // Hare moves two steps
      hare = nums[nums[hare]];
    } while (tortoise != hare);

    // Phase 2: Find the entrance to the cycle (the duplicate number)
    tortoise = nums[0];
    while (tortoise != hare) {
      // Both pointers move one step at a time
      tortoise = nums[tortoise];
      hare = nums[hare];
    }

    // The meeting point is the duplicate number
    return hare;
  }
}

// Main function to demonstrate the solution with examples
void main() {
  Solution solution = Solution();

  // Example 1
  List<int> nums1 = [1, 3, 4, 2, 2];
  int result1 = solution.findDuplicate(nums1);
  print('Example 1:');
  print('Input: $nums1');
  print('Output: $result1'); // Expected output: 2

  // Example 2
  List<int> nums2 = [3, 1, 3, 4, 2];
  int result2 = solution.findDuplicate(nums2);
  print('Example 2:');
  print('Input: $nums2');
  print('Output: $result2'); // Expected output: 3

  // Example 3
  List<int> nums3 = [3, 3, 3, 3, 3];
  int result3 = solution.findDuplicate(nums3);
  print('Example 3:');
  print('Input: $nums3');
  print('Output: $result3'); // Expected output: 3
}