import Foundation
var openBracketIndex = [Int]()
var stackIndex = -1
var stack = [String]()
var postfixArray = [String]()
var lastStackWieght = [Int]()
var flag = 0
let priorityDictionary = ["+": 1, "-": 1, "*":2, "/":2, "(": -1, ")": -1]
func infixToPostfix (from expressionArray: [String]) -> [String] {
    var expressionArray = expressionArray
    for each in expressionArray {
        if each == ")" {
            openBracketIndex.append(stackIndex)
            stackIndex += 1
            expressionArray.removeFirst()
        } else if each == "(" {
        openBracketIndex.removeLast()
        stackIndex -= 1
        } else if priorityDictionary[each]! == nil {
            if lastStackWieght.count == 0 {
                stack.append(each)
                stackIndex += 1
                lastStackWieght.append(priorityDictionary[each]!)
                expressionArray.removeFirst(
            } else {
                if priorityDictionary[each]! == lastStackWieght[lastStackWieght.count - 1] || priorityDictionary[each]! < lastStackWieght[lastStackWieght.count - 1] {
                   stackIndex -= 1
                   expressionArray.removeFirst()
                   postfixArray.append(stack.removeLast())
                   infixToPostfix(from: expressionArray)
                   flag = 1
                } else {
                stack.append(each)
                stackIndex += 1
                expressionArray.removeFirst()
                }
            }
        } else {
            postfixArray.append(each)
        }
        if flag == 1 { 
            return infixToPostfix(from: expressionArray)
        } else {
            return postfixArray + (stack.reversed())
        } 
    }
}
print(infixToPostfix(from: ["2", "*", "(", "-", "5", ")", "+", "6"]))


