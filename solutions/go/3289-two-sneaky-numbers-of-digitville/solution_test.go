package main

import "testing"

func TestGetSneakyNumbers(t *testing.T) {
	tests := []struct {
		name string
		nums []int
		want []int
	}{
		{
			name: "duplicates found in alternating order",
			nums: []int{0, 1, 1, 0},
			want: []int{1, 0},
		},
		{
			name: "duplicates found later in array",
			nums: []int{0, 3, 2, 1, 3, 2},
			want: []int{3, 2},
		},
		{
			name: "same duplicate values appear in different positions",
			nums: []int{4, 0, 4, 1, 2, 3, 2},
			want: []int{4, 2},
		},
	}

	for _, tc := range tests {
		t.Run(tc.name, func(t *testing.T) {
			got := getSneakyNumbers(tc.nums)
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
