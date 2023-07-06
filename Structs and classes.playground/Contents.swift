import Cocoa

struct Person {
    var name: String
    var age: Int
}

var p1 = Person(name: "iva", age: 17)
print("Person's name is \(p1.name) and she is \(p1.age) years old")

struct Sport {
    var name: String
    var isOlympycSport: Bool
    var olympicStatus: String {
        if isOlympycSport{
            return "yes"
        }
        else{
            return "no"
        }
    }
}

var s1 = Sport(name: "Football", isOlympycSport: true)
var s2 = Sport(name: "Walking", isOlympycSport: false)
print("Is \(s1.name) a sport? \(s1.olympicStatus)")
print("Is \(s2.name) a sport? \(s2.olympicStatus)")

struct Work {
    var name: String
    var amount: Int {
        didSet{
            print("It's \(amount) % ready")
            if(amount == 100){
                print("Completed!")
            }
        }
    }
}
var w1 = Work(name: "walking", amount: 0)
w1.amount = 30
w1.amount = 70
w1.amount = 100

struct Calculator {
    var value1: Int
    var value2: Int
    
    func sum() -> Int{
        return value1 + value2
    }
    
    mutating func changingValue1(newValue: Int){
        value1 = newValue
    }
}
var calc = Calculator(value1: 10, value2: 15)
calc.sum()
calc.changingValue1(newValue: 30)
calc.sum()

var str = "iva 1"
str.count
str.uppercased()

struct Animal{
   private var name:String
    private var legs: Int
    static var numOfAnimals = 0
    init(name: String, legs: Int){
        self.name = name
        self.legs = legs
        Animal.numOfAnimals += 1
    }
}

var animal = Animal(name: "Ico", legs: 4)
print(Animal.numOfAnimals)
var animal1 = Animal(name: "Ico", legs: 4)
print(Animal.numOfAnimals)
var animal2 = Animal(name: "Ico", legs: 4)
print(Animal.numOfAnimals)

class AnimalClass{
    var name: String
    var legs: Int
    var type: String
    init(name: String, legs: Int, type: String){
        self.name = name
        self.legs = legs
        self.type = type
    }
    func makeSound(){
        print("makingSound")
    }
}

var racoon = AnimalClass(name: "Racoon", legs: 4, type: "racoon")

class Dogg: AnimalClass{
    init(name: String){
        super.init(name: name, legs: 4, type: "dog")
    }
    override func makeSound() {
        print("Dog sounds")
    }
    
    deinit{
        print("\(self.name) was destroyed")
    }
}

var dog2 = Dogg(name: "Ico")
racoon.makeSound()
dog2.makeSound()
