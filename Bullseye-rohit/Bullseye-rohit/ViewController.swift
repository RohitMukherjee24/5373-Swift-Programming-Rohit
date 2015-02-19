//
//  ViewController.swift
//  Bullseye-rohit
//
//  Created by bo120 on 2/16/15.
//  Copyright (c) 2015 bo120. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    var score = 0
    var round = 0
    var currentValue: Int = 50
    var targetValue: Int = 0
    override func viewDidLoad()
    {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") { let trackLeftResizable =
            trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal) }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
            let difference = abs(targetValue - currentValue)
            var points = 100 - difference
        score = score + points
        
        
        
        var title: String
        
        if difference == 0
            
        {
            
            title = "Perfect!"
            
            points += 100
            
        } else if difference < 5
            
        {
            
            title = "You almost had it!"
            
            if difference == 1
                
            {    points += 50
                
            }
            
        } else if difference < 10
            
        {
            
            title = "Pretty good!"
            
        } else
            
        {
            
            title = "Not even close..."
            
        }
        
        score += points
        
        
        

            let message = "You scored \(points) points"
           // let difference = abs(targetValue - currentValue)
           // let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
                + "\nThe difference is \(difference)"
            
        //let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        let alert = UIAlertController(title: title,
        message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default,
            handler: { action in
            self.startNewRound()
            self.updateLabels()
            })
        
        alert.addAction(action)
        //let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        //alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
            targetValue = 1 + Int(arc4random_uniform(100))
            currentValue = 50
            slider.value = Float(currentValue)
            startNewRound()
            updateLabels()
    }
    
    
    @IBAction func sliderMoved(slider: UISlider) { currentValue = lroundf(slider.value)
    }
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
    func startNewRound() {
            round += 1
            targetValue = 1 + Int(arc4random_uniform(100))
            currentValue = 50
            slider.value = Float(currentValue)
    }
    func startNewGame() {
                score = 0
                round = 0
                startNewRound()
    }
    
    func updateLabels() {
                targetLabel.text = String(targetValue)
                scoreLabel.text = String(score)
                roundLabel.text = String(round)
    }
    
    }

