





/*slide 167 */

/*func repeatTask(count:Int, task:()->()) {
    for _ in 0..<count {
    task()
    }
}

func eat() {
    var message = "食飯"
    print("sleeping")
}

func sleep() {
    var message = "訓"
    print("eating")
}

repeatTask(2, task:eat)
repeatTask(3, task:sleep) 
*/

//Slide 257

/* var book = ["name":"little prince", "author":"Max"]
var bookName = book["name"]
var bookName2 = book["author"] */
class Human {
    
}

class Boy:Human{
    var name = "Max"
}

class Girl:Human {
    var name = "Mary"
}


var people:[Human] = [Boy(),Girl(), Boy()]

for data in people {
    if let boy = data as? Boy {
        var message = ""
    }
}