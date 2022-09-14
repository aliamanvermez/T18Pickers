//
//  ViewController.swift
//  T18Pickers
//
//  Created by NeonApps on 13.09.2022.
//

import UIKit

class ViewController: UIViewController, UIFontPickerViewControllerDelegate {
    let goToSecondVCButton = UIButton()
    let backgroundImage = UIImageView()
    let changeTextStyleButton = UIButton()
    let textLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createUI(){
        setDefaultSize(view: view)
        view.backgroundColor = .white
        addImage()
        buttonCreate()
        textLabelCreate()
        
            }
    
    func buttonCreate() {
        
        goToSecondVCButton.setTitle("Next Page", for: .normal)
        goToSecondVCButton.frame = CGRect(x: 0.3 * screenWidth, y: 0.8 * screenHeight, width: 0.4 * screenWidth, height: 50)
        goToSecondVCButton.backgroundColor = .white
        goToSecondVCButton.setTitleColor(UIColor.systemRed, for: .normal)
        goToSecondVCButton.layer.cornerRadius = 16
        goToSecondVCButton.addTarget(self, action: #selector(goToSecondVCButtonClicked), for: .touchUpInside)
        
        changeTextStyleButton.setTitle("Change Style", for: .normal)
        changeTextStyleButton.frame = CGRect(x: 0.3 * screenWidth, y: 0.6 * screenHeight, width: 0.4 * screenWidth, height: 50)
        changeTextStyleButton.backgroundColor = .white
        changeTextStyleButton.setTitleColor(UIColor.systemRed, for: .normal)
        changeTextStyleButton.layer.cornerRadius = 16
        changeTextStyleButton.addTarget(self, action: #selector(changeTextStyleButtonClicked), for: .touchUpInside)
        
        view.addSubview(changeTextStyleButton)
        view.addSubview(goToSecondVCButton)


        
        
    }
    
    func addImage () {
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.frame = CGRect(x: 0 , y: 0 , width: screenWidth , height: screenHeight)
        view.addSubview(backgroundImage)
        
    }
    func textLabelCreate() {
        textLabel.text = "     Welcome To Neon Apps!"
        
        textLabel.frame = CGRect(x: 0.2 * screenWidth, y: 0.4 * screenHeight, width: 0.6 * screenWidth, height: 100)
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 0
        view.addSubview(textLabel)
        
       
    }
    
    @objc func goToSecondVCButtonClicked() {
        let secondVC = SecondVC()
        
        let navVC = UINavigationController(rootViewController: secondVC)
//        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
      }
    
    @objc func changeTextStyleButtonClicked() {
        let config = UIFontPickerViewController.Configuration()
        config.includeFaces = false
        let vc = UIFontPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
        
       
        
      }
    
    func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true)
        
    }
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true)
        guard let descriptor = viewController.selectedFontDescriptor else {
            return
        }
        print(descriptor)
        textLabel.font = UIFont(descriptor: descriptor , size: 24 )

    }


}

