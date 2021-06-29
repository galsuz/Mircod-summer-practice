//
//  UIStackViewExtension.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 29.06.2021.
//

import Foundation
import UIKit

extension UIStackView {
    convenience init(textFields: [UITextField]) {
        self.init()
        self.spacing = 11
        for textField in textFields {
            self.addArrangedSubview(textField)
        }
    }
}
