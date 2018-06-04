
import UIKit

// helper for creating an image-only UITabBarItem
extension UITabBarItem {
    
    open override func awakeFromNib() {
        self.imageInsets = UIEdgeInsets(top:6,left:0,bottom:-6,right:0)
        // displace to hide
        self.titlePositionAdjustment = UIOffset(horizontal:0,vertical:30000)
    }
}
