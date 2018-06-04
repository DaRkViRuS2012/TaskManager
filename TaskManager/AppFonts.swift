//
// AppFonts.swift
// Wardah
//
//  Created by Molham Mahmoud on 26/04/17.
//  Copyright © 2017. All rights reserved.
//

import UIKit

struct AppFonts {
    // MARK: fonts names
    private static let fontNameBoldEN = "OpenSans-Bold"
    private static let fontNameBoldAR = "DroidArabicKufi-Bold"
    private static let fontNameSemiBoldEN = "OpenSans-SemiBold"
    private static let fontNameSemiBoldAR = "DroidArabicKufi"
    private static let fontNameRegularEN = "OpenSans-Regular"
    private static let fontNameRegularAR = "DroidArabicKufi"
    private static let HelveticaNeueFont = "Helvetica Neue"
    
    // MARK: font sizes
    private static let sizeXBig:Double = 31
    private static let sizeBig:Double = 20
    private static let sizeNormal:Double = 18
    private static let sizeSmall:Double = 14
    private static let sizeXSmall:Double = 13
    private static let sizeXtraSmall:Double = 10
    
    private enum FontWeight {
        case bold
        case semiBold
        case regular
        case thin
    }
    
    // MARK: fonts getters
    // font to be used in the app
    static var xBig: UIFont {
        let fontName = getFontName(weight:.thin)
        return UIFont(name: fontName, size: CGFloat(sizeXBig * fontScale))!
    }
    
    static var xBigBold: UIFont {
        let fontName = getFontName(weight:.bold)
        return UIFont(name: fontName, size: CGFloat(sizeXBig * fontScale))!
    }
    
    static var xBigSemiBold: UIFont {
        let fontName = getFontName(weight:.semiBold)
        return UIFont(name: fontName, size: CGFloat(sizeXBig * fontScale))!
    }

    static var big: UIFont {
        let fontName = getFontName(weight:.thin)
        return UIFont(name: fontName, size: CGFloat(sizeBig * fontScale))!
    }
    
    static var bigBold: UIFont {
        let fontName = getFontName(weight:.bold)
        return UIFont(name: fontName, size: CGFloat(sizeBig * fontScale))!
    }
    
    static var bigSemiBold: UIFont {
        let fontName = getFontName(weight:.semiBold)
        return UIFont(name: fontName, size: CGFloat(sizeBig * fontScale))!
    }

    static var normal: UIFont {
        let fontName = getFontName(weight:.thin)
        return UIFont(name: fontName, size: CGFloat(sizeNormal * fontScale))!
    }
    
    static var normalBold: UIFont {
        let fontName = getFontName(weight:.bold)
        return UIFont(name: fontName, size: CGFloat(sizeNormal * fontScale))!
    }
    
    static var normalSemiBold: UIFont {
        let fontName = getFontName(weight:.semiBold)
        return UIFont(name: fontName, size: CGFloat(sizeNormal * fontScale))!
    }

    static var small: UIFont {
        let fontName = getFontName(weight:.thin)
        return UIFont(name: fontName, size: CGFloat(sizeSmall * fontScale))!
    }
    
    static var smallBold: UIFont {
        let fontName = getFontName(weight:.bold)
        return UIFont(name: fontName, size: CGFloat(sizeSmall * fontScale))!
    }
    
    static var smallSemiBold: UIFont {
        let fontName = getFontName(weight:.semiBold)
        return UIFont(name: fontName, size: CGFloat(sizeSmall * fontScale))!
    }
    
    static var xSmall: UIFont {
        let fontName = getFontName(weight:.thin)
        return UIFont(name: fontName, size: CGFloat(sizeXSmall * fontScale))!
    }
    
    static var xSmallBold: UIFont {
        let fontName = getFontName(weight:.bold)
        return UIFont(name: fontName, size: CGFloat(sizeXSmall * fontScale))!
    }
    
    static var xSmallSemiBold: UIFont {
        let fontName = getFontName(weight:.semiBold)
        return UIFont(name: fontName, size: CGFloat(sizeXSmall * fontScale))!
    }
    
    
    static var xtraSmall: UIFont {
        let fontName = getFontName(weight:.thin)
        return UIFont(name: fontName, size: CGFloat(sizeXtraSmall * fontScale))!
    }
    
    static var xtraSmallBold: UIFont {
        let fontName = getFontName(weight:.bold)
        return UIFont(name: fontName, size: CGFloat(sizeXtraSmall * fontScale))!
    }
    
    static var xtraSmallSemiBold: UIFont {
        let fontName = getFontName(weight:.semiBold)
        return UIFont(name: fontName, size: CGFloat(sizeXtraSmall * fontScale))!
    }
    
    // Font scale
    private static var fontScale:Double {
        var scale : Double = 1.0;
        if (ScreenSize.isSmallScreen) {    // iPhone 4 & 5 (480 - 568)
            scale = 0.8;
        } else if (ScreenSize.isMidScreen){ // iPhone 6 & 7 (667)
            scale = 0.95;
        } else {                    // iPhone 6+ & 7+ (736)
            scale = 1.0;
        }
        return scale;
    }
    
    private static func getFontName(weight: FontWeight) -> String {
        if (AppConfig.currentLanguage == .arabic) {
            switch weight {
            case .bold:
                return fontNameBoldAR
            case .semiBold:
                return fontNameSemiBoldAR
            case .thin:
                return HelveticaNeueFont
            default:
                return fontNameRegularAR
            }
        } else {
            switch weight {
            case .bold:
                return fontNameBoldEN
            case .semiBold:
                return fontNameSemiBoldEN
            case .thin:
                return HelveticaNeueFont
            default:
                return fontNameRegularEN
            }
        }
    }
}


