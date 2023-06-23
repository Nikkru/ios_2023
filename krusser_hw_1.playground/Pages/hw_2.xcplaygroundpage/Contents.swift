//: [Previous](@previous)

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
//     deposit / 100 * interest * period + deposit
}

let sum = getMoney(deposit: 100.0, interest: 10.0, period: 3)
//: [Next](@next)
