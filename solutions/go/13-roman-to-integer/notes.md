# Notes

- Complexity: O(n) time, O(1) extra space where n = len(s). Single pass through
  the string with a switch-based lookup.
- Key idea: Iterate through each character and compare its value with the next
  character's value. If the current value is less than the next, subtract it
  (subtractive notation like IV = 4, IX = 9). Otherwise, add it normally.
- Edge cases:
  - Empty string: returns 0.
  - Single character: returns its corresponding value.
  - All same characters: purely additive (e.g., III = 3).
  - Subtractive notation: IV, IX, XL, XC, CD, CM handled correctly by comparing
    adjacent values.
- Switch used instead of hashmap for lower memory usage.
