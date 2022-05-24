//
//  ViewController.swift
//  Calculator
//
//  Created by TarıkOzturk on 23.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnLabel: Double = 0
    var firstNumber: Double = 0
    var mathFunction: Bool = false
    var whichMathfunction = 0
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func numberButtons(_ sender: UIButton) {
        if mathFunction {
            resultLabel.text = String(sender.tag-1)
            numberOnLabel = Double(resultLabel.text!)!
            mathFunction = false
        }else {
            resultLabel.text = resultLabel.text! + String(sender.tag-1)
            numberOnLabel = Double(resultLabel.text!)!
        }
    }
    
    @IBAction func functionButtonsPressed(_ sender: UIButton) {
        if resultLabel.text != "" && sender.tag != 19 && sender.tag != 18 && sender.tag != 17 && sender.tag != 16 && sender.tag != 11 {
            firstNumber = Double(resultLabel.text!)!
            if sender.tag == 12 // plus
            {
                resultLabel.text = "+"
            }
            else if sender.tag == 13 // minus
            {
                resultLabel.text = "-"
            }
            else  if sender.tag == 14 // multiplication
            {
                resultLabel.text = "x"
            }
            else if sender.tag == 15 // divide
            {
                resultLabel.text = "/"
            }
            
            whichMathfunction = sender.tag
            mathFunction = true
            
        }
        else if sender.tag == 11 {
            
            if whichMathfunction == 12 {
                resultLabel.text! = String(firstNumber + numberOnLabel)
            }
            else if whichMathfunction == 13 {
                resultLabel.text! = String(firstNumber - numberOnLabel)
            }
            else if whichMathfunction == 14 {
                resultLabel.text! = String(firstNumber * numberOnLabel)
            }
            else if whichMathfunction == 15 {
                resultLabel.text! = String(firstNumber / numberOnLabel)
            }
        }
        else if sender.tag == 18 {
            resultLabel.text = ""
            firstNumber = 0
            numberOnLabel = 0
            whichMathfunction = 0
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text! = "0"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
}

