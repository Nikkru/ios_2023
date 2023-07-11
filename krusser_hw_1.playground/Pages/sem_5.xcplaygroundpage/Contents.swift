import Foundation

protocol MenuProtocol {
    var name: String { get }
    var cost: Double { get }
}

class Cafe {
    private var menus = [String]()
    init(menus: [String]) {
        self.menus = menus
    }
//    func addMenu(menu: M)
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


var green = Tea(type: .green, cost: 100)
green.name


