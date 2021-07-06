//
//  UISimpleButtonExtension.swift
//  Mircod Practice
//
//  Created by Кирилл Королёв on 05.07.2021.
//

import Foundation
import UIKit

enum ButtonTypes {
    case underlined
    case rightArrow
    case leftArrow
}


extension UIButton {
    convenience init(text: String, cellType: ButtonTypes) {
        self.init()
        self.setTitle(text, for: .normal)
        self.setTitleColor(.black, for: .normal)
        
        snp.makeConstraints() { make in
            make.height.equalTo(49)
            make.width.equalTo(135)
        }
        
        switch cellType {
        case .underlined:
            let lineView = UIView()
            lineView.backgroundColor = .black
            addSubview(lineView)
            
            lineView.snp.makeConstraints { make in
                make.width.bottom.centerX.equalToSuperview()
                make.height.equalTo(1)
            }
            
        case .rightArrow:
            setImage(UIImage(named: "rightArrow"), for: .normal)
            semanticContentAttribute = .forceRightToLeft
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
            sizeToFit()
        case .leftArrow:
            setImage(UIImage(named: "leftArrow"), for: .normal)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40)
            sizeToFit()
        }
        
    }
}
