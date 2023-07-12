import Foundation

protocol MachineProtocol{
    func start()
    func finish()
}

protocol MenuProtocol {
    var name: String { get }
    var cost: Double { get }
}

class Cafe {
    var menu = [MenuProtocol]()
    init(menu: [MenuProtocol]) {
        self.menu = menu
    }
    func addMenu(newPosition: MenuProtocol) {
        self.menu.append(newPosition)
    }
    func getMenu() {
        menu.forEach { a in
            print("\(a.name) - \(a.cost) рублей")
        }
    }
    func getEnableMenu(deposit: Double) -> [MenuProtocol] {
        print("\nДоступные Вам блюда до \(deposit) рублей:")
        var enableMenu = menu.filter { dish in
            dish.cost <= deposit
        }
        enableMenu.forEach { a in
            print("\(a.name) - \(a.cost) рублей")
        }
        return enableMenu
    }
}

struct Limonad: MenuProtocol {
    var name: String
    var cost: Double
}

struct Salad: MenuProtocol {
    var name: String
    var cost: Double
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

class FirstCafe: Cafe {
    override func addMenu(newPosition: MenuProtocol) {
        menu.append(newPosition)
        print(newPosition)
    }
}

final class VedingMashin: FirstCafe {
    func getDish(num: Int, deposit: Double) -> MenuProtocol? {
        guard menu[num].cost <= deposit && menu.count < num else { return nil }
        return menu[num]
    }
}

var green = Tea(type: .green, cost: 100)
var cezar = Salad(name: "Cezar", cost: 120)
green.name

var oneCafe = Cafe(menu: [green])
oneCafe.addMenu(newPosition: cezar)
oneCafe.getMenu()

oneCafe.getEnableMenu(deposit: 100)

var veding1 = VedingMashin(menu: [green, cezar])
var dish1 = veding1.getDish(num: 0, deposit: 130)

extension VedingMashin: MachineProtocol {
    func start() {
        print("On")
    }
    func finish() {
        print("Out")
    }
}
