import Foundation

protocol CafeProtocol {
    var name: String {get set}
}

protocol MenuProtocol {
    var name: String { get }
    var cost: Double { get }
}

struct Tea: MenuProtocol {
    enum TeaType: String {
        case black
        case green
        case fruit
    }
    var type: TeaType
    var name: String { type.rawValue + " tea"}
    var cost: Double
}

struct Coffee: MenuProtocol {
    
    enum CoffeeSize: String {
        case l
        case m
        case s
    }
    
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
    
    var menu: [MenuProtocol]
    
    var coffee: [Coffee]
    var tea:    [Tea]
    var name:   String
    
    required init(menu:   [MenuProtocol],
                  coffee: [Coffee],
                  tea:    [Tea],
                  name:   String) {
        self.menu   = menu
        self.coffee = coffee
        self.tea    = tea
        self.name   = name
        
        print("Инициализация")
    }
    
    convenience init(name: String) {
        let latte = Coffee(name: "Latte",
                           isSugar: true,
                           isIce: false,
                           size: .l)
        let cappuccino = Coffee(name: "Cappuccino",
                                isSugar: false,
                                isIce: false,
                                size: .m)
        let blackTea = Tea(type: .black, cost: 50)
        self.init(menu: [latte, blackTea], coffee: [latte, cappuccino],
                  tea: [blackTea],
                  name: name)
    }
    
    deinit {
            print("Деинициализация")
    }
    
    func addCoffee(coffee: Coffee) {
        self.coffee.append(coffee)
    }
    func printDrink<T>(drink: T) {
        print(drink)
    }
    func getTeaName() {
        menu.forEach { a in
            guard let product = a as? Tea else {return}
            print(product.name)
        }
    }
    func getMenu() -> [String: [MenuProtocol]] {
        var tea = [Tea]()
        var coffee = [Coffee]()
        cafe?.menu.forEach({ a in
            if let product = a as? Tea {
                tea.append(a as! Tea)
            } else if let product = a as? Coffee {
                coffee.append(a as! Coffee)
            }
        })
        return ["tea": tea, "coffee": coffee]
    }
//    func getCost() -> [String: [Double]] {
//        let menu = getMenu()
//        var finalCost: [String: [Double]] = [:]
//        
//        menu.forEach { a in
//            let cost = a.value.first?.cost
//            finalCost.updateValue(cost, forKey: a.key)
//        }
//        return finalCost
//    }
}

class Name {
    var test: String
    init(test: String) {
        self.test = test
    }
}

var c = Name(test: "Olga")
var d = c
d.test = "Igor"
print(c.test, d.test)


//И напишем функцию, которая будет печатать в консоль адрес в памяти.
func getAddress(_ collection: UnsafeRawPointer) { print(Int(bitPattern: collection))
}

var teaArray = [Tea]()
var tea = teaArray

getAddress(teaArray)
getAddress(tea)
tea.append(Tea(type: .black, cost: 110))
getAddress(tea)

var cafe: Cafe?
var newCafe: Cafe?
var superNewCafe: Cafe?

cafe = Cafe(name: "Cafe")
newCafe = cafe
superNewCafe = cafe

cafe?.getTeaName()
cafe?.getMenu()
cafe = nil
newCafe = nil
superNewCafe = nil
