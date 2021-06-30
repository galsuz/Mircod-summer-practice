//
//  UIButtonExtension.swift
//  Mircod Practice
//
//  Created by Кирилл Королёв on 29.06.2021.
//

import Foundation
import UIKit

extension UIButton {
    
    convenience init(text: String) {
        self.init()
        self.setTitle(text, for: .normal)
        self.backgroundColor = UIColor.mainOrangeColor
        self.layer.cornerRadius = 35
        self.frame.size.height = 60
    }
    
    func changeColor(isActive: Bool) {
        self.backgroundColor = isActive ? UIColor.mainOrangeColor : UIColor.mainDarkGreyColor
    }
}
