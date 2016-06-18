//: Closures
//This function takes a string and prints it

func printString(aString: String) {
    print("Printing the string passed in: \(aString)")
    
}

printString("Hi, my name is Passan.")

// assign the function we just declared to a constant. note that we do not add parenthese"()" after the function name.
let someFunction = printString

someFunction("Hi look at me!")

func displayString(printStringFunc: (String) -> Void){
    printStringFunc("I am a function inside another function")
    
}

//A function can be assigned to variables or constant
// functions as inputs to other functions,
displayString(printString)

let allNumbers = [1,2,3,4,5,6,7,8,9,10]

func isEvenNumber(i:Int) -> Bool {
    return i % 2 == 0
}

let ifEven = isEvenNumber
let evenNumbers = allNumbers.filter(ifEven)



//////capturing variables/////

//////returning functions//////


func printerFunction() -> (Int) -> () {
    var runningTotal = 0
    func printInteger (number: Int) {
        runningTotal += 10
        print("The Interger passed in is: \(runningTotal)")
    }
    return printInteger
}
let printAndReturnIntegerFunc = printerFunction()
printAndReturnIntegerFunc(2)
printAndReturnIntegerFunc(22)
printAndReturnIntegerFunc(33)

let runningTotalFunction = printerFunction()
runningTotalFunction(2)




//////Closure expression/////
func doubler(i: Int) -> Int {
    return i * 2
    
}
let doubleFunction = doubler
doubleFunction(4)

let numbers = [1,2,3,4,5]
let doubledNumbers = numbers.map(doubleFunction)

/////Using closure expressions with the map function
let tripleNumbers = numbers.map({(i: Int) -> Int in return i * 3})

////Using closure expressions with the sorted function
var names = ["Chris","Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

//sorted(names, backwards)

let sortedNames = names.sort({ (s1: String, s2: String) -> Bool in return s1 > s2})
sortedNames

names.sort({ s1, s2 in return s1 > s2})

names.sort({s1, s2 in s1 > s2})

names.sort({$0 > $1})

names.sort(){$0 > $1}
names.sort{$0 > $1}


//Rules 1
[1,2,3,4,5].map({ (i:Int) -> Int in return i * 3})

//Rule 2: Inferring Type from Context
[1,2,3,4,5].map({i in return i * 3})

//Rule 3: Implicit Returns from Single Expression Closures
[1,2,3,4,5].map({i in i * 3})

//Rule 4: Shorthand Argument Names
[1,2,3,4,5].map({$0 * 3})

//Rule 5: Trailing Closure
[1,2,3,4,5].map(){$0 * 3}

//Rule 6: Ingnoring Parentheses
[1,2,3,4,5].map{$0 * 3}

