import UIKit

print("задание №1\n")

// задание №1 Вывести в консоль все чётные числа от 0 до 100, включая 0.

for i in 0...100 where i % 2 != 0 {
    print(i)
}

print("\nзадание №2\n")

// задание №2. Создать две переменных: одна равна 7, другая 20. Если результат перемножения этих переменных больше 10, то вывести в консоль первую переменную, в противном случае вывести вторую.

var a: Int = 7
var b: Int = 20

a * b > 10 ? print(a) : print(b)

print("\nзадание №3\n")

// задание №3. Создайте переменную “k”, равную 9. В диапазоне от 10 до 50, но только по нечётным числам, если текущее число плюс “k” — чётное, то увеличьте “k” на 2, в противном случае выведите в консоль “Next” и перейдите к следующей итерации.

var k: Int = 9

for i in 10 ... 50 where i % 2 != 0 {
    if k % 2 == 0 {
        k += 2
        print(k)
    } else {
        print("Next")
        continue
    }
}

print("\nзадание №4\n")

// задание №4. Создайте переменную “k”, равную 9. В диапазоне от 10 до 50, но только по нечётным числам, если текущее число плюс “k” — чётное, то увеличьте “k” на 1, в противном случае выведите в консоль “Next” прекратите выполнение цикла.

k = 9

for i in 10 ... 50 where i % 2 != 0 {
    if k % 2 == 0 {
        k += 1
        print(k)
    } else {
        print("Next")
        continue
    }
}

