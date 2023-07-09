import Foundation

// 1.Создать перечисление с видами пиццы (хотя бы 4-5 кейсов).

//enum PizzaKind {
//    case margherita
//    case sicilian
//    case hawaiian
//    case pepperoni
//}

// 2. Создать структуру пиццы.
//Она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки (например, дополнительно добавить пепперони, помидоры, сыр).
//Вид пиццы должен быть вложенным типом для структуры пиццы.
//Подсказка: добавки лучше также сделать перечислением.

struct Pizza {
    
    enum PizzaKind: String {
        case margherita = "Маргарита"
        case sicilian = "Сицилийская"
        case hawaiian = "Гавайсткая"
        case pepperoni = "Пепперони"
    }
    
    enum PizzaThiсk: String {
        case thin = "тонкая"
        case thick = "толстая"
    }
    
    enum PizzaAdditives: String {
        case parmesan = "сыр Пармезан"
        case pineapple = "ананас"
        case mushrooms = "шаминьоны"
        case olives = "оливки"
        case anchovy = "анчоусы"
        case tomato = "помидоры"
        case mozarela = "моцарела"
    }
    
    var name: String
    var cost: Double
    var kind: PizzaKind
    var ingredients: [PizzaAdditives]
    var pizzaThick: PizzaThiсk
}

// 3. Создать класс пиццерии, добавить массив с возможными видами пиццы. Переменная с массивом должна быть приватной. Массив задаётся в инициализаторе.
// 4. Написать в классе пиццерии функции для добавления нового вида пиццы и для получения всех доступных пицц.

class Pizzeria {
    
    private var pizzaMenu: [Pizza]
    
    init(pizzaMenu: [Pizza]) {
        self.pizzaMenu = pizzaMenu
    }
    
    func addPizza(pizza: Pizza) {
        self.pizzaMenu.append(pizza)
    }
    
    func printMenu() {
        self.pizzaMenu.forEach { pizza in
            print(" \(pizza.name) - \(pizza.pizzaThick.rawValue) пицца типа '\(pizza.kind.rawValue)' за \(pizza.cost) рублей.")
            print("Начинка:")
            pizza.ingredients.forEach { a in
                print(" - \(a.rawValue)")
            }
        }
    }
    
    func getAllPizza() -> [Pizza] {
        return self.pizzaMenu
    }
    
    func getCost(name: String) -> Double? {
//        guard pizzaMenu.contains(where: { $0.name == name })
//        else {
//            print("Пицца \(name) в данном меню отсутвует")
//            return nil
//        }
//
//        return pizzaMenu.first { pizza in
//            pizza.name == name
//        }?.cost
        guard let costT = pizzaMenu.first(where: { pizza in
            pizza.name == name })?.cost else {
            print("Пицца \(name) в данном меню отсутвует")
            return nil
        }
        print("Пицца \(name) стоит \(costT) рублей")
        return costT
    }
}

let pipperoni = Pizza(name: "Pipperoni", cost: 100.0, kind: .pepperoni, ingredients: [.parmesan, .olives], pizzaThick: .thick)

let sicilian = Pizza(name: "Cicilian", cost: 130.0, kind: .sicilian, ingredients: [.parmesan, .olives, .anchovy], pizzaThick: .thick)

let margarita = Pizza(name: "Margarita", cost: 123.0, kind: .margherita, ingredients: [.mozarela, .tomato], pizzaThick: .thick)

let pizzaHut = Pizzeria(pizzaMenu: [pipperoni, sicilian, margarita])

pizzaHut.printMenu()
pizzaHut.getCost(name: "Cicilian")
