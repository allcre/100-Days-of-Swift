import UIKit

/*
 Your input is this:
 let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
 
 Your job is to:
 Filter out any numbers that are even
 Sort the array in ascending order
 Map them to strings in the format “7 is a lucky number”
 Print the resulting array, one item per line
 */

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

for i in (luckyNumbers.filter {
    !$0.isMultiple(of: 2)
} .sorted().map {
    "\($0) is a lucky number"
}) {
    print(i)
}

/*
this works too:
 
 func sol (arr: [Int], filterEven: ([Int]) -> [Int], sort: ([Int]) -> [Int], lucky: ([Int]) -> [String], printArr: ([String]) -> Void) {
    let filteredArr = filterEven(arr)
    let sortedArr = sort(filteredArr)
    let luckyArr = lucky(sortedArr)
    printArr(luckyArr)
}

sol (arr: luckyNumbers) { (arr) in
    arr.filter {$0 % 2 == 1}
} sort: { (filteredArr) in
    filteredArr.sorted()
} lucky: { (sortedArr) in
    sortedArr.map {
        "\($0) is a lucky Number"
    }
} printArr: { (luckyArr) in
    for i in luckyArr {
        print(i)
    }
}
*/
