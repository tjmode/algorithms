/*
to sort an array with minimum number of sort
*/
import Foundation
func countingSort(array: [Int]) -> [Int] {
    var array = array
    var sortedArray = Array(1...array.count)
    var indexCount = [Int]()
    let indexRange = Array((array.min() ?? 0)...(array.max() ?? 0))
    var sumCount = [Int]()
    var count = 0
    for occurrenceOfNumber in indexRange {
        indexCount.append(array.lazy.filter{$0 == occurrenceOfNumber}.count)
        if indexCount.count == 1 {
            sumCount.append(indexCount[count])
        } else if indexCount.count == 2{
            sumCount.append(indexCount[count] + indexCount[count - 1])
        } else {
            sumCount.append(indexCount[indexCount.count - 1] + sumCount[sumCount.count - 1])
        }
    count += 1
    }
    var swapCount = 0
    for arrayValueAndIndex in array {
        var temp = sumCount[(indexRange.index(of:  arrayValueAndIndex) ?? 0)]
        if array[temp - 1] !=  arrayValueAndIndex {
             sortedArray[temp - 1]  =  arrayValueAndIndex
             swapCount += 1
        }
        sumCount[(indexRange.index(of:  arrayValueAndIndex) ?? 0)] = (sumCount[(indexRange.index(of:  arrayValueAndIndex) ?? 0)]) - 1
    }
    print(swapCount)
    print(sortedArray)
    return sortedArray
}

func minimumDifference (array: [Int], indexNumber: Int) -> Int {
    var minimumDifference = 0
    if array.count > indexNumber {
        for index in 0..<indexNumber {
            minimumDifference = minimumDifference + (array[index + 1] - array[index] )
        }
    }
    return minimumDifference
}

print(minimumDifference (array: (countingSort(array: [1,2,3,4])), indexNumber: 3))

