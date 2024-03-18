

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextBtn(_ sender: UIButton) {
        
        if let secondVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController {
            secondVC.dataClosure = { data in
                self.displayLabel.text = data
            }
            
            self.present(secondVC, animated: true)
        }
        
    }
    
}

