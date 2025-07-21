// LeetCode Problem 35: Search Insert Position
// https://leetcode.com/problems/search-insert-position/

class Solution {
  /// Returns the index of [target] in [nums] if found,
  /// or the index where it would be inserted in sorted order.
  /// Assumes [nums] is a sorted list of distinct integers.
  /// Time Complexity: O(log n)
  int searchInsert(List<int> nums, int target) {
    int left = 0;
    int right = nums.length - 1;

    while (left <= right) {
      int mid = left + ((right - left) >> 1);

      if (nums[mid] == target) {
        return mid;
      } else if (nums[mid] < target) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return left; // Insertion point
  }
}

void main() {
  final solution = Solution();

  // Example 1
  List<int> nums1 = [1, 3, 5, 6];
  int target1 = 5;
  print(solution.searchInsert(nums1, target1)); // Output: 2

  // Example 2
  List<int> nums2 = [1, 3, 5, 6];
  int target2 = 2;
  print(solution.searchInsert(nums2, target2)); // Output: 1

  // Example 3
  List<int> nums3 = [1, 3, 5, 6];
  int target3 = 7;
  print(solution.searchInsert(nums3, target3)); // Output: 4

  // Example 4
  List<int> nums4 = [1, 3, 5, 6];
  int target4 = 0;
  print(solution.searchInsert(nums4, target4)); // Output: 0
}
