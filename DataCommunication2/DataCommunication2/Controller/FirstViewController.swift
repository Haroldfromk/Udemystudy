
import UIKit



class FirstViewController: UIViewController, SendDelegate {
    
    
  
    @IBOutlet weak var currentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func sendData(data: String) {
        currentLabel.text = data
    }

    @IBAction func getDataButton(_ sender: UIButton) {
        if let secondVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController {
            secondVC.delegate = self
            
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    
}
