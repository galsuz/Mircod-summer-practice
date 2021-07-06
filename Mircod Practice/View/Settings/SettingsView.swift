//
//  SettingsView.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 03.07.2021.
//

import UIKit

// Mark: - Just for example (struct)
struct Settings {
    let image: [UIImage] = [#imageLiteral(resourceName: "Icon1"),#imageLiteral(resourceName: "Icon2"),#imageLiteral(resourceName: "icon3")]
    let names: [String] = ["Temperature settings", "Push-notifications", "About application"]
}

class SettingsView: UIView {
    
    private let settings = Settings()
    lazy var settingsTableView = UITableView()
    private let settingsCellReuseIdentifier = "settingsCell"
    
    func configureView(){
        settingsTableView.rowHeight = 60
        setupTableView()
        initConstrints()
    }
    
    func setupTableView(){
        addSubview(settingsTableView)
        setSettingsTableViewDelegates()
        settingsTableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: settingsCellReuseIdentifier)
    }
    
    private func initConstrints(){
        settingsTableView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
}

extension SettingsView: UITableViewDelegate, UITableViewDataSource {
    
    private func setSettingsTableViewDelegates(){
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //Mark: - Hardcode because only an UI and i want to sleep
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: settingsCellReuseIdentifier) as! SettingsTableViewCell
        print("Cell")
        if indexPath.row == 1 {
            cell.configureCell(settingName: settings.names[indexPath.row], settingImage: settings.image[indexPath.row], .withSwitch)
            return cell
        }
        
        cell.configureCell(settingName: settings.names[indexPath.row], settingImage: settings.image[indexPath.row], .standart)
        return cell
    }
}
