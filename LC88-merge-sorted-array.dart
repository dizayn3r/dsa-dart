class Solution {
  void merge(List<int> nums1, int m, List<int> nums2, int n) {
    // Initialize three pointers:
    // i for the last element of the valid part of nums1
    // j for the last element of nums2
    // k for the last position of nums1 (m + n - 1)
    int i = m - 1;
    int j = n - 1;
    int k = m + n - 1;

    // Start merging from the end of nums1
    while (i >= 0 && j >= 0) {
      if (nums1[i] > nums2[j]) {
        nums1[k] = nums1[i];
        i--;
      } else {
        nums1[k] = nums2[j];
        j--;
      }
      k--;
    }

    // If any elements remain in nums2, copy them
    while (j >= 0) {
      nums1[k] = nums2[j];
      j--;
      k--;
    }

    // No need to copy the remaining elements from nums1 as they are already in place
  }
}


void main() {
  List<int> nums1 = [1, 2, 3, 0, 0, 0];
  int m = 3;
  List<int> nums2 = [2, 5, 6];
  int n = 3;

  Solution().merge(nums1, m, nums2, n);
  print(nums1); // Output: [1, 2, 2, 3, 5, 6]
}
