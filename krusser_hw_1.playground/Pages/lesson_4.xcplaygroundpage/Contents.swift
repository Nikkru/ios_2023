import Foundation


var tuple = (name: "Latte", cost: 100)
tuple.1 = 110
let costCoffe = tuple.cost

enum CoffeeSize {
    case s
    case m
    case l
    
    init(size: String) {
        switch size {
        case "small":  self = .s
        case "medium": self = .m
        case "large":  self = .l
        default:       self = .m
        }
    }
}

struct Coffee {
    var name: String {
        willSet(newName) {
            print("Новое название кофе - \(newName)")
        }
        didSet(oldName) {
            print("Старое название кофе - \(oldName)\n")
        }
    }
    var isSugar: Bool
    var isIce: Bool
    var size: CoffeeSize
    var cost: Double = 110 {
        willSet(newCost) {
            print("Новая стоимость кофе - \(newCost)")
        }
        didSet(oldCost) {
            print("Старая стоимость кофе - \(oldCost)\n")
        }
    }
    func getCoffee() {
        print("Название: \(name), стоимость: \(cost)\n")
    }
    mutating func changeName(name: String) {
        self.name = name
    }
}
let size = CoffeeSize(size: "large")
var latte = Coffee(name: "Latte", isSugar: true, isIce: false, size: size)
latte.cost = 150
latte.getCoffee()
latte.changeName(name: "FriLatte")
