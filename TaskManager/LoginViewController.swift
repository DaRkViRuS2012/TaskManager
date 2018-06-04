//
//  LoginViewController.swift
//  Wardah
//
//  Created by Hani on 4/25/17.
//  Copyright © 2017 BrainSocket. All rights reserved.
//

import UIKit

class LoginViewController: AbstractController {
    
    // MARK: Properties
    // login view
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    // process View
    
    
    
    var homeViewControllerId = "tabController"
    var signupViewControllerId = "SignupViewController"
    
    // MARK: Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCustomeNavBarTitle(type: .signin)
        //  self.showNavBackButton = true
        
        
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    // Customize all view members (fonts - style - text)
    override func customizeView() {
        super.customizeView()
        // set fonts
        loginButton.titleLabel?.font = AppFonts.normal
        
        signupButton.titleLabel?.font = AppFonts.small
        
        
        // set text
        loginButton.setTitle("START_NORMAL_LOGIN".localized, for: .normal)
        loginButton.setTitle("START_NORMAL_LOGIN".localized, for: .highlighted)
        // loginButton.hideTextWhenLoading = true
        
        signupButton.setTitle("START_CREATE_ACCOUNT".localized, for: .normal)
        signupButton.setTitle("START_CREATE_ACCOUNT".localized, for: .highlighted)
        emailTextField.placeholder = "START_EMAIL_PLACEHOLDER".localized
        passwordTextField.placeholder = "START_PASSWORD_PLACEHOLDER".localized
        
        
        // text field styles
        emailTextField.appStyle()
        passwordTextField.appStyle()
        
        // customize button
        loginButton.makeRounded()
        loginView.addShaddow()
        
        // set Colors
        //        loginButton.backgroundColor = AppColors.
    }
    
    // Build up view elements
    override func buildUp() {
        loginView.animateIn(mode: .animateInFromBottom, delay: 0.2)
    }
    
    // MARK: Actions
    @IBAction func loginAction(_ sender: UIButton) {
        // validate email
        
        if let email = emailTextField.text, !email.isEmpty {
            if email.isValidEmail() {
                // validate password
                if let password = passwordTextField.text, !password.isEmpty {
                    if password.length >= AppConfig.passwordLength {
                        // start login process
                        self.showActivityLoader(true)
                        self.view.isUserInteractionEnabled = false
                        ApiManager.shared.userLogin(email: email, password: password) { (isSuccess, error, user) in
                            // stop loading
                            self.showActivityLoader(false)
                            self.view.isUserInteractionEnabled = true
                            // login success
                            if (isSuccess) {
                                self.presentViewController(viewControllerId: self.homeViewControllerId,storyBoard: .mainStoryboard)
                            } else {
                                if let msg = error?.errorName{
                                    self.showMessage(message:msg, type: .error)
                                    
                                }
                                if let msg = error?.errorName{
                                    self.showMessage(message:msg, type: .error)
                                    
                                }
                            }
                        }
                    } else {
                        self.passwordTextField.errorMode()
                        showMessage(message:"SINGUP_VALIDATION_PASSWORD_LENGHTH".localized, type: .warning)
                    }
                } else {
                    self.passwordTextField.errorMode()
                    showMessage(message:"SINGUP_VALIDATION_PASSWORD".localized, type: .warning)
                }
            } else {
                self.emailTextField.errorMode()
                showMessage(message:"SINGUP_VALIDATION_EMAIL_FORMAT".localized, type: .warning)
            }
        } else {
            self.emailTextField.errorMode()
            showMessage(message:"SINGUP_VALIDATION_EMAIL".localized, type: .warning)
        }
    }
    
    
    // MARK: textField delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
            loginAction(loginButton)
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}

