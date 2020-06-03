import Foundation
/*
Create a simple calculator and calculate the values based on the order of precedence
Input will be string (e.g., "(2*39)(65.3*58.3)+2"
output: 296947.22
*/
let expression = "(2*39)(65.3*58.3)+2"

extension String {
    func replacingFirstOccurrence(of target: String, with replacement: String) -> String {
        guard let range = self.range(of: target) else { return self }
        return self.replacingCharacters(in: range, with: replacement)
    }
}

func addingMultiplicationSymbolInBetweenBracket (in expression: String) -> String{
    var expression = expression.replacingOccurrences(of:  " ", with: "")
    expression = expression.replacingOccurrences(of:  ")(", with: ")*(")
    var perviousOfEach = ""
    for each in Array(expression) {
        if each == "(" {
            let number = Int(perviousOfEach) ?? 12421
            if number != 12421 {
                expression = expression.replacingFirstOccurrence(of:  "\(number)(", with: "\(number)*(")
            }
        }
        perviousOfEach = String(each)
    }
    return expression
}

func calculationFor(operators: String, firstOperand: Double, secondOperand: Double) -> Double {
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

func evaluatingPostFixIntoValue (from postfixsArray: [String]) -> Double {
    let symbolDic = ["+": 0.0, "-": 0.0, "*": 1.0, "/": 1.0]
    var stack = [Double]()
    for eachExpression in postfixsArray {
        if symbolDic[eachExpression] != nil {
            if stack.count == 1 {
                let answer = calculationFor(operators: eachExpression , firstOperand: symbolDic[eachExpression] as! Double, secondOperand: stack[stack.count - 1]) 
               stack.removeLast()
               stack.insert(answer, at: stack.endIndex)
             } else {
                let answer = calculationFor(operators: eachExpression , firstOperand: stack[stack.count - 2], secondOperand: stack[stack.count - 1])
               stack.removeLast()
               stack.removeLast()
               stack.insert(answer, at: stack.endIndex)
             }
       } else {
         stack.append(Double(eachExpression) as! Double)
       }
   }
    return stack[0]
}

func creatingPostFixArray (from expressionArray: [String]) -> [String] {
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
                var secondTempArray : [String] = Array(tempArray.reversed())
                for removingIndex in (tempOpenBracketIndex - 1)...(stackIndex - 1){
                    var a = stack.remove(at: tempOpenBracketIndex - 1)
                    stackIndex -= 1
               }
               operators = operators + secondTempArray
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
                 var flag = 1
                while flag == 1 {
                    if currectWieght != lastWieght , currectWieght > lastWieght  {
                        stack.append(each)
                        stackIndex += 1
                        lastWieght = symbolDic[each] as! Int
                        flag = 0
                    } else if  currectWieght == lastWieght || currectWieght < lastWieght {
                        if stack[stack.count - 1] == "(" {
                            stack.append(each)
                            stackIndex += 1
                            lastWieght = -1
                            flag = 0
                        } else {
                            let transfer = stack.removeLast()
                            operators.append(transfer)
                            stack.append(each)
                            lastWieght = symbolDic[each] as! Int
                            if stack.count != 0 {
                                if stack[stack.count - 1] != "(" {
                                    lastWieght = symbolDic[each] as! Int
                                } else {
                                    lastWieght = -1 
                                }
                            } else {
                                lastWieght = -1 
                            }
                            flag = 0
                        }
                    }
                }
            }
        } else {
            operators.append(each)
        }
    }
    stack = stack.reversed()
    return operators + stack
}

func floatPointMerging (in expressionArray: [String]) -> [String] {
    var expressionArray = expressionArray
    for eachDot in 0..<(expressionArray.lazy.filter{$0 == "."}.count){
       let indexOfPoint = expressionArray.index(of: ".") ?? 1
        var floatValue = "\(expressionArray[indexOfPoint - 1]) \(expressionArray[indexOfPoint]) \(expressionArray[indexOfPoint + 1])"
        floatValue = floatValue.replacingOccurrences(of:  " ", with: "")
        expressionArray[indexOfPoint - 1] = floatValue
        expressionArray.remove(at: indexOfPoint)
        expressionArray.remove(at: indexOfPoint)
    }
    return expressionArray
}

func splitingNumbersAsStringArrayAndTempExpression (from expression: String) -> ([String],String) {
    var tempExpression = expression
    var numbersAsStringArray = [String]()
    let decimalNumbers = expression.components(separatedBy: CharacterSet.decimalDigits.inverted)
    var indexOfDecimalNumbers = 0
    for each in decimalNumbers {
        if let number = Int(each) {
            numbersAsStringArray.append(String(number))
            tempExpression = tempExpression.replacingFirstOccurrence(of: "\(number)", with: "1")
            indexOfDecimalNumbers += 1
        }

    }
    return (numbersAsStringArray,  tempExpression)
}

func creatingExpressionArrayFrom (numbersAsStringArray: [String], tempExpression: String) -> [String] {
    var numbersAsStringArray = numbersAsStringArray
    let tempExpressionArray = Array(tempExpression)
    var expressionArray = [String]()
    for each in tempExpressionArray {
        if each == "1" {
            expressionArray.append("\(numbersAsStringArray[0])")
            numbersAsStringArray.remove(at:0)
        } else {
            expressionArray.append("\(each)")
        } 
    }
    return expressionArray
}

func calculate (the expression: String) -> Double {
    let expression = addingMultiplicationSymbolInBetweenBracket (in: expression)
    let numbersAsStringArrayAndTemExpression = splitingNumbersAsStringArrayAndTempExpression(from: expression)
    var expressionArray = creatingExpressionArrayFrom( numbersAsStringArray: numbersAsStringArrayAndTemExpression.0, tempExpression: numbersAsStringArrayAndTemExpression.1)
    expressionArray = floatPointMerging(in : expressionArray)
    let postfixsArray = creatingPostFixArray(from: expressionArray)
    return evaluatingPostFixIntoValue (from: postfixsArray)
}
print(calculate(the: expression))
























