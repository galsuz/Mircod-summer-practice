//
//  RegistrationView.swift
//  Mircod Practice
//
//  Created by Кирилл Королёв on 05.07.2021.
//

import UIKit
import SnapKit

class RegistrationView: UIView, UITextFieldDelegate {
    
    lazy var backButton = UIButton()
    lazy var registerLabel = UILabel()
    lazy var textFieldsStackView: UIStackView = UIStackView(views: [loginTextField, passwordTextField, firstNameTextField, secondNameTextField],
                                                            axis: .vertical)
    lazy var loginTextField = UITextField(placeholder: "your login")
    lazy var passwordTextField = UITextField(placeholder: "password")
    lazy var firstNameTextField = UITextField(placeholder: "first_name")
    lazy var secondNameTextField = UITextField(placeholder: "last_name")
    lazy var nextButton: UIButton = UIButton(text: "next", isEnabled: false)
    
    func configureView() {
        addSubviews()
        
        initConstraints()
        configureButton()
        configureTextFields()
        configureLabel()
    }
    
    private func addSubviews() {
        addSubview(backButton)
        addSubview(registerLabel)
        addSubview(textFieldsStackView)
        addSubview(nextButton)
    }
    
    private func initConstraints() {
        backButton.snp.makeConstraints{ make in
            make.height.width.equalTo(11)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(60)
            make.leading.equalToSuperview().inset(16)
        }
        registerLabel.snp.makeConstraints{ make in
            make.top.equalTo(backButton.snp.top).inset(37)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        
        textFieldsStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(registerLabel.snp.bottom).offset(32)
        }
        
        nextButton.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(textFieldsStackView.snp.bottom).offset(21)
        }
    }
    
    private func configureButton() {
        backButton.setImage(#imageLiteral(resourceName: "Union"), for: .normal)
    }
    private func configureTextFields() {
        let textFields: [UITextField] = [loginTextField, passwordTextField, firstNameTextField, secondNameTextField]
        textFields.forEach { textField in
            textField.delegate = self
            textField.addTarget(self, action: #selector(updateTextFields), for: .editingChanged)
        }
    }
    
    private func configureLabel() {
        registerLabel.font = UIFont(name: "ProximaNova-Bold", size: 25)
        registerLabel.text = "Register"
        
    }
    
    // MARK: - Actions
    @objc
    private func updateTextFields() {
        guard let loginText = loginTextField.text, loginText != "",
              let passwordText = passwordTextField.text, passwordText != "",
              let firstNameText = firstNameTextField.text, firstNameText != "",
              let secondNameText = secondNameTextField.text, secondNameText != "" else {
            nextButton.changeColor(isActive: false)
            return
        }
        nextButton.changeColor(isActive: true)
    }
    
    
    
}

