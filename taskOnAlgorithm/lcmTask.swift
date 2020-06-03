/*
LCM of two number
*/

import Foundation

func findingLargeNumber (between numberOne: Int, and numberTwo: Int) -> Int {
    if numberOne >= numberTwo {
        return numberOne
    } else {
        return numberTwo
    }
}

func findingLcm (for numberOne: Int, and numberTwo: Int, with largeNumber: Int) -> Int {
    var largeNumber = largeNumber
    var answer = 0
    if (largeNumber % numberOne == 0) , (largeNumber % numberTwo == 0) {
        return largeNumber
    } else {
       return findingLcm (for : numberOne, and: numberTwo, with: largeNumber + 1)
    }
}

func lcm (for numberOne: Int, and numberTwo: Int) -> Int{
    return findingLcm (for: numberOne, and: numberTwo, with: (findingLargeNumber(between: numberOne, and: numberTwo)))
}
print(lcm(for: 1, and: 1))
