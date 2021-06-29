//
//  UISegementConrollExtension.swift
//  Mircod Practice
//
//  Created by Кирилл Королёв on 29.06.2021.
//

import Foundation
import UIKit

extension UISegmentedControl {
    convenience init(label1: String, label2: String) {
        self.init()
        self.setTitle(label1, forSegmentAt: 0)
        self.setTitle(label2, forSegmentAt: 1)
        self.selectedSegmentTintColor = UIColor.mainOrangeColor
    }
}
