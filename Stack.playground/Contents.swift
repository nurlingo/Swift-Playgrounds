import UIKit

class Node<T> {
    let value: T
    var next: Node?
    init(value: T) {
        self.value = value
    }
}

class Stack<T> {
    var top: Node<T>?
    
    func push(_ value: T) {
        let oldTop = top
        top = Node(value: value)
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
}

struct User {
    let name: String
    let username: String
}

let me = User(name: "Nur", username: "nurios")
let muhsin = User(name: "Muhsin", username: "@muhsin")

let userStack = Stack<User>()
userStack.push(me)
userStack.push(muhsin)

userStack.pop()?.username


let stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)

stack.peek()
let firstPop = stack.pop()

stack.peek()
let secondPop = stack.pop()
let thirdPop = stack.pop()
let finalPop = stack.pop()
