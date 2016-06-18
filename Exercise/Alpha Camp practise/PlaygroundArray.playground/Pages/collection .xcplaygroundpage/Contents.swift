//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//array
var todo: [String] = ["Max","Peter","Mary"]

//add value to the end of the array
todo.append("Tom")
todo = todo + ["John"]

//can not change things in let
let toread: [String]

//read the array
let firstTast = todo[2]

//modify the array 
todo[2] = "Steve"

//insert Indexs
todo.insert("Cathy", atIndex: 1)

//removeing items
todo.removeAtIndex(0)

//count
todo.count

//////dictionary/////// (array is not in order
var studentNames: [String: String] = [
"max":"78",
"Mary":"92",
"David":"80"
]

studentNames

//inserting key value pairs
studentNames["tom"] = "63"

studentNames

//change value
studentNames["max"] = "90"
studentNames
studentNames.updateValue("50", forKey: "David")
studentNames

//remove key value pairs
studentNames["max"] = nil
studentNames
studentNames.removeValueForKey("tom")
studentNames

//non existing value
let tommy = studentNames["40"]



