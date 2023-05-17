import UIKit

/* write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:
 
 You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 If you can’t find the square root, throw a “no root” error.
*/

enum errors: Error {
    case outOfBounds, noRoot
}

func sqrt (_ x: Int) throws -> Int {
    if x < 1 || x > 10_000 {
        throw errors.outOfBounds
    }
    
    let upperBound: Int = x/2 < 100 ? x/2 : 100
    // or upperBound = min(x/2, 100)
    
    if x == 1 {
        return 1
    } else {
        for i in 1...upperBound {
            if i * i == x {
                return i
            }
        }
    }
    
    throw errors.noRoot
}

let num: Int = 225

do {
    print("The root of \(num) is \(try sqrt(num))")
} catch errors.outOfBounds {
    print("Out of bounds")
} catch errors.noRoot {
    print("no integer root")
} catch {
    print("error")
}
