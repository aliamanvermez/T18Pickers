//
//  SecondVC.swift
//  T18Pickers
//
//  Created by NeonApps on 13.09.2022.
//

import Foundation
import UIKit

class SecondVC : UIViewController {
    var goToThirdVCButton = UIButton()
    var changeBackgroundColor = UIButton()
    var bgColorChanger = UIColorWell()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        createUI()
    }
    
    func createUI(){
        setDefaultSize(view: view)
        view.backgroundColor = .cyan
        buttonCreate()
    }
    
    func buttonCreate() {
        view.addSubview(goToThirdVCButton)
        goToThirdVCButton.setTitle("Next Page", for: .normal)
        goToThirdVCButton.frame = CGRect(x: 0.3 * screenWidth, y: 0.8 * screenHeight, width: 0.4 * screenWidth, height: 50)
        goToThirdVCButton.backgroundColor = .systemPink
        goToThirdVCButton.setTitleColor(UIColor.white, for: .normal)
        goToThirdVCButton.layer.cornerRadius = 16
        goToThirdVCButton.addTarget(self, action: #selector(goToThirdVCButtonClicked), for: .touchUpInside)
        
        changeBackgroundColor.setTitle("Change BgColor", for: .normal)
        changeBackgroundColor.frame = CGRect(x: 0.3 * screenWidth, y: 0.6 * screenHeight, width: 0.4 * screenWidth, height: 50)
        changeBackgroundColor.backgroundColor = .systemPink
        changeBackgroundColor.setTitleColor(UIColor.white, for: .normal)
        changeBackgroundColor.layer.cornerRadius = 16
        changeBackgroundColor.addTarget(self, action: #selector(changeBackgroundColorClicked), for: .touchUpInside)
        view.addSubview(changeBackgroundColor)
        
        
        
    }
    
    
    @objc func goToThirdVCButtonClicked() {
        let thirdVC = ThirdVC()
        
        let navVC = UINavigationController(rootViewController: thirdVC)
//        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        
    }
    
    @objc func changeBackgroundColorClicked() {
        bgColorChanger.frame = CGRect(x: 0.1 * screenWidth, y: 0.1 * screenHeight, width: 30, height: 30)
        bgColorChanger.supportsAlpha = true
        bgColorChanger.selectedColor = .systemRed
        bgColorChanger.title = "Change Color"
        bgColorChanger.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
        view.addSubview(bgColorChanger)
        
    }
    
    @objc func colorChanged() {
        view.backgroundColor = bgColorChanger.selectedColor
    }
}
