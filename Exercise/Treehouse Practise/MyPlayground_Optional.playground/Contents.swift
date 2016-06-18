//: Playground - noun: a place where people can play

import UIKit

func sendNoticeTo(aptNumber aptNumber: Int){
    
}

func findApt (aptNumber : String) -> String? {
    let aptNumbers = ["101","202","303","404"]
    for tempAptNumber in aptNumbers {
        if ( tempAptNumber == aptNumber) {
            return aptNumber
        }
    }
    return nil
}


/*Accepts two Int parameters
Figures out if the first parameter is divisible by the second
Returns a Bool optional
If the number is divisible it return a true else it returns a nil
Call the function with 2 numbers and then print out whether “Divisible” or “Not Divisible*/

func isDivisable (dividend dividend: Int, divisor: Int) -> Bool? {
    if dividend % divisor == 0 {
    return true
} else {
return nil
}
}

if let result = isDivisable(dividend: 15, divisor: 4){
    print("Divisable")
} else {
    print("Not Divisable")
}




