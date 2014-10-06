// --- Arrays and Dictionaries
// * typed
// * couple of ways of instantiating empty array
var emptyArray2 = [String]()
var emptyArray1: [String] = []
var emptyArray3 = Array<String>()
var supported = ["javascript"] // type Array<String> or [String]
supported += ["java", "objective-c"]
supported += ["swift"]
// supported += 3.0 // Errors because it's not a string

var emptyDictionary1 = [String: String]()
var emptyDictionary2 = Dictionary<String, String>()
var emptyDictionary3: [String:String] = [:]
var airports = ["SFO": "San Francisco", "BOS": "Logan"] // type [String:String]
airports["BER"] = "Berlin"

// -- Constant
let supportedImmutable = ["javascript"]
// supportedImmutable += ["swift"] // Errors because its immutable
// supportedImmutable[0] = "swift" // Errors because its immutable

let airportsImmutable = airports
// airportsImmutable["DUB"] = "Chicago" // errors


// -- Printing values in arrays and dictionaries
println("The first language supported is \(supported[0])")

// println("The SFO airport is named \(airport["SFO"])") // Errors because bad syntax

let sfo = airports["SFO"]
println("The SFO airport is named \(sfo!)") // Hey wait? What's that "!" doing? Find out in 04-optionals.