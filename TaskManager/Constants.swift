//
//  Constants.swift
//  Wardah
//
//  Created by Dania on 12/25/16.
//  Copyright © 2016 . All rights reserved.
//
import UIKit


// MARK: Application configuration
struct AppConfig {
    // domain
    static let appBaseDevURL = "https://rombeye.falcon9.io/dev/"
    static let appBaseLiveURL = "https://rombeye.falcon9.io/dev/"
    static let useLiveAPI: Bool = false
    static let useCurrentLocation: Bool = false
    // social
    static let instagramClienID = "a33bd13f810c4df7ae344437c21fc926"
    static let instagramRedirectURI = "http://alpha-apps.ae"
    static let twitterConsumerKey = "eq0dVMoM1JqNcR6VJJILsdXNo"
    static let twitterConsumerSecret = "6JkdvzSijm13xjBW0fYSEG4yF2tbro8pwxz1vDx290Bj0Mw2vI"
    // validation
    static let passwordLength = 6
    // current application language
    static var currentLanguage:AppLanguage {
        let locale = NSLocale.current.languageCode
        if (locale == "ar") {
            return .arabic
        }
        return .english
    }
    
    
    
    
    
    /// Set navigation bar style, text and color
    static func setNavigationStyle() {
        // set text title attributes
        let attrs = [NSAttributedStringKey.foregroundColor : UIColor.black ,
                     NSAttributedStringKey.font : AppFonts.big]
        UINavigationBar.appearance().titleTextAttributes = attrs
        // set background color
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = AppColors.grayXDark
        //        UINavigationBar.appearance().height = 94
        //        UINavigationBar.appearance().frame.size = CGSize(width: UIScreen.main.bounds.width, height: 94)//UINavigationBar.appearance().sizeThatFits(CGSize(width: UIScreen.main.bounds.width, height: 94))
        // UINavigationBar().sizeThatFits(CGSize(width: UIScreen.main.bounds.width, height: 64))
        // remove under line
        //        UINavigationBar.appearance().shadowImage = UIImage()
        //        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    static func setTabBarStyle(){
        
        UITabBar.appearance().tintColor = AppColors.green
        UITabBar.appearance().backgroundColor = .white
    }
}


// MARK: Notifications
extension Notification.Name {
    static let notificationLocationChanged = Notification.Name("NotificationLocationChanged")
    static let notificationUserChanged = Notification.Name("NotificationUserChanged")
    static let notificationFilterOpened = Notification.Name("NotificationFilterOpened")
    static let notificationFilterClosed = Notification.Name("NotificationFilterClosed")
    static let notificationRefreshStories = Notification.Name("NotificationRefreshStories")
    static let notificationRefreshProducts = Notification.Name("NotificationRefreshProducts")
    static let notificationRefreshCart  = Notification.Name("NotificationRefreshCart")
    
}

// MARK: Screen size
enum ScreenSize {
    static let isSmallScreen =  UIScreen.main.bounds.height <= 568 // iphone 4/5
    static let isMidScreen =  UIScreen.main.bounds.height <= 667 // iPhone 6 & 7
    static let isBigScreen =  UIScreen.main.bounds.height >= 736 // iphone 6Plus/7Plus
    static let isIphone = UIDevice.current.userInterfaceIdiom == .phone
}

enum ScreenSizeRatio{
    
    static let smallRatio = CGFloat(UIScreen.main.bounds.width / 750 ) * 2.0
    static let largRatio =  CGFloat(UIScreen.main.bounds.width / 750 )
}



// MARK: Application language
enum AppLanguage{
    case english
    case arabic
    
    var langCode:String {
        switch self {
        case .english:
            return "en"
        case .arabic:
            return "ar"
        }
    }
}






