//
//  UISimpleButtonExtension.swift
//  Mircod Practice
//
//  Created by Алсу Гиниятуллина  on 30.06.2021.
//

import Foundation
import UIKit

extension UIButton {
    
    convenience init(text: String, type: Int) {
        
        self.init()
        
//        self.setTitle(text, for: .normal)
//        self.titleLabel?.font = UIFont(name:"ProximaNova-Regular", size: 16)
        
        self.setTitleColor(UIColor.black, for: .normal)
        self.titleLabel?.textAlignment = .center
        self.frame.size.height = 49
        self.frame.size.width = 135
        
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name:"ProximaNova-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16),
              .foregroundColor: UIColor.black,
              .underlineStyle: NSUnderlineStyle.single.rawValue]
                 
        
        let attributeString = NSMutableAttributedString(string: "Back to main",
                                                            attributes: yourAttributes)
        self.setAttributedTitle(attributeString, for: .normal)
        
    }
}
