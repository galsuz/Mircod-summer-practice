//
//  DeviceTableViewController.swift
//  Mircod Practice
//
//  Created by Алсу Гиниятуллина  on 06.07.2021.
//

import UIKit

import CoreBluetooth

class DeviceTableViewController: UITableViewController {

    var peripheralNames: [String] = []
    var bleManager: BLEManager!
    var myTimer : Timer!
    
    convenience init(manager: BLEManager) {
        self.init()
        bleManager = manager
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTimer = Timer(timeInterval: 5.0, target: self, selector: #selector(refresh), userInfo: nil, repeats: true)
                RunLoop.main.add(self.myTimer, forMode: .default)
        tableView.isScrollEnabled = false
        tableView.rowHeight = 60
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return peripheralNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.font = UIFont(name: "ProximaNova-Bold", size: 14)
        cell.textLabel?.text = peripheralNames[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        bleManager.connectToPeripheral(indexPath: indexPath.row)
    }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        60
//    }
    
    @objc
    func refresh() {
        peripheralNames = bleManager.getPeripherals()
        tableView.reloadData()
    }

}

class TableViewCell: UITableViewCell {
    
}
