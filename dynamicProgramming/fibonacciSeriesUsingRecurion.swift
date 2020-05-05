// its simple fibonacci series using recurion
func fibonacci (n: Int) -> Int {
var result = 0
if n == 1 || n == 2 {
result = 1
} else {
result = fibonacci(n: n - 1) + fibonacci (n: n - 2)
}
return result
}
print(fibonacci (n: 5))
