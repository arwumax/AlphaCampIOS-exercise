//protocols

protocol FullyNamed {
    var fullName: String {get}
    
}
struct User: FullyNamed{
    var fullName: String
    
}

let user = User(fullName: "John")

struct Friend: FullyNamed{
    var firstName: String
    var middleName: String
    var lastName:String
    
    var fullName: String {
        return "\(firstName) \(middleName) \(lastName)"
    }
}

let friend = Friend(firstName: "Max", middleName:
    "Wu", lastName: "ar")
friend.fullName

//Inheritance vs. Protocols

import Foundation

class Employee {
    let name: String
    let address: String
    let startDate: NSDate
    let type: String
    
    var department: String?
    var reportsTo:Employee?
    init(
}





