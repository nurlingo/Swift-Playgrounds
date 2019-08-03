/**
 FizzBuzz
 Write a program that prints the numbers from 1 to 100 with the following exceptions:
    - For multiples of three print “Fizz” instead of the number
    - For the multiples of five print “Buzz”.
    - For numbers which are multiples of both three and five print “FizzBuzz”.
*/


let hundredNumbers = Array(1...100)

for num in hundredNumbers {
    
    if num%15 == 0 {
        print("fizzbuzz")
    } else if num%3 == 0 {
        print("fizz")
    } else if num%5 == 0 {
        print("buzz")
    } else {
        print(num)
    }
    
}
