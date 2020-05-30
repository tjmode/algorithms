import Foundation
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
            tempExpression = tempExpression.replacingOccurrences(of: "\(number)", with: "1")
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
var expression = "(11+1*(3.3+11))"
let answer = decimalNumberSpliter(expression: expression)

var expressionArray = expressionArrayMaker( numbers: answer.0, tempExpression: answer.1)
expressionArray = floatProblem(expressionArray: expressionArray)
