//
//  ViewController.swift
//  BullsEye
//
//  Created by student on 9/1/2562 BE.
//  Copyright © 2562 BUU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    @IBOutlet weak var totalScore:UILabel!
    @IBOutlet weak var totalRound:UILabel!
    var currentValue : Int = 0
    var targetValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        targetValue = Int.random(in: 1...100)
        print("TargetValue = \(targetValue)")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showAlert(){
        var difference = abs(currentValue - targetValue)
        var points=100-difference
        score += points
        
        
        let  title: String
        if difference == 0{
            title = "Perfect!"
        }else if difference<5{
            title = "You most had it!"
        }else if difference<10{
            title = "pretty good!"
        }else{
            title = "Not even close..."
        }
        
        
        
        let message = " your score  \(points) points"
        
        
        
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func slidemove(_ slider :UISlider){
        currentValue = lroundf(slider.value)
        
    }
    
    @IBAction func startOver(_ sender:UIButton){
    score = 0
    round = 0
    startNewRound()
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value  = Float(currentValue)
        updateLabel()
        print("TargetValue = \(targetValue)")
        
    }
    
    func updateLabel(){
        targetLabel.text = String(targetValue)
        totalScore.text = String(score)
        totalRound.text = String(round)
    }
    
    
}

