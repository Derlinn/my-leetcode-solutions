package main

func twoSum(nums []int, target int) (result []int) {

	for idxn, n := range nums {
		for idxj := idxn + 1; idxj < len(nums); idxj++ {
			if (n + nums[idxj]) == target {
				result = []int{idxn, idxj}
				break
			}
		}
		if len(result) == 2 {
			break
		}
	}

	return result
}
