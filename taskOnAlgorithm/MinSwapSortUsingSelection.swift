/*
sort the elements of array with minimum swaps. Also find the sum of difference of values from the given index position in reverse order.
Inputs: Array size, Array elements, Index position
output: Sorted array with minimum swap count, sum of difference of values 
*/
import Foundation
func selectionSort (array: [Int]) -> [Int] {
    var array = array
    var swapCounter = 0
    for index in 0..<array.count {
        let tempArray = array[index...(array.count - 1)]
        let tempArrayMinValue = tempArray.min() as! Int
        if array[index] != tempArrayMinValue {
            let tempValue = array[index]
            array[index] = tempArrayMinValue
            array[(tempArray.index(of:tempArrayMinValue) as! Int + index)] = tempValue
            swapCounter += 1
        }
    }
    print(swapCounter)
    print(array)
    return array
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

print(minimumDifference (array: (selectionSort(array: [1,2,3,4])), indexNumber: 3))
