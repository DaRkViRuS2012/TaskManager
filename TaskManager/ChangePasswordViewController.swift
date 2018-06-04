//
//  ChangePasswordViewController.swift
//  AnyCubed
//
//  Created by Nour  on 1/17/18.
//  Copyright © 2018 NourAraar. All rights reserved.
//

import UIKit

class ChangePasswordViewController: AbstractController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var currentPasswordTextField: XUITextField!
    @IBOutlet weak var newPasswordTextField: XUITextField!
    @IBOutlet weak var confirmPasswordTextField: XUITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setCustomeNavBarTitle(type: .home)
        self.showNavBackButton = true
    }
    
    override func customizeView() {
        super.customizeView()
        
        
    }
    
    
    func validate()-> Bool{
        
        if let currentPassword = currentPasswordTextField.text, !currentPassword.isEmpty {
            
        } else {
            showMessage(message:"SINGUP_VALIDATION_EMAIL".localized, type: .warning)
            return false
        }
        
        
        if let newPassword = newPasswordTextField.text, !newPassword.isEmpty {
            
        } else {
            showMessage(message:"SINGUP_VALIDATION_EMAIL".localized, type: .warning)
            return false
        }
        
        if let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty {
            
        } else {
            showMessage(message:"SINGUP_VALIDATION_EMAIL".localized, type: .warning)
            return false
        }
        
        return true
        
    }
    
    @IBAction func save(_ sender: XUIButton) {
        
        if validate(){
            if let newpassword = newPasswordTextField.text,let currentPassword = currentPasswordTextField.text {
                self.showActivityLoader(true)
                ApiManager.shared.changePassword(currentPassword: currentPassword,newPassword:newpassword, completionBlock: { (success, error) in
                    self.showActivityLoader(false)
                    
                    if success{
                        self.showMessage(message: "Done", type: .success)
                        self.popOrDismissViewControllerAnimated(animated: true)
                    }
                    if error != nil{
                        if let msg = error?.errorName{
                            self.showMessage(message: msg, type: .error)
                        }
                        
                    }
                })
                
                
            }
        }
    }
    
    
}

