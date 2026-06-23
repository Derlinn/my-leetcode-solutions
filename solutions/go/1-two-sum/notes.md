# Notes

- Complexity: O(n²) time, O(1) extra space where n = len(nums). Nested loops
  compare all pairs, but no auxiliary data structures are used.
- Key idea: Brute force approach with early exit. Use two nested loops where the
  inner loop starts after the outer index to avoid checking the same pair twice.
  Return immediately upon finding a pair that sums to target.
- Edge cases:
  - Minimum array size is 2 (guaranteed by problem constraints).
  - Negative numbers: work correctly as long as sum equals target.
  - Duplicate values: can be part of the answer if they appear at different
    indices.
  - Zeros in the array: handled like any other number.
  - Only one valid answer exists.
