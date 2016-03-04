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
    
    init () {
        self.operationStack = [String]()
    }
    
    func appendToStack (addThis: String?) {
        if addThis != nil {
            return
        } else {
            self.operationStack.append(addThis!)
            return
       }
    }
    
    func calculate () -> String {
        return ""
    }
    
    
}