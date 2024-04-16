//
//  SecondViewController.swift
//  Coordinator Pattern
//
//  Created by Dongik Song on 3/19/24.
//

import UIKit

class SecondViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Second"
        view.backgroundColor = .green
        
        
    }
    
   

}
