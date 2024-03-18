
import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var displayLabel: UILabel!
    
    var message : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayLabel.text = message
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
    

}
