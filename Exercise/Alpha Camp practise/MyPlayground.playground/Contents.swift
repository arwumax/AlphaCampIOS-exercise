//: Playground - noun: a place where people can play

import UIKit



func number() {
    
for i in 1...9 {
    for j in 1...9{
       let sum = i * j
        print( "\(i) * \(j) = \(sum)")
        }
    }
}

number()


func starNumber (num: Int) {
    let star:Character = ("*")
    for a in 1...num {
        print(String(count: a, repeatedValue: star))
    }
    for b in 1...num-1{
        print(String(count: num-b, repeatedValue: star))
    }
}
starNumber(5)




