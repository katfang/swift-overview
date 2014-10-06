// --- Type casting and unbinding
var dictWithAny: [String:Any] = [:]
dictWithAny["string"] = "Hello"
dictWithAny["double"] = 3.0

// value1: AnyObject?
var value1 = dictWithAny["string"]
value1 = dictWithAny["double"]
value1 = dictWithAny["int"]

// Works if you're sure it's there, and you're sure it's a String
// value2: String
var value2 = dictWithAny["string"] as String
//  value2 = dictWithAny["double"] as String  // errors
//  value2 = dictWithAny["int"] as String     // errors

// Works if you're not sure it's there, but are sure it will be a String if it is
// value3: String?
var value3 = dictWithAny["string"] as String?
//  value3 = dictWithAny["double"] as String? // errors
value3 = dictWithAny["int"] as String?

// Works if you're not sure it's there, but are sure it will be a String if it is.
// Different from above in that you don't have to further unbind it.
// value4: String!
var value4 = dictWithAny["string"] as String!
//  value4 = dictWithAny["double"] as String! // errors
value4 = dictWithAny["int"] as String!


// Works if you're not sure it's a String or if it's there.
// Basically, use this.
// c: String?
var value5 = dictWithAny["string"] as? String
value5 = dictWithAny["double"] as? String
value5 = dictWithAny["int"] as? String

// You could do this, but it's fundamentally silly
var value6 : String! = dictWithAny["string"] as? String
value6 = dictWithAny["double"] as? String
value6 = dictWithAny["int"] as? String

// Moral of the story? Use `as?`