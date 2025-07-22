// A class that contains the method to generate Pascal's Triangle
class Solution {
  // Method to generate the first 'numRows' rows of Pascal's Triangle
  List<List<int>> generate(int numRows) {
    List<List<int>> ans = []; // This will hold the resulting triangle

    // Loop through each row number from 1 to numRows
    for (int length = 1; length <= numRows; length++) {
      // Create a new row with 'length' elements, all initialized to 1
      List<int> row = List.filled(length, 1);

      // Calculate the inner elements of the row if length > 2
      for (int i = 1; i < length - 1; i++) {
        // Each inner element is the sum of the two elements above it
        row[i] = ans[length - 2][i - 1] + ans[length - 2][i];
      }

      // Add the constructed row to the final result
      ans.add(row);
    }

    return ans;
  }
}

void main() {
  Solution solution = Solution();

  int numRows = 5; // You can change this value or take input dynamically

  // Generate Pascal's Triangle
  List<List<int>> triangle = solution.generate(numRows);

  // Print each row of the triangle
  for (var row in triangle) {
    print(row);
  }
}
