import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progresBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    

    
    //var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
       
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // true or false
        
        // if user's answer is correct
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight == true {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        //updateUI()
        
//        let totalProgress = quiz.count
//        let currentProgress = questionNumber
//        
//        progresBar.progress = Float(currentProgress) / Float(totalProgress)
    
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progresBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
    
}

