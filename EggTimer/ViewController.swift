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
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    var timer = Timer()
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelection(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0

        titleView.text = "Cooking a \(hardness) egg..."
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
         if secondsPassed < totalTime {
            secondsPassed += 1
            
            let percentageComplete = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = percentageComplete
         } else {
            timer.invalidate()
            titleView.text = "Done!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
}
