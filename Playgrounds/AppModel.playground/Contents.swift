
//class ou struct ?

// Reference ?
// Inheritance
// No choice?

// Modéliser le Truc (et éventuellements TrucAutres)
// Propriétés (var et let)

// Fonctions

// Modéliser le TrucManager
// Bcp de fonctions



import Foundation

struct Item {
    let name: String
    var price: Double
    var comment: String
    var toSell: Bool

    var sellWebsiteURL: URL?
    let condition: Condition

    var photo: Data? // (nil / Data)
}

enum Condition {
    case perfect
    case ok
    case bad
}

let item = Item(name: "", price: 8, comment: "", toSell: false, sellWebsiteURL: URL(string: "http://www.apple.com")!, condition: Condition.ok, photo: nil)

if item.sellWebsiteURL != nil {
    print(item.sellWebsiteURL!) // ! -> force unwrap operator
}

if let websiteURL = item.sellWebsiteURL { // if let -> optional binding
    print(websiteURL)
}

let defaultURL = URL(string: "http://leboncoin.fr")!
let url = item.sellWebsiteURL ?? defaultURL // ?? nil coalescing operator

var emptyArray: [String] = []
var emptyDic: [String:Int] = [:]
var emptySet: Set<String> = []

let result = emptyDic["Toto"] ?? 0

func helloWorld() {
    print("hello world")
}

func say(_ message: String) {
    print(message)
}

func echo(_ message: String, count numberOfEchoes: Int = 3) -> String {
    return message
}

helloWorld()
say("Hello")
echo("Hello", count: 3)

emptyArray.append("toto")
emptyArray.insert("toto", at: 0)
echo("Hello")

emptySet.insert("Hello")
