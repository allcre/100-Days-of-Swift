import UIKit

/*Your goal is to loop from 1 through 100, and for each number:
 If it’s a multiple of 3, print “Fizz”
 If it’s a multiple of 5, print “Buzz”
 If it’s a multiple of 3 and 5, print “FizzBuzz”
 Otherwise, just print the number. */

for i in 1...100 {
    let m3 = i.isMultiple(of: 3)
    let m5 = i.isMultiple(of: 5)
    
    if m3 && m5 {
        print("FizzBuzz")
    } else if m3 {
        print("Fizz")
    } else if m5 {
        print("Buzz")
    } else {
        print(i)
    }
}
