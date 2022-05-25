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
    
    mutating func numerButtonPressed (_ number: String) -> String {
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
        
        let prevDoobleValue = Double(self.previousValue)
        let newDoobleValue = Double(self.newValue)
        
        switch self.mathOperator {
        case "+" :
            resultValue = String(format: "%g", (prevDoobleValue! + newDoobleValue!))
        case "-" :
            resultValue = String(format: "%g", (prevDoobleValue! - newDoobleValue!))
        case "X" :
            resultValue = String(format: "%g", (prevDoobleValue! * newDoobleValue!))
        case "/" :
            resultValue = String(format: "%g", (prevDoobleValue! / newDoobleValue!))
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
            let reversedValıe = resultDoubleValue * -1.0
            self.resultValue = String(format: "%g", reversedValıe)
            return self.resultValue
        }
    }
    
    mutating func percentPressed(_ currentValue: String) -> String {
        if currentValue == "0" || currentValue == "0.00" {
            return "0"
        } else {
            let resultDoubleValue = Double(currentValue)!
            let reversedValıe = resultDoubleValue * 0.01
            self.resultValue = String(format: "%g", reversedValıe)
            return self.resultValue
        }
    }
    
}
