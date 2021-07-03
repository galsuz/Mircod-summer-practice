//
//  SettingsViewController.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 03.07.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private var settingsView: SettingsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSettingsView()
        
    }
    
    private func createSettingsView(){
        navigationController?.navigationBar.isHidden = true
        settingsView = SettingsView()
        view.addSubview(settingsView)
        settingsView.snp.makeConstraints { make in
            make.size.equalTo(view)
        }
        settingsView.configureView()
    }
}
