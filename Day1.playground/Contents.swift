import Cocoa

var greeting = "Hello, playground"
greeting = "Goodbye"

var age = 38

var str1 = """
This goes
over multiple
lines
"""
var str2 = """
This goes \
over multiple \
lines
"""

var pi = 3.141
var awsome = true

var score = 85
var str = "Your score is \(score)"
var result = "The test results are here: \(str)"

let taylor = "swift"
// taylor = "hey"

let string = "Hello"
let album: String = "Repo"
let cnt: Int = 12
let height: Double = 12.5
let isTrue: Bool = true

let john = "John"
let paul = "Paul"
let george = "George"

let people = [john, paul, george]
people[0] //swift crashes if you try to read something that doesn't exists
let people2: [String] = [john, paul]

//elements in sets are stored in random order and are all unique values
let colors = Set(["red", "white", "yellow"])
//if you insert duplicate value it gets ignored
let colors2 = Set(["red", "white", "red", "blue"])

// tuples allow you to store several values together in a single value
var name = (first: "taylor", last: "swift")
name.first
name.0

let address = (house: 555, steet: "random", city: "sofia")
let set = Set([1, 3, 5, 2, 2])
let pythons = ["Erik, John, Terry, Terry"]

let heights: [String: Double] = [
    "person1": 1.78,
    "person2": 1.23,
    "person3": 1.80
]
heights["person1"]

// null is nil i swift
heights["person4"]
heights["person4", default: 0]

//empty dic
var teams = [String: String]()
teams[paul] = "wal"
teams[paul]

// empty array
var array = [Int]()

// empty set
var set2 = Set<String>()

enum Results {
    case succes
    case failure
}
var res = Results.succes

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(song: String)
}
let active = Activity.talking(topic: "Weather")


var tuplet = (2, 3, 4)
var tuplet2 = (first: 2, 3, 4)
tuplet2.2
