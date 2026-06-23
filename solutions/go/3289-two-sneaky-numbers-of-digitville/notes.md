# Notes

- Complexity: O(n) time, O(n) extra space where n = len(nums) - 2.
- Key idea: Scan the array once while tracking seen numbers in a frequency array
  sized to the valid value range [0, n-1]. When a number is seen the second
  time, append it to the result. Stop as soon as two duplicated values are
  collected.
- Edge cases:
  - The two duplicates can appear early, late, or interleaved.
  - The result order follows discovery order, not sorted order.
  - This implementation assumes all values are inside [0, n-1] as guaranteed by
    the problem.
