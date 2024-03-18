
import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func bactBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
