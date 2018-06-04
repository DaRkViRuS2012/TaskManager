//
//  UITextField.swift
//  Wardah
//
//  Created by Molham Mahmoud on 6/20/17.
//  Copyright © 2017 BrainSocket. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func appStyle() {
        self.borderStyle = .none
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let padding = CGFloat(16.0)
        let border = CALayer()
        let height = CGFloat(1.0)

        border.borderColor = AppColors.borderColor.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - height , width:  screenWidth - 2 * padding, height: height)
        border.borderWidth = height
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.clear
        self.font = AppFonts.normal
        self.textAlignment = .left
        if (AppConfig.currentLanguage == .arabic) {
            self.textAlignment = .right
        }
        self.textColor = AppColors.green
        self.addTarget(self, action: #selector(startEditing), for: .editingChanged)
        self.addTarget(self, action: #selector(endEdit), for: .editingDidEnd)
    }
    
    
    @objc func startEditing(){
        self.textColor = AppColors.orange
    }
    
    @objc func endEdit(){
        self.textColor = AppColors.green
    }
    
    func searchBarStyle() {
        self.borderStyle = .none
        self.backgroundColor = UIColor.clear
        self.font = AppFonts.big
        self.textAlignment = .left
        if (AppConfig.currentLanguage == .arabic) {
            self.textAlignment = .right
        }
    }

    func appStyle(padding: Int) {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let border = CALayer()
        let height = CGFloat(1.0)
        border.borderColor = AppColors.grayXDark.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - height - 5, width:  screenWidth - 2 * CGFloat(padding), height: height)
        border.borderWidth = height
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.clear
        self.font = AppFonts.xSmall
        self.textAlignment = .left
        if (AppConfig.currentLanguage == .arabic) {
            self.textAlignment = .right
        }
    }
    
    func errorMode(){
        self.borderStyle = .none
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let padding = CGFloat(16.0)
        let border = CALayer()
        let height = CGFloat(1.0)
        
        border.borderColor = UIColor.red.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - height - 5 , width:  screenWidth - 2 * padding, height: height)
        border.borderWidth = height
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.clear
        self.font = AppFonts.normal
        self.textAlignment = .left
        if (AppConfig.currentLanguage == .arabic) {
            self.textAlignment = .right
        }
    }
    
    func addIconButton(image:String){
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: image), for: .normal)
        
        if (AppConfig.currentLanguage == .arabic) {
            button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -16)
        }else{
            button.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0)
        }
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 30), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
       // button.addTarget(self, action: #selector(showOrHideText) ,for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
   
    }
    
    func showOrHideText(){
        self.isSecureTextEntry = !isSecureTextEntry
    }
    
    
    
}
