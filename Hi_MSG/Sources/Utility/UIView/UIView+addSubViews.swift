import Foundation
import UIKit

extension UIView {
    func addSubviews(_ items: UIView...) {
        items.forEach { self.addSubview($0) }
    }
}
