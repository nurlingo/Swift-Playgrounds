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


// MARK: - ALGRTHM 4.1 - Given a sorted array of integers, find the starting and ending position of a given target value.


// A simple implemenation that uses binary search and then runs a loop to find the boundaries.
// O(n) in worst case, but more efficient on average.

func findBoundariesSimple(for target: Int, in array: [Int]) -> (Int,Int) {
    
    var l = 0
    var r = array.count-1
    
    while l < r {
        
        let m = (l+r)/2
        
        if array[m] == target {
            
            for i in (l...m).reversed() {
                if array[i] != target {
                    l = i+1
                    break
                }
            }
            
            for i in (m...r) {
                if array[i] != target {
                    r = i-1
                    break
                }
            }
            
            return (l,r)
            
        } else if array[m] > target {
            r = m-1
        } else {
            l = m+1
        }
        
    }
    
    return (-1,-1)
}



// MARK: - ALGRTHM 4.2 - Given a sorted array of integers, find the starting and ending position of a given target value.

// A more efficient O(logn) implementation, using binary search through recursion

func boundaries(for target: Int, in array: [Int]) -> (Int,Int) {
    let n = array.count
    let first = firstOccurence(array: array, l: 0, r: n-1, target: target)
    let last = lastOccurence(array: array, l: 0, r: n-1, target: target)
    
    return(first, last)
}

func firstOccurence(array: [Int], l: Int, r: Int, target: Int) -> Int {
    
    if l <= r {
        
        let m = (l+r)/2
        
        if (m == 0 || target > array[m-1]) && array[m] == target {
            return m
        } else if target > array[m] {
            return firstOccurence(array: array, l: m+1, r: r, target: target)
        } else {
            return firstOccurence(array: array, l: l, r: m-1, target: target)
        }
        
    }
    
    return -1
    
}

func lastOccurence(array: [Int], l: Int, r: Int, target: Int) -> Int {
    
    let n = array.count
    
    if l <= r {
        
        let m = (l+r)/2
        
        if (m == n-1 || target < array[m+1]) && array[m] == target {
            return m
        } else if target < array[m] {
            return lastOccurence(array: array, l: l, r: m-1, target: target)
        } else {
            return lastOccurence(array: array, l: m+1, r: r, target: target)
        }
        
    }
    
    return -1
    
}

// Test

let sortedArray = [0,1,2,3,4,5,6,7,8,8,8,8,8,8,8,8,9,10,11,12]
findBoundariesSimple(for: 8, in: sortedArray)
boundaries(for: 8, in: sortedArray)



// MARK: - ALGRTH 5.1 Rotate an array to the left by N steps. Uses Swift's array slicing

let steps = 5
var a = [33, 47, 70, 37, 8, 53, 13, 93, 71, 72, 51, 100, 60, 87, 97]

// Returns a rotated array
func rotateSwift(array: [Int], leftRotations d: Int) -> [Int] {
    Array(array[d..<array.count] + a[0..<d])
}


// MARK: ALGRTH 5.2 Rotate an array to the left by N steps. Manual implemenation that rotates the original array

func rotateLeft(array: inout [Int], leftRotations d: Int) {
    
    if d < array.count/2 {
        
        // take from the head and move to the tail
        
        // reverse the array, since removeLast() is O(1).
        array = array.reversed()
        var headToBecomeTail = [Int]()

        for _ in 0..<d {
            headToBecomeTail.append(array.removeLast())
        }

        array = array.reversed() + headToBecomeTail

    } else {
        
        // take from the tail and move to the head
        
        var tailToBecomeHead = [Int]()

        for _ in d..<array.count {
            tailToBecomeHead.append(array.removeLast())
        }

        array = tailToBecomeHead.reversed() + array
    }

}

// MARK: - Testing the functions out

// the first function returns new array and doesn't modifying the original
let rotatedA = rotateSwift(array: a, leftRotations: steps)

// the second function is void, so instead it rotates the original
rotateLeft(array: &a, leftRotations: steps)

// check if the original got rotated too
a == rotatedA



// MARK: - AGRTHM 6.1 - A sorted array is rotated at some pivot unknown to you beforehand. Return the array in sorted order.

// Example [ 4 5 6 7 0 1 2 ] should return [ 0 1 2 4 5 6 7 ].

func fixRotation(in array: [Int]) -> [Int] {
    
    var l = 0
    var r = array.count-1
    
    guard array.count>1, array[l] > array[r] else {
        // already sorted or invalid
        return array
    }
    
    var startIndex = 0
    
    while l <= r {
        
        let m = (l+r)/2
            
        if array[m] > array[m+1] {
            startIndex = m + 1
            break
        } else if array[m] > array[l] && array[m] > array[r] {
            l = m
        } else if array[m] < array[l] && array[m] < array[r] {
            r = m
        }
        
    }
    
    return Array(array[startIndex...array.count-1] + array[0...startIndex-1])
    
    
}

// MARK: - AGRTHM 6.2 - A sorted array is rotated at some pivot unknown to you beforehand. Given an element, find it in the rotated array or return -1.

func findElementInRotated(array: [Int], target: Int) -> Int {
    
    var l = 0
    var r = array.count-1
    
    guard array.count>1, array[l] > array[r] else {
        // not rotated
        return -1
    }
        
    while l <= r {
        
        let m = (l+r)/2

        if array[m] == target {
            return m
        }
        
        if array[m] > array[l] && array[m] > array[r] {
            // pivot is on the right side
            
            if target < array[m] && target >= array[l] {
                // target is on the left
                r = m-1
            } else  {
                l = m+1
            }
        
        } else {
            // pivot is on the left side
            if target > array[m] && target <= array[r] {
               l = m+1
            } else {
               r = m-1
            }
            
        }
        
    }
    
    return -1
    
}

let rotatedArray = [ 4, 5, 6, 7, 0, 1, 2 ]

fixRotation(in: rotatedArray)

findElementInRotated(array: rotatedArray, target: 8)

