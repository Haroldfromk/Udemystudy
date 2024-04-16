//
//  Coordinator.swift
//  Coordinator Pattern
//
//  Created by Dongik Song on 3/19/24.
//

import Foundation
import UIKit

enum Event { // 현재 여기선 열거형으로 간단하게 만들었다.
    case buttonTapped // 버튼을 탭했을 경우
    
}

protocol Coordinator {
    var navigationControlller : UINavigationController? { get set } // Root Controller 가 될 것이다.
    //var children : [Coordinator]? { get set }
    
    
    func eventOccurred(with type : Event) // 이벤트가 발생했을때
        
    func start () // 앱이 시작될때 호출하는 함수 설정
}

protocol Coordinating { // 모든 VC가 이벤트를 전달하기 위한 Coordinator에 대한 참조가 필요.
    
    var coordinator : Coordinator? { get set }
    
}
