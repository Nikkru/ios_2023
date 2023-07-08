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
    
    init?(newSize: String) {
        switch newSize {
        case "small":  self = .s
        case "medium": self = .m
        case "large":  self = .l
        default:       return nil
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
let sizeTwo = CoffeeSize(size: "medium")
let lSize = CoffeeSize(newSize: "ls")
print(lSize)
var latte = Coffee(name: "Latte", isSugar: true, isIce: false, size: size)
latte.cost = 150
latte.getCoffee()
latte.changeName(name: "FriLatte")
var cappuchino = Coffee(name: "Cappuchino", isSugar: true, isIce: false, size: .l)


class Cafe {
    private var coffee: [Coffee] = []
    
    init(coffee: [Coffee]) {
            self.coffee = coffee
    }
    
    
    convenience init() {
        let latteM = Coffee(name: "Latte-M", isSugar: true, isIce:
false, size: .l)
        let mocciato = Coffee(name: "Mocciato", isSugar:
false, isIce: false, size: .m)
        self.init(coffee: [latteM, mocciato])
}

    func addCoffee(coffee: Coffee) {
        self.coffee.append(coffee)
    }
}

var cafe = Cafe(coffee: [latte, cappuchino])
var newCafe = Cafe()




