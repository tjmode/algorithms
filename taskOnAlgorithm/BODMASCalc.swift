import Foundation

var expression = "(10+1+1+1-1/10)"
var expressionArray = Array(expression)

func add(number1: Int, number2: Int) -> Int {
    return number1 + number2
}

func multiplication(number1: Int, number2: Int) -> Int {
    return number1 * number2
}

func subtract(number1: Int, number2: Int) -> Int {
    return number1 - number2
}

func division(number1: Int, number2: Int) -> Int {
    return number1 / number2
}
func odmasChecker(expression: String) -> String {
    var expression = expression
    var answer = 0
    let numberArray = expression.components(separatedBy: CharacterSet.decimalDigits.inverted)
    var number1 = [Int]()
    var priorityChecker = 1
    var symbolIndex = 0
    var reArrangedExpression = ""
    for item in numberArray {
        if let number = Int(item) {
            number1.append(number)
            expression = expression.replacingOccurrences(of: "\(number)", with: "")
        }
    }
    var temporaryExpressionArray = Array(expression)
   if priorityChecker == 1 {
        if temporaryExpressionArray.contains("/") {
            symbolIndex = (temporaryExpressionArray.index(of: "/") ?? 0)
            answer = division(number1: number1[symbolIndex], number2: number1[symbolIndex + 1] as! Int)
            priorityChecker = 0
        }
   }

    if priorityChecker == 1 {
        if temporaryExpressionArray.contains("*") {
            symbolIndex = (temporaryExpressionArray.index(of: "*") ?? 0)
            answer = multiplication(number1: number1[symbolIndex], number2: number1[symbolIndex + 1] as! Int)
            priorityChecker = 0
        }
    }

    if priorityChecker == 1 {
        if temporaryExpressionArray.contains("+") {
            symbolIndex = (temporaryExpressionArray.index(of: "+") ?? 0)
            answer = add(number1: number1[symbolIndex], number2: number1[symbolIndex + 1] as! Int)
            priorityChecker = 0
        }
    }
    if priorityChecker == 1 {
        if temporaryExpressionArray.contains("-") {
            symbolIndex = (temporaryExpressionArray.index(of: "-") ?? 0)
            answer = subtract(number1: number1[symbolIndex], number2: number1[symbolIndex + 1] as! Int)
            priorityChecker = 0
        }
    }
    //if priorityChecker == 0 { 
        temporaryExpressionArray.remove(at: symbolIndex)
        number1.remove(at: symbolIndex + 1)
        number1[symbolIndex] = answer
        var suma = [String]()
        if temporaryExpressionArray.count == 0 {
            reArrangedExpression = "\(answer)"
            return reArrangedExpression
        } else {
            for i in 0..<temporaryExpressionArray.count {
                suma.append("\(number1[i])")
                suma.append(String(temporaryExpressionArray[i]))
            }
            suma.append("\(number1[number1.count - 1])")
            for eachCharacter in suma {
                reArrangedExpression += "\(eachCharacter)"
            }
             return odmasChecker(expression: reArrangedExpression )
        }
   // }
}
for i in 0..<1 {
    var openedBracketIndex = -1
    var closedBracketIndex = -1
    for j in 0..<expressionArray.count {
        if expressionArray[j] == "(" {
            openedBracketIndex = j
        } 
        if expressionArray[j] == ")" {
            closedBracketIndex = j
            let expressionToCalculate = String(expressionArray[(openedBracketIndex + 1)..<(closedBracketIndex)])
           print(odmasChecker(expression: expressionToCalculate))
        }
    }
}
