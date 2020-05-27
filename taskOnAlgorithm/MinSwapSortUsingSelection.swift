import Foundation
var array = [5,2,3,4,1,2,2,2,6,7,7]
var swapCounter = 0
for i in 0..<array.count {
    let tempArray = array[i...(array.count - 1)]
    let tempArrayMinValue = tempArray.min() as! Int ?? 0
    if array[i] != tempArrayMinValue {
        let tempValue = array[i]
        array[i] = tempArrayMinValue
        array[(tempArray.index(of:tempArrayMinValue) as! Int ?? 0 + i)] = tempValue
        swapCounter += 1
    }
}
print(array)
print(swapCounter)