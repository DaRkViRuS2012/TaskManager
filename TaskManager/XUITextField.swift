//
//  XUITextField.swift
//  Wardah
//
//  Created by Nour  on 12/22/17.
//  Copyright © 2017 AlphaApps. All rights reserved.
//

import Foundation
import UIKit


private var kAssociationKeyMaxLength: Int = 0

@IBDesignable
class XUITextField:UITextField{
    
    @IBInspectable var maxLength: Int {
        get {
            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
                return length
            } else {
                return Int.max
            }
        }
        set {
            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
        }
    }
    
    @objc func checkMaxLength(textField: UITextField) {
        guard let prospectiveText = self.text,
            prospectiveText.characters.count > maxLength
            else {
                return
        }
        
        let selection = selectedTextRange
        let maxCharIndex = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        text = prospectiveText.substring(to: maxCharIndex)
        selectedTextRange = selection
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if tag > 0{
            self.appStyle()
        }
        self.placeholder = self.placeholder?.localized
        if tag > 1{
            self.font = AppFonts.normal
        }else{
            self.font = AppFonts.xSmall
        }
        
    }

    
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        return UIEdgeInsetsInsetRect(bounds,
//                                     UIEdgeInsetsMake(0, 40, 0, 15))
//    }
//    
//    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//        return UIEdgeInsetsInsetRect(bounds,
//                                     UIEdgeInsetsMake(0, 40, 0, 15))
//    }
//    
//    override func editingRect(forBounds bounds: CGRect) -> CGRect {
//        return UIEdgeInsetsInsetRect(bounds,
//                                     UIEdgeInsetsMake(0, 40, 0, 15))
//    }
}


class PasswordTextField:UITextField{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if tag != -1{
            self.appStyle()
        }
        self.placeholder = self.placeholder?.localized
        self.font = AppFonts.normal
        self.addIconButton()
    }
    
    func addIconButton(){
        
        self.addIconButton(image: "eyeIcon")
        let passwordTextFieldRightButton = self.rightView as! UIButton
        passwordTextFieldRightButton.addTarget(self, action: #selector(hideText), for: .touchUpInside)
        
        
    }
    
    @objc func hideText(){
        self.isSecureTextEntry = !self.isSecureTextEntry
    }
    
    

}




class CreditCardTextField:UITextField{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      customize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customize()
    }
    
    
    func customize(){
        self.appStyle()
        self.font = AppFonts.xtraSmall
        
    }
    
    
   

    
    
    
}



extension String {
    func grouping(every groupSize: String.IndexDistance, with separator: Character) -> String {
        let cleanedUpCopy = replacingOccurrences(of: String(separator), with: "")
        return String(cleanedUpCopy.characters.enumerated().map() {
            $0.offset % groupSize == 0 ? [separator, $0.element] : [$0.element]
            }.joined().dropFirst())
    }
}

