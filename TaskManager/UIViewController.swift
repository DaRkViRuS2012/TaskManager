//
//  UIViewController.swift
//  Wardah
//
//  Created by Dania on 7/4/17.
//  Copyright © 2017 BrainSocket. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    
    func findContentViewControllerRecursively() -> UIViewController? {
    var childViewController: UIViewController?
    if let tabBarController:UITabBarController = self as? UITabBarController{
        childViewController = tabBarController.selectedViewController
    } else if let navigationContoller :UINavigationController = self as? UINavigationController {
        childViewController = navigationContoller.topViewController
    } else if let splitViewController:UISplitViewController = self as? UISplitViewController {
        childViewController = splitViewController.viewControllers.last
    } else if self.presentedViewController != nil {
        childViewController = self.presentedViewController
    }
    // FIXME: UIAlertController is a kludge and should be removed
    let shouldContinueSearch: Bool  = (childViewController != nil) && !childViewController!.isKind(of: UIAlertController.self)
    return shouldContinueSearch ? childViewController?.findContentViewControllerRecursively() : self
    }
    
    func isPresentedModally() -> Bool {
        return self.presentingViewController?.presentedViewController == self
    }
    
    func popOrDismissViewControllerAnimated(animated: Bool){
        if (self.isPresentedModally()) {
            self.dismiss(animated: animated, completion: nil)
        } else if (self.navigationController != nil) {
            self.navigationController?.popViewController(animated: animated)
        }
    }
}







import Foundation

private var AssociatedObjectHandle: UInt8 = 0

extension UINavigationBar {
    
    var height: CGFloat {
        get {
            if let h = objc_getAssociatedObject(self, &AssociatedObjectHandle) as? CGFloat {
                return h
            }
            return 0
        }
        set {
            
           objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    //OBJC_ASSOCIATION_RETAIN_NONATOMIC
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        if self.height > 0 {
            return CGSize(width: self.superview!.bounds.size.width, height: self.height)
            
        }
        return super.sizeThatFits(size)
    }
    
}

