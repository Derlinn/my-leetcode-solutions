package main

import "testing"

func TestTwoSum(t *testing.T) {
	tests := []struct {
		name   string
		nums   []int
		target int
		want   []int
	}{
		{
			name:   "default tab",
			nums:   []int{2, 7, 11, 15},
			target: 9,
			want:   []int{0, 1},
		},
		{
			name:   "negative numbers",
			nums:   []int{-1, -2, -3, 5, 10},
			target: 7,
			want:   []int{2, 4},
		},
		{
			name:   "minimum array",
			nums:   []int{1, 2},
			target: 3,
			want:   []int{0, 1},
		},
		{
			name:   "with zeros",
			nums:   []int{0, 0, 3, 4},
			target: 0,
			want:   []int{0, 1},
		},
		{
			name:   "duplicates in array",
			nums:   []int{3, 2, 3},
			target: 6,
			want:   []int{0, 2},
		},
		{
			name:   "large values",
			nums:   []int{1000000, 2000000, 3000000},
			target: 3000000,
			want:   []int{0, 1},
		},
	}

	for _, tc := range tests {
		t.Run(tc.name, func(t *testing.T) {
			got := twoSum(tc.nums, tc.target)
			if len(got) != len(tc.want) {
				t.Fatalf("len mismatch: got=%v want=%v", got, tc.want)
			}
			for i := range got {
				if got[i] != tc.want[i] {
					t.Fatalf("mismatch at index %d: got=%v want=%v", i, got, tc.want)
				}
			}
		})
	}
}
