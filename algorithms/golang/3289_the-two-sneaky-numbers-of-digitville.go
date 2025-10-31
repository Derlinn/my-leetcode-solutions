func getSneakyNumbers(nums []int) []int {
    var countNumber = make([]int, len(nums)-2)
    var doubleNumber []int
    index := 0

    for len(doubleNumber) <= 1 {
        currentNumber := nums[index]
        if countNumber[currentNumber] == 0{
            countNumber[currentNumber] ++
        } else {
            doubleNumber = append(doubleNumber, currentNumber)
        }
        index++
    }

    return doubleNumber
}