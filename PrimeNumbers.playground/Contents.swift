// ALGORITHM 1
// Check if a number P is prime

func isPrime(_ p: Int) -> Bool {
    
    guard p > 2 else { return true }
    var isPrime = true
    
    // sufficient to check all numbers up to the square root of P
    let sqrt = Int(Double(p).squareRoot())+1
    
    for i in 2...sqrt {
        
        if p%i==0 {
            // non-prime if divisible by any number > 1
            isPrime=false
            break
        }
        
    }

    return isPrime
}

// Test
let nonPrimeNumber = 993
isPrime(nonPrimeNumber)

let largePrimeNumber = 111_191_111
isPrime(largePrimeNumber)


// ALGORITHM 2.1
// Count prime numbers in a range from to A...B using the isPrime algorithm.

func countPrimeNumberInRange(from a:Int, to b:Int) -> Int {
    
    guard a <= b else {return 0}
    let range = a...b
    var primeCount = 0

    for p in range {
        if isPrime(p) {
            primeCount += 1
        }
    }
    
    return primeCount
}

// TEST
countPrimeNumberInRange(from: 2, to: 200)


// ALGORITHM 2.2
// Count prime numbers in a range 0...b using the Sieve of Eratosthenes

func sieveOfEratosthenes(to upperBound: Int) -> Int {
    
    guard upperBound > 1 else {return 0}
    var primeCount = 0
    
    // create a boolean array with indexes corresponding to integers from 0 to upperbound
    // mark all of them as prime (except 0 and 1)
    var indexedBooleans = [false,false] + Array(repeating: true, count: upperBound-1)

    for p in 2...upperBound {
        if indexedBooleans[p] {
            
            primeCount += 1
            
            var j = 2*p
            while j<=upperBound {
                // all multiples of a prime number are marked as non-prime
                indexedBooleans[j] = false
                j += p
            }

        }
    }
    
    return primeCount
}

sieveOfEratosthenes(to: 200)
