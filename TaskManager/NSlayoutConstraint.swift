//
//  NSlayoutConstraint.swift
//  Wardah
//
//  Created by Nour  on 11/5/17.
//  Copyright © 2017 AlphaApps. All rights reserved.
//

import Foundation

import UIKit

class XNSLayoutConstraint: NSLayoutConstraint {
    override func awakeFromNib() {
        let ratio = Double(UIScreen.main.bounds.width / 750 ) * 2.0
        self.constant = self.constant * CGFloat(ratio)
    }
    
    func setNewConstant(_ newconstant:CGFloat){
        
        self.constant = newconstant
        
    }
}


extension NSLayoutConstraint{
    
    
    open override func awakeFromNib() {
        let ratio = Double(UIScreen.main.bounds.width / 750 ) * 2.0
        self.constant = self.constant * CGFloat(ratio)
    }
    
}
