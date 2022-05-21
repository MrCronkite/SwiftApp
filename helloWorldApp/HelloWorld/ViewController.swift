//
//  ViewController.swift
//  HelloWorld
//
//  Created by admin1 on 21.05.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LabelHello: UILabel!
    @IBOutlet weak var helloWorldButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        LabelHello.isHidden = true
        helloWorldButton.layer.cornerRadius = 13
    }


    @IBAction func showText() {
        LabelHello.isHidden = false
    }
}

