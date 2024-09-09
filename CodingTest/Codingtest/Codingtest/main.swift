/***
 A+B
 [문제]
 두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.
 
 
 [입력]
 첫째 줄에 A와 B가 주어진다. (0 < A, B < 10)
 
 [출력]
 첫째 줄에 A+B를 출력한다.
 
 [예제 입력 1]
 1 2
 
 [예제 출력 1]
 3
 ***/

import Foundation

// 함수 정의
func first() {
    let input = readLine()!.split(separator: " ")
    let A = Int(input[0])!
    let B = Int(input[1])!
    print(A + B)
}


//main()

/***
 [문제]
 두 정수 A와 B를 입력받은 다음, A-B를 출력하는 프로그램을 작성하시오.
 
 [입력]
 첫째 줄에 A와 B가 주어진다. (0 < A, B < 10)
 
 [출력]
 첫째 줄에 A-B를 출력한다.
 
 [예제 입력 1]
 3 2
 
 [예제 출력 1]
 1
 
 ***/
func second() {
    
    var input = readLine()!.split(separator: " ")
    
    var A = Double(input[0])!
    var B = Double(input[1])!
    
    print(A / B)
    
}

//second()

func third() {
    let input = readLine()!.split(separator: " ")
    let A = Int(input[0])!
    let B = Int(input[1])!
    
    print(A+B)
    print(A-B)
    print(A*B)
    print(A/B)
    print(A%B)
}

//third()

func fourth() {
    let input = readLine()!
    
    print(input+"??!")
}

//fourth()

func fifth() {
    let input = Int(readLine()!)!
    let answer = input - 543
    print(answer)
}

//fifth()

func sixth() {
    let input = readLine()!.split(separator: " ")
    let A = Int(input[0])!
    let B = Int(input[1])!
    let C = Int(input[2])!
    
    print((A+B)%C)
    print(((A%C) + (B%C))%C)
    print((A*B)%C)
    print(((A%C)*(B%C))%C)
}
//sixth()

func seventh() {
    var first = Int(readLine()!)!
    var second = Int(readLine()!)!
    
    print(first*(second%10))
    print(first*((second/10)%10))
    print(first*(second/100))
    print(first*second)
    
}

//seventh()

func eightth() {
    let input = readLine()!.split(separator: " ")
    let A = Int(input[0])!
    let B = Int(input[1])!
    let C = Int(input[2])!
    
    print(A + B + C)
}

//eightth()

func nineth() {
    print("\\    /\\")
    print(" )  ( ')")
    print("(  /  )")
    print(" \\(__)|")
}

//nineth()

func tenth() {
    print("|\\_/|")
    print("|q p|  /}")
    //print("( 0 )\"""\\")
    print("|\"^\"`   |")
    print("||_/=\\__|")
}

tenth()

func eleventh() {
    let input = readLine()?.split(separator: " ")
    let A = Int(input![0])
    let B = Int(input![1])
    
    let answer = A! > B! ? ">" : A! < B! ? "<" : "=="
    
    print(answer)
}

//eleventh()

func twelveth() {
    let input = Int(readLine()!)!
    
    switch input {
    case 90...100 :
        print("A")
    case 80...89 :
        print("B")
    case 70...79 :
        print("C")
    case 60...69 :
        print("D")
    default:
        print("F")
    }
}

//twelveth()

func thirteenth() {
    let input = Int(readLine()!)!
    
    
}

thirteenth()
