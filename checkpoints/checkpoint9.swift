import UIKit

/* write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.
 write your function in a single line of code */

let arr: [Int]? = [1, 2, 3]

func randomInt(arr: [Int]?) -> Int { arr?.randomElement() ?? Int.random(in: 1...100) }

print(randomInt(arr: arr))
