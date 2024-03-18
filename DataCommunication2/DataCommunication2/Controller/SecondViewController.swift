

import UIKit

protocol SendDelegate {
    func sendData(data : String)
}

class SecondViewController: UIViewController {

   
    @IBOutlet weak var textField: UITextField!
    
    var delegate : SendDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    @IBAction func dataSendButton(_ sender: UIButton) {
        if let text = textField.text {
            delegate?.sendData(data: text)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
