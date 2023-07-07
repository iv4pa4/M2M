import Cocoa

protocol havingId{
    var id: Int {get set}
    var name: String {get}
    var age: Int {get}
}

struct Person: havingId{
    public var id = 0
    public var name: String
    public let age = 17
    
}

func getId(something: havingId){
    print(something.id)
}
var p = Person(name: "Iva")
getId(something: p)

protocol canWalk {
    func canWalk() -> String
}
protocol canTalk {
    func canTalk() -> Int
}
protocol canEat {
    func canEat() -> String
}
protocol personActions: canWalk, canTalk, canEat{
    
}

struct PersonNew: personActions{
    func canWalk() -> String {
        return "Can walk"
    }
    func canTalk() -> Int {
        return 3
    }
    func canEat() -> String {
       return "can eat"
    }
}

var p2 = PersonNew()
p2.canEat()
p2.canTalk()
p2.canWalk()

extension Int{
    func sqrt() -> Int{
        return self * self
    }
    var isEven: Bool{
        if self % 2 == 1 {
            return true
        }
        else{
            return false
        }
    }
}

var a = 8
a.sqrt()
a.isEven

//Handling missing data
var age: Int?
age = 8

//Unwrapping optionals
var str: String? = nil
var str2: String? = "iva"

if let tmp2 = str2{
    print(tmp2.count)
}
else{
    print( "empty")
}
