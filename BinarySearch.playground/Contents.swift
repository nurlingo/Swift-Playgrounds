// Binary search and related algorithms implemented in Swift

let array = Array(1...1000)

// MARK: - ALGRTHM 1 - Binary Search: return index for the element if found in the array or nil otherwise.

func binarySearch<T: Comparable>(_ array: [T], for searchObject: T) -> Int? {
    
    var startIndex = 0
    var endIndex = array.count - 1
    
    if searchObject < array[startIndex] || searchObject > array[endIndex] {
        return nil
    }
    
    while startIndex <= endIndex {
        
        let midIndex = (startIndex + endIndex) / 2
        let midValue = array[midIndex]
        
        if searchObject == midValue {
            return midIndex
        } else if searchObject < midValue {
            endIndex = midIndex - 1
        } else if searchObject > midValue {
            startIndex = midIndex + 1
        }
    }
    
    return nil
}

// BVA testing
binarySearch(array, for: 0)
binarySearch(array, for: 1)
binarySearch(array, for: 774)
binarySearch(array, for: 1000)
binarySearch(array, for: 1001)



// MARK: - ALGRTHM 2 - Babylonian square root: Find a rounded down (ceiled) square root of a nonnegative integer

func babylonianSquareRoot(of x: UInt) -> UInt {
    
    guard x != 0 else { return 0 }
    guard x > 3 else { return 1 }
    
//    print("\n\(x)")
    var m = x/2
    var nextM = (m + x/m)/2
    
    while m > nextM && m*m != x {
//        print(m, nextM)
        m = nextM
        nextM = (m + x/m)/2
    }
    
    return m
}

// Oracle function to check the implementation above
func ceiledSquareRoot(of x: UInt) -> UInt {
    UInt(Double(x).squareRoot())
}

// Basic test cases
babylonianSquareRoot(of: 0)
babylonianSquareRoot(of: 1)
babylonianSquareRoot(of: 2)
babylonianSquareRoot(of: 3)
babylonianSquareRoot(of: 4)
babylonianSquareRoot(of: 5)
babylonianSquareRoot(of: 7)
babylonianSquareRoot(of: 9)
babylonianSquareRoot(of: 71)
babylonianSquareRoot(of: 909)

// BVA
babylonianSquareRoot(of: 80)
ceiledSquareRoot(of: 80)
babylonianSquareRoot(of: 82)
ceiledSquareRoot(of: 82)

babylonianSquareRoot(of: 9091)
ceiledSquareRoot(of: 9091)

babylonianSquareRoot(of: 9999)
ceiledSquareRoot(of: 9999)
babylonianSquareRoot(of: 10001)
ceiledSquareRoot(of: 10001)


// MARK: - ALGRTHM 3 - Finding the bottom: An array has elements up to element J sorted in decreasing order, and  elements after J sorted in increasing order. Find the index of element J.

func binaryBottomSearch<T: Comparable>(array: [T]) -> Int {
    
    // handle special cases
    switch array.count {
    case 0:
        return -1
    case 1:
        return 0
    case 2:
        return array[0] > array[1] ? 1 : 0
    default:
        break
    }

    
    var l = 0
    var r = array.count-1
    
    while l<r {
        print(l,r)
        let m = (r+l)/2
        
        if array[m] > array[m+1] {
            l = m
        } else if array[m-1] < array[m] {
            r = m
        } else {
            return m
        }
    }
    
    return -1
    
}


// BVA
binaryBottomSearch(array: [Int]())
binaryBottomSearch(array: [1])
binaryBottomSearch(array: [2,1])
binaryBottomSearch(array: [1,2])
binaryBottomSearch(array: [2,1,3])

// Functional sanity testing
let valley = Array(0...300).reversed() + Array(1...1000)
binaryBottomSearch(array: valley)


// Invalid inputs for robustness testing

// goes into infinite loop
//binaryBottomSearch(array: Array(1...1000).reversed())

// throws "index out of range" error
//binaryBottomSearch(array: Array(1...1000))
