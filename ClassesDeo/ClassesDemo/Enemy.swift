//Ememy Character를 만든다고 가정해보자.

//class Enemy {
//    var health = 100
//    var attackStrength = 10
//    
//    func move() {
//        print("Walk forwards")
//    }
//    
//    func attack() {
//        print("Land a hit, does \(attackStrength) damage.")
//    }
//}

// struct는 init이 자체적으로 있으나 class는 없어서 별도로 서술해야한다.
class Enemy {
    var health : Int
    var attackStrength : Int
    
    init(health: Int, attackStrength: Int) {
        self.health = health
        self.attackStrength = attackStrength
    }
    func takeDamage(amount : Int) {
        health = health - amount
    }
    
    func move() {
        print("Walk forwards")
    }

    func attack() {
        print("Land a hit, does \(attackStrength) damage.")
    }
}
