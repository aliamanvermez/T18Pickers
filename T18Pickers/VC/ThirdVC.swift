//
//  ThirdVC.swift
//  T18Pickers
//
//  Created by NeonApps on 13.09.2022.
//

import Foundation
import UIKit
class ThirdVC : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var goToFourthVCButton = UIButton()
    var chooseImageFromLibrary = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        createUI()
    }
    
    func createUI(){
        setDefaultSize(view: view)
        buttonCreate()
        imageViewCreate()
    }
    
    func buttonCreate() {
        view.addSubview(goToFourthVCButton)
        goToFourthVCButton.setTitle("Next Page", for: .normal)
        goToFourthVCButton.frame = CGRect(x: 0.3 * screenWidth, y: 0.8 * screenHeight, width: 0.4 * screenWidth, height: 50)
        goToFourthVCButton.backgroundColor = .systemPink
        goToFourthVCButton.setTitleColor(UIColor.white, for: .normal)
        goToFourthVCButton.layer.cornerRadius = 16
        goToFourthVCButton.addTarget(self, action: #selector(goToFourthVCButtonClicked), for: .touchUpInside)
        
    }
    
    func imageViewCreate() {
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImageFromLibraryTapped))
        chooseImageFromLibrary.image = UIImage(named: "select")
        chooseImageFromLibrary.frame = CGRect(x: 0.2 * screenWidth, y: 0.03 * screenHeight, width: 0.6 * screenWidth, height: 0.2 * screenHeight)
        chooseImageFromLibrary.addGestureRecognizer(imageTapRecognizer)
        chooseImageFromLibrary.isUserInteractionEnabled = true
        
        view.addSubview(chooseImageFromLibrary)
    }
    
    @objc func chooseImageFromLibraryTapped(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    
    @objc func goToFourthVCButtonClicked() {
        let fourthVC = FourthVC()
        
        let navVC = UINavigationController(rootViewController: fourthVC)
//        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
      
    }
    
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        chooseImageFromLibrary.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
}
