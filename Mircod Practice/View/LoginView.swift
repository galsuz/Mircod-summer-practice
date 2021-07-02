//
//  LoginView.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 02.07.2021.
//

import UIKit

class LoginView: UIView {

    lazy var stackView: UIStackView = {
        let view = makeStackView(textFields: makeTextFields())
        return view
    }()
    
    lazy var logInButton: UIButton = {
        let button = makeButton()
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func addViews(){
        print("log: \(frame)")
       // addSubview(stackView)
        addSubview(logInButton)
    }
}
