//
//  ViewController.swift
//  traffic_light
//
//  Created by admin1 on 23.05.22.
//

import UIKit

enum Light{
    case red, yellow, green
}

class ViewController: UIViewController {

    @IBOutlet weak var red_light: UIView!
    @IBOutlet weak var yellow_light: UIView!
    @IBOutlet weak var green_light: UIView!
    @IBOutlet weak var button_light: UIButton!
    
    private var currentLight = Light.red
    
    private let  lightIsOn: CGFloat = 1
    private let  lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        red_light.layer.cornerRadius = 60
        yellow_light.layer.cornerRadius = 60
        green_light.layer.cornerRadius = 60
        
        button_light.layer.cornerRadius = 10
        red_light.alpha = lightIsOff
        yellow_light.alpha = lightIsOff
        green_light.alpha = lightIsOff
    }

    @IBAction func lightIncl() {
        switch currentLight {
        case .red:
            red_light.alpha = lightIsOn
            currentLight = .yellow
            green_light.alpha = lightIsOff
        case .yellow:
            yellow_light.alpha = lightIsOn
            red_light.alpha = lightIsOff
            currentLight = .green
        case .green:
            green_light.alpha = lightIsOn
            yellow_light.alpha = lightIsOff
            currentLight = .red
        }
        
    }
    
}

