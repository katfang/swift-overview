// --- Enumerations
// * unlike Obj-C, not actually backed by int
enum CompassPoint {
    case North, South, East, West
}
let direction1 = CompassPoint.North
let direction2:CompassPoint = .South

// -- Associated Values
enum TrainStatus {
    case OnTime
    case Delayed(Int)
}
var status3:TrainStatus = .OnTime
status3 = .Delayed(10)

// -- Raw Values
enum Whitespace: Character {
    case Space = " "
    case Tab = "\t"
    case Newline = "\n"
}
Whitespace.Space.toRaw() == " "
Whitespace.fromRaw(" ") == Whitespace.Space