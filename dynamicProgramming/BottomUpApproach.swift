func bottomUp(n: Int) -> Void {
var result = 0
var bottomUp = [1: 1, 2: 1]
for i in 3..<n + 1 {
bottomUp[i] = ( bottomUp [i - 1] ?? 0) + ( bottomUp [i - 2] ?? 0 )
print(bottomUp)
}
result =  bottomUp[n] ?? 0
print(bottomUp[5])
}
bottomUp(n: 5)

/*
func bottomUp(n: Int) -> Void {
var result = 0
var bottomUp = [0: 0, 1: 1, 2: 1] 
for i in 3..<n + 1 {
bottomUp[i] = ( bottomUp [i - 1]) + ( bottomUp [i - 2])
}
result =  bottomUp[n] 
print(bottomUp[5])
}
*/
