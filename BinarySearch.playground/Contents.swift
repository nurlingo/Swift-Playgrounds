// Binary search algorythm implemented with Swift

let array = Array(1...1000)

func binarySearch<T: Comparable>(_ array: [T], for searchObject: T) -> Bool {
    
    var startIndex = 0
    var endIndex = array.count - 1
    
    if searchObject < array[startIndex] || searchObject > array[endIndex] {
        return false
    }
    
    while startIndex <= endIndex {
        
        let midIndex = (startIndex + endIndex) / 2
        let midValue = array[midIndex]
        
        if searchObject == midValue {
            return true
        } else if searchObject < midValue {
            endIndex = midIndex - 1
        } else if searchObject > midValue {
            startIndex = midIndex + 1
        }
    }
    
    return false
}

// BVA testing
binarySearch(array, for: 0)
binarySearch(array, for: 1)
binarySearch(array, for: 774)
binarySearch(array, for: 1000)
binarySearch(array, for: 1001)
