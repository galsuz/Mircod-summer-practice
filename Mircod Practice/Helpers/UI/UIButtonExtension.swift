//
//  UIButtonExtension.swift
//  Mircod Practice
//
//  Created by Кирилл Королёв on 29.06.2021.
//

import Foundation
import UIKit

extension UIButton {
    
    convenience init(text: String, isEnabled: Bool = true) {
        self.init()
        self.setTitle(text, for: .normal)
        self.backgroundColor = UIColor.mainOrangeColor
        self.layer.cornerRadius = 30
        changeColor(isActive: isEnabled)
        snp.makeConstraints { make in
            make.height.equalTo(60)
        }
    }
    
    func changeColor(isActive: Bool) {
        self.backgroundColor = isActive ? UIColor.mainOrangeColor : UIColor.mainDarkGreyColor
        self.isEnabled = isActive
    }
    
                     
}
