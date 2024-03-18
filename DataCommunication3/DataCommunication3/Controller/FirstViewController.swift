

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getDataBtn(_ sender: UIButton) {
        
        if let secondVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController {
            
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(_:)), name: NSNotification.Name("test"), object: nil)
        
    }
    
    @objc func dataReceived (_ notification : Notification) {
        
        if let text = notification.object as? String {
            displayLabel.text = text
        }
        
    }
    
}

