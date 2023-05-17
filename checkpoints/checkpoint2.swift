import UIKit

/* create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.*/

var arr: [String] = []

arr = ["hi", "hello", "bye", "goodbye", "hi", "hello", "seeya"]

var set = Set<String>()
set = Set(arr)

print(arr)
print("Number of elements: \(arr.count)")

print(set)
print("Number of unique elements: \(set.count)")
