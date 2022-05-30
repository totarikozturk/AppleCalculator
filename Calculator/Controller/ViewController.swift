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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        resultLabel.text = calculator.clearButtonPressed()
    }
    @IBAction func plusMinusPressed(_ sender: UIButton) {
        resultLabel.text = calculator.plusminusPressed(resultLabel.text ?? "0")
    }
    @IBAction func percentPressed(_ sender: UIButton) {
        resultLabel.text = calculator.percentPressed(resultLabel.text ?? "0")
    }
    @IBAction func numberPressed(_ sender: UIButton) {
        resultLabel.text = calculator.numberButtonPressed(sender.currentTitle!)
    }
    @IBAction func mathButtonPressed(_ sender: UIButton) {
        resultLabel.text = calculator.mathOperatorPressed(sender.currentTitle!)
    }
    @IBAction func equalPressed(_ sender: UIButton) {
        resultLabel.text = calculator.equalButtonPressed()
    }
}
