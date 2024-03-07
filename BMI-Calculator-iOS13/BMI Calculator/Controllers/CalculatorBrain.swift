//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Dongik Song on 3/2/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit


struct CalculatorBrain {
    
    var bmi : BMI?
    
    
    func getBMIValue() -> String {
        
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
        
    }
    
    func getAdvice() -> String {
        let advice = bmi?.advice ?? ""
        return advice
    }
    
    func getColor() -> UIColor {
        let color = bmi?.color ?? UIColor.red
        return color
    }
    
    
    mutating func calculateBMI(height : Float, weight : Float){
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
            
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
            
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        }
        
    }
    

    
    
}
    //struct CalculatorBrain {
    //
    //    var calculatedBMIValue : String = ""
    //
    //    mutating func calculateBMI(height : Float, weight : Float){
    //        calculatedBMIValue = String(format: "%.1f", (weight / (height * height)))
    //
    //    }
    //
    //    func getBMIValue() -> String {
    //
    //        return calculatedBMIValue
    //    }
    //}

