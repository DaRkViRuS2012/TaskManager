//
//  XUILabel.swift
//  Wardah
//
//  Created by Nour  on 12/22/17.
//  Copyright © 2017 AlphaApps. All rights reserved.
//

import Foundation
import UIKit

class XUILabel:UILabel{

    override func awakeFromNib() {
        super.awakeFromNib()
        
        if self.tag == -1{
            self.font = AppFonts.xSmall
        }else if self.tag > -1{
            self.font = AppFonts.normal
        }else{
            self.font = UIFont.systemFont(ofSize: 10)
        }
        
        
            self.text = self.text?.localized
       
    }

}
