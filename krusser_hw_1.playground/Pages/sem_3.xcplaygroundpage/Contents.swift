//: [Previous](@previous)

import Foundation

let arrayNubers: [Int] = [5, 6, -14, 25]
let arraySortedNumbers = arrayNubers.sorted(by: <)

let arrayMapNumbers = arrayNubers.map { $0 + 5 }

let arrayFilterNumbers = arrayNubers
    .filter({ $0 >= 0 && $0 != 12 })
    .map({ $0 * 2 })

var dictionary: [Int : String] = [:]
let arrayValue = [2, 6, 25, 4, 2, 2, 10, 2]
let arrayNewValue = Array(Set(arrayValue))

func isArrayMoreHundred(array: [Int]) -> Bool {
    
    return array.reduce(0, +) > 100
}
isArrayMoreHundred(array: arrayValue)

dictionary = [1:"One",2:"Two",3:"Three",4:"Four",5:"Five",6:"Six",7:"Seven"]

var closure = { (dictionary: [Int : String]) -> Void in
    for (key, value) in dictionary {
        if key > 5 {
            print(value)
        }
    }
}
closure(dictionary)

enum Tea: String {
    case greeen = "Green tea"
    case black = "Black tea"
    case fruit = "Fruit tea"
}

let dictionaryTea: [Tea:Double] = [ .greeen:100,
                                    .black:200,
                                    .fruit:300]
let multityple = { (tea: Tea, multGreen: Double, multBlack: Double, multFruit: Double, price: Double) -> (Double) in
    switch tea {
    case .greeen: return price * multGreen
    case .black: return price * multBlack
    case .fruit: return price * multFruit
    }
}

func teaPriceFix(dict: [Tea:Double], mGreen: Double, mBlack: Double, mFruit: Double) -> ([Tea:Double]) {
    var dictTemp = dict
    dictTemp[.greeen]! *= mGreen
    dictTemp[.black]! *= mBlack
    dictTemp[.fruit]! *= mFruit
    return dictTemp
    }

teaPriceFix(dict: dictionaryTea, mGreen: 1.3, mBlack: 0.4, mFruit: 0.95)

func findMidle( startPoint: [Double], finishPoint: [Double]) -> [Double] {
    var midlePoint = [Double]()
    guard startPoint.count == finishPoint.count && startPoint.count == 2 else { print("Значения не соответствуют паре цифр координат")
        return midlePoint
    }
    for i in 0 ..< startPoint.count {
        print(i)
        print(finishPoint[i])
        midlePoint.append((startPoint[i] + finishPoint[i]) / 2)
    }
    return midlePoint
}

var midlePoint = findMidle(startPoint: [0,3], finishPoint: [1,6])
//: [Next](@next)


func createArray(array: [Int]) -> [Int]? {
    var newArray = [Int]()
    guard array.count == 4 else {
        return nil
    }
    newArray.append(array.first!)
    newArray.append(array[1] + array[2])
    newArray.append(array.last!)
    
//    return newArray.sorted(by: <)
    return [array[0], array[1] + array[2], array[3]].sorted(by: <)
}

var newArray = createArray(array: [0,1,2,6])

var bigArray = [Int]()
for i in 1 ... 50 where i%2==0 {
    bigArray.append(i)
}

let sum = { (a: Int, b: Int) -> Int in
    let sum = a + b
    print(sum)
    return sum
}

func test(a: (Int) -> Void) {
    print(type(of: a))
}

test(a: {_ in})

sum(7, 10)


