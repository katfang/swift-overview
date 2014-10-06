// --- Optionals
// * ? deontes optional - may be that type or may be nil.
// * dict[key] returns an optional since key might not be there
var airports = ["SFO": "San Francisco", "BOS": "Logan", "BER": "Berlin"]
var airport1 = airports["SFO"]
airport1 = airports["LAX"]

var airport2: String? = airports["SFO"]
var airport3: String? = airports["TPE"]

// -- Checking and unwrapping optionals
// * Unwrap with !
if airport2 != nil {
    let name = airport2!
    print("SFO stands for \(name), ")
    println("which is the same as \(airport2!)")
}

// println(airport3!) // Errors! with a fatal error because it's nil

// * if-let to check and unwrap at the same time
if let name = airports["BOS"] {
    println("BOS stands for \(name).")
}

// -- Implicitly unwrapped optionals
// * useful if known it will be defined before being used, but isn't initialized till later, such as in viewDidLoad()
var airport4: String! = airports["BER"]
println("BER stands for \(airport3)")