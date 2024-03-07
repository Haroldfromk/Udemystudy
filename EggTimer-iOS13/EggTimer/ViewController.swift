//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft" : 3, "Medium" : 4, "Hard" : 7]
    
    var totalTime = 0
    var secondsPassed = 0
    var player : AVAudioPlayer?
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        titleLabel.text = "\(hardness) selected!"
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        progressBar.progress = 0.0
        secondsPassed = 0
        player?.stop()
    }
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func updateTimer() {
        //example functionality
        if secondsPassed < totalTime {
            
            let percentageProgress : Float = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = Float(percentageProgress)
            
            
            secondsPassed += 1
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            progressBar.progress = 1.0
            playSound()
        }
        
    }
    
}
