//
//  ViewController.swift
//  retro-calculator
//
//  Created by Ryan Collins on 2016-02-24.
//  Copyright © 2016 Ryan Collins. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var display:UILabel!

    var buttonSound: AVAudioPlayer!
    var userIsTyping = false
    var calculator = Calculator()
    
    @IBAction func nubmerPressed(button: UIButton!) {
        buttonSound.play()
        userIsTyping = true
        if display.text == "0" {
            display.text = String(button.tag)
        } else {
            display.text?.appendContentsOf(String(button.tag))
        }
    }
    
    @IBAction func operandPressed(button: UIButton!) {
        calculator.appendToStack(display.text)
        var operatorValue: String
        
        switch button.tag {
        case 10:
            operatorValue = "/"
        case 11:
            operatorValue = "*"
        case 12:
            operatorValue = "-"
        case 13:
            operatorValue = "+"
        default:
            operatorValue = ""
        }
        
        calculator.appendToStack(operatorValue)
        userIsTyping = false
        display.text = "0"
        
    }
    
    
    @IBAction func equalPressed(sender: UIButton) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonAudioFilePath = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: buttonAudioFilePath!)
        
        do {
            
          try buttonSound = AVAudioPlayer(contentsOfURL: soundURL)
            buttonSound.volume = 0.25
            buttonSound.prepareToPlay()
            
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

