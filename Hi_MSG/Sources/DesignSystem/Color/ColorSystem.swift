import UIKit

extension UIColor {
    enum Hi_MSG: String{
        case A = ""
    }
    
    static func hi_MSG(_ colorName: UIColor.Hi_MSG) -> UIColor! {
        return UIColor(named: colorName.rawValue)
    }
}
