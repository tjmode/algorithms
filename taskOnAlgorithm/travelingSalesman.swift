import Foundation
var distanceMatrix = [[-1, 2, 3],[2, -1, 3],[1, 2, -1]]
var tempDistanceMatrix = distanceMatrix
var counter = -1 
var indexCounter = -1
var nodeSelectRange = 0
var selectedNode = 0
func selectRow (for index: Int) -> [Int] {
    var row = [Int] ()
    for indexCount in 0..<tempDistanceMatrix.count {
        row.append(tempDistanceMatrix[indexCount][index])
    }
    return row
}

func selectColumn (for index: Int) -> [Int] {
    return tempDistanceMatrix[index]
}
func smallValue(of array: [Int]) -> Int{
    var array = array
    if array.contains(-1) {
        array.remove(at: (array.index(of: -1)) as! Int)
        return array.min() as! Int
    } else { return array.min() as! Int }
}

func columnReduction() -> Void {
    let distanceMatrixs =  distanceMatrix
    for eachColumn in distanceMatrixs {
        counter += 1
        let minValue = smallValue(of: eachColumn)
        for each in eachColumn {
            indexCounter += 1
            if each != -1 {
               distanceMatrix[counter][indexCounter] = distanceMatrix[counter][indexCounter] - minValue
            }
        }
        indexCounter = -1
    }
}

func rowReduction() -> Void {
    for rowIndex in 0..<distanceMatrix.count {
        counter += 1
       let minValue = smallValue(of: selectRow(for: rowIndex))
       for _ in 0..<distanceMatrix.count {
           indexCounter += 1
           if distanceMatrix [indexCounter][counter] != -1 {
               distanceMatrix [indexCounter][counter] = distanceMatrix [indexCounter][counter] - minValue
           }
       }
       indexCounter = -1
    }
}
func deleteTempDistanceMatrix(for x: Int, and y: Int) -> Void {
    tempDistanceMatrix.remove(at: y)
    for index in 0..<tempDistanceMatrix.count {
        tempDistanceMatrix[index].remove(at: x)
     }
}

func findX(for array: [Int]) -> String {
    var x = "nil"
    if array.filter({$0 == 0}).count == 1 {
        x = "\(array.index(of: 0)as! Int ?? 0)"
    }
    return x
}

columnReduction()
tempDistanceMatrix = distanceMatrix
counter = -1 
indexCounter = -1
rowReduction()
tempDistanceMatrix = distanceMatrix
print(tempDistanceMatrix)
for index in 0..<tempDistanceMatrix.count {
  var tempX = findX(for: selectColumn(for: index))
  if let x = Int(tempX)  {
      deleteTempDistanceMatrix(for: x, and: index)
  }
}
print(tempDistanceMatrix)

for index in 0..<tempDistanceMatrix.count {
    var tempX = findX(for: selectRow(for: index)) 
    if let x = Int(tempX) {
        deleteTempDistanceMatrix(for: x, and: index)
    }
}
print(tempDistanceMatrix)


