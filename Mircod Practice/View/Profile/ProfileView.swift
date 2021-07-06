//
//  ProfileView.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 03.07.2021.
//

import UIKit

class ProfileView: UIView {
    
    lazy var profileLabel = UILabel()
    lazy var profileImageView = UIImageView()
    lazy var nameLabel = UILabel()
    lazy var loginLabel = UILabel()
    lazy var dividerView = UIView()
    lazy var logoutButton = UIButton(text: "Logout", cellType: .rightArrow)
    lazy var profileStackView = UIStackView(views: [profileImageView, nameLabel,
                                                    loginLabel, dividerView, logoutButton],
                                            axis: .vertical, distribution: .equalSpacing)
    
    func configureView(){
        addSubviews()
        customizeAll()
        initConstraints()
        
        backgroundColor = .profileBackgroundColor
    }
    
    private func addSubviews(){
        addSubview(profileLabel)
        addSubview(profileStackView)
    }
    
    private func initConstraints(){
        profileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(61)
            make.leading.equalToSuperview().inset(30)
//            make.height.equalTo(30)
        }
        
        profileStackView.snp.makeConstraints { make in
            make.top.equalTo(profileLabel.snp.bottom).offset(118)
            make.leading.trailing.equalToSuperview().inset(30)
//            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(145)
            
        }
        
//        nameLabel.snp.makeConstraints { make in
//            make.height.equalTo(56)
//            make.width.equalToSuperview()
//        }
        
//        loginLabel.snp.makeConstraints { make in
////            make.height.equalTo(19)
//            make.leading.equalToSuperview()
//        }
        
        profileImageView.snp.makeConstraints { make in
            make.height.width.equalTo(120)
//            make.leading.equalToSuperview()
        }
        
        dividerView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalToSuperview()
        }
    }
    
    // MARK: - Customization
    private func customizeAll(){
        profileImageView.image = #imageLiteral(resourceName: "NoImage")
        customizeProfileStackView()
        customizeLabels()
        customizeDividerView()
    }
    
    private func customizeProfileStackView(){
        profileStackView.alignment = .center
        profileStackView.setCustomSpacing(5, after: profileImageView)
        profileStackView.setCustomSpacing(17, after: nameLabel)
        profileStackView.setCustomSpacing(5, after: loginLabel)
        profileStackView.setCustomSpacing(5, after: dividerView)
    }
    
    private func customizeLabels(){
        nameLabel.numberOfLines = 0
        nameLabel.text = "Pavel \nProkopev"
        nameLabel.font = UIFont(name: "ProximaNova-Bold", size: 30)
        nameLabel.textAlignment = .center
        nameLabel.sizeToFit()
        
        loginLabel.text = "Sartan8"
        loginLabel.textColor = .mainOrangeColor
        loginLabel.textAlignment = .center
        loginLabel.sizeToFit()
        
        profileLabel.text = "Profile"
        profileLabel.font = UIFont(name: "ProximaNova-Bold", size: 25)
    }
    
    private func customizeDividerView(){
        dividerView.backgroundColor = .dividerColor
    }
        
}
