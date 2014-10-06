// --- Conditionals and Loops
// -- If
// * No parens necessary around if-expression
var randomNumber = 17
if randomNumber > 0 {
    println("is positive")
} else if randomNumber == 0 {
    println("is zero")
} else {
    println("is negative")
}

// -- Switch
// * breaks after each case, but can specify fallthrough
// * must be exhaustive
// * can bundle multiple cases together with 1, 2, 3
// * 4...9 produces a range of 4 through 9 inclusive
switch randomNumber {
case 0:
    println("That's not very random.")
case 1, 2, 3:
    println("The number is too small to use.")
case 4...9:
    println("The number is close to usable.")
case 10:
    println("The number is 10.")
    fallthrough
default:
    println("This is a good random number.")
}

// * switch on tuple
// * test value, range with 1.0, 0.5...1.0
// * assigns the value of color.2 to blue
// * use _ to ignore a value
let rgbaColor = (1.0, 1.0, 1.0, 1.0)
switch rgbaColor {
case (1.0, 0.5...1.0, let blue, _):
    println("Green and \(blue * 100)% blue")
default:
    println("Not interesting")
}


// -- For
// Loop over strings by character
var snowmanCorporation = "☃☃☃"
for c in snowmanCorporation {
    print("\(c) is a board member. ")
}
println()

// Loop over range of numbers inclusive
for number in 1...5 {
    print(number)
}
println()

// Loop over range of numbers, includes 6, but excludes 10
for number in 6..<10 {
    print(number)
}
println()

// Loop over values in array
var supported = ["javascript", "java", "objective-c", "swift"]
for language in supported {
    print("We support \(language). ")
}
println()

// Loop over key, value pairs in dictionary
var airports = ["SFO": "San Francisco", "BOS": "Logan", "BER": "Berlin"]
for (code, name) in airports {
    print("The name of \(code) is \(name). ")
}
println()

// * Use _ to ignore key OR value in dictionary
for (_, name) in airports {
    print("I have been to \(name). ")
}
println()
