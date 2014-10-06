// -- Generics in Protocols and Classes
/*
// Cannot do:
protocol Container<ItemType> {
func push(item: ItemType)
func pop() -> ItemType
}

class Stack<T> : Container<T> { ... }

class Stack<T> {
var store = T[]();

func push(item:T) { store.append(item) }
func pop() -> T { return store.removeLast() }
}

*/
protocol Container {
    typealias ItemType
    func push(item:ItemType)
    func pop() -> ItemType
}

class Stack<T> : Container {
    typealias ItemType = T
    var store = [T]();
    
    func push(item:T) { store.append(item) }
    func pop() -> T { return store.removeLast() }
}

var stack = Stack<Int>()
stack.push(3)
stack.pop()
stack.push(4)

// var container: Container = stack // Error Protocol 'Container' can only be used as a generic constraitn because it has Self or associated type requirements

// You still lose associated type information, but you can use funcs which don't have generics on input
func popContainer<T:Container>(container: T) {
    // container.push(30) // ERROR T.ItemType does not conform to protocol IntegerLiteralConvertible
    println(container.pop())
}

popContainer(stack)

/* // This errors because Container does not have pop / push.
class ContainerWrapper<T> : Container {
typealias ItemType = T
var c: Container

init<C: Container where C.ItemType == T>(var c: C) {
self.c = c
}

func pop() -> T {
return c.pop()
}

func push(item:T) {
return c.push(item)
}
}

c.pop()
self.c.pop()
*/

class ContainerWrapper<T> : Container {
    typealias ItemType = T
    let _pop: () -> T
    let _push: (T) -> ()
    
    init<C: Container where C.ItemType == T>(var c: C) {
        _pop = { c.pop() }
        _push = { c.push($0) }
    }
    
    func pop() -> T {
        return _pop()
    }
    
    func push(item:T) {
        return _push(item)
    }
}

// Good discussions:
// http://schani.wordpress.com/2014/06/03/playing-with-swift/
// https://devforums.apple.com/thread/230611?tstart=0
