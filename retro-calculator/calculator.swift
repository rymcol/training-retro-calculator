//
//  calculator.swift
//  retro-calculator
//
//  Created by Ryan Collins on 2016-03-03.
//  Copyright © 2016 Ryan Collins. All rights reserved.
//

import Foundation

class Calculator {
    
    var operationStack: [String]
    var lastResult: Double
    
    init () {
        self.operationStack = [String]()
        self.lastResult = 0
    }
    
    func appendToStack (addThis: String?) {
        if addThis == nil {
            return
        } else {
            self.operationStack.append(addThis!)
            return
       }
    }
    
    func calculate () -> String {
        
        let operation = self.operationStack[1]
        
        switch operation {
        case "*":
            let result = Double(self.operationStack[0])! * Double(self.operationStack[2])!
            return String(result)
        case "+":
            let result = Double(self.operationStack[0])! + Double(self.operationStack[2])!
            return String(result)
        case "-":
            let result = Double(self.operationStack[0])! - Double(self.operationStack[2])!
            return String(result)
        case "/":
            let result = Double(self.operationStack[0])! / Double(self.operationStack[2])!
            return String(result)
        default:
            return "Error"
        }
    }
    
    
}