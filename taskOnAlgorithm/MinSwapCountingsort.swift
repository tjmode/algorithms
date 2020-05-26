/*
to sort an array with minimum number of sort
*/

import Foundation
func countingSort(array: [Int]) -> [Int] {
    var storedArray = Array(0...array.count)
    var indexCount = [Int]()
    let indexRange = Array((array.min() ?? 0)...(array.max() ?? 0))
    var sumCount = [Int]()
    var count = 0
    for i in indexRange {
        indexCount.append(array.lazy.filter{$0 == i}.count)
        if indexCount.count == 1 {
            sumCount.append(indexCount[count])
        } else if indexCount.count == 2{
            sumCount.append(indexCount[count] + indexCount[count - 1])
        } else {
            sumCount.append(indexCount[indexCount.count - 1] + sumCount[sumCount.count - 1])
        }
    count += 1
    }
    for j in array {
        var temp = sumCount[(indexRange.index(of: j) ?? 0)]
        storedArray[temp] = j
        sumCount[(indexRange.index(of: j) ?? 0)] = (sumCount[(indexRange.index(of: j) ?? 0)]) - 1
    }
    return storedArray
}
print(countingSort(array: []))
