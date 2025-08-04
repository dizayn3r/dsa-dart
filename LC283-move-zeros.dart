class Solution {
  /// Optimal Two-Pointer Approach
  /// Time: O(n), Space: O(1)
  void moveZeroes(List<int> nums) {
    int writeIndex = 0; // Points to where next non-zero should be written

    // First pass: Move all non-zero elements to the front
    for (int readIndex = 0; readIndex < nums.length; readIndex++) {
      if (nums[readIndex] != 0) {
        nums[writeIndex] = nums[readIndex];
        writeIndex++;
      }
    }

    // Second pass: Fill remaining positions with zeros
    while (writeIndex < nums.length) {
      nums[writeIndex] = 0;
      writeIndex++;
    }
  }

  /// Alternative: Swap-based Approach (Single Pass)
  /// Time: O(n), Space: O(1)
  void moveZeroesSwap(List<int> nums) {
    int left = 0; // Points to the next position where non-zero should go

    for (int right = 0; right < nums.length; right++) {
      if (nums[right] != 0) {
        // Swap non-zero element to the left position
        int temp = nums[left];
        nums[left] = nums[right];
        nums[right] = temp;
        left++;
      }
    }
  }

  /// Optimized Swap Approach (Avoid unnecessary swaps)
  /// Time: O(n), Space: O(1)
  void moveZeroesOptimizedSwap(List<int> nums) {
    int left = 0;

    for (int right = 0; right < nums.length; right++) {
      if (nums[right] != 0) {
        // Only swap if positions are different
        if (left != right) {
          int temp = nums[left];
          nums[left] = nums[right];
          nums[right] = temp;
        }
        left++;
      }
    }
  }

  /// Inefficient Approach (for comparison) - NOT RECOMMENDED
  /// Time: O(n²), Space: O(1)
  void moveZeroesBruteForce(List<int> nums) {
    int n = nums.length;

    for (int i = 0; i < n - 1; i++) {
      if (nums[i] == 0) {
        // Find next non-zero element
        int j = i + 1;
        while (j < n && nums[j] == 0) {
          j++;
        }

        if (j < n) {
          // Shift all elements between i and j to the left
          int temp = nums[j];
          for (int k = j; k > i; k--) {
            nums[k] = nums[k - 1];
          }
          nums[i] = temp;
        }
      }
    }
  }
}

// Comprehensive test and demonstration
void main() {
  Solution solution = Solution();

  print("=== LeetCode 283: Move Zeroes ===\n");

  // Test Case 1
  print("Test Case 1:");
  List<int> nums1 = [0, 1, 0, 3, 12];
  print("Input:  $nums1");
  solution.moveZeroes(nums1);
  print("Output: $nums1");
  print("Expected: [1, 3, 12, 0, 0]\n");

  // Test Case 2
  print("Test Case 2:");
  List<int> nums2 = [0];
  print("Input:  $nums2");
  solution.moveZeroes(nums2);
  print("Output: $nums2");
  print("Expected: [0]\n");

  // Test Case 3: All zeros
  print("Test Case 3 (All zeros):");
  List<int> nums3 = [0, 0, 0, 0];
  print("Input:  $nums3");
  solution.moveZeroes(nums3);
  print("Output: $nums3");
  print("Expected: [0, 0, 0, 0]\n");

  // Test Case 4: No zeros
  print("Test Case 4 (No zeros):");
  List<int> nums4 = [1, 2, 3, 4];
  print("Input:  $nums4");
  solution.moveZeroes(nums4);
  print("Output: $nums4");
  print("Expected: [1, 2, 3, 4]\n");

  // Test Case 5: Mixed case
  print("Test Case 5 (Mixed):");
  List<int> nums5 = [1, 0, 2, 0, 0, 3, 0, 4];
  print("Input:  $nums5");
  solution.moveZeroes(nums5);
  print("Output: $nums5");
  print("Expected: [1, 2, 3, 4, 0, 0, 0, 0]\n");

  // Demonstrate different approaches
  print("=== Comparing Different Approaches ===\n");

  List<int> testArray = [0, 1, 0, 3, 12];

  // Approach 1: Two-pass
  List<int> test1 = List.from(testArray);
  print("Original: $test1");
  solution.moveZeroes(test1);
  print("Two-pass approach: $test1");

  // Approach 2: Swap-based
  List<int> test2 = List.from(testArray);
  solution.moveZeroesSwap(test2);
  print("Swap approach: $test2");

  // Approach 3: Optimized swap
  List<int> test3 = List.from(testArray);
  solution.moveZeroesOptimizedSwap(test3);
  print("Optimized swap: $test3");

  // Step-by-step demonstration
  print("\n=== Step-by-Step Demonstration ===");
  demonstrateStepByStep([0, 1, 0, 3, 12]);
}

void demonstrateStepByStep(List<int> nums) {
  print("Input array: $nums");
  print("\nTwo-pointer approach step-by-step:");

  List<int> demo = List.from(nums);
  int writeIndex = 0;

  print("Step 0: writeIndex = $writeIndex, array = $demo");

  for (int readIndex = 0; readIndex < demo.length; readIndex++) {
    print("\nStep ${readIndex + 1}: readIndex = $readIndex, nums[readIndex] = ${demo[readIndex]}");

    if (demo[readIndex] != 0) {
      demo[writeIndex] = demo[readIndex];
      print("  Non-zero found! Move ${demo[readIndex]} to position $writeIndex");
      writeIndex++;
      print("  writeIndex incremented to $writeIndex");
    } else {
      print("  Zero found, skip");
    }

    print("  Current array: $demo");
  }

  print("\nFilling remaining positions with zeros:");
  while (writeIndex < demo.length) {
    demo[writeIndex] = 0;
    print("  Set position $writeIndex to 0");
    writeIndex++;
  }

  print("\nFinal result: $demo");
}