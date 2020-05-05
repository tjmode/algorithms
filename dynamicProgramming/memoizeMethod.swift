var memo = [Int: Int]() 
//in swift, if declared the dictionary outside the func only I //getting in the correct
func fib (_ num: Int) -> Int {
if let cached = memo[num] {
return cached
}
let result: Int
if (num <= 2) {
result = 1
}
else {
result = fib(num - 1) + fib(num - 2)
}
memo[num] = result
return result
}
print(fib(5))

 /* func fibonacci (n: Int, memo: [Int]) -> Int {
var result = Int()
if memo[n] != null{
result = memo[n]
}
if n == 1 || n == 2 {
result = 1
} else {
result = fibonacci(n: n - 1) + fibonacci(n: n - 2)
}
memo[n] = result
return result
} * /
