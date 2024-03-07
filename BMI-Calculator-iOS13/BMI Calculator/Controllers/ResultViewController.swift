//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Dongik Song on 3/1/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue : String?
    var advice : String?
    var color : UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var adviceLabel: UILabel!
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
        adviceLabel.text = advice
        bmiLabel.text = bmiValue
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
