//
//  CalculatorViewController.swift
//  MyAPP
//
//  Created by Gevorg Hovhannisyan on 07.04.22.
//

import Foundation
import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var calculatorOutput: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var outputs: String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ClearAll()
    }
    
    
    func ClearAll() {
        
        outputs = " "
        calculatorOutput.text = " "
        calculatorResults.text = " "
        
    }
    
    @IBAction func rez(_ sender: Any) {
        if(validInput()){
        let expression = NSExpression(format: outputs)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        calculatorResults.text = resultString
        }
        else
        {
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator unable to do math based on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool {
        
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in outputs {
            
            if specialCharacter(char: char) {
                
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous : Int = -1
        
        for index in funcCharIndexes {
            
            if (index == 0) {
                return false
            }
            if (index == outputs.count - 1) {
                return false
            }
            if(previous != -1){
                
                if (index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter (char: Character) -> Bool {
        if (char == "*")
        {
            return true
        }
        if (char == "/")
        {
            return true
        }
        if (char == "+")
        {
            return true
        }
       return false
    }
    
    func formatResult(result: Double) -> String {
        
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func AC(_ sender: Any) {
        
        ClearAll()
    }
    
    @IBAction func removeLast(_ sender: Any) {
        
        if (!outputs.isEmpty) {
            
            outputs.removeLast()
            calculatorOutput.text = outputs
        }
        
    }
    
    func addToOutput(value: String) {
        
        outputs = outputs + value
        calculatorOutput.text = outputs
        
    }
    
    @IBAction func one(_ sender: Any) {
        addToOutput(value: "1")
    }
    
    @IBAction func two(_ sender: Any) {
        addToOutput(value: "2")
        
    }
    
    @IBAction func three(_ sender: Any) {
        addToOutput(value: "3")
        
    }
    
    @IBAction func four(_ sender: Any) {
        addToOutput(value: "4")
        
    }
    
    @IBAction func five(_ sender: Any) {
        addToOutput(value: "5")
        
    }
    
    @IBAction func six(_ sender: Any) {
        addToOutput(value: "6")
        
    }
    
    @IBAction func seven(_ sender: Any) {
        addToOutput(value: "7")
        
    }
    
    @IBAction func eight(_ sender: Any) {
        addToOutput(value: "8")
        
    }
    
    @IBAction func nine(_ sender: Any) {
        addToOutput(value: "9")
        
    }
    
    
    @IBAction func zero(_ sender: Any) {
        addToOutput(value: "0")
        
    }
    
    @IBAction func sum(_ sender: Any) {
        addToOutput(value: "+")
        
    }
    
    @IBAction func dif(_ sender: Any) {
        addToOutput(value: "-")
        
    }
    
    @IBAction func mult(_ sender: Any) {
        addToOutput(value: "*")
        
    }
    
    @IBAction func div(_ sender: Any) {
        addToOutput(value: "/")
        
    }
}
