//
//  ViewController.swift
//  view_kit
//
//  Created by admin1 on 27.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let alert = UIAlertController()
    let buttonAction = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //label
        self.label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        self.label.text = "hello world"
        self.label.textColor = .green
        self.label.center = view.center
        self.view.addSubview(label)
        
        
        //button
        self.buttonAction.frame = CGRect(x: 20, y: 100, width: 100, height: 50)
        self.buttonAction.setTitle("✸", for: .normal)
        self.buttonAction.setTitleColor(.yellow, for: .normal)
        self.buttonAction.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        self.view.addSubview(buttonAction)
    }
    
    @objc func pressed(sender: UIButton!) {
        print("hello")
        
    }


}

