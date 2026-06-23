package main

import "testing"

func TestLongestCommonPrefix(t *testing.T) {
	tests := []struct {
		name string
		strs []string
		want string
	}{
		{
			name: "no commun prefix",
			strs: []string{"ab", "b"},
			want: "",
		},
		{
			name: "commun prefix",
			strs: []string{"abracadabra", "abranaconda"},
			want: "abra",
		},
		{
			name: "empty input",
			strs: []string{},
			want: "",
		},
		{
			name: "single string",
			strs: []string{"hello"},
			want: "hello",
		},
		{
			name: "identical strings",
			strs: []string{"abc", "abc", "abc"},
			want: "abc",
		},
		{
			name: "one empty string",
			strs: []string{"abc", "", "abcd"},
			want: "",
		},
		{
			name: "prefix is first string",
			strs: []string{"ab", "abcd", "abcde"},
			want: "ab",
		},
		{
			name: "leetcode example - flower",
			strs: []string{"flower", "flow", "flight"},
			want: "fl",
		},
	}

	for _, tc := range tests {
		t.Run(tc.name, func(t *testing.T) {
			got := longestCommonPrefix(tc.strs)
			if got != tc.want {
				t.Fatalf("prefix mismatch: got=%v want=%v", got, tc.want)
			}
		})
	}
}
