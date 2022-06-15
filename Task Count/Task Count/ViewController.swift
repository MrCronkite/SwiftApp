//
//  ViewController.swift
//  Task Count
//
//  Created by admin1 on 10.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var labelPass: UILabel!
    
    let mySwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonOne.layer.cornerRadius = 10
        //buttonOne.setTitle("введи пароль", for: .highlighted)
        //создание свич
        self.mySwitch.frame = CGRect(x: 200, y: 400, width: 0, height: 0)
        self.view.addSubview(self.mySwitch)
        //self.mySwitch.setOn(true, animated: true)
        
        //проверка
        if self.mySwitch.isOn{
            print("sw on")
        }else{
            print("sw off")
        }
        
        self.mySwitch.addTarget(self, action: #selector(switchChange(paramTarget:)), for: .valueChanged)
        self.mySwitch.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
    }
    
    
    
    //MARK: Alert
    @IBAction func showButton(_ sender: Any) {
        self.labelPass.text = "Ваш пароль, "
        self.alert(title: "Внимание", message: "Неправельный пароль", style: .alert )
       
    }
    
    
    func alert(title: String, message: String, style: UIAlertController.Style){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.labelPass.text? += (text?.text)!
        }
        alertController.addTextField { (textField) in
            textField.isSecureTextEntry = true
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func switchChange(paramTarget: UISwitch){
        print("param is = ", paramTarget)
        
        if paramTarget.isOn{
            print("sw on")
        }else{
            print("sw off")
        }
        
    }
    
    @objc func isOn(target: UISwitch){
        if target.isOn{
            self.buttonOne.isPointerInteractionEnabled = false
        }else{
            self.buttonOne.isPointerInteractionEnabled = true
        }
    }

}



