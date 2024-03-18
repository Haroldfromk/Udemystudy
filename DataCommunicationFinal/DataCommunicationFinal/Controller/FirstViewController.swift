
import UIKit

protocol SendProtocol : AnyObject {
    func sendData(data : String)
}

class FirstViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate : SendProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goProtocol(_ sender: UIButton) {
        if let secondVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController {
            
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    
}

