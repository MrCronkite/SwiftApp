//
//  ViewController.swift
//  view_kit
//
//  Created by admin1 on 27.06.22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let label = UILabel()
    let buttonAction = UIButton()
    let buttonPlay = UIButton()
    let buttonPause = UIButton()
    let switchUI = UISwitch()
    let picker = UIPickerView()
    let dataPicker = UIDatePicker()
    var player = AVAudioPlayer()
    let slider = UISlider()
    var segmentControl = UISegmentedControl()
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController? = nil
    
    var menuArrey = ["one", "two", "tree"]

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
        
        self.buttonPlay.frame = CGRect(x: 40, y: 500, width: 100, height: 50)
        self.buttonPlay.setTitle("play", for: .normal)
        self.buttonPlay.setTitleColor(UIColor.purple, for: .highlighted)
        self.buttonPlay.layer.cornerRadius = 10
        self.buttonPlay.backgroundColor = .lightGray
        self.buttonPlay.addTarget(self, action: #selector(playAudio(sender:)), for: .touchUpInside)
        self.view.addSubview(buttonPlay)
        
        self.buttonPause.frame = CGRect(x: 240, y: 500, width: 100, height: 50)
        self.buttonPause.setTitle("pause", for: .normal)
        self.buttonPause.setTitleColor(UIColor.purple, for: .highlighted)
        self.buttonPause.layer.cornerRadius = 10
        self.buttonPause.backgroundColor = .lightGray
        self.buttonPause.addTarget(self, action: #selector(pauseAudio(sender:)), for: .touchUpInside)
        self.view.addSubview(buttonPause)
        
        
        
        //switch
        self.switchUI.frame = CGRect(x: 10, y: 130, width: 0, height: 0)
        self.view.addSubview(self.switchUI)
        self.switchUI.setOn(false, animated: true)
        self.switchUI.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
        
        //picker
        picker.frame = CGRect(x: self.view.center.x - 100, y: 170, width: 200, height: 120)
        picker.dataSource = self
        picker.delegate = self
        picker.backgroundColor = .purple
        self.view.addSubview(picker)
        
        
        //dataPicker
        dataPicker.frame = CGRect(x: self.view.center.x - 150, y: 300, width: 300, height: 150)
        self.view.addSubview(dataPicker)
        dataPicker.datePickerMode = .date
        dataPicker.addTarget(self, action: #selector(datePickerChange(paramDatePicker:)), for: .valueChanged)
        
        var oneYearTime = TimeInterval()
        oneYearTime = 365*24*60*60
        
        let todayDate = Date()
        let oneYearFromToday = todayDate.addingTimeInterval(oneYearTime)
        let twoYearFromToday = todayDate.addingTimeInterval(oneYearTime * 2)
        
        dataPicker.maximumDate = twoYearFromToday
        dataPicker.minimumDate = oneYearFromToday
        
        
        //audioplayer
        do {
                if let audioPath = Bundle.main.path(forResource: "solnce", ofType: "mp3"){
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    self.slider.maximumValue = Float(player.duration)
                }
                }catch {
                print("error")
            }
        
        
        
        
        //slider
        self.slider.frame = CGRect(x: 40, y: 450, width: 200, height: 23)
        self.slider.maximumValue = 100.0
        self.slider.minimumValue = 0.0
        self.view.addSubview(slider)
        self.slider.addTarget(self, action: #selector(changeValueMusic(target:)), for: .valueChanged)
        
        
        //segmentcontrol
        self.segmentControl = UISegmentedControl(items: self.menuArrey)
        self.segmentControl.frame = CGRect(x: 100, y: 600, width: 200, height: 30)
        self.segmentControl.addTarget(self, action: #selector(segmentControlChange(sender:)), for: .valueChanged)
        self.view.addSubview(segmentControl)
        
        
        self.createButton()
        self.createTextField()
        
    }
    
    //MARK - method

    func createTextField(){
        self.textField.frame = CGRect(x: 100, y: 700, width: 280, height: 44)
        self.textField.borderStyle = .roundedRect
        self.textField.placeholder = "Enter text to share"
        self.view.addSubview(self.textField)
    }
    
    func createButton(){
        self.buttonShare.frame = CGRect(x: 100, y: 770, width: 280, height: 44)
        //self.buttonShare = UIButton(type: .roundedRect)
        self.buttonShare.setTitleColor(.red, for: .normal)
        self.buttonShare.setTitle("Расшарить", for: .normal)
        self.buttonShare.addTarget(self, action: #selector(hendleShare), for: .touchUpInside)
        self.view.addSubview(self.buttonShare)

    }

    //MARK: UIactivityViewController
   @objc func hendleShare(sender: Any){
       let text = self.textField.text

        if text?.count == 0 {
            let message = "Сначала введите текст"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action  = UIAlertAction(title: "ok", style: .cancel, handler: nil)

            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)

        }

        self.activityViewController = UIActivityViewController(activityItems: [self.textField.text ?? "nil"], applicationActivities: nil)
        self.present(self.activityViewController!, animated: true, completion: nil)
    }
    
    @objc func segmentControlChange(sender: UISegmentedControl){
        if sender == self.segmentControl{
            let  segmentIndex = sender.selectedSegmentIndex
            self.label.text = menuArrey[segmentIndex]
            sender.isMomentary = true
            print(segmentIndex)
        }
    }
    
    @objc func changeValueMusic(target: UISlider){
        self.player.currentTime = TimeInterval(target.value)
    }
    
    @objc func playAudio(sender: UIButton){
        self.player.play()
    }
    
    @objc func pauseAudio(sender: UIButton){
        self.player.stop()
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
            self.buttonAction.isEnabled = false
        }else{
            self.buttonAction.isEnabled = true
        }
    }
    
    @objc func datePickerChange(paramDatePicker: UIDatePicker){
        if paramDatePicker.isEqual(self.dataPicker){
            print("dataChange = ", paramDatePicker.date)
        }
    }
    
}

//MARK: UIpicker

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result  = "row = \(row) + \(component)"
        
        return result
    }
}




