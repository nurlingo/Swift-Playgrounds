/**
 Two factorial implementations in Swift:
    1) Using FOR loop
    2) Using recursion
 */

func factorial(of value: UInt) -> UInt {
    
    if value == 0 {
        return 1
    }
    
    var product: UInt = 1
    
    for digit in 1...value {
        product = product*digit
    }
    
    return product
}

func recursiveFactorial(of value: UInt) -> UInt {
    
    if value == 0 {
        return 1
    }
    
    return value * recursiveFactorial(of: value - 1)
}

factorial(of: 0)
recursiveFactorial(of: 0)
factorial(of: 3)
recursiveFactorial(of: 4)
factorial(of: 5)
recursiveFactorial(of: 5)
