//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var secondsRemaining = 60
    
    var timer = Timer()
    
    @IBOutlet weak var titleView: UILabel!
    
    @IBAction func hardnessSelection(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
         if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds left")
            secondsRemaining -= 1
            titleView.text = "Cooking..."
         } else if secondsRemaining == 0 {
            timer.invalidate()
            titleView.text = "Done!"
        }
    }
    
}
