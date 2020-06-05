/*
LCM of two number
*/

import Foundation

func findingLargeNumber (among numberOne: Int, and numberTwo: Int) -> Int {
    if numberOne >= numberTwo {
        return numberOne
    } else {
        return numberTwo
    }
}

func findingLcm (for numberOne: Int, and numberTwo: Int, with largeNumber: Int) -> Int {
    var largeNumber = largeNumber
    if (numberTwo == 0 ) || (numberOne == 0) {
        return 0
    } else if (largeNumber % numberOne == 0) , (largeNumber % numberTwo == 0) {
        return largeNumber
    } else {
       return findingLcm (for : numberOne, and: numberTwo, with: largeNumber + 1)
    }
}

func lcm (for numberOne: Int, and numberTwo: Int) -> Int{
    return findingLcm (for: numberOne, and: numberTwo, with: (findingLargeNumber(among: numberOne, and: numberTwo)))
}
print(lcm(for: 1, and: 1))
