import Foundation

protocol CafeProtocol {
    var coffee: [Coffee] { get set }
    func addCoffee(coffee: Coffee)
}

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

class Cafe: CafeProtocol {
    var coffee: [Coffee]
    init(coffee: [Coffee]) {
        self.coffee = coffee
    }
    convenience init() {
        let latte = Coffee(name: "Latte",
                           isSugar: true,
                           isIce: false,
                           size: .l)
        let cappuccino = Coffee(name: "Cappuccino",
                                isSugar: false,
                                isIce: false,
                                size: .m)
        self.init(coffee: [latte, cappuccino])
    }
    func addCoffee(coffee: Coffee) {
        self.coffee.append(coffee)
    }
}

class FirstCafe: CafeProtocol {
    var coffee: [Coffee]
    init(coffee: [Coffee]) {
        self.coffee = coffee
    }
    convenience init() {
        let latte = Coffee(name: "Latte",
                           isSugar: true,
                           isIce: false,
                           size: .l)
        let cappuccino = Coffee(name: "Cappuccino",
                                isSugar: false,
                                isIce: false,
                                size: .m)
        self.init(coffee: [latte, cappuccino])
    }
    func addCoffee(coffee: Coffee) {
        self.coffee.append(coffee)
        print(self.coffee.count)
    }
}

let espresso = Coffee(name: "Espresso",
                      isSugar: true,
                      isIce: false,
                      size: .l,
                      cost: 50)

let firstCafe = FirstCafe()
var cafeOne = Cafe()
//cafeOne.addCoffee(coffee: espresso)
//firstCafe.addCoffee(coffee: espresso)

var cafe: [CafeProtocol] = [cafeOne, firstCafe]

for oneCafe in cafe {
    oneCafe.addCoffee(coffee: espresso)
}

// Объявление переменных в протоколе

//var firstCafe: CafeProtocol = FirstCafe()
firstCafe.coffee = [espresso]
print(cafeOne.coffee)

