//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Marco Cheng on 10/22/15.
//  Copyright © 2015 Marco Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberString : String = ""
    var numbersArr : [Int] = []
    var result : Int = 0
    var opString : String = ""
    var firstNum : String = "0"
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func number(sender: UIButton) {
        let buttonText = sender.currentTitle!
        numberString += buttonText
        display.text = numberString
    }
    
    
    @IBAction func simpleOp(sender: UIButton) {
        opString = sender.currentTitle!
        firstNum = display.text!
        numberString = ""
    }
    
    @IBAction func returnKey(sender: UIButton) {
        var avgResult : Double = 0.0
        switch opString {
        case "+" : result = Int(display.text!)! + Int(firstNum)!
        case "-" : result = Int(firstNum)! - Int(display.text!)!
        case "×" : result = Int(display.text!)! * Int(firstNum)!
        case "÷" : result = Int(firstNum)! / Int(display.text!)!
        case "mod" : result = Int(firstNum)! % Int(display.text!)!

        case "avg" :
            numbersArr.append(Int(display.text!)!)
            print(numbersArr)
            for number in numbersArr {
                result += Int(number)
            }
            avgResult = Double(result) / Double(numbersArr.count)
            print(avgResult)
     
        case "count" :
            numbersArr.append(Int(display.text!)!)
            result = numbersArr.count
        default: display.text = "0"
            
        }
        
        display.text = opString == "avg" ? String(avgResult) : String(result)
        avgResult = 0.0
        result = 0
        numberString = ""
        numbersArr = []
        
    }
   
    @IBAction func Fact(sender: UIButton) {
        let times = Int(display.text!)
        result = Int(times!)
        for(var i = Int(times!)-1; i>0; i--){
            result *= i
        }
        display.text = String(result)
    }
    @IBAction func countOrAvg(sender: AnyObject) {
        numbersArr.append(Int(display.text!)!)
        print(numbersArr)
        display.text = "0"
        numberString = ""
        opString = sender.currentTitle!!
        print(opString)
    }
    
    @IBAction func clear(sender: UIButton) {
        numberString = ""
        display.text = "0"
        numbersArr = []
    }
}

