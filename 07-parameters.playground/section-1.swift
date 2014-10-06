// --- Parameters

// For `func`s, default is no external parameter name
func addTwo(a: Int, b: Int) -> Int {
    return a + b
}
addTwo(3, 4)

// external names
func addTwoWithNames(first a: Int, second b: Int) -> Int {
    return a + b
}
addTwoWithNames(first:3, second:4)

// external name shorthand
func addTwoWithSameName(#first: Int, #second: Int) -> Int {
    return first + second
}
addTwoWithSameName(first:3, second:4)

// named output tuples
func getStatusWithNames() -> (code:Int, message:String) {
    return (200, "Success")
}
let status2 = getStatusWithNames()
println("Code: \(status2.code) Message: \(status2.message)")

// -- Parameter naming in classes / structs
// * init: initializers' parameters all use internal name as external names
// * addTwo(a,b): for class methods, first param has no external name, others use internal name as external name
// * addTwoMore: can have differing external and internal names, remove external names with _
class AdditionClass {
    init(a:Int, b:Int) { }
    
    func addTwo(a: Int, b: Int) -> Int {
        return a+b
    }
    
    func addTwoMore(first a: Int, _ b: Int) -> Int {
        return a+b
    }
}
let addition = AdditionClass(a:1, b:2)
addition.addTwo(1, b:2)
addition.addTwoMore(first:1, 2)

// -- Variadic parameters
func mean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
mean(1,2,3,4)


// -- constant and variable parameters
// * parameters passed in as constant unless you use 'var', which will give you a /copy/ of that value
/*
func addDashesInFront(s: String, count: Int) -> String {
for _ in 1...count {
s = "-" + s
}
return s
}
*/
func addDashesInFront(var s: String, count: Int) -> String {
    for _ in 1...count {
        s = "-" + s
    }
    return s
}
var stringArg = "Hello"
addDashesInFront(stringArg, 5)
stringArg


// -- Pass by Reference
// * Done automatically for classes, NOT structs or basic types
var h = 0
func addOne(a: Int) -> Int {
    return a + 1
}
addOne(h)
h

func addOneDirectly(inout a: Int) {
    a += 1
}
addOneDirectly(&h)
h
