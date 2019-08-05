/**
 Find the most common object in an array
 */

func mostCommonObject<T: Hashable>(in array: [T]) -> T? {
    
    guard !array.isEmpty else {
        return nil
    }
    
    var mostCommonObject = array[0]
    var maxCount = 1
    var objectsDict = [T:Int]()
    
    for object in array {
        if let count = objectsDict[object] {
            let incrementedCount = count + 1
            objectsDict[object] = incrementedCount
            
            if incrementedCount > maxCount {
                maxCount = incrementedCount
                mostCommonObject = object
            }
            
        } else {
            objectsDict[object] = 1
        }
    }

    
    return mostCommonObject

}


let names = ["John", "Jack", "Jill", "Fred", "Jack", "Craig"]

mostCommonObject(in: names)
