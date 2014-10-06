import UIKit // for pow

// --- Protocols and Extensions
// struct definitions from 06-structs-classes
struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}
let s = Size(width: 2, height: 2)

struct Rect {
    var origin = Point()
    var size = Size()
    
    // -- computed properties
    var upperLeft: Point {
        get {
            let x = origin.x - (size.width/2)
            let y = origin.y + (size.height/2)
            return Point(x: x, y: y)
        }
        set (newLeft) {
            origin.x = newLeft.x + size.width/2
            origin.y = newLeft.y - size.height/2
        }
    }
    
    // -- struct func
    func description() -> String {
        return "Rectangle with origin \(origin) and size \(size)"
    }
    
    // -- mutating func
    mutating func moveRight() {
        origin.x += 1
    }
    
    // -- static func
    static func unitSquareAtOrigin(origin:Point) -> Rect {
        return Rect(origin: origin,
            size:Size(width:1, height:1))
    }
}

// -- Protocol
// * protocols can be added to structs and classes
// * can define property (must say get and/or set)
// * can define function

protocol HasColor {
    var color: (Float, Float, Float, Float) { get set }
}

protocol RoundChecker {
    func isRound() -> Bool
}

protocol HasArea {
    var area: Double { get }
}

// Classes can adopt protocols
class Circle: HasColor, RoundChecker {
    var radius: Double = 1
    var color: (Float, Float, Float, Float)
    
    init(color: (Float, Float, Float, Float)) {
        self.color = color
    }
    
    func isRound() -> Bool {
        return true
    }
}

// Storing something that adopts a protocol
var circle1: HasColor = Circle(color: (1, 1, 1, 1))
circle1.color
// circle1() // Errors, isRound() isn't part of HasColor protocol
(circle1 as Circle).isRound()

// Storing object that adopts multiple protocols
var circle2: protocol<HasColor, RoundChecker> = Circle(color: (1, 1, 1, 1))
circle2.color
circle2.isRound()

// -- Extensions
// * Allow you to add methods and computed properties to classes, structs
// * Cannot add new stored properties

// add new protocol to class
extension Circle: HasArea {
    var area: Double {
        return 3.14159 * pow(radius, 2)
    }
}

// add new protocol
extension Rect : HasArea {
    var area: Double { return size.width * size.height }
}

// add new function
extension Rect {
    mutating func moveLeft() {
        origin.x -= 1
    }
}
var r = Rect.unitSquareAtOrigin(Point(x: 0,y: 0))
r.area

// add initializer
extension Point {
    init(_ x: Double, _ y: Double) {
        self.x = x
        self.y = y
    }
}
var q = Point(0,0)