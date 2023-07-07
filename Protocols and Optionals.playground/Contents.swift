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

func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}
class Album {
    var name: String

    init(name: String) {
        self.name = name
    }
}

class StudioAlbum: Album {
    var studio: String

    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
}

class LiveAlbum: Album {
    var location: String

    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
}

let album = albumReleased(year: 2006) ?? "unknown"
print("The album is \(album)")
let album2 = albumReleased(year: 2007) ?? "unknown"
print("The album is \(album2)")

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")

var allAlbums: [Album] = [taylorSwift, fearless]

for album in allAlbums {
    let studioAlbum = album as! StudioAlbum
    print(studioAlbum.studio)
}
