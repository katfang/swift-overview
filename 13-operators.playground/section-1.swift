// --- Define operators
// Point struct previously defined
struct Point {
    var x = 0.0
    var y = 0.0
    init(_ x:Double, _ y:Double) {
        self.x = x
        self.y = y
    }
}

var p = Point(1, 0)
var q = Point(0, 1)

// Overload existing operator
func == (left: Point, right: Point) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
}
p == q

// Overload existing operator with postfix
postfix func ++(inout pt: Point) -> Point {
    let copy = pt
    pt.x += 1
    pt.y += 1
    return copy
}
q = p++
q
p

// Create new operator
// * define associativity and precedence
infix operator +- { associativity left precedence 140 }

func +- (left: Point, right: Point) -> Point {
    return Point(left.x + right.x, left.y - right.y)
}
p +- q