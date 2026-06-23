package main

func longestCommonPrefix(strs []string) string {
	result := ""

	if len(strs) == 0 {
		return ""
	}

	if len(strs) == 1 {
		return strs[0]
	}

	minLen := len(strs[0])
	for _, s := range strs {
		if len(s) < minLen {
			minLen = len(s)
		}
	}

	for i := 0; i < minLen; i++ {
		current := strs[0][i]
		for _, s := range strs {
			if s[i] != current {
				return result
			}
		}
		result += string(current)
	}

	return result
}
