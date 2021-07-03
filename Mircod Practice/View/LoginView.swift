//
//  LoginView.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 02.07.2021.
//

import UIKit
import SnapKit
class LoginView: UIView, UITextFieldDelegate {
    
    lazy var logInLabel = UILabel()
    lazy var textFieldsStackView: UIStackView = UIStackView(views: [loginTextField, passwordTextField],
                                                            axis: .vertical)
    lazy var loginTextField = UITextField(placeholder: "login")
    lazy var passwordTextField = UITextField(placeholder: "password")
    lazy var logInButton: UIButton = UIButton(text: "Log in", isEnabled: false)
    
    func configureView(){
        // Add subviews
        addSubview(logInLabel)
        addSubview(textFieldsStackView)
        addSubview(logInButton)
        
        // Elements configuration
        initConstraints()
        configureTextFields()
        configurelabel()
    }
    
    private func initConstraints(){
        logInLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(32)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        textFieldsStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(logInLabel.snp.bottom).offset(32)
        }
        
        logInButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(textFieldsStackView.snp.bottom).offset(21)
        }
    }
    
    private func configureTextFields(){
        let textFields: [UITextField] = [loginTextField, passwordTextField]
        textFields.forEach { textField in
            textField.delegate = self
            textField.addTarget(self, action: #selector(updateTextFields), for: .editingChanged)
        }
        
    }
    
    private func configurelabel(){
        logInLabel.font = UIFont(name: "ProximaNovaBold", size: 25)
        logInLabel.text = "Log in"
    }
    
    // Mark: - Action
    @objc
    private func updateTextFields(){
        guard let loginText = loginTextField.text, loginText != "",
              let passwordText = passwordTextField.text, passwordText != "" else {
            logInButton.changeColor(isActive: false)
            return
        }
        logInButton.changeColor(isActive: true)
        
    }
}
