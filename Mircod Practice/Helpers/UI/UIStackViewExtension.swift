//
//  UIStackViewExtension.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 29.06.2021.
//

import Foundation
import UIKit

extension UIStackView {
    convenience init(views: [UIView],
                     spacing: CGFloat = 11,
                     axis: NSLayoutConstraint.Axis = .horizontal) {
        self.init()
        self.spacing = spacing
        self.axis = axis
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
