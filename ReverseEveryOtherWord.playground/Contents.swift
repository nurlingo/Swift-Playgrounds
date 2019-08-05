/**
 Reverse every other word in a sentence
 */

let sampleSentence = "This is the sentence we want to reverse every other word in"

func reverseEveryOtherWord(in sentence: String) -> String {
    
    let words = sentence.split(separator: " ")
    
    guard !words.isEmpty else {
        return sentence
    }
    
    var reversedSentence = ""
    
    for i in 0...words.count - 1 {
        
        // add spaces between words
        if i > 0 {
            reversedSentence += " "
        }
        
        // reverse every other word
        if i % 2 == 1 {
            reversedSentence += words[i].reversed()
        } else {
            reversedSentence += words[i]
        }
    }
    
    return reversedSentence
}

print(reverseEveryOtherWord(in: sampleSentence))

reverseEveryOtherWord(in: "")
reverseEveryOtherWord(in: "    ")
reverseEveryOtherWord(in: "Word")
reverseEveryOtherWord(in: "This si the ecnetnes we tnaw to esrever every rehto word ni")
reverseEveryOtherWord(in: "2 2_+ =_8 4_-")
