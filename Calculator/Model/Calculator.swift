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
            if number == "." {
                if self.decimalPressed != true {
                    self.newValue += number
                    self.decimalPressed = true
                }
            }else {
                self.newValue = ""
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
            self.newValue = ""
        }
        self.newValue = resultValue
        self.decimalPressed = false
        self.mathOperator = mathOperator
        self.resultValue = ""
        return ""
    }
    
    mutating func equalButtonPressed() -> String {
        self.decimalPressed = false
        
        let prevDoubleValue = Double(self.previousValue)
        let newDoubleValue = Double(self.newValue)
        
        if prevDoubleValue != nil && newDoubleValue != nil {
            switch self.mathOperator {
            case "+" :
                resultValue = String(format: "%g", (prevDoubleValue! + newDoubleValue!))
            case "-" :
                resultValue = String(format: "%g", (prevDoubleValue! - newDoubleValue!))
            case "X" :
                resultValue = String(format: "%g", (prevDoubleValue! * newDoubleValue!))
            case "/" :
                resultValue = String(format: "%g", (prevDoubleValue! / newDoubleValue!))    
            default:
                self.resultValue = self.newValue
            }
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
            self.resultValue = String(format: "%g", reversedValue)
            return self.resultValue
        }
    }
    
    mutating func percentPressed(_ currentValue: String) -> String {
        if currentValue == "0" || currentValue == "0.00" {
            return "0"
        } else {
            let resultDoubleValue = Double(currentValue)!
            let reversedValue = resultDoubleValue * 0.01
            self.resultValue = String(format: "%g", reversedValue)
            return self.resultValue
        }
    }
}
