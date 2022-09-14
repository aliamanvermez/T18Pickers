//
//  FourthVC.swift
//  T18Pickers
//
//  Created by NeonApps on 13.09.2022.
//

import Foundation
import UIKit
class FourthVC : UIViewController {
    let birthDayTextField = UITextField()
    let birthdayPicker = UIDatePicker()
    let toolbar = UIToolbar()
    
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        createUI()
        view.backgroundColor = .brown
    }
    
    func createUI() {
        createTextField()
        createDatePicker()
    }
    
    func createTextField() {
        birthDayTextField.placeholder = "DD//MM//YY"
        birthDayTextField.frame = CGRect(x: 0.2 * screenWidth, y: 0.2 * screenHeight, width: 0.6 * screenWidth, height: 40)
        birthDayTextField.backgroundColor = .white
        
        view.addSubview(birthDayTextField)
        
    }
    
    func createToolbar () -> UIToolbar {
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        return toolbar
        
    }
    
    func createDatePicker() {
        birthdayPicker.preferredDatePickerStyle = .wheels
        birthDayTextField.inputView = birthdayPicker
        birthDayTextField.inputAccessoryView = createToolbar()
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        self.birthDayTextField.text = dateFormatter.string(from: birthdayPicker.date)
        self.view.endEditing(true)
    }
}
