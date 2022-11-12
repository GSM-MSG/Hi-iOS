import UIKit

extension UIImage {
    enum Hi_MSG: String {
        case hi_Logo = "HI_LOGO"
        case hi_Logo2 = "HI LOGO2"
        case welcome_Image = "Welcome_Image"
    }
    
    static func hi_MSG(_ imageName: UIImage.Hi_MSG) -> UIImage! {
        return UIImage(named: "\(imageName.rawValue)")
    }
}
