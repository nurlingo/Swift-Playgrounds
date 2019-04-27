import Foundation

struct Swifter: Decodable {
    let fullName: String
    let id: Int
    let twitter: URL
}

let simpleJson = """
{
 "fullName": "Federico Zanetello",
 "id": 123456,
 "twitter": "http://twitter.com/zntfdr"
}
""".data(using: .utf8)! // our native (JSON) data

do {
    let myStruct = try JSONDecoder().decode(Swifter.self, from: simpleJson) // decoding our data
    print(myStruct) // decoded!
} catch {
    print(error) // any decoding error will be printed here!
}

let jsonArray = """

 [
     {
         "fullName": "Federico Zanetello",
         "id": 1,
         "twitter": "http://twitter.com/zntfdr"
     },
     {
         "fullName": "Don Kihot",
         "id": 2,
         "twitter": "http://twitter.com/kihot"
     }
 ]

""".data(using: .utf8)! // our native (JSON) data

do {
    let myDictionaryOfStructArrays = try JSONDecoder().decode([Swifter].self, from: jsonArray) // decoding our data
    print(myDictionaryOfStructArrays[0].fullName) // decoded!
} catch {
    print(error) // any decoding error will be printed here!
}


// More complex example
struct MoreComplexStruct: Decodable {
    let swifter: Swifter
    let lovesSwift: Bool
}

let json = """
{
    "swifter": {
        "fullName": "Federico Zanetello",
        "id": 123456,
        "twitter": "http://twitter.com/zntfdr"
    },
    "lovesSwift": true
}
""".data(using: .utf8)! // our data in native format

do {
    let complexStruct = try JSONDecoder().decode(MoreComplexStruct.self, from: json) // do your decoding here
    print(complexStruct.swifter) // decoded!!!!!
} catch {
    print(error) // any decoding error will be printed here!
}




