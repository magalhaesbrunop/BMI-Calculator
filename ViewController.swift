//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Bruno Magalhães on 02/11/18.
//  Copyright © 2018 Cybernetic Company of Milky Way. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet var lotAnimationView: LOTAnimationView!
    
    @IBOutlet var answerTextView: UITextView!
    
    @IBOutlet var weithTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    
    var massKg: Float = 0
    var heightM: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
    }
    
    @IBAction func calcButton(_ sender: UIButton) {
        
        let result = bmiCalc(weight: massKg, height: heightM)
        
        print(result)
        
    }
    
    func bmiCalc(weight : Float, height : Float) -> String {
        
        massKg = Float(weithTextField.text!)!
        heightM = Float(heightTextField.text!)!
        
        let bmi = massKg/powf(heightM, 2)
        let shortenedBMI = String(format: "%.2f", bmi)
        var interpretation = ""
        
        if bmi > 25 {
            interpretation = "you are overweight"
        } else if bmi > 18.5 {
            interpretation = "you have a normal weight"
        } else {
            interpretation = "you are underweight"
        }
        
        return "Your BMI is \(shortenedBMI) and \(interpretation)"
        
    }
    
    func bmiCalcImperialUnits(weightInPounds: Float, heightInFeet: Float, remainderInches: Float) {
        
        let weightInKg = weightInPounds * 0.45359237
        let totalInches = heightInFeet * 12 + remainderInches
        let heightInM = totalInches * 0.0254
        
        let bmi = weightInKg / powf(heightInM, 2)
        
    }
    
    func startAnimation() {
        
        lotAnimationView.setAnimation(named: "dna_like_loader")
        lotAnimationView.loopAnimation = true
        lotAnimationView.play()
        
    }
}

