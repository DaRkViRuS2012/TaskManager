//
//  UILable.swift
//  Wardah
//
//  Created by Nour  on 11/20/17.
//  Copyright © 2017 AlphaApps. All rights reserved.
//


import UIKit

extension UILabel{


    func addStrikeLine(){
    
        if let text = self.text{
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
            attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
            self.attributedText = attributeString
        }
    
    }

}
