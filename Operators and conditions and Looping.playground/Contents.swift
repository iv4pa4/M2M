import Cocoa

let first = 12
let second = 4
let total = first + second
let difference = first - second
let mult = first * second
let a = first % second
let b = first % 5
let c = first % 7

let totalNumbers = a + b + c
let firstPart = "Hello"
let secondPart = " world"
let message = firstPart + secondPart
let array1 = [firstPart, secondPart]
let array2 = [firstPart, secondPart]
let totalArrays = array1 + array2

var score = 95
score += 5
score -= 10
score /= 9
score *= 9

a == b
a != b
a > b
a <= b

if score >= totalNumbers {
    print("yes")
}
else {
    print("no")
}

if score > 80 && score % 8 == 0 {
    print("all true")
}
else if score > 80 || score % 10 == 0{
    print("no way")
}

// ternary operator
let firstCard = "7"
let secondCard = "10"
print(firstCard == secondCard ? "Same" : "not the same")

let weather = "sunny"

switch weather {
case "rain":
    print("Rainy")
case "sunny":
    print("Sunny")
    fallthrough
default:
    print("enjoy")
}

switch second {
case 0 ..< 5:
    print("between 0 and 5")
case 5 ..< 10:
    print("between 5 and 10")
case 0 ... 10:
    print("from 0 to 10 or 10")
default:
    print("greater than 10")
}

let passingGrade = 70...100

for i in [1,3,4] {
    print("Passing grade is \(i)")
}
 
for i in totalArrays {
    print(i)
}
//exit single loop
var cnt = 1
while cnt < 20 {
    print("Number is \(cnt)")
    break
    cnt += 1
}

while false{
    print("false")
}

repeat{
    print("false 2")
} while false

print("Exiting")

//exiting multiple loops
outerLoop: for i in 1...15 {
    for j in 1..<15 {
        print( i * j )
        if i * j == 2 {
            break outerLoop
        }
    }
}
//skipping element
for odd in 1...15 {
    if odd % 2 == 1{
        continue
    }
    print (odd)
}

            
1%2
