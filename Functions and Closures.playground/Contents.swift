import Cocoa

// basic func
func printHelp() {
    let message = """
Welcome to my first function!
Enjoy
"""
print(message)
}

printHelp()

// func reciving values
func sum (number1: Int, number2: Int){
    print(number1 * number2)
}

sum(number1: 12, number2: 10)

//func returning values
func sqrt(number: Int) -> Int{
    return number * number
}

let result = sqrt(number: 8)
print(result)

//Omitting parameter labels
func readCar( _ car: String ) -> String{
    print(car)
    return car
}
readCar("fiat")

//default parameters
func greeting(nicely: Bool = true){
    if nicely == true {
        print("Hi Iva")
    }
    else{
        print("Not Iva")
    }
}
greeting(nicely: false)
greeting()

//variadic func
func sqrt2(_ numbers: Int...) -> [Int]{
    var result: [Int] = []
    for number in numbers {
        result.append(number*number)
    }
    return result
}

sqrt2(1,2,3,4)

//throwing func
enum passwordError: Error {
    case obvious
}
func passwordCheck (_ password: String) throws -> Bool {
    if password == "password" {
        throw passwordError.obvious
    }
    return true
}

do {
    try passwordCheck("password")}
catch{
    print("Obvious password")
}

func doubleMyNum(num: inout Int){
    num += 10
}
var mynum = 10
doubleMyNum(num: &mynum)
print(mynum)


// simple closure
var driving = {
    print("Driving")
}

driving()

//closure with parameters
let driving2 = {
    (car: String) in
    print("Car is \(car)")
}
driving2("Fiat")

var driving3 = {
    (car: String) -> String in
    return car
}
var drivingWithResult = driving3("Nissan")
print(drivingWithResult)

//as parameters
func travel (action: () -> Void){
    action()
    print("Action done")
}

travel (action: driving)
//Trailing closure syntax
travel {
    print("Trailing syntax")
}

func travel2 (action: (String) -> Void){
    action("Strange action")
    print("Action done")
}

travel2{ (action: String) in
    print(action)
}

func travel3 (name: String, action: (String) -> Void){
    action(name)
    print("Action done")
}

travel3(name: "Opppp"){ (action: String) in
    print(action)
}
//with accepting arguements and returning values
func travel4 (name: String, action: (String) -> String){
    let res = action(name)
    print(res)
    print("Action done")
}

travel4(name: "Opppp"){ (action: String) -> String in
    return action
}

//Shorthand parameter names
travel4(name: "Opppp"){
    $0
}

func travel5 (_ name: String, _ speed: Int, action: (String, Int) -> String){
    let res = action(name, speed)
    print(res)
    print("Action done")
}

travel5("Iva", 20){
    "Just casually doing magic with \($0), \($1)"
}
//functions that return closures
// (String)-what it gets, Void - what it returns
func travell () -> (String) -> Void {
    return {
        var cnt = 0
        print("This is the arguement \( $0 )")
        cnt += 1
    }
    
}

var travelResult = travell()
travelResult("HEy")
//var in closure is still alive
travelResult("HEy")
travelResult("HEy")


func storeTwoValues(value1: String, value2: String) -> (String) -> String {
    var previous = value1
    var current = value2
    return { new in
        let removed = previous
        previous = current
        current = new
        return "Removed \(removed)"
    }
}
let store = storeTwoValues(value1: "Hello", value2: "World")
let removed = store("Value Three")
print(removed)
