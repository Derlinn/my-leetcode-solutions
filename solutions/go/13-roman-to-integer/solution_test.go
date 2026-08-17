package main

import "testing"

func TestRomanToInt(t *testing.T) {
	tests := []struct {
		name string
		s    string
		want int
	}{
		{
			name: "leetcode example - III",
			s:    "III",
			want: 3,
		},
		{
			name: "leetcode example - LVIII",
			s:    "LVIII",
			want: 58,
		},
		{
			name: "leetcode example - MCMXCIV",
			s:    "MCMXCIV",
			want: 1994,
		},
		{
			name: "single character",
			s:    "V",
			want: 5,
		},
		{
			name: "subtractive pairs",
			s:    "IV",
			want: 4,
		},
		{
			name: "all same characters",
			s:    "XXXXXX",
			want: 60,
		},
		{
			name: "large value",
			s:    "MMMCMXCIX",
			want: 3999,
		},
		{
			name: "empty string",
			s:    "",
			want: 0,
		},
	}

	for _, tc := range tests {
		t.Run(tc.name, func(t *testing.T) {
			got := romanToInt(tc.s)
			if got != tc.want {
				t.Fatalf("romanToInt(%q) = %d, want %d", tc.s, got, tc.want)
			}
		})
	}
}
