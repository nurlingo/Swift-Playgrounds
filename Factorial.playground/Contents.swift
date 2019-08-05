/**
 Factorial - two implementations:
 - with a for loop
 - recursive
 
 In mathematics, the factorial of a positive integer n, denoted by n!, is the product of all positive integers less than or equal to n, such that:
 
 n! = n * (n-1) * (n-2) * (n-3) * ... * 3 * 2 * 1
 
 For example: 5! = 5 * 4 * 3 * 2 * 1 = 120
 
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
