

import UIKit

class SecondViewController: UIViewController {

    // Data전달 Closure
    var dataClosure : ((_ data:String) -> Void )?
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func sendDataBtn(_ sender: UIButton) {
        if let text = textField.text {
            dataClosure?(text)
        }
       
        self.dismiss(animated: true)
    }
    

}
