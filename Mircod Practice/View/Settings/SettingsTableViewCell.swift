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

    private lazy var settingSwitch = UISwitch()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryView = settingSwitch
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configureCell(settingName: String, settingImage: UIImage,_ cellType: CellType) {

        self.textLabel?.text = settingName
        self.imageView?.image = settingImage
        
        settingSwitch.isHidden = cellType != .withSwitch
        settingSwitch.onTintColor = .mainOrangeColor
    }
}
