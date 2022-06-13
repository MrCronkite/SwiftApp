//
//  ViewController.swift
//  Task Count
//
//  Created by admin1 on 10.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        hello()
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
    
}


