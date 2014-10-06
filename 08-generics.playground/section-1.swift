// --- Generics
var a = 1
var b = 2
func swapTwoVariables<T>(inout a:T, inout b:T) {
    let temp = a
    a = b
    b = temp
}
println("a \(a) and b \(b)")
swapTwoVariables(&a, &b)
println("a \(a) and b \(b)")