import UIKit


var result2 = [Int]()

while (result2.count < 20) {
    
    var k: Int = random() % 20
    if (!result2.contains(k)) {
        result2.append(k)
    }
}
print(result2)


