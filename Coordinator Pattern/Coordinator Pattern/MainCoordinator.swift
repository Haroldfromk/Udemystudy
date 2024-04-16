//
//  MainCoordinator.swift
//  Coordinator Pattern
//
//  Created by Dongik Song on 3/19/24.
//

import Foundation
import UIKit

class MainCoordinator : Coordinator {
    
    var navigationControlller: UINavigationController?
    
    func eventOccurred(with type: Event) {
        switch type {
        case .buttonTapped :
            let vc : UIViewController & Coordinating  = SecondViewController() 
            
            navigationControlller?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        var vc : UIViewController & Coordinating = ViewController()
        
        vc.coordinator = self
        
        navigationControlller?.setViewControllers([vc], animated: false)
    }
    
    
}
