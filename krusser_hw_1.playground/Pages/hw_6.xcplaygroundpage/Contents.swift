import Foundation

//Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность.
//Должностей пока может быть две: или кассир, или повар.
struct PizzeriaWorker {
    
    enum Position {
        case cashier
        case cook
    }
    var name: String
    var salary: Int
    var position: Position
}

class Pizzeria {
    //Добавить в класс пиццерии массив с работниками.
    var employees: [PizzeriaWorker]
    //Добавить в класс пиццерии свойство, в котором хранится массив столиков. У класса столика добавить свойство, в котором хранится кафе, в котором стоит столик. Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра.
    var tables: [Table]
    
    init(employees: [PizzeriaWorker], tables: [Table]) {
        self.employees = employees
        self.tables = tables
        tables.forEach { a in
            a.pointTable = self
        }
    }
}

//Создать класс столика. В нём должны быть свойство, в котором содержится количество мест, и функция, которая на вход принимает количество гостей, которое хотят посадить, возвращает true, если места хватает, и false, если места не хватает. Изначальное количество мест задаётся в инициализаторе.
class Table {
    let seats: Int
    weak var pointTable: Pizzeria?
    
    init() {
        seats = 12
    }
    
    func isEnoughSeats(guests: Int) -> Bool {
        guard guests > seats else {
            return true
        }
        return false
    }
}

var tableOne = Table()
let tableTwo = Table()

tableOne.seats
tableOne.pointTable

let workerFirst = PizzeriaWorker(name: "Tom", salary: 600, position: .cashier)
let workerSecond = PizzeriaWorker(name: "Tom", salary: 1000, position: .cook)

let pizzeriaOne = Pizzeria(employees: [workerFirst, workerSecond], tables: [tableOne, tableTwo])

tableOne.pointTable
tableTwo.pointTable
