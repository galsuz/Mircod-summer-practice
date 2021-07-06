//
//  LoginView.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 02.07.2021.
//

import UIKit
import SnapKit
class LoginView: UIView, UITextFieldDelegate {
    
    lazy var backButton = UIButton()
    lazy var logInLabel = UILabel()
    lazy var textFieldsStackView: UIStackView = UIStackView(views: [loginTextField, passwordTextField],
                                                            axis: .vertical)
    lazy var loginTextField = UITextField(placeholder: "login")
    lazy var passwordTextField = UITextField(placeholder: "password")
    lazy var logInButton: UIButton = UIButton(text: "Log in", isEnabled: false)
    
    func configureView(){
        addSubviews()
        
        // Elements configuration
        initConstraints()
        configureButton()
        configureTextFields()
        configurelabel()
    }
    private func addSubviews(){
        addSubview(backButton)
        addSubview(logInLabel)
        addSubview(textFieldsStackView)
        addSubview(logInButton)
    }
    
    private func initConstraints() {
        backButton.snp.makeConstraints{make in
            make.height.width.equalTo(11)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(60)
            make.leading.equalToSuperview().inset(16)
        }
        logInLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.top).inset(37)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
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
    
    private func configureButton() {
        backButton.setImage(#imageLiteral(resourceName: "Union"), for: .normal)
    }
    
    private func configureTextFields(){
        let textFields: [UITextField] = [loginTextField, passwordTextField]
        textFields.forEach { textField in
            textField.delegate = self
            textField.addTarget(self, action: #selector(updateTextFields), for: .editingChanged)
        }
        
    }
    
    private func configurelabel(){
        logInLabel.font = UIFont(name: "ProximaNova-Bold", size: 25)
        logInLabel.text = "Log in"
    }
    
    // MARK: - Actions
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
