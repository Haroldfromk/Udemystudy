//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Dongik Song on 3/3/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var result : String?
    
    @IBOutlet weak var totalLabel: UILabel!
    
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = result ?? "56.32"
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
