//
//  ViewController.swift
//  view_kit
//
//  Created by admin1 on 27.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let buttonAction = UIButton()
    let switchUI = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //label
        self.label.frame = CGRect(x: 200, y: 70, width: 100, height: 50)
        self.label.text = "hello world"
        self.label.textAlignment = .center
        self.label.numberOfLines = 3
        self.label.textColor = .green
        self.view.addSubview(label)
        
        
        //button
        self.buttonAction.frame = CGRect(x: 10, y: 70, width: 100, height: 50)
        self.buttonAction.setTitle("klick", for: .normal)
        self.buttonAction.setTitleColor(.black, for: .normal)
        self.buttonAction.layer.cornerRadius = 20
        self.buttonAction.backgroundColor = .blue
        self.buttonAction.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        self.view.addSubview(buttonAction)
        
        //switch
        self.switchUI.frame = CGRect(x: 10, y: 130, width: 0, height: 0)
        self.view.addSubview(self.switchUI)
        self.switchUI.setOn(false, animated: true)
        self.switchUI.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
    }
    
    @objc func pressed(sender: UIButton!) {
        self.alert(title: "Vlad привет", message: "nenenne", style: .alert)
    }
    
    func alert(title: String, message: String, style: UIAlertController.Style){
    let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "ok", style: .default) {(action) in
            let text = alertController.textFields?.first
            self.label.text? += (text?.text)!
        }
        alertController.addTextField{(textField) in textField.isSecureTextEntry = false}
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
    }
                                
    @objc func isOn(target: UISwitch){
        if target.isOn{
            print(target.isOn)
            self.buttonAction.isEnabled = false
        }else{
            self.buttonAction.isEnabled = true
        }
    }

}

