import Foundation
let expressionArray = Array("(1*1(1+1))")
var priorityDictionary = ["+": 1, "-": 1, "*":2, "/":2]
var stackIndex = 0
var openBracketIndex = -1
var currentWieght = 0
var symbols = [String]()
var postfixArray = [String]()
var lastWeight = -1
var temp = 0
for each in expressionArray {
    if each == "(" {
        openBracketIndex = stackIndex
        lastWeight = -1
    } else if each == ")" {
        if symbols.count != 0 {
            temp = openBracketIndex
            var tempArray = symbols[openBracketIndex..<stackIndex]
            lastWeight = -1
            tempArray.reverse()
            postfixArray = postfixArray + tempArray
            for removingIndex in openBracketIndex..<(stackIndex){
                var a = symbols.remove(at: openBracketIndex)
                stackIndex -= 1
            }
            openBracketIndex = temp
        }
    } else if priorityDictionary[String(each)] != nil {
        currentWieght = priorityDictionary[String(each)] as! Int ?? 0
        var flag = 0
        while flag == 0 {
            if symbols.count == 0 {
                symbols.append(String(each))
                stackIndex += 1
                lastWeight = priorityDictionary[String(each)] as! Int ?? 0
                flag = 1
            } else if currentWieght != lastWeight , currentWieght > lastWeight {
                symbols.append(String(each))
                stackIndex += 1
                lastWeight = priorityDictionary[String(each)] as! Int ?? 0
                flag = 1
            } else if  currentWieght == lastWeight || currentWieght < lastWeight {
                print("YES")
                let transfer = symbols.removeLast()
                symbols.append(String(each))
                postfixArray.append(transfer)
                flag = 1
                print(postfixArray)
            } else {
                symbols.append(String(each))
                stackIndex += 1
                lastWeight = priorityDictionary[String(each)] as! Int ?? 0
                flag = 1
            }
        }

    } else {
        postfixArray.append(String(each))
    }
}
print(postfixArray)
