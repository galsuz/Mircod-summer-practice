//
//  ProfileView.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 03.07.2021.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    var updateImageBackroundPanelViewWidthConstraint: Constraint!
    lazy var profileLabel = UILabel()
    lazy var profileImageView = UIImageView()
    lazy var updateImageBackroundPanelView = UIView()
    lazy var backgroundPanelCameraButton = UIButton()
    lazy var backgroundPanelGalleryButton = UIButton()
    lazy var nameLabel = UILabel()
    lazy var loginLabel = UILabel()
    lazy var dividerView = UIView()
    lazy var logoutButton = UIButton(text: "Logout", cellType: .rightArrow)
    lazy var profileStackView = UIStackView(views: [profileImageView, nameLabel,
                                                    loginLabel, dividerView, logoutButton],
                                            axis: .vertical,
                                            distribution: .fill)
    
    func configureView(){
        addSubviews()
        customizeAll()
        initConstraints()
//        backgroundColor = .profileBackgroundColor
    }
    
    private func addSubviews(){
        addSubview(profileLabel)
        addSubview(updateImageBackroundPanelView)
        addSubview(backgroundPanelCameraButton)
        addSubview(backgroundPanelGalleryButton)
        addSubview(profileStackView)
    }
    
    private func initConstraints() {
        
        profileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(61)
            make.leading.equalToSuperview().inset(30)
        }
        
        profileStackView.snp.makeConstraints { make in
            make.top.equalTo(profileLabel.snp.bottom).offset(118)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        backgroundPanelCameraButton.snp.makeConstraints {make in
            make.height.equalTo(30)
            make.width.equalTo(34)
            make.leading.equalTo(updateImageBackroundPanelView.snp.leading).inset(38)
            make.top.equalTo(updateImageBackroundPanelView.snp.top).inset(53)
        }
        
        backgroundPanelGalleryButton.snp.makeConstraints{ make in
            make.height.equalTo(32)
            make.width.equalTo(32)
            make.trailing.equalTo(updateImageBackroundPanelView.snp.trailing).inset(32)
            make.top.equalTo(updateImageBackroundPanelView.snp.top).inset(52)
        }
    
        hideImageBackroundPanelView()
        
        profileImageView.snp.makeConstraints { make in
            make.height.width.equalTo(120)
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
        customizeView()
        customizeButtons()
    }
    
    private func customizeProfileStackView(){
        profileStackView.alignment = .center
        profileStackView.setCustomSpacing(11, after: profileImageView)
        profileStackView.setCustomSpacing(17, after: nameLabel)
        profileStackView.setCustomSpacing(61, after: loginLabel)
        profileStackView.setCustomSpacing(40, after: dividerView)
    }
    
    private func customizeButtons() {
        backgroundPanelCameraButton.setImage(#imageLiteral(resourceName: "camera"), for: .normal)
        backgroundPanelCameraButton.alpha = 0
        backgroundPanelGalleryButton.setImage(#imageLiteral(resourceName: "gallery"), for: .normal)
        backgroundPanelGalleryButton.alpha = 0
    }
    
    private func customizeView() {
        
        updateImageBackroundPanelView.alpha = 1
        updateImageBackroundPanelView.backgroundColor = .profileBackgroundViewColor
        updateImageBackroundPanelView.layer.cornerRadius = 67.5
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
    
    func hideImageBackroundPanelView() {
        updateImageBackroundPanelView.snp.remakeConstraints { make in
            self.updateImageBackroundPanelViewWidthConstraint = make.width.equalTo(0).constraint
            make.height.equalTo(135)
            make.center.equalTo(profileImageView)
        }
    }
    
    func showImageBackroundPanelView() {
        updateImageBackroundPanelView.snp.remakeConstraints { remake in
            remake.width.equalToSuperview().inset(30)
            remake.height.equalTo(135)
            remake.center.equalTo(profileImageView)
        }
    }
}
