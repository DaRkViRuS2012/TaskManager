//
//  SignupViewController.swift
//  Wardah
//
//  Created by Molham Mahmoud on 4/25/17.
//  Copyright © 2017 BrainSocket. All rights reserved.
//

import UIKit


class SignupViewController: AbstractController {
    
    
    
    
    
    // MARK: Properties
    
    // stages
    @IBOutlet weak var signupStage1: UIView!
    @IBOutlet weak var signupStage2: UIView!
    @IBOutlet weak var signupStage3: UIView!
    
    // stage 1
    @IBOutlet weak var SignupView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var EXTTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    /// stage 2
    
    @IBOutlet weak var fNameTextField: UITextField!
    @IBOutlet weak var lNameTextField: UITextField!
    
    
    // stage 3
    
    @IBOutlet weak var idCardImageView: UIImageView!
    // signup Button
    
    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var viewPolicyButton: UIButton!
    
    // signup Button
    @IBOutlet weak var nextButton: UIButton!
    
    
    // ask for age
    
    
    @IBOutlet weak var askForAgeView: UIView!
    
    
    // under 18
    @IBOutlet weak var underAgeView: UIView!
    
    
    var overAge:Bool = true
    
    
    
    var arrayStagesContainers: [UIView] = [UIView]()
    
    // Data
    var currentStageIndex: Int = -1
    var isMale: Bool = true
    var birthday: Date = Date()
    var tempUserInfoHolder: AppUser = AppUser()
    var password: String = ""
    
    
    
    
    
