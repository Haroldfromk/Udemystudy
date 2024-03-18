

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func dataSendBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "goToVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToVC" {
            let secondVC = segue.destination as? SecondViewController
            if let text = textField.text {
                secondVC?.message = text
            }
        }
    }
    
}

