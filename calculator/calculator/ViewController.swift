//
//  ViewController.swift
//  calculator
//
//  Created by Uef on 10/01/2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resLabel: UILabel!
    
    
    @IBOutlet weak var equationLabel: UILabel!
    var equation = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearScreen()
    }
    func clearScreen(){
        equation           = ""
        equationLabel.text = ""
        resLabel.text      = ""
    }
    @IBAction func clearAll(_ sender: Any) {
        clearScreen()
    }
    func addToEquation( _ value: String){
        if resLabel.text != "" {
            clearScreen()
        }
        equation.append(value)
        equationLabel.text = equation
    }
    @IBAction func backspace(_ sender: Any) {
        if equation != "" {
            equation.removeLast()
            equationLabel.text = equation
        }
    }
    @IBAction func modules(_ sender: Any) {
        addToEquation("%")
        
    }
    @IBAction func divide(_ sender: Any) {
        addToEquation("/")
    }
    
    @IBAction func multiply(_ sender: Any) {
        addToEquation("*")
    }
    
    @IBAction func plus(_ sender: Any) {
        addToEquation("+")
    }
    
    @IBAction func minus(_ sender: Any) {
        addToEquation("-")
    }

    @IBAction func dot(_ sender: Any) {
        addToEquation(".")
    }
    
    @IBAction func zero(_ sender: Any) {
        addToEquation("0")
    }
    
    @IBAction func one(_ sender: Any) {
        addToEquation("1")
    }
    
    @IBAction func two(_ sender: Any) {
        addToEquation("2")
    }
    
    @IBAction func three(_ sender: Any) {
        addToEquation("3")
    }
    
    @IBAction func four(_ sender: Any) {
        addToEquation("4")
    }
    
    @IBAction func five(_ sender: Any) {
        addToEquation("5")
    }
    
    @IBAction func six(_ sender: Any) {
        addToEquation("6")
    }
    
    @IBAction func seven(_ sender: Any) {
        addToEquation("7")
    }
    
    @IBAction func eight(_ sender: Any) {
        addToEquation("8")
    }
    
    @IBAction func nine(_ sender: Any) {
        addToEquation("9")
    }
    
    @IBAction func equal(_ sender: Any) {
        
        let expression = NSExpression(format: equation)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resStr = formatResult(result)
        if IsValid(resStr) {
            resLabel.text = resStr
        }else {
            let alert = UIAlertController(title: "Invalid Input", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (_) in
                self.clearScreen()
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    func IsValid(_ value: String) -> Bool {
        var count = 0
        var charStack = [Int]()
        var prev = -1
        for c in value {
            if isChar(c) {
                charStack.append(count)
            }
            count += 1
        }
        for index in charStack {
            if index == 0 {
                return false
            }
            if index == value.count-1 {
                return false
            }
            if prev != -1 {
                if index - prev == 1 {
                    return false
                }
            }
            prev = index
            
        }
        return true
    }
    func isChar(_ char: Character) -> Bool {
        if char == "*" {
            return true
        }
        if char == "/" {
            return true
        }
        if char == "+" {
            return true
        }
        if char == "-" {
            return true
        }
        return false
    }
    
    func formatResult(_ result: Double)->String{
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.1f",result)
        }else {
            return String(format: "%.2f",result)
        }
    }
    
}

