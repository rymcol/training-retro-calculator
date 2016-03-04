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
    
    var leftString = ""
    var rightString = ""
    var lastTotal = "0"
    var currentOperation: Operation = Operation.Empty
    
    enum Operation: String {
        case Multiply = "*"
        case Divide = "/"
        case Add = "+"
        case Subtract = "-"
        case Empty = ""
    }
    
    @IBAction func nubmerPressed(button: UIButton!) {
        playSound()
        userIsTyping = true
        if display.text == "0" {
            display.text = String(button.tag)
        } else {
            display.text?.appendContentsOf(String(button.tag))
        }
    }
    
    @IBAction func operandPressed(button: UIButton!) {
        playSound()
        
        leftString = display.text!
        
        switch button.tag {
        case 10:
            currentOperation = Operation.Divide
        case 11:
            currentOperation = Operation.Multiply
        case 12:
            currentOperation = Operation.Subtract
        case 13:
            currentOperation = Operation.Add
        default:
            currentOperation = Operation.Empty
        }
        
        userIsTyping = false
        display.text = "0"
        
    }
    
    
    @IBAction func equalPressed(sender: UIButton) {
        playSound()
        rightString = display.text!
        let result = calculate(currentOperation)
        display.text = result
        lastTotal = result
        userIsTyping = false
    }
    
    @IBAction func clear(sender: UIButton) {
        playSound()
        userIsTyping = false
        display.text = "0"
        leftString = ""
        rightString = ""
        lastTotal = "0"
    }
    
    func calculate (operation: Operation) -> String {
        
        if lastTotal != "0" {
            leftString = lastTotal
        }
        
        switch operation {
            case Operation.Add:
                let result = Double(leftString)! + Double(rightString)!
                return String(result)
            case Operation.Multiply:
                let result = Double(leftString)! * Double(rightString)!
                return String(result)
            case Operation.Divide:
                let result = Double(leftString)! / Double(rightString)!
                return String(result)
            case Operation.Subtract:
                let result = Double(leftString)! - Double(rightString)!
                return String(result)
            default:
                return "Error"
        }
    }
    
    func playSound() {
        if buttonSound.playing {
            buttonSound.stop()
        } else {
            buttonSound.play()
        }
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

