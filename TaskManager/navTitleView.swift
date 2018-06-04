//
//  navTitleView.swift
//  AnyCubed
//
//  Created by Nour  on 12/25/17.
//  Copyright © 2017 NourAraar. All rights reserved.
//

import UIKit

enum navTitleViewTypes{
    
    case signin
    case home
    case signup
}


class navTitleView: AbstractNibView {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    

    
    
    func fillWith(type:navTitleViewTypes){
        
        switch type {
        case .home:
            imageView.image = #imageLiteral(resourceName: "cube")
            titleLabel.text = "HOME_TITLE".localized
        case .signin:
            imageView.image = #imageLiteral(resourceName: "cube")
            titleLabel.text = "SIGNIN_TITLE".localized
        case .signup:
            imageView.image = #imageLiteral(resourceName: "cube")
            titleLabel.text = "SIGNUP_TITLE".localized
        }
        
        setupFrames()
    }
    
    
    override func customizeView() {
        self.imageView.contentMode = .scaleAspectFit
        self.titleLabel.font = AppFonts.big
        self.titleLabel.textColor = AppColors.green
        self.backgroundColor = .clear
    }
    
    
    
    
    func setupFrames()
    {
        
        let height: CGFloat = UIApplication.visibleViewController()?.navigationController?.navigationBar.frame.height ?? 44
        let image_size: CGFloat = height * 0.6
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0,
                                      y: (height - image_size) / 2,
                                      width: (imageView.image == nil) ? 0 : image_size,
                                      height: image_size)
        
        let titleWidth: CGFloat = titleLabel.intrinsicContentSize.width + 10
        titleLabel.frame = CGRect(x: imageView.frame.maxX + 5,
                                   y: 0,
                                   width: titleWidth,
                                   height: height)
        
        
        
        contentWidth = Int(imageView.frame.width + titleWidth + 32)
        
        self.frame = CGRect(x: -CGFloat(contentWidth/2) , y: 0, width: CGFloat(contentWidth), height: height)
    }
    
    
    var contentWidth: Int = 0 //if its CGFloat, it infinitely calls layoutSubviews(), changing franction of a width
    override func layoutSubviews() {
        super.layoutSubviews()
        let height: CGFloat = UIApplication.visibleViewController()?.navigationController?.navigationBar.frame.height ?? 44
        let width:CGFloat = UIApplication.visibleViewController()?.navigationController?.navigationBar.frame.width ?? 375
        let startPoint = CGFloat((width / 2) - CGFloat(contentWidth / 2))
        self.frame = CGRect(x: startPoint , y: 0, width: CGFloat(contentWidth), height: height)
    }

}
