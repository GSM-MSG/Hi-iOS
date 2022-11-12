import UIKit

extension UIFont {
    enum Family: String {
        case black = "Black",
             bold = "Bold",
             extraBold = "ExtraBold",
             extraLight = "ExtraLight",
             light = "Light",
             medium = "Medium",
             regular = "Regular",
             semiBold = "SemiBold",
             thin = "Thin"
    }
    
    static func hi_MSG(size: CGFloat, family: Family) -> UIFont! {
        return UIFont(name: "Pretendard-\(family.rawValue)", size: size)
    }
}
