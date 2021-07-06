//
//  LoggedOutView.swift
//  Mircod Practice
//
//  Created by Кирилл Королёв on 05.07.2021.
//

import UIKit
import SnapKit

class LoggedOutView: UIView {
    
    lazy var backButton = UIButton()
    
    lazy var buttonsStackView: UIStackView = UIStackView(views: [logInButton, registerButton],
                                                         spacing: 13,
                                                         axis: .horizontal,
                                                         distribution: .fillEqually)
    
    lazy var logInButton: UIButton = UIButton(text: "Log in", isEnabled: true)
    
    lazy var registerButton: UIButton = UIButton(text: "Register", isEnabled: true)
    
    var imageView = UIImageView()
    
    var demoLabel = UILabel()
    
//    var backArrowButton = UIImageView = Ima
    
    
    func configureView() {
        // TODO: - create extension UILabelExtension
        imageView.image = #imageLiteral(resourceName: "demoPhoto")
        demoLabel.text = "DEMO"
        demoLabel.font = UIFont(name: "ProximaNova-Bold", size: 60)
        
        demoLabel.textColor = .white
        addSubviews()
    }
    
    private func addSubviews() {

        addSubview(imageView)
        addSubview(buttonsStackView)
        addSubview(demoLabel)
        
        initConstraints()
    }
    
    private func initConstraints() {
        
        demoLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            
            
        }
        
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(buttonsStackView).inset(105)
        }
        
        buttonsStackView.snp.makeConstraints{ make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(55)
            make.leading.trailing.equalToSuperview().inset(12)
        }
    }
}
