# Notes

- Complexity: O(n × m) time, O(1) extra space where n = number of strings and m
  = length of the shortest string.
- Key idea: Find the shortest string length first to bound the scan. Then
  iterate character by character across all strings at the same index; as soon
  as one character differs from the first string's character at that position,
  return the prefix built so far.
- Edge cases:
  - Empty input array: return "" immediately.
  - Single string: return it as-is, no comparison needed.
  - One or more empty strings in the array: minLen is 0, loop never runs, return
    "".
  - All strings identical: the full string is returned.
