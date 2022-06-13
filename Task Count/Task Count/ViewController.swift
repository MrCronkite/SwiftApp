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
    
    override func loadView() {
        super.loadView()
        print("loadView")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        hello()
        
        buttonOne.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            print("viewWillApper")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }
    
    
    func hello(){
        print("hi")
    }
    
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

}



