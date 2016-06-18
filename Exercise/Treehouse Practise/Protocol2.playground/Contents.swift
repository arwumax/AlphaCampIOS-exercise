protocol Printable {
    func description() -> String
}

protocol PrettyPrintable: Printable {
    func prettyDescription() -> String
}

struct User: PrettyPrintable {
    let name: String
    let age: Int
    let address: String
    
    func description() -> String {
        return "\(name), \(age), \(address)"
    }
    func prettyDescription() -> String {
        return "name: \(name)\nage: \(age)\naddress: \(address)"
    }
}

let user = User(name: "Pasan", age: 27, address: "None")
print(user.prettyDescription())

/**********************************************/


struct Point {
    let x: Int
    let y: Int
    
    func pointsAroundMe(withRange range: Int) -> [Point] {
        var results: [Point] = []
        
        for x in (self.x - range)...(self.x + range) {
            for y in (self.y - 1)...(self.y + 1) {
                let point = Point(x: x, y: y)
                results.append(point)
            }
        }
        
        return results
    }
}

enum Direction{
    case Up, Down, Right, Left
}

protocol Movable {
    func move(direction: Direction, distance: Int)
}

protocol Destructable {
    func decreaseLife(factor:Int)
}

protocol Attackable {
    var strength: Int {get}
    var range: Int {get}
    
    func attack(player: PlayerType)
}

protocol PlayerType {
    var position: Point {get set}
    var life: Int {get set}
    init(point: Point)
    
}

class Enemy: PlayerType, Destructable, Attackable, Movable {
    var position: Point
    var life: Int = 10
    var strenth: Int = 5
    var range: Int = 2
    
    required init(point: Point) {
        self.position = point
    }
    
    func decreaseLife(factor: Int) {
        self.life -= factor
    }
    
    func attack(player: PlayerType) {
        {
    }
}



