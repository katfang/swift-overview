// --- Functions
// Simple, no arguments, no return
func greet(Void) -> Void {
    println("Why hello!")
}

// Simpler with Voids dropped.
func simplerGreet() {
    println("Hello out there")
}
greet()

// With parameters and return type
func buildGreeting(name1:String, name2:String) -> String {
    return "Hello \(name1) and \(name2)"
}
buildGreeting("Fire", "Base")

// With default parameters
func buildGreeting2(name:String = "World") -> String {
    return "Hello " + name
}
buildGreeting2()

// Returning tuples
func getStatus() -> (Int, String) {
    return (200, "Success")
}
let status = getStatus()
println("Status: \(status)")
println("Status: \(status.0) \(status.1)")
let (code, message) = getStatus()
println("Code: \(code) Message: \(message)")

// Functions as types
var functionHolder: (String, String) -> String
functionHolder = buildGreeting
functionHolder("Base", "Fire")

// --- Closures
// no arguments, no return
let greetingPrinter = {
    () -> () in
    println("Hello world")
}
greetingPrinter()

// type inferred
let greetingPrinterWithoutTypes = {
    println("Hello world")
}

// with parameters and return type
let greetingReturner = {
    (name:String) -> String in
    return "Hello, my name is \(name)"
}
greetingReturner("Inigo Montoya")

// with parameters and inferred return type
let greetingReturnerInferred = {
    (name:String) in
    "Hello \(name)"
}
greetingReturnerInferred("Firebase")

// Another way
let greetingReturner2 : String -> String = {
    "Hello \($0)"
}
greetingReturner2("Universe")

// as parameters
func repeat(count: Int, task: () -> ()) {
    for i in 0..<count {
        task()
    }
}
repeat(2, {
    print("Hello! ")
})

// trailing closures
repeat(2) {
    print("Hello! ")
}
println()

// auto closure - compute expression passed in as closure
var debug = true
func ourAssert(predicate : @autoclosure () -> Bool) {
    if debug {
        if !predicate() {
            println("This is full of failure")
        }
    }
}
var someExpensiveComputation: Void -> Int = { 3 }
ourAssert(someExpensiveComputation() != 42)
// But actually use the built-in assert()