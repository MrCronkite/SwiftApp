//
//  ViewController.swift
//  traffic_light
//
//  Created by admin1 on 23.05.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var red_light: UIView!
    @IBOutlet weak var yellow_light: UIView!
    @IBOutlet weak var green_light: UIView!
    @IBOutlet weak var button_light: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        red_light.layer.cornerRadius = 60
        yellow_light.layer.cornerRadius = 60
        green_light.layer.cornerRadius = 60
    }

    @IBAction func lightIncl() {
        red_light.backgroundColor = UIColor.red
    }
    
}

