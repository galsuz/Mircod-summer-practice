//
//  MainViewController.swift
//  Mircod Practice
//
//  Created by Алсу Гиниятуллина  on 06.07.2021.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    private var mainView: MainView!
    private var bleManager: BLEManager!
    let deviceButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMainView()

    }
    
    func createMainView() {
        navigationController?.navigationBar.isHidden = false
        mainView = MainView()
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.size.equalTo(view)
        }
        mainView.configureView()
        mainView.addDeviceButton.addTarget(self, action: #selector(addDeviceButtonPressed), for: .touchUpInside)
    }
    
    @objc
    func addDeviceButtonPressed() {
        bleManager = BLEManager()
        let deviceTableViewController = DeviceTableViewController(manager: bleManager)
        navigationController?.pushViewController(deviceTableViewController, animated: true)
    }

}
