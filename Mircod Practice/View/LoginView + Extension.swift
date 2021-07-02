//
//  LoginView + Extension.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 02.07.2021.
//

import UIKit
import SnapKit

extension LoginView {
    
    func makeTextFields() -> [UITextField] {
        return [UITextField(placeholder: "login"), UITextField(placeholder: "password")]
    }
    
    func makeStackView(textFields: [UITextField]) -> UIStackView {
        let stackView = UIStackView(textFields: textFields)
        stackView.snp.makeConstraints { make in
            make.left.right.equalTo(16)
            make.top.equalTo(176)
        }
        return stackView
    }
    
    func makeButton() -> UIButton{
        let button = UIButton(text: "Log in")
        button.snp.makeConstraints { make in
            make.top.leading.equalTo(stackView.snp.bottom).offset(16)
            //make.top.leading.equalTo(16)
        }
        return button
    }
    
}
