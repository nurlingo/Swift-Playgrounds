/**
 Following are two alternative implementations:
   1) First implementation uses Swift's Array
   2) Second implementation does NOT use Swift's Array (more interesting)
*/


// First implementation that uses Swift's Array

public struct SimpleStack<T> {
    
    private var array = [T]()

    init(array: [T]) {
        self.array = array
    }
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public func peek() -> T? {
        return array.last
    }
    
}

var intStack = SimpleStack(array: [1,2])

intStack.isEmpty
intStack.push(3)
intStack.peek()
intStack.count

intStack.pop()
intStack.pop()
intStack.pop()
intStack.isEmpty


// Second implementation that does NOT use Swift's Array

class Node<T> {
    let value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}

class Stack<T> {
    var top: Node<T>?
    
    func push(_ element: T) {
        let oldTop = top
        top = Node(value: element)
        top?.next = oldTop
    }
    
    func pop() -> T? {
        let currentTop = top
        top = top?.next
        return currentTop?.value
    }
    
    func peek() -> T? {
        return top?.value
    }
    
    var count: Int {
        
        var count = 0
        var currentTop = top
        
        while currentTop != nil {
            count += 1
            currentTop = currentTop?.next
        }
        
        return count
    }
    
    var recursiveCount: Int {
        return countRecursively(passedTop: top)
    }
    
    func countRecursively(passedCount: Int = 0, passedTop: Node<T>?) -> Int {
        
        if passedTop == nil {
            return passedCount
        } else {
            return countRecursively(passedCount: passedCount + 1, passedTop: passedTop?.next)
        }
        
    }
}


struct User {
    let name: String
    let username: String
}

let me = User(name: "Nur", username: "@nurios")
let muhsin = User(name: "Muhsin", username: "@muhsin")

let userStack = Stack<User>()
userStack.push(me)
userStack.push(muhsin)

userStack.pop()?.username


let stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.count
stack.recursiveCount
stack.peek()
let firstPop = stack.pop()

stack.peek()
let secondPop = stack.pop()
let thirdPop = stack.pop()
let finalPop = stack.pop()
stack.count
stack.recursiveCount
