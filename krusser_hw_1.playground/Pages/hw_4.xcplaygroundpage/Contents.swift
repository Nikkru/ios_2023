import Foundation

// hw_5
//Создать протокол для меню. Протокол должен содержать стоимость и наименование. Стоимость и название должны быть get-only.
//Создайте класс кафе, в нём должен быть массив с наименованиями меню и инициализатор. Подпишите структуру чая с прошлого занятия на протокол из первого пункта. В качестве name должен быть вид чая и “tea”. Например, для чёрного чая должно быть black tea, а для зелёного green tea.
//Создайте ещё 3 кафе, для которых класс Cafe будет родительским.
//Добавить в родительский класс функцию (add) по добавлению новой позиции в меню. Саму переменную меню сделать приватной, если она ещё таковой не является.
//Сделать так, чтобы в первом из трёх классов наследников (например, FirstCafe) функция add помимо того, что выполняла всё тоже самое, что и в родительском классе, печатала в консоль стоимость добавляемой позиции.
//Создать класс автомата с едой, не реализовывать в нём ни методов, ни свойств, однако, этот класс должен уметь делать всё тоже самое, что и FirstCafe.
//Сделать так, чтобы от класса автомата с напитками нельзя было наследоваться.


//Создать протокол для меню. Протокол должен содержать стоимость и наименование. Стоимость и название должны быть get-only.
protocol MenuProtocol {
    var name: String {get}
    var cost: Double {get}
}

//Подпишите структуру чая с прошлого занятия на протокол из первого пункта. В качестве name должен быть вид чая и “tea”. Например, для чёрного чая должно быть black tea, а для зелёного green tea.
enum TeaType: String {
    case black
    case green
    case fruit
}

struct Tea: MenuProtocol {

    var type: TeaType
    var name: String { type.rawValue + " tea"}
    var cost: Double
    
    func getCost(discount: Int) -> Double {
        guard discount <= 50 else {
            print("Скидка невозможна")
            return cost
        }
        return cost * Double(discount) / 100
    }
}

//Создайте ещё 3 кафе, для которых класс Cafe будет родительским.
class FirstCafe: Cafe {
    //Сделать так, чтобы в первом из трёх классов наследников (например, FirstCafe) функция add помимо того, что выполняла всё тоже самое, что и в родительском классе, печатала в консоль стоимость добавляемой позиции.
    override func add(newPosition: MenuProtocol) {
        print(newPosition.cost)
    }
}
class SecondCafe: Cafe {
    
}
class ThirdCafe: Cafe {
    
}

//Создать класс автомата с едой, не реализовывать в нём ни методов, ни свойств, однако, этот класс должен уметь делать всё тоже самое, что и FirstCafe.
//Сделать так, чтобы от класса автомата с напитками нельзя было наследоваться.
final class VedingMashin: FirstCafe {
   
}

//Создайте класс кафе, в нём должен быть массив с наименованиями меню и инициализатор.
class Cafe {
    private var menu: [MenuProtocol]
    
    init(menu: [MenuProtocol]) {
        self.menu = menu
    }

   //Добавить в родительский класс функцию (add) по добавлению новой позиции в меню. Саму переменную меню сделать приватной, если она ещё таковой не является.
    func add(newPosition: MenuProtocol) {
        menu.append(newPosition)
    }
    func getMenu() {
        menu.forEach { a in
            print("\(a.name) - \(a.cost) рублей")
        }
    }
}

let blackEvening = Tea(type: .black, cost: 100)
let whiteEvening = Tea(type: .green, cost: 110)
let fruitEvening = Tea(type: .fruit, cost: 120)


var veding = VedingMashin(menu: [blackEvening, whiteEvening])
veding.add(newPosition: fruitEvening)
veding.getMenu()
