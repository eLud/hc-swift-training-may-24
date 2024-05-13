

let languageName = "Swift"
var version: Float = 5.10
let isAwesome = true

let areWeAppleEmployees = false

let introduced: Int
if areWeAppleEmployees {
    introduced = 2013
} else {
    introduced = 2014
}

print(introduced)

let newVersion: Double = 6.0
// version = newVersion //Cannot assign value of type 'Double' to type 'Float'

let a = 5
let b = 2.0

let c = Double(a) / b // 2

// Constants vs. variables
// Strong typing
// Type inference

// Value type
struct Dog {
    let name: String
    var age: Int
}

class Animal {
    let name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func makeNoise() {

    }
}

// Reference type
class Cat: Animal {
    override func makeNoise() {
        super.makeNoise()
        print("miaou")
        //self.makeNoise() //this
    }
}

var dog1 = Dog(name: "Médor", age: 0)
let cat1 = Cat(name: "Félix", age: 0)

let cat2 = cat1
let dog2 = dog1

cat1.age = 1
dog1.age = 1

print(cat1.age)
cat2.age
print(dog1)
dog2.age
