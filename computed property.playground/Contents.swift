import Foundation

var pizzaInInches: Int = 16 {
    willSet {
        print("new value is \(newValue)")
    }
    didSet {
        print("old value is \(oldValue)")
    }
}

pizzaInInches = 8




var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
}

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

print(numberOfPizza)

numberOfPizza = 8
print(numberOfPeople)
