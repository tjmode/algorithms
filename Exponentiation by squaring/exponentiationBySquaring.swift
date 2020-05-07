import Foundation
func x (n: Int, s: Int) -> Int { 
    if s == 1 {
        return n
    }
    if (s % 2 ) == 0 {
        return x(n: n * n,s: s / 2)
    }
    return n * x(n: n * n,s: s / 2)
}
print(x(n: 2,s: 2))