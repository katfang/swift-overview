// --- Structs
// * properties are default public and can have default value
struct Point {
    var x = 0.0
    var y = 0.0
}
var p = Point()
p = Point(x: 1, y: 1)

struct Size {
    var width = 0.0, height = 0.0
}
let s = Size(width: 2, height: 2)


// * upperLeft: is a computed property (has getters and setters)
// * description: is a function (functions also default public)
// * moveRight: is a mutating function, and needs the mutating keyword
// * unitSquareAtOrigin: is a static func, can only be called on Rect, not instances
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
var r = Rect()
r.origin = p
r.size = s
r.upperLeft
r.upperLeft = Point(x: 0, y: 0)
r.origin // origin has moved
Rect.unitSquareAtOrigin(Point(x:0, y: 0))
// r.unitSquareAtOrigin(Point(x:0, y: 0)) // Errors
r.moveRight()

// --- Classes
// * default public ???
// * vars must be initialized either when declaring property or in init()
// * [usually] don't need self (see ??? for the exception)
// * class func instead of static func
class Vehicle {
    var numberOfWheels = 0
    var gas: Double
    
    init() {
        gas = 10.0
    }
    
    func useGas() {
        gas--
    }
    
    // -- class func [not static]
    class func isTransportation() -> Bool {
        return true
    }
}
var vehicle = Vehicle()
vehicle.useGas()
vehicle.gas
Vehicle.isTransportation()
// vehicle.isTransportation() // errors

// -- Subclasses classes
// * use override
class Car: Vehicle {
    var speed = 0.0
    override func useGas() {
        gas -= 0.1
    }
}
vehicle = Car()
vehicle.useGas()
vehicle.gas
// vechicle.speed // Errors because it's not cast to Car
(vehicle as Car).speed // More on casting in ???

// -- property observers
// * if newSpeed / oldSpeed were not set, would default to newValue / oldvalue
// * can't actually change / prevent getting or setting, just observe
class Car2 : Car {
    override var speed: Double {
        willSet (newSpeed) {
            if newSpeed > 100.0 {
                println("So fast!")
            }
        }
        didSet (oldSpeed) {
            if speed > oldSpeed {
                println("Going faster")
            }
        }
    }
}
var car = Car2()
car.speed = 120

// --- More advanced switching
// * case let to check class type
// * order matters, executes first match only
vehicle = car
switch vehicle {
case let car2 as Car2:
    car2.speed = 3
case let car as Car:
    car.speed = 4
default:
    vehicle.useGas()
}

// --- Structs vs Classes
// Struct: 
// * value type
// * let makes properties immutable
// * assignment copies VALUE
// * compare instance data with ==

let rectConst = Rect()
// rConst.origin.x = 3 // errors
// rConst.moveRight() // errors

var rectVar = rectConst
rectVar.origin.x = 3
rectConst
rectVar // different from rectConst!

// Class: 
// * reference type
// * let makes reference immutable, properties can change!
// * assignment shares instance, compare instance identity with ===

let carConst = Car()
carConst.speed = 120
carConst.useGas()
// carConst = Car() // errors


var carVar = carConst
carVar.useGas()
carConst
carVar // same as carConst!


// Blog post on structs + classes
// https://developer.apple.com/swift/blog/?id=10
// Discussion about static vs class
// https://devforums.apple.com/thread/234483?tstart=0

