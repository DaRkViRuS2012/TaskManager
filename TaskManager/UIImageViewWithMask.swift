//
//  Utils.swift
//  VerbTool
//
//  Created by Hani on 2/29/16.
//  Copyright © 2016 BrainSocket. All rights reserved.
//

import UIKit

@IBDesignable
class UIImageViewWithMask: UIImageView {
    var maskImageView = UIImageView()
    
    @IBInspectable
    var maskImage: UIImage? {
        didSet {
            maskImageView.image = maskImage
            updateView()
        }
    }
    
    // This updates mask size when changing device orientation (portrait/landscape)
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        if maskImageView.image != nil {
            maskImageView.frame = bounds
            mask = maskImageView
        }
    }
}
