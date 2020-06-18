/*
Create a simple calculator and calculate the values based on the order of precedence
Input will be string (e.g., "(2*39)(65.3*58.3)+2"
output: 296947.22
*/

import Foundation
let expression = "(1+28+1)1"
let symbolDic = ["+": 0.0, "-": 0.0, "*": 1.0, "/": 1.0]
var roundOfSize = [Int]()

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
            if let number = Int(perviousOfEach) {
                expression = expression.replacingFirstOccurrence(of:  "\(number)(", with: "\(number)*(")
            }
        }
        perviousOfEach = String(each)
    }
    var index = -1
    var tempArray = Array(expression)
    for each in tempArray {
        index += 1
        if each == ")" {
            if tempArray.count - 1 != index {
                if symbolDic["\(tempArray[index + 1])"] == nil || tempArray[index + 1] == "(" {
                    expression = expression.replacingFirstOccurrence(of:  ")", with: ")*")
                }
            } 
        }
    }
    return expression
}

func calculationFor(operators: String, firstOperand: Float, secondOperand: Float) -> Float {
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

func evaluatingPostFixIntoValue (from postfixsArray: [String]) -> Float {
    var stack = [Float]()
    for eachExpression in postfixsArray {
        if symbolDic[eachExpression] != nil {
            if stack.count == 1 {
                let answer = calculationFor(operators: eachExpression , firstOperand: symbolDic[eachExpression] as! Float, secondOperand: stack[stack.count - 1]) 
               stack.removeLast()
               stack.insert(answer, at: stack.endIndex)
            }else if stack.count == 0 {
                stack.append(0)
             } else {
                let answer = calculationFor(operators: eachExpression , firstOperand: stack[stack.count - 2], secondOperand: stack[stack.count - 1])
               stack.removeLast()
               stack.removeLast()
               stack.insert(answer, at: stack.endIndex)
             }
       } else {
         stack.append(Float(eachExpression) as! Float)
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

func floatPointblend (in expressionArray: [String]) -> [String] {
    var expressionArray = expressionArray
    for eachDot in 0..<(expressionArray.lazy.filter{$0 == "."}.count) {
        let indexOfPoint = expressionArray.index(of: ".") ?? 1
        if indexOfPoint == 0 {
            expressionArray[0] = "0.\(expressionArray[indexOfPoint + 1])"
        } else if symbolDic[expressionArray[indexOfPoint - 1]] != nil || expressionArray[indexOfPoint - 1] == ")" {
            expressionArray[indexOfPoint] = "0.\(expressionArray[indexOfPoint + 1])"
            roundOfSize.append(Array(expressionArray[indexOfPoint + 1]).count)
            expressionArray.remove(at: indexOfPoint + 1)
        } else {
            var floatValue = "\(expressionArray[indexOfPoint - 1]) \(expressionArray[indexOfPoint]) \(expressionArray[indexOfPoint + 1])"
            floatValue = floatValue.replacingOccurrences(of:  " ", with: "")
            roundOfSize.append(Array(expressionArray[indexOfPoint + 1]).count)
            expressionArray[indexOfPoint - 1] = floatValue
            expressionArray.remove(at: indexOfPoint)
            expressionArray.remove(at: indexOfPoint)
        }
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
            numbersAsStringArray.append(String(each))
            tempExpression = tempExpression.replacingFirstOccurrence(of: "\(each)", with: "1")
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

func positiveNegativeblend (in expressionArray: [String]) -> [String] {
    var expressionArray = expressionArray
    var index = -1
    for each in 0..<expressionArray.count - 1 {
        index += 1
        if expressionArray[index] == "-" || expressionArray[index] == "+" {
            if index == 0 {
                if expressionArray[index + 1] == "(" {
                    expressionArray[index] = "\(expressionArray[index])1"
                    expressionArray.insert("*", at: index + 1)
                } else if symbolDic[expressionArray[index + 1]] == nil {
                    expressionArray[0] = "\(expressionArray[index])\(expressionArray[index + 1])"
                    expressionArray.remove(at: index + 1)
                }
            } else if(expressionArray.count - 1) > index {
                if expressionArray[index + 1] == "(", symbolDic[expressionArray[index - 1]] != nil {
                    expressionArray[index] = "\(expressionArray[index])\(1)"
                    expressionArray.insert("*", at: index + 1)
                } else if symbolDic[expressionArray[index - 1]] != nil, symbolDic[expressionArray[index + 1]] == nil {
                    let symbols = expressionArray.remove(at: index)
                    expressionArray[index] = "\(symbols)\(expressionArray[index])"
                    index -= 1
                } else if expressionArray[index - 1] == "(", symbolDic[expressionArray[index + 1]] == nil{
                   let symbols = expressionArray.remove(at: index)
                   expressionArray[index] = "\(symbols)\(expressionArray[index])"
                   index -= 1
                }
            }
        }
    }
    return expressionArray
}

func roundOf(value: Float) -> Float {
    if roundOfSize.count != 0 {
        let temp = roundOfSize.max() as! Int ?? 0
        var size = 1.0
        for i in 0...temp{
            size = size * 10.0
        }
        return round((Float(size) * Float(value))) / Float(size)
    } else {
        return value
    }
}
func validation(for expressionArray: [String]) -> Int {
    var bool = 0
    var stack = [String]()
    for each in expressionArray {
        if let number = Float(each) {
            stack.append(each)
        } else if each == "(" {
            stack.append(each)
        } else {
            if stack.count == 0 {
                bool = -1
            } else {
                stack.removeLast()
            }
        }
    }
    if stack.count == 0 {
        bool = -1
    }
    return bool
}
func calculate (the expression: String) -> Float {
   if expression != "" {
        let expression = addingMultiplicationSymbolInBetweenBracket (in: expression)
        let numbersAsStringArrayAndTemExpression = splitingNumbersAsStringArrayAndTempExpression(from: expression)
        var expressionArray = creatingExpressionArrayFrom( numbersAsStringArray: numbersAsStringArrayAndTemExpression.0, tempExpression: numbersAsStringArrayAndTemExpression.1)
        expressionArray = positiveNegativeblend(in: expressionArray)
        expressionArray = floatPointblend(in : expressionArray)
        let validateAnswer = validation(for: expressionArray)
        if validateAnswer == -1 {
            print("invalid")
            return -1
        } else {
            let postfixsArray = creatingPostFixArray(from: expressionArray)
            evaluatingPostFixIntoValue (from: postfixsArray)
            return roundOf(value: evaluatingPostFixIntoValue (from: postfixsArray))
        }
   }
   return 0
}
print(calculate(the: expression))
