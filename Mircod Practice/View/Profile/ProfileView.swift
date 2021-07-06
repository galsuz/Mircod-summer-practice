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
    lazy var logoutButton = UIButton(text: "Logout", cellType: .underlined)
    lazy var profileStackView = UIStackView(views: [profileImageView, nameLabel,
                                                    loginLabel, dividerView, logoutButton],
                                            axis: .vertical)
    
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
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(30)
        }
        
        profileStackView.snp.makeConstraints { make in
            make.top.equalTo(profileLabel.snp.bottom).offset(118)
            make.leading.trailing.equalToSuperview().inset(30)
            //make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(118)
            
        }
        
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.height.equalTo(19)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.height.width.equalTo(120)
        }
        
        dividerView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview().inset(30)
        }
    }
    
    // Mark: - Customization
    private func customizeAll(){
        profileImageView.image = #imageLiteral(resourceName: "NoImage")
        customizeProfileStackView()
        customizeLabels()
        customizeDividerView()
    }
    
    private func customizeProfileStackView(){
        profileStackView.alignment = .center
        profileStackView.setCustomSpacing(11, after: profileImageView)
        profileStackView.setCustomSpacing(17, after: nameLabel)
        profileStackView.setCustomSpacing(61, after: loginLabel)
        profileStackView.setCustomSpacing(40, after: dividerView)
    }
    
    private func customizeLabels(){
        nameLabel.numberOfLines = 0
        nameLabel.text = "Pavel \nProkopev"
        nameLabel.textAlignment = .center
        
        loginLabel.text = "Sartan8"
        loginLabel.textColor = .mainOrangeColor
        
        profileLabel.text = "Profile"
        
    }
    
    private func customizeDividerView(){
        dividerView.backgroundColor = .dividerColor
    }
        
}
