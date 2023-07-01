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
    case white
    
    func getColor() -> String {
        self.rawValue
    }
}

func getTea(tea: Tea?) {
    guard let tea = tea else {
        print("No this position!")
        return
    }
    print(tea.rawValue)
}

print(Tea.black.getColor())

getTea(tea: .white)

//: [Next](@next)
