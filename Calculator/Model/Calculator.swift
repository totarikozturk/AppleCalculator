//
//  Calculatore.swift
//  Calculator
//
//  Created by TarıkOzturk on 25.05.2022.
//

import Foundation

struct Calculator {
    
    var previousValue = ""
    var newValue = ""
    var resultValue = ""
    var mathOperator = ""
    var decimalPressed = false
    
    mutating func numberButtonPressed (_ number: String) -> String {
        if !resultValue.isEmpty {
            self.newValue = number
            self.resultValue = ""
        } else {
            if (number == ".") {
                if self.decimalPressed != true {
                    self.newValue += number
                    self.decimalPressed = true
                }
            }else {
                self.newValue += number
            }
        }
        return self.newValue
    }
    
    
    mutating func mathOperatorPressed (_ mathOperator: String) -> String {
        if resultValue.isEmpty {
            self.previousValue = self.newValue
        } else {
            self.previousValue = self.resultValue
        }
        self.newValue = ""
        self.decimalPressed = false
        self.mathOperator = mathOperator
        self.resultValue = ""
        return ""
    }
    
    mutating func equalButtonPressed() -> String {
        self.decimalPressed = false
        
        let prevDoubleValue = Double(self.previousValue)
        let newDoubleValue = Double(self.newValue)
        
        switch self.mathOperator {
        case "+" :
          //  resultValue = String(format: "%f", (prevDoubleValue! + newDoubleValue!)) // convert result format 0.00
            resultValue = String(format: "%g", (prevDoubleValue! + newDoubleValue!))   // convert result format normal
        case "-" :
         //   resultValue = String(format: "%f", (prevDoubleValue! - newDoubleValue!)) // convert result format 0.00
            resultValue = String(format: "%g", (prevDoubleValue! - newDoubleValue!))   // convert result format normal
        case "X" :
         //   resultValue = String(format: "%f", (prevDoubleValue! * newDoubleValue!)) // convert result format 0.00
            resultValue = String(format: "%g", (prevDoubleValue! * newDoubleValue!))   // convert result format normal
        case "/" :
          //  resultValue = String(format: "%f", (prevDoubleValue! / newDoubleValue!))  // convert result format 0.00
            resultValue = String(format: "%g", (prevDoubleValue! / newDoubleValue!))    // convert result format normal
        default:
            self.resultValue = self.newValue
        }
        self.previousValue = self.resultValue
        return self.resultValue
    }
    
    mutating func clearButtonPressed() -> String {
        self.previousValue = ""
        self.newValue = ""
        self.resultValue = ""
        self.mathOperator = ""
        self.decimalPressed = false
        return "0"
    }
    
    mutating func plusminusPressed(_ currentValue: String) -> String {
        if currentValue == "0" || currentValue == "0.00" {
            return "0"
        } else {
            let resultDoubleValue = Double(currentValue)!
            let reversedValue = resultDoubleValue * -1.0
           // self.resultValue = String(format: "%.2f", reversedValue) // convert result format 0.00
            self.resultValue = String(format: "%g", reversedValue)     // convert result format normal
            return self.resultValue
        }
    }
    
    mutating func percentPressed(_ currentValue: String) -> String {
        if currentValue == "0" || currentValue == "0.00" {
            return "0"
        } else {
            let resultDoubleValue = Double(currentValue)!
            let reversedValue = resultDoubleValue * 0.01
            //self.resultValue = String(format: "%.2f", reversedValue)  // convert result format 0.00
            self.resultValue = String(format: "%g", reversedValue)      // convert result format normal
            return self.resultValue
        }
    }
    
}
