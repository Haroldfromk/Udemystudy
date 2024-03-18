

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func sendDataBtn(_ sender: Any) {
        
        if let text = textField.text {
            
            NotificationCenter.default.post(name: NSNotification.Name("test"), object: text)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
