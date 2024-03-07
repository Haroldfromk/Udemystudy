
import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculatorBrain.getBMIValue()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        let height = String(format:"%.2f", sender.value)
        
        heightLabel.text = "\(height)m"
        //print(String(format:"%.2f", currentValue))
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format:"%.0f", sender.value)
        
        weightLabel.text = "\(weight)Kg"
        //print(Int(currentValue))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        //let bmi = weight / (height * height)
        //let bmi = weight / pow(height,2)
        //bmiValue = String(format: "%.1f", bmi)
        // 새롭게 추가 버튼을 눌렀을때 다음 뷰 컨트롤러로 전환 하기 위해 작성.
//        let secondVC = SecondViewController()
//        secondVC.bmiValue = String(format: "%.1f", bmi)
//        self.present(secondVC, animated: true, completion: nil)
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let bmi = weightSlider.value / pow(heightSlider.value,2)
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            //destinationVC.bmiValue = String(format: "%.1f", bmi)
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

 
