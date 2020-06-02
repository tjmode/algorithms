/*
sort the elements of arrayOfElements with minimum swaps. Also find the sum of difference of values from the given index position in reverse order.
Inputs: arrayOfElements size, arrayOfElements elements, Index position
output: Sorted arrayOfElements with minimum swap count, sum of difference of values 
*/

import Foundation
func arrayOfElementsSortingWithMinimumSwap (arrayOfElements: [Int]) -> [Int] {
    var arrayOfElements = arrayOfElements
    var swapCounter = 0
    var temparrayOfElementsMinValue = 0
    for index in 0..<arrayOfElements.count {
        let temparrayOfElements = arrayOfElements[index...(arrayOfElements.count - 1)]
        temparrayOfElementsMinValue = temparrayOfElements.min() as! Int
        if arrayOfElements[index] != temparrayOfElementsMinValue {
            let tempValue = arrayOfElements[index]
            arrayOfElements[index] = temparrayOfElementsMinValue
            arrayOfElements[(temparrayOfElements.index(of:temparrayOfElementsMinValue) as! Int )] = tempValue
            swapCounter += 1
        }
    }
    return arrayOfElements
}
func sumOfMinimumDiferenceForGivenRange (arrayOfElements: [Int], indexNumber: Int) -> Int {
    var sumOfDiference = 0
    if arrayOfElements.count > indexNumber {
        for index in 0..<indexNumber {
            sumOfDiference = sumOfDiference + (arrayOfElements[index + 1] - arrayOfElements[index] )
        }
    }
    return sumOfDiference
}

var sortedArrayOfElements = arrayOfElementsSortingWithMinimumSwap(arrayOfElements: [1,2,1,9])
print(sortedArrayOfElements)
sumOfMinimumDiferenceForGivenRange(arrayOfElements: sortedArrayOfElements, indexNumber: 2)