    // datePicker
    
    
    // MARK: Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showNavBackButton = true
        self.setCustomeNavBarTitle(type: .signup)
    }
    
    // Customize all view members (fonts - style - text)
    override func customizeView() {
        super.customizeView()
        
        // init stages array
        arrayStagesContainers.append(signupStage1)
        arrayStagesContainers.append(signupStage2)
        arrayStagesContainers.append(signupStage3)
        arrayStagesContainers.append(askForAgeView)
        arrayStagesContainers.append(underAgeView)
        
        nextStageAction(self)
        // set default gender to male
        
        
    }
    
    
    override func backButtonAction(_ sender: AnyObject) {
        // hide keyboard
        //        fNameTextField.resignFirstResponder()
        //        lNameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        // check current stage
        if currentStageIndex == 0 {
            _ = self.navigationController?.popViewController(animated: true)
        } else {
            backStage()
        }
    }
    
    // Build up view elements
    override func buildUp() {
        SignupView.animateIn(mode: .animateInFromBottom, delay: 0.2)
        nextButton.animateIn(mode: .animateInFromBottom, delay: 0.3)
        
        
    }
    
    func showaskForAgeView(){
        
        let currentStageView = arrayStagesContainers[currentStageIndex]
        
        
        currentStageView.animateIn(mode: .animateOutToRight, delay: 0.2)
        askForAgeView.animateIn(mode: .animateInFromLeft, delay: 0.3)
        
    }
    
    
    func showUnderAge(){
        let currentStageView = arrayStagesContainers[currentStageIndex]
        
        currentStageView.animateIn(mode: .animateOutToRight, delay: 0.2)
        underAgeView.animateIn(mode: .animateInFromLeft, delay: 0.3)
        
    }
    
    
    @IBAction func nextStageAction (_ sender: AnyObject){
        if currentStageIndex >= 3 {
            if self.validateStage4() {
                attempSignup()
            }else{
                
                let newStageIndex = currentStageIndex + 1
                switchToStageIndex(newStageIndex)
            }
        } else {
            var valid = false;
            switch currentStageIndex {
            case -1:
                valid = true
            case 0:
                valid = self.validateStage1()
            case 1:
                valid = self.validateStage2()
            case 2:
                valid = self.validateStage3()
            case 3:
                valid = self.validateStage4()
            case 4:
                valid = true
            default:
                break;
            }
            
            if valid {
                let newStageIndex = currentStageIndex + 1
                switchToStageIndex(newStageIndex)
            }
        }
    }
    
    func backStage() {
        let previousStageIndex = currentStageIndex - 1
        switchToStageIndex(previousStageIndex)
    }
    
    func switchToStageIndex(_ index: Int) {
        
        if index  >= arrayStagesContainers.count {
            return
        }
        
        // this is the initial stage switching
        if currentStageIndex == -1 && index == 0 {
            for view in arrayStagesContainers {
                view.isHidden = true
            }
            
            signupStage1.isHidden = false
            
            signupStage1.animateIn(mode: .animateInFromBottom, delay: 0.2)
            nextButton.animateIn(mode: .animateInFromBottom, delay: 0.3)
            
            
        } else {
            if currentStageIndex > index {
                // moving back
                let currentStageView = arrayStagesContainers[currentStageIndex]
                let previousStageView = arrayStagesContainers[index]
                
                currentStageView.animateIn(mode: .animateOutToRight, delay: 0.2)
                previousStageView.animateIn(mode: .animateInFromLeft, delay: 0.3)
                overAge = true
            } else {
                // moving next
                let currentStageView = arrayStagesContainers[currentStageIndex]
                let nextStageView = arrayStagesContainers[index]
                
                nextStageView.isHidden = false;
                
                currentStageView.animateIn(mode: .animateOutToLeft, delay: 0.2)
                nextStageView.animateIn(mode: .animateInFromRight, delay: 0.3)
            }
        }
        
        // UPDAET PAGE INDICATOR
        
        
        currentStageIndex = index
    }
    
    
    func birthdayChanged(sender:UIDatePicker){
        birthday = sender.date
    }
    
    func validateStage1() -> Bool{
        
        // validate email
        if let email = emailTextField.text, !email.isEmpty {
            
        } else {
            showMessage(message:"SINGUP_VALIDATION_EMAIL".localized, type: .warning)
            return false
        }
        
        if emailTextField.text!.isValidEmail() {
            tempUserInfoHolder.email = emailTextField.text!
        } else {
            showMessage(message:"SINGUP_VALIDATION_EMAIL_FORMAT".localized, type: .warning)
            return false
        }
        
        // validate Mobile
        
        if let ext = EXTTextField.text, !ext.isEmpty {
            
        } else {
            showMessage(message:"SINGUP_VALIDATION_MOBILE".localized, type: .warning)
            return false
        }
        
        if EXTTextField.text!.isPhoneNumber {
            tempUserInfoHolder.mobile = EXTTextField.text!
        } else {
            showMessage(message:"SINGUP_VALIDATION_MOBILE_FORMAT".localized, type: .warning)
            return false
        }
        if let mobile = mobileTextField.text, !mobile.isEmpty {
            
        } else {
            showMessage(message:"SINGUP_VALIDATION_MOBILE".localized, type: .warning)
            return false
        }
        
        if mobileTextField.text!.isPhoneNumber {
            tempUserInfoHolder.mobile?.append(mobileTextField.text!)
        } else {
            showMessage(message:"SINGUP_VALIDATION_MOBILE_FORMAT".localized, type: .warning)
            return false
        }
        
        
        // validate password
        if let psw = passwordTextField.text, !psw.isEmpty {
        } else {
            showMessage(message:"SINGUP_VALIDATION_PASSWORD".localized, type: .warning)
            return false
        }
        
        if passwordTextField.text!.length >= AppConfig.passwordLength {
            password = passwordTextField.text!;
        } else {
            showMessage(message:"SINGUP_VALIDATION_PASSWORD_LENGHTH".localized, type: .warning)
            return false
        }
        return checkEmailAndPhone()
    }
    
    
    
    
    func checkEmailAndPhone()-> Bool{
        
        return false
    }
    
    func validateStage2() -> Bool{
        
        if let fName = fNameTextField.text, !fName.isEmpty {
            tempUserInfoHolder.firstName = fName
        } else {
            showMessage(message:"SINGUP_VALIDATION_FNAME".localized, type: .warning)
            return false
        }
        
        if let lName = lNameTextField.text, !lName.isEmpty {
            tempUserInfoHolder.lastName = lName
        } else {
            showMessage(message:"SINGUP_VALIDATION_LNAME".localized, type: .warning)
            return false
        }
        
        return true
    }
    
    
    
    func validateStage3() -> Bool{
        
        //        if idCardImageView.image == nil{
        //            return true
        //        }
        //        attempSignup()
        return true
    }
    
    func validateStage4() -> Bool{
        return overAge
    }
    
    /// Register user
    func attempSignup () {
        // show loader
        self.showActivityLoader(true)
        self.view.isUserInteractionEnabled = false
        let image = idCardImageView.image
        ApiManager.shared.userSignup(user: tempUserInfoHolder, password: password,image:image) { (success: Bool, err: ServerError?, user: AppUser?) in
            // hide loader
            self.showActivityLoader(false)
            self.view.isUserInteractionEnabled = true
            if success {
                
                self.showMessage(message: "We send you an email please check your email".localized, type: .success)
                self.popOrDismissViewControllerAnimated(animated: true)
            } else {
                self.showMessage(message:(err?.type.errorMessage)!, type: .error)
            }
        }
    }
    
    // MARK: textField delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            EXTTextField.becomeFirstResponder()
        } else if textField == EXTTextField {
            mobileTextField.becomeFirstResponder()
        }else if textField == mobileTextField {
            nextStageAction(self)
            fNameTextField.becomeFirstResponder()
        } else if textField == fNameTextField {
            lNameTextField.becomeFirstResponder()
        } else if textField == lNameTextField {
            nextStageAction(self)
            textField.resignFirstResponder()
        }
        return true
    }
    
    
    
    // I am not ovrer 18
    
    
    
    @IBAction func close(_ sender: UIButton) {
        self.popOrDismissViewControllerAnimated(animated: true)
    }
    
    
    @IBAction func notOver18(_ sender: XUIButton) {
        overAge = false
        nextStageAction(self)
    }
    
    
    @IBAction func openGallery(_ sender: UIButton) {
        openGallery()
    }
    
    @IBAction func openCamera(_ sender: UIButton) {
        openCamera()
    }
    
    
    
    
    
}


extension SignupViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func openCamera(){
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    func openGallery(){
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]){
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        if let updatedImage = image.updateImageOrientionUpSide(){
            idCardImageView.image = updatedImage
        }else{
            idCardImageView.image = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // click on the image
    @IBAction func viewImage(_ sender: UITapGestureRecognizer) {
        if let image = self.idCardImageView.image{
            let newImageView = UIImageView(image: image)
            newImageView.frame = UIScreen.main.bounds
            newImageView.backgroundColor = .black
            newImageView.contentMode = .scaleAspectFit
            newImageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
            newImageView.addGestureRecognizer(tap)
            
            UIView.animate(withDuration: 0.5, delay: 0.3, options: .allowAnimatedContent, animations: {
                self.view.addSubview(newImageView)
            }, completion: nil)
            
            self.navigationController?.isNavigationBarHidden = true
            self.tabBarController?.tabBar.isHidden = true
        }
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
        
    }
    
    
}

