//: Playground - noun: a place where people can play

import UIKit


func concatenateString(a: String, b: String) ->String {
    return a + b
}

concatenateString("a", b: "b")

func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)"
}

sayHello(to: "Max", and: "Mary")



//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////


func calculateArea(length length:Int, width: Int) -> Int{
    return length * width
}

//Default Values
func carpetCostCalculator(length length: Int, width: Int, carpetColor: String = "tan") -> (price: Int, carpetColor: String) {
    
    let area = calculateArea(length: length
        , width: width)
    var price: Int
    switch carpetColor {
        case "gray": price = area * 1
        case "tan": price = area * 2
        case "blue": price = area * 4
        default: price = 0
    }
    return (price, carpetColor)
}

let result = carpetCostCalculator(length: 10, width: 20)
result.0
result.1

//Function scope
func countDownAndUp(var a: Int){
var b = a

while b > 0 {
    b--
    a++
    print("a: \(a)")
    print("b: \(b)")
}
}

var a = 20 // not this a
countDownAndUp(a) //use this a

//Tuples
func searchNames (name name: String) -> (found: Bool, description: String) {
    let names = ["Max","Mary","John","David"]
    var found = (false, "\(name) is not a teacher")
    
    for i in names {
        if i == name {
        found = (true, "\(name) is a teacher")
        }
    }
    return found
}
let result1 = searchNames(name: "Max")
result1.found
result1.description




