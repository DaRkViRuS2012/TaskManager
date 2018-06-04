//
//  UIStoryBoard.swift
//  Wardah
//
//  Created by Dania on 7/5/17.
//  Copyright © 2017 BrainSocket. All rights reserved.
//

import Foundation
import UIKit
extension UIStoryboard{
    
    static var mainStoryboard:UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    static var startStoryboard:UIStoryboard {
        return UIStoryboard(name: "Start", bundle: nil)
    }
    
    static var chatStoryboard:UIStoryboard {
        return UIStoryboard(name: "Chat", bundle: nil)
    }
    
    static var profileStoryboard:UIStoryboard {
        return UIStoryboard(name: "Profile", bundle: nil)
    }
}
