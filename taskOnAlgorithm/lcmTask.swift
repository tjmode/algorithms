/*
LCM of two number
*/

import Foundation
func largeAndSmallNumberFinder(numberOne: Int , numberTwo: Int) -> Int {
    if numberOne <= numberTwo {
       let largeNumber = numberTwo
       let smallNumber = numberOne
       return lcmCalculation(largeNumber: largeNumber, smallNumber: smallNumber)
    } else {
       let largeNumber = numberOne
       let smallNumber = numberTwo
       return lcmCalculation(largeNumber: largeNumber, smallNumber: smallNumber)
    }
}

func lcmCalculation (largeNumber: Int, smallNumber: Int) -> Int {
    var largeNumber = largeNumber
    if (largeNumber % largeNumber == 0) , (smallNumber%largeNumber == 0) {
    } else {
        largeNumber = largeNumber + 1
        lcmCalculation (largeNumber: largeNumber, smallNumber: smallNumber)
    }
     return largeNumber
}
func lcm (numberOne: Int, numberTwo: Int) -> Int{
    let answer = largeAndSmallNumberFinder(numberOne: numberOne , numberTwo: numberTwo)
    return answer
}
print(lcm(numberOne: 2, numberTwo: 4))
