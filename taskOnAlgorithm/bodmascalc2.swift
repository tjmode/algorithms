import Foundation
extension String {
    func replacingFirstOccurrence(of target: String, with replacement: String) -> String {
        guard let range = self.range(of: target) else { return self }
        return self.replacingCharacters(in: range, with: replacement)
    }
}
func ofProblem (expression: String) -> String{
    var expression = expression.replacingOccurrences(of:  " ", with: "")
    expression = expression.replacingOccurrences(of:  ")(", with: ")*(")
    var tempCatch = "w"
    for of in Array(expression) {
        if of == "(" {
            let number = Int(tempCatch) ?? 12421
            if number != 12421 {
                expression = expression.replacingFirstOccurrence(of:  "\(number)(", with: "\(number)*(")
            }
        }
        tempCatch = String(of)
    }
    return expression
}
func calculation(operators: String, firstOperand: Double, secondOperand: Double) -> Double {
    switch operators {
        case "+" :
            return firstOperand + secondOperand
        case "-" :
            return firstOperand - secondOperand
        case "*" :
            return firstOperand * secondOperand
        case "/" :
            return firstOperand / secondOperand
        default : 
            return 0                
    }
}

func postfixEvaluation (postfixs: [String]) -> Double {
    let symbolDic = ["+": 0, "-": 0, "*": 1, "/": 1]
    var stack = [Double]()
    for expression in postfixs {
        if symbolDic[expression] != nil {
            if stack.count == 1 {
                let answer = calculation(operators: expression , firstOperand: symbolDic[expression] as! Double, secondOperand: stack[stack.count - 1]) 
               stack.removeLast()
               stack.insert(answer, at: stack.endIndex)
             } else {
                let answer = calculation(operators: expression , firstOperand: stack[stack.count - 2], secondOperand: stack[stack.count - 1])
               stack.removeLast()
               stack.removeLast()
               stack.insert(answer, at: stack.endIndex)
             }
       } else {
           stack.append(Double(expression) as! Double)
       }
   }
    return stack[0]
}
func infixToPostfix (expressionArray: [String]) -> [String] {
    let symbolDic = ["+": 1, "-": 1, "*": 2, "/": 2]
    var stack = [String]()
    var operators = [String]()
    var stackIndex = 0
    var stackAdded = 0
    var higherOrderWight = 0
    var lastWieght = -1
    var openBracketIndex = [Int]()
    for each in expressionArray {
        if each == "(" {
           openBracketIndex.append(stackIndex + 1)
            stack.append(each)
            stackIndex += 1
            lastWieght = -1
        } else if each == ")" {
            if stack[stack.count - 1 ] != "(" {
                let tempOpenBracketIndex = openBracketIndex[openBracketIndex.count - 1]
                var tempArray = stack[tempOpenBracketIndex...stackIndex - 1]
                var tempSquareArray : [String] = Array(tempArray.reversed())
                for removingIndex in (tempOpenBracketIndex - 1)...(stackIndex - 1){
                    var a = stack.remove(at: tempOpenBracketIndex - 1)
                    stackIndex -= 1
               }
               operators = operators + tempSquareArray
               openBracketIndex.removeLast()
            } else {
                stack.removeLast()
                stackIndex -= 1
                openBracketIndex.removeLast()
            }
        } 
        else if symbolDic[each] != nil {
            let currectWieght = symbolDic[each] as! Int
             if stack.count == 0 {
                 stack.append(each)
                 stackIndex += 1
                 lastWieght = symbolDic[each] as! Int
             } else  {
                 var doneMessage = 1
                while doneMessage == 1 {
                    if currectWieght != lastWieght , currectWieght > lastWieght  {
                        stack.append(each)
                        stackIndex += 1
                        lastWieght = symbolDic[each] as! Int
                        doneMessage = 0
                    } else {
                        if stack[stack.count - 1] == "(" {
                            stack.append(each)
                            stackIndex += 1
                            lastWieght = -1
                            doneMessage = 0
                        } else {
                            let transformers = stack.removeLast()
                            stackIndex -= 1
                            operators.append(transformers)
                            if stack.count != 0 {
                                if stack[stack.count - 1] != "(" {
                                    lastWieght = symbolDic[each] as! Int
                                } else {
                                    lastWieght = -1 
                                }
                            } else {
                                lastWieght = -1 
                            }
                        }
                    }
                }
            }
        } else {
            operators.append(each)
        }
    }
    return operators + stack
}
func floatProblem (expressionArray: [String]) -> [String] {
    var expressionArray = expressionArray
    for eachDot in 0..<(expressionArray.lazy.filter{$0 == "."}.count){
       let indexOfPoint = expressionArray.index(of: ".") ?? 1
        let floatValue = "\(expressionArray[indexOfPoint - 1]) \(expressionArray[indexOfPoint]) \(expressionArray[indexOfPoint + 1])"
        expressionArray[indexOfPoint - 1] = floatValue
        expressionArray.remove(at: indexOfPoint)
        expressionArray.remove(at: indexOfPoint)
    }
    return expressionArray
}
func decimalNumberSpliter (expression: String) -> ([Int],String) {
    var tempExpression = expression
    var numbers = [Int]()
    let decimalNumbers = expression.components(separatedBy: CharacterSet.decimalDigits.inverted)
    for each in decimalNumbers {
        if let number = Int(each) {
            numbers.append(number)
            tempExpression = tempExpression.replacingFirstOccurrence(of: "\(number)", with: "1")
        }
    }
    return (numbers,  tempExpression)
}
func expressionArrayMaker (numbers: [Int], tempExpression: String) -> [String] {
    var numbers = numbers
    let tempExpressionArray = Array(tempExpression)
    var expressionArray = [String]()
    for each in tempExpressionArray {
        if each == "1" {
            expressionArray.append("\(numbers[0])")
            numbers.remove(at:0)
        } else {
            expressionArray.append("\(each)")
        } 
    }
    return expressionArray
}
var expression = "(10+52)*((5-2(2))+9-33)"
expression = ofProblem (expression: expression)
let answer = decimalNumberSpliter(expression: expression)
var expressionArray = expressionArrayMaker( numbers: answer.0, tempExpression: answer.1)
expressionArray = floatProblem(expressionArray: expressionArray)
let postfixs = infixToPostfix(expressionArray: expressionArray)
print(postfixEvaluation (postfixs: postfixs))