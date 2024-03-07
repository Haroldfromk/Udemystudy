
class Dragon: Enemy { // Enemy를 적음으로써 가지고있던 properties들을 상속 받았다.
    
    var wingSpan = 2
        
    func talk (speech : String) {
        print("Says: \(speech)")
    }
    
    override func move() { // Enemy의 move()를 오버라이딩 할 수있다. 즉 다른 내용을 담을 수 있다. -> 재정의 할 수 있다.
        print("Fly forwards")
    }
    
    override func attack() {
        super.attack() // Enemy에 있는 attack()또한 그대로 사용하고 싶다면 super를 사용한다.
        print("Spits fire, does 10 damage")
    }
}
