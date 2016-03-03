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
    
    @IBAction func nubmerPressed(button: UIButton!) {
        buttonSound.play()
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

