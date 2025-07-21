class Solution {
  int lengthOfLongestSubstring(String s) {
    int maxLength = 0;
    int left = 0;
    Set<String> seen = {};

    for (int right = 0; right < s.length; right++) {
      while (seen.contains(s[right])) {
        seen.remove(s[left]);
        left++;
      }
      seen.add(s[right]);
      maxLength =
          maxLength > (right - left + 1) ? maxLength : (right - left + 1);
    }

    return maxLength;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.lengthOfLongestSubstring("abcabcbb")); // Output: 3
  print(solution.lengthOfLongestSubstring("bbbbb")); // Output: 1
  print(solution.lengthOfLongestSubstring("pwwkew")); // Output: 3
}
