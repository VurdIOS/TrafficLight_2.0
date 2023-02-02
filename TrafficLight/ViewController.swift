//
//  ViewController.swift
//  TrafficLight
//
//  Created by Камаль Атавалиев on 02.02.2023.
//

import UIKit

enum trafficLightStates {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    var trafficLightStateCurrent = trafficLightStates.red
    var trafficLightStateOn: CGFloat = 1
    var trafficLightStateOff: CGFloat = 0.3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = startButton.frame.width / 10
    }
    
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.height / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.height / 2
        greenLight.layer.cornerRadius = greenLight.frame.height / 2
    }

    
    @IBAction func startButtonTapped() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch trafficLightStateCurrent {
        case .red:
            redLight.alpha = trafficLightStateOn
            greenLight.alpha = trafficLightStateOff
            trafficLightStateCurrent = trafficLightStates.yellow
        case .yellow:
            redLight.alpha = trafficLightStateOff
            yellowLight.alpha = trafficLightStateOn
            trafficLightStateCurrent = trafficLightStates.green
        case .green:
            yellowLight.alpha = trafficLightStateOff
            greenLight.alpha = trafficLightStateOn
            trafficLightStateCurrent = trafficLightStates.red
        }
        
    }
    
    
}

