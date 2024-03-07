// Enemy initialize

let skeleton1 = Enemy(health: 100, attackStrength: 10)
//print(skeleton.health)
let skeleton2 = skeleton1

skeleton1.takeDamage(amount: 10)
skeleton1.takeDamage(amount: 10)
skeleton2.takeDamage(amount: 10)

print(skeleton2.health) // 70
// skeleton1을 참조하기에 같이 떨어진다.
// 만약 Enemy가 structure라면 80 / 90 이렇게 각자 값을 갖는다.
//skeleton.move()
//skeleton.attack()

//let skeleton2 = Enemy()
//let skeleton3 = Enemy()
//여러 skeleton들을 만들 수 있다.

//let dragon = Dragon() // 상속받았기에 Enemy classr의 properties모두 사용이 가능하다.
//dragon.attackStrength = 15
//dragon.move()
//dragon.attack()
//dragon.wingSpan = 5 // 새로 추가한 property 사용가능.
//dragon.talk(speech: "My teeth are swords! My claws are spears! My wings are a hurricane")
