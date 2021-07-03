//
//  UITextFieldExtension.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 29.06.2021.
//

import Foundation
import UIKit
import SnapKit

extension UITextField {
    convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.borderTextFieldColor.cgColor
        self.layer.borderWidth = 1
        
        snp.makeConstraints { make in
            make.height.equalTo(52)
        }
    }
}
