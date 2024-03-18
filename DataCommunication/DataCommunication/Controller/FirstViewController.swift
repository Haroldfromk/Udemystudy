

import UIKit

class FirstViewController: UIViewController {
    
    
    
    @IBOutlet weak var textField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendData(_ sender: UIButton) {
        
        guard let secondVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController
        else {
            return
        }
        
        secondVC.message = textField.text
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC,animated: true,completion: nil)
        
    }
    
}

