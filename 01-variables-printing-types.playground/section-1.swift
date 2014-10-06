// --- Variables and constants
// * no more @ signs to make it NS
// * var for variable
// * type inference
// * let for constant / immutable
var languageTyped: String = "Swift"
var languageVar = "Swift"
let language = "Swift"
let π = 3.14159
var snowmanCorporation = "☃☃☃"
// let ☃ = "snowman" // This supposedly works, but doesn't actually :(


// --- Printing
// * Evaluates things in \(..)
println("Hello snowman")
print("Hello \(snowmanCorporation), ")
println("Did you know 3 + 5 is \(3 + 5)")
println(π)


// --- Tuples
// * Can have same or mixed types in tuple
let tupA = (3, 4)
let tupB = ("Apples", 4)
tupA.0
tupB.1

// --- Strings
var longString = "This is supposed to be a really long string, but it probably isn't all that long."

// -- Get length ??? iterates over the entire string
countElements(longString)

// -- Get character at given index
// longString[3] // Errors, cannot subscript String with Int
let longStringIndex = advance(longString.startIndex, 3)
let character = longString[longStringIndex] // type Character
String(character)

// Turn into Array<Character>
let longStringArray = Array(longString)
String(longStringArray[3])

// -- Strings copy on assignment
var string1 = "Hello"
var string2 = string1
string1 += " World"
string2 // Still just "Hello"