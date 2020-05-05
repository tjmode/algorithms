import Foundation
func splitingArray (array: [Int]) -> [Int] {
    print(array)
    guard array.count > 1 else {
        print(1)
        return array
    }
    let leftArray = Array(array[0..<array.count / 2])
    let rightArray = Array(array[array.count / 2..<array.count])
    print("LEFT:\(leftArray)")
    print("right:\(rightArray)")
    return merge(leftArray: splitingArray(array: leftArray), rightArray: splitingArray(array: rightArray))
}
func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
    var mergedArray = [Int]()
    var leftArray = leftArray
    var rightArray = rightArray 
    print(2)
    print(leftArray , rightArray)
    while leftArray.count > 0 && rightArray.count > 0 {
        if leftArray.first ?? 0 < rightArray.first ?? 0 {
            mergedArray.append(leftArray.removeFirst())
        } else {
            mergedArray.append(rightArray.removeFirst())
        }
    }
    print("merged:\(mergedArray + leftArray + rightArray)")
    return mergedArray + leftArray + rightArray 
}
print(splitingArray(array: [86,35,6,63,2,24]))