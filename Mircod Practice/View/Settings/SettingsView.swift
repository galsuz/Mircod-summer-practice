//
//  SettingsView.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 03.07.2021.
//

import UIKit

struct Settings {
    let image: [UIImage] = [#imageLiteral(resourceName: "Icon1"),#imageLiteral(resourceName: "Icon2"),#imageLiteral(resourceName: "icon3")]
    let names: [String] = ["Temperature settings", "Push-notifications", "About application"]
}

class SettingsView: UIView {
    
    private let settings = Settings()
    private lazy var settingsTableView = UITableView()
    private let settingsCellReuseIdentifier = "settingsCell"
    
    func configureView() {
        setupTableView()
        initConstraints()
        settingsTableView.backgroundColor = .clear
    }
    
    func setupTableView() {
        addSubview(settingsTableView)
        settingsTableView.isScrollEnabled = false
        settingsTableView.tableFooterView = UIView()
        setSettingsTableViewDelegates()
        settingsTableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: settingsCellReuseIdentifier)
    }
    
    private func initConstraints() {
  
        settingsTableView.snp.makeConstraints { make in
//            make.leading.trailing.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(15)
            make.leading.equalToSuperview()
//            make.centerX.equalToSuperview()
//            make.size.centerX.equalToSuperview()
//            make.top.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
//            make.top.equalToSuperview().offset(10)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func setSettingsTableViewDelegates() {
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
    }
}

extension SettingsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //Mark: - Hardcode because only an UI and i want to sleep
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: settingsCellReuseIdentifier) as! SettingsTableViewCell
      
        let withSwitch = indexPath.row == 1
//        if indexPath.row == 0 {
//            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
//            tableView.separatorStyle = .none
//        }
        let cellType: CellType = withSwitch ? .withSwitch : .standart
        cell.configureCell(settingName: settings.names[indexPath.row], settingImage: settings.image[indexPath.row], cellType)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
}
