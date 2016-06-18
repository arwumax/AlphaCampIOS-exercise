//: Playground - noun: a place where people can play

import UIKit
import Foundation

func greeting(s0: String) -> (String){
    return "Hello \(s0)"
}

var returnMsg = greeting("Swift")
print("case 1: \(returnMsg)")

var funVar = greeting

returnMsg = funVar("Swift")
print("case 2: \(returnMsg)")

//Case 3: call function as a function's parameter
func useFuncAsParam(string: String, funcAsParam:(String)->(String)) -> (String) {
    
    return funcAsParam(string)
}

returnMsg = useFuncAsParam("Swift", funcAsParam: greeting)
    print("CASE 3: \(returnMsg)")

/* Example 2: Demo the use of closure */
//=> CASE 4: use closure as a function's parameter
returnMsg = useFuncAsParam("Swift", funcAsParam: {(s0: String) -> (String) in
return "Hello \(s0) which can work together well with Objective-C"})
print("CASE 4: \(returnMsg)")

//Case 5 -> important
returnMsg = useFuncAsParam("Swift", funcAsParam: {s0 in return "Hello \(s0) which can work tgt well with objective-C"})
print("Case 5: \(returnMsg)")

//Case 6: use shorthand arguments to reduce more
returnMsg = useFuncAsParam("Swift", funcAsParam: {return "Hello \($0) which can work together well with objective-C!"})
print("CASE 6: \(returnMsg)")

//Case7: use trailing closureto express
returnMsg = useFuncAsParam("Swift") {
    return "Hello \($0) which can work together well with objective-C!"}
print("CASE 7: \(returnMsg)")

let brands = ["Apple", "Google", "Facebook"]



var sortedBrands = brands.sort({
    (s0: String, s1: String) -> Bool in
    return s0 < s1
})
print("Case 8: \(sortedBrands)")
sortedBrands = brands.sort(){$0 < $1}













