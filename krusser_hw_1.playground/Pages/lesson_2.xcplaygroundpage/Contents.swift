//: [Previous](@previous)

import Foundation

//var greeting = "Hello, playground"
//
//var a: Int? = 5
//var b = a!
//var c = a ?? b

enum Tea: String {
    case green = "Grean tea"
    case black = "Black tea"
    
    func getColor() -> String {
        self.rawValue
    }
}

func getTea(tea: Tea) -> String {
    tea.rawValue
}

print(Tea.black.getColor())

print(getTea(tea: .green))

//: [Next](@next)
