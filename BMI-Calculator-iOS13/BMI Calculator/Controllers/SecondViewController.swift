//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Dongik Song on 3/1/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        
        // view.backgroundColor = UIColor.red
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = bmiValue
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        // (x,y)좌표에 가로 세로가 100, 50 인 프레임 생성
        view.addSubview(label) // 우리가 알고 있는 controller를 만들었을때의 전체를 덮고 있는 view가 addsubview앞에 있는 그 view이다.
    }
    
}
