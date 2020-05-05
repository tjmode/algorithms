import Foundation
func quickSort(array: [Int]) -> [Int] {
    var less = [Int]()
    var greater = [Int]()
    var equal = [Int]()
    if array.count > 1 {
        let pivot = array[0]
        for x in array{
            if x < pivot {
                less.append(x)
            } else if x == pivot {
                equal.append(x)
            } else if x > pivot {
                greater.append(x)
            }
        }
    } else {
        return array
    }
    return quickSort(array: less) + equal + quickSort(array: greater)
}
print(quickSort(array: [36,589,412,444]))