//
//  AddSubView.swift
//  Hi_MSG
//
//  Created by 박준서 on 2022/11/10.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ items: UIView...) {
        items.forEach { self.addSubview($0) }
    }
}
