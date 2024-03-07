import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progresBar: UIProgressView!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {

        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight == true {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        // setTitle의 값을 update해주기 위해 정의해준다.
        // 적지않으면 update되지않음!
        let getAnswer0 = quizBrain.getAnswerText0()
        let getAnswer1 = quizBrain.getAnswerText1()
        let getAnswer2 = quizBrain.getAnswerText2()
    
        zeroButton.setTitle(getAnswer0, for: .normal)
        firstButton.setTitle(getAnswer1, for: .normal)
        secondButton.setTitle(getAnswer2, for: .normal)
        
        progresBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        zeroButton.backgroundColor = UIColor.clear
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
    }
    
}

