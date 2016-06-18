//: Playground - noun: a place where people can play

import UIKit


var orignal_arr = [0,1,2,3,4,5,6,7,8,9]
var random_arr = [Int]()

for i in 0...3 {
    var randomIndex:Int = random() % orignal_arr.count
    random_arr.append(orignal_arr[randomIndex])
    orignal_arr.removeAtIndex(randomIndex)
}

print(random_arr)

