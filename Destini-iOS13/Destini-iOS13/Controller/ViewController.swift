import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI() // As soon as we launch this app, this trigger will be operated
    }
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let userChoice = sender.currentTitle!
            
        storyBrain.selectDestination(userChoice)

        updateUI()
        

    }

    func updateUI () {
        storyLabel.text = storyBrain.getTitle()
        
        // to update button's title, we need te declare
        let getchoice1 = storyBrain.getChoice1()
        let getchoice2 = storyBrain.getChoice2()
    
        choice1Button.setTitle(getchoice1, for: .normal)
        choice2Button.setTitle(getchoice2, for: .normal)

    }
    
}

