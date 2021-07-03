//
//  SettingsTableViewCell.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 03.07.2021.
//

import UIKit

enum CellType {
    case standart
    case withSwitch
}

class SettingsTableViewCell: UITableViewCell {
    
    private lazy var settingName = UILabel()
    private lazy var settingImage = UIImageView()
    private lazy var settingSwitch = UISwitch()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configureCell(settingName: String, settingImage: UIImage,_ cellType: CellType) {
        addSubview(self.settingName)
        addSubview(self.settingImage)
        self.settingName.text = settingName
        self.settingImage.image = settingImage
        if cellType == .withSwitch {
            addSubview(self.settingSwitch)
        }
        initConstraint(cellType)
    }
    
    private func initConstraint(_ cellType: CellType){
        settingImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(0)
            make.height.equalTo(34)
            make.width.equalTo(30)
        }
        
        settingName.snp.makeConstraints { make in
            make.leading.equalTo(settingImage.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(50)
            make.top.equalToSuperview().offset(19)
        }
        
        if cellType == .withSwitch {
            settingSwitch.snp.makeConstraints { make in
                make.trailing.equalToSuperview().inset(0)
                make.top.equalToSuperview().inset(15)
                make.bottom.equalToSuperview().inset(15)
            }
        }
    }
    
}
