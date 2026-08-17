package main

func romanToInt(s string) int {
    result := 0

    for i := 0; i < len(s) ; i++ {
        current := romanValue(s[i])
        
        if i != len(s)-1 && current < romanValue(s[i+1]) {
            result -= current
        } else {
            result += current
        }
    }

    return result
}

// Func need less mem than hashmap
func romanValue(b byte) int {
    switch b {
        case 'I':
            return 1
        case 'V':
            return 5
        case 'X':
            return 10
        case 'L':
            return 50
        case 'C':
            return 100
        case 'D':
            return 500
        case 'M':
            return 1000
        default:
            return 0
    }
}
