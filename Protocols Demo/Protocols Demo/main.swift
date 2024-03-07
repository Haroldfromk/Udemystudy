//class Bird {
//    
//    var isFemale = true
//    
//    func layEgg() {
//        if isFemale {
//            print ("The bird makes a new bird in a shell.")
//        }
//    }
//    
//    func fly () {
//        print("The bird flaps its wings and lifts off into the sky")
//    }
//}
//
//class Eagle : Bird { // 상속을 하였다.
//     
//    func soar(){
//        print("The eagle glides in the air using air currents.")
//    }
//}
//
//class Penguin : Bird {
//    func swin() {
//        print("The penguin paddles through the water.")
//    }
//}
//
//struct FlyingMuseum {
//    func flyingDemo(flyingObject : Bird) {
//        flyingObject.fly()
//    }
//}
//
//class Airplane : Bird {
//    override func fly() {
//        print ("The airplane uses its engine to lift off into the air.")
//    }
//}
//
//let myEagle = Eagle()
//let myPenguin = Penguin()
//let museum = FlyingMuseum()
//let myAirplane = Airplane()
//
//myAirplane.fly()





protocol CanFly {
    func fly()
}


class Bird {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print ("The bird makes a new bird in a shell.")
        }
    }
    
//    func fly () {
//        print("The bird flaps its wings and lifts off into the sky")
//    }
}

class Eagle : Bird, CanFly {
    func fly() {
        print("The bird flaps its wings and lifts off into the sky")
    }
    // 상속을 하였다.
    
    func soar(){
        print("The eagle glides in the air using air currents.")
    }
}

class Penguin : Bird {
    
    func swin() {
        print("The penguin paddles through the water.")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject : CanFly) {
        flyingObject.fly()
    }
}

struct Airplane : CanFly {
    func fly() {
        print ("The airplane uses its engine to lift off into the air.")
    }
}

let myEagle = Eagle()
myEagle.fly()

let myPenguin = Penguin()
let myPlane = Airplane()
let museum = FlyingMuseum()


