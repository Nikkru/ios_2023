import Foundation

// найти корни квадратного уравнения ax^2 + bx + c = 0

func findRoots(a: Double, b: Double, c: Double) -> (Double?, Double?) {
    
    let discr = b * b - 4 * a * c
    switch discr {
    case _ where discr < 0:
        print("Корни отсутствуют")
        return (nil, nil)
    case _ where discr == 0:
        let x =  -b / 2 * a
        print(x)
        return (x, nil)
    default:
        print("")
        return (-b + sqrt(discr) / 2 * a, -b - sqrt(discr) / 2 * a)
    }
}

print(findRoots(a: 3, b: 10, c: 3))

enum Tea: String {
    case black
    case green
    case fruit
    
    
}

struct TeaCost {

    var name: Tea
    var cost: Double
    
    func getCost(discount: Int) -> Double {
        guard discount <= 50 else {
            print("Скидка невозможна")
            return cost
        }
        return cost * Double(discount) / 100
    }
}

class Cafe {
    var tea: [TeaCost] = []
    
    init(tea: [TeaCost]) {
        self.tea = tea
    }
    
    func printTea() {
        tea.forEach { t in
            print(t)
        }
    }
    
    func printCostTea(type: Tea, sale: Int) -> Double? {
//        guard tea.contains(type) else {
//        }
        for teaType in tea {
            if teaType.name == type {
                return teaType.getCost(discount: sale)
            }
        }
        return nil
    }
}

struct CafeTea {
    var type: Tea
    var cost: Double
    
    func getCost(sale: Int) -> Double {
        guard sale < 50 else {
            print("невозможно применить скидку")
            return cost
        }
        return cost * Double(sale) / 100
    }
}

class TeaCafe {
    var tea: [CafeTea]
    init(tea: [CafeTea]) {
        self.tea = tea
    }
    
    func getCost(type: Tea, sale: Int) -> Double? {
        
        guard let teaT = tea.first(where: { a in
            a.type == type
        }) else {
            return nil
        }
       return teaT.getCost(sale: sale)
    }
}

let blackNight = TeaCost(name: .black, cost: 100)
let whiteNight = TeaCost(name: .green, cost: 110)
let fruitMorning = TeaCost(name: .fruit, cost: 130)

let blackEvening = CafeTea(type: .black, cost: 100)
let whiteEvening = CafeTea(type: .green, cost: 110)
let fruitEvening = CafeTea(type: .fruit, cost: 120)

var set1 = Cafe(tea: [blackNight, whiteNight, fruitMorning])

set1.printTea()

var menu = TeaCafe(tea: [blackEvening, whiteEvening, fruitEvening])

blackNight.getCost(discount: 50)
print(set1.printCostTea(type: .green, sale: 30))
print(menu.getCost(type: .fruit, sale: 30))

class Person {
    
    struct Activity {
        enum TyoeOfActivity {
            case pupil
            case student
            case employee
        }
    }
}

var activ: Person.Activity.TyoeOfActivity

func getTea(activity: Person.Activity.TyoeOfActivity, balance: Double, sale: Int, cafe: TeaCafe) -> CafeTea? {
    var menuT = menu.tea.sorted { $0.getCost(sale: sale) > $1.getCost(sale: sale)}
    guard menuT.first!.getCost(sale: sale) < balance else { return nil }
    switch activity {
    case .pupil:
        menuT.filter { $0.getCost(sale: sale) <= balance }
        return menuT.first
    case .student:
        menuT.filter { $0.type == .black }
        return menuT.first
    case .employee:
        menuT.filter { $0.type == .black || $0.type == .fruit }
        return menuT.first
    }
}

var studentA = getTea(activity: .pupil, balance: 200, sale: 25, cafe: menu)
