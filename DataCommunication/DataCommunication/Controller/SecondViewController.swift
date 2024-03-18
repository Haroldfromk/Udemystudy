

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var secondLabel: UILabel!
    
    var message : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getText()
    }
    
    func getText() {
        if let gotMessage = message {
            secondLabel.text = gotMessage
        } else {
            secondLabel.text = "sending text failed"
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    

}
