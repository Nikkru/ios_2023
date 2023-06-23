import Foundation

// 1. Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, следующий аргумент это годовой процент, третий аргумент это срок Функция возвращает сколько денег получит пользователь по итогу.

func getMoney(deposit: Double, interest: Double, period: Int) -> Double {
    
    var sum = deposit
    
    guard period != 0 else {
        return deposit
    }
    
    for i in 1 ... period {
        sum += sum / 100 * interest
        print("in \(i) the deposit would up to \(sum) coins")
    }
    return sum
}

let sum = getMoney(deposit: 100.0, interest: 10.0, period: 3)


// 2. Создать перечисление, которое содержит 3 вида пиццы и создать переменные с каждым видом пиццы.

enum Pizza {
    case margherita
    case sicilian
    case hawaiian
}

let m: Pizza = .margherita
let s: Pizza = .sicilian
let h: Pizza = .hawaiian


// 3. Добавить возможность получения названия пиццы через rawValue

enum NewPizza: String {
    case margherita = "Margherita Pizza"
    case sicilian = "Sicilian Pizza"
    case hawaiian = "Hawaiian Pizza"
}

let m2: NewPizza = .margherita
let s2: NewPizza = .sicilian
let h2: NewPizza = .hawaiian

print("\n" + m2.rawValue)
print("\n" + s2.rawValue)
print("\n" + h2.rawValue)
