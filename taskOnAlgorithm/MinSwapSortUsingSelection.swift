/*
sort the elements of arrayOfElements with minimum swaps. Also find the sum of difference of values from the given index position in reverse order.
Inputs: arrayOfElements size, arrayOfElements elements, Index position
output: Sorted arrayOfElements with minimum swap count, sum of difference of values 
*/

import Foundation
func sortingarrayOfElementsWithMinimumSwap (arrayOfElements: [Int]) -> [Int] {
    var arrayOfElements = arrayOfElements
    var swapCounter = 0
    for index in 0..<arrayOfElements.count {
        let temparrayOfElements = arrayOfElements[index...(arrayOfElements.count - 1)]
        let minValueOfTempArrayOfElements = temparrayOfElements.min() as! Int
        if arrayOfElements[index] != minValueOfTempArrayOfElements {
            let tempValue = arrayOfElements[index]
            arrayOfElements[index] = minValueOfTempArrayOfElements
            arrayOfElements[(temparrayOfElements.index(of:minValueOfTempArrayOfElements) as! Int )] = tempValue
            swapCounter += 1
        }
    }
    return arrayOfElements
}
func sumOfDiferenceBetweenGivenRange (arrayOfElements: [Int], indexNumber: Int) -> Int {
    var sumOfDiference = 0
    if arrayOfElements.count > indexNumber {
        for index in 0..<indexNumber {
            sumOfDiference = sumOfDiference + (arrayOfElements[index + 1] - arrayOfElements[index] )
        }
    }
    return sumOfDiference
}

var sortedArrayOfElements = sortingarrayOfElementsWithMinimumSwap(arrayOfElements: [1,2,1,9])
print(sortedArrayOfElements)
sumOfDiferenceBetweenGivenRange(arrayOfElements: sortedArrayOfElements, indexNumber: 2)
