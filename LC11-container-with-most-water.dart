/*
  Problem: Container With Most Water

  You are given an integer array `height` of length `n`.
  There are `n` vertical lines drawn such that the two endpoints of the i-th line are (i, 0) and (i, height[i]).

  Find two lines that together with the x-axis form a container, such that the container contains the most water.

  Return the maximum amount of water a container can store.

  Note: You may not slant the container.

  Example 1:
    Input: height = [1,8,6,2,5,4,8,3,7]
    Output: 49
    Explanation: The vertical lines form a container with the most water between indices 1 and 8.
                 The height is min(8, 7) = 7, and the width is 8 - 1 = 7, so area = 7 * 7 = 49.

  Example 2:
    Input: height = [1,1]
    Output: 1

  Constraints:
    - n == height.length
    - 2 <= n <= 10^5
    - 0 <= height[i] <= 10^4
*/

import 'dart:io';
import 'dart:math';

class Solution {
  /// Returns the maximum area of water that can be contained.
  int maxArea(List<int> height) {
    int l = 0;                         // Left pointer
    int r = height.length - 1;         // Right pointer
    int maxArea = 0;                   // Track max area found

    while (l < r) {
      int currHeight = height[l] < height[r] ? height[l] : height[r];
      int width = r - l;
      int area = currHeight * width;

      if (area > maxArea) maxArea = area;

      // Move the pointer pointing to the shorter line
      if (height[l] < height[r]) {
        l++;
      } else {
        r--;
      }
    }

    return maxArea;
  }
}

void main() {
  final solution = Solution();

  stdout.write('Enter the number of vertical lines: ');
  int? count = int.tryParse(stdin.readLineSync() ?? '');
  stdout.write('Enter the maximum height for each line: ');
  int? maxHeight = int.tryParse(stdin.readLineSync() ?? '');

  if (count == null || maxHeight == null || count < 2 || maxHeight < 0) {
    print('Invalid input. Make sure count >= 2 and maxHeight >= 0.');
    return;
  }

  final random = Random();
  List<int> heights = List.generate(count, (_) => random.nextInt(maxHeight + 1));

  print('Generated heights: $heights');

  int area = solution.maxArea(heights);
  print('Maximum area of water the container can hold is: $area');
}

