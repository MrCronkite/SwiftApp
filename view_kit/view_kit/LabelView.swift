//
//  label.swift
//  view_kit
//
//  Created by admin1 on 4.07.22.
//

import UIKit

let labelUI = UILabel()

class LabelView: ViewController{
    
    
    func createLabel(){
        labelUI.frame = CGRect(x: 100, y: 790, width: 100, height: 20)
        labelUI.text = "Hello"
        labelUI.textColor = .red
        self.view.addSubview(labelUI)
    }
    
}


