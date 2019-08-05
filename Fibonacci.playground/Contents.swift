/**
 Created by Nursultan Askarbekuly
 
 In mathematics, the Fibonacci numbers, commonly denoted "F_n" form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is
 
            F_0 = 0, F_1 = 1,
                and
                    F_n = F_(n-1) + F_(n-2), for n > 1.
 
 Traditionally, zero is omitted from the sequence, and the Fibonacci sequence starts with F_1 = F_2 = 1. However, since we are programmers. To facilitate for that, we will have a flag parameter to indicate whether to include zero or not. Thus, the beginning of the sequence will look like this:
 
            (0), 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...
 
 Fun fact: name Fibonacci comes from latin "filius Bonacci", which means "son of Bonacci". The short form is used to refer to Leonardo Bonacci, Italian mathematician, who popularized the Hindu–Arabic numeral system in the Middle Ages Europe.
 */


func fibonacciSequence(of length: Int, includeZero: Bool = false) -> [Int] {
    
    // establish the sequence's beginning
    var sequence = includeZero ? [0,1] : [1,1]
    
    // if the required length is below 3, then we have what is needed
    guard length >= 3 else {
        return Array(sequence.prefix(length))
    }
    
    // start from 3, since we have the first two already
    for _ in 3...length {

        // take the two rightmost elements in array
        let lastIndex = sequence.count - 1
        let last = sequence[lastIndex]
        let prelast = sequence[lastIndex-1]
        
        // append their sum
        sequence.append(last + prelast)
    }
    
    return sequence
    
}


// an alternative implementation using recursion instead of a for loop

func fibonacciAlternative(of length: Int, includeZero: Bool = false) -> [Int] {
    
    let sequence = includeZero ? [0,1] : [1,1]
    
    // if the required length is below 3, then we have what is needed
    guard length >= 3 else {
        return Array(sequence.prefix(length))
    }
    
    return sequence + fibonacciRecursive(iterationsLeft: length-3, prelast: sequence[0], last: sequence[1])
    
}

func fibonacciRecursive(iterationsLeft: Int, prelast: Int, last: Int) -> [Int] {
    // helper recursive method to replace a for loop
    
    let newLast = prelast + last
    
    if iterationsLeft == 0 {
        return [newLast]
    }
    
    return [prelast+last] + fibonacciRecursive(iterationsLeft: iterationsLeft-1, prelast: last, last: newLast)
    
}

// Test cases

fibonacciSequence(of: 0)
fibonacciAlternative(of: 0)

fibonacciSequence(of: 0, includeZero: true)
fibonacciAlternative(of: 0, includeZero: true)

fibonacciSequence(of: 1)
fibonacciAlternative(of: 1)

fibonacciSequence(of: 1, includeZero: true)
fibonacciAlternative(of: 1, includeZero: true)

fibonacciSequence(of: 2)
fibonacciAlternative(of: 2)

fibonacciSequence(of: 2, includeZero: true)
fibonacciAlternative(of: 2, includeZero: true)

fibonacciSequence(of: 3)
fibonacciAlternative(of: 3)

fibonacciSequence(of: 3, includeZero: true)
fibonacciAlternative(of: 3, includeZero: true)

fibonacciSequence(of: 4)
fibonacciAlternative(of: 4)

fibonacciSequence(of: 4, includeZero: true)
fibonacciAlternative(of: 4, includeZero: true)

fibonacciSequence(of: 5)
fibonacciAlternative(of: 5)

fibonacciSequence(of: 5, includeZero: true)
fibonacciAlternative(of: 5, includeZero: true)

fibonacciSequence(of: 9)
fibonacciAlternative(of: 9)

fibonacciSequence(of: 9, includeZero: true)
fibonacciAlternative(of: 9, includeZero: true)
