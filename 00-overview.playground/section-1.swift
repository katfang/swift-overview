// --- General Overview
/*
* Made by Apple
* General design: must be as fast as ObjC, ahead-of-time compilation, interoperate with ObjC
* Modern features
* Checks for nil
* Multiple return values
* Methods are waaay less awkward than ObjC
* Generics (in protocols are still a work in progress)
* No private variables or methods // WRONG AS OF BETA 4 https://developer.apple.com/swift/blog/?id=5
* Interoperability is there, but awkward (If it doesn't work, try tagging it with @objc)
* Reference counts (has weak / strong / unowned)
*/

// Playground - noun: a place where people can play

// --- Why not ObjC?
/*

@interface XYZTodoListTableViewController ()

@property NSMutableArray *todoItems;

@end

@implementation XYZTodoListTableViewController

- (void)loadInitialData {
XYZTodoItem *item1 = [[XYZTodoItem alloc] init];
item1.itemName = @"Buy milk";
[self.todoItems addObject:item1];
}

*/

/*
Things to add
Public / Internal / Private

Nil coalescing ??
Chaining optionals
Weak, unowned
Lazy properties
closure capture - unowned self -- capture list (Intermediate)
pass struct by reference
is String
Generic class implement two protocols with same typealias name thing clashes?

Intermediate has:
initializers / convenience

Advanced has:
subscripts
*/