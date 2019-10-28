//
//  StepperViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by God on 10/28/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class StepperViewController: UIViewController {
    var sliderValueHolder = Float()

    var delegate:fontSize?
    var currentValue: Float!
    
    @IBOutlet var fontSizerStepperOutlet: UIStepper!
    @IBOutlet var fontSizerSliderOutlet: UISlider!
    @IBOutlet var previousFontSize: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCurrentValue()
    }
    
    private func setCurrentValue(){
        fontSizerSliderOutlet.value = currentValue ?? 20
        fontSizerStepperOutlet.value = Double(currentValue ?? 20)
        previousFontSize.text = "Previous Font Size: \(String(describing: currentValue ?? 20))"
    }
    
    private func handleSlider(value: Float){
        if delegate != nil{
            sliderValueHolder = value
            delegate?.changeFontSize(size: sliderValueHolder)
            
            previousFontSize.text = "Current Font Size: \(value)"
            fontSizerStepperOutlet.value = Double(value)
        }
    }
    
    private func handleStepper(value:Double){
        sliderValueHolder = Float(value)
        delegate?.changeFontSize(size: sliderValueHolder)
        fontSizerSliderOutlet.value = Float(value)
        fontSizerStepperOutlet.value = Double(fontSizerSliderOutlet.value)
        previousFontSize.text = "Current Font Size: \(value)"
    }
    
    
    @IBAction func fontSizerSlider(_ sender: UISlider) {
        handleSlider(value: sender.value)
    }
    @IBAction func fontSizerStepper(_ sender: UIStepper) {
        handleStepper(value: sender.value)
    }
}
