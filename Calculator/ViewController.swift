//
//  ViewController.swift
//  Calculator
//
//  Created by TarıkOzturk on 23.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var calculator = Calculator()
    
    @IBOutlet var resultLabel: UILabel!
    
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        return formatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        resultLabel.text = calculator.clearButtonPressed()
    }
    
    @IBAction func plusMinusPressed(_ sender: UIButton) {
        resultLabel.text = calculator.plusminusPressed(resultLabel.text ?? "0")
        
        /* let amount = Double(calculator.plusminusPressed(resultLabel.text ?? "0"))
         let formattedString = formatter.string(for: amount)
         resultLabel.text = formattedString */
    }
    
    @IBAction func percentPressed(_ sender: UIButton) {
        resultLabel.text = calculator.percentPressed(resultLabel.text ?? "0")
        
        /*  let amount = Double(calculator.plusminusPressed(resultLabel.text ?? "0"))
         let formattedString = formatter.string(for: amount)
         resultLabel.text = formattedString */
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        resultLabel.text = calculator.numberButtonPressed(sender.currentTitle!)
        
        /* let amount = Double(calculator.numberButtonPressed(sender.currentTitle!))
         let formattedString = formatter.string(for: amount)
         resultLabel.text = formattedString */
    }
    
    @IBAction func mathButtonPressed(_ sender: UIButton) {
        resultLabel.text = calculator.mathOperatorPressed(sender.currentTitle!)
        
        /*  let amount = Double(calculator.mathOperatorPressed(sender.currentTitle!))
         let formattedString = formatter.string(for: amount)
         resultLabel.text = formattedString */
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        resultLabel.text = calculator.equalButtonPressed()
        
        /*  let amount = Double(calculator.equalButtonPressed())
         let formattedString = formatter.string(for: amount)
         resultLabel.text = formattedString  */
        
    }
}
