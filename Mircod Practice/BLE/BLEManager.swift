//
//  BLEmanager.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 08.07.2021.
//

import Foundation
import CoreBluetooth

class BLEManager: NSObject {
    
    var temperatureBlePeripheral: CBPeripheral?
    private var centralManager: CBCentralManager!
    private var peripherals: [CBPeripheral] = []
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func getPeripherals() -> [String] {
        var peripheralNames: [String] = []
        if peripherals.count != 0 {
            peripherals.forEach { peripheral in
                peripheralNames.append(peripheral.name! ?? "нет имени")
            }
        }
        return peripheralNames
    }
    
    func connectToPeripheral(indexPath: Int) {
        temperatureBlePeripheral = peripherals[indexPath]
        guard let periphiral = temperatureBlePeripheral else { return }
        centralManager.connect(periphiral)
        
    }
    
}

extension BLEManager: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("central state is .unknown")
        case .resetting:
            print("central state is .resetting")
        case .unsupported:
            print("central state is .unsupported")
        case .unauthorized:
            print("central state is .unauthorized")
        case .poweredOff:
            print("central state is .poweredOff")
        case .poweredOn:
            print("central state is .poweredOn")
            centralManager.scanForPeripherals(withServices: [.advertiseUUID], options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
        @unknown default:
            print("Сломалося")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard let name = peripheral.name else {
            return
        }
        print(name)
        peripherals.append(peripheral)
    }
    
}

extension BLEManager: CBPeripheralDelegate {
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        peripheral.services?.forEach({ serivce in
            print("service: \(serivce)")
            peripheral.discoverCharacteristics(nil, for: serivce)
        })
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        service.characteristics?.forEach({ characteristic in
            print(characteristic)
            if characteristic.properties.contains(.read) {
                print("\(characteristic.uuid) contains .read")
                peripheral.readValue(for: characteristic)
            }
            if characteristic.properties.contains(.notify) {
                print("\(characteristic.uuid) contains .notify")
                peripheral.setNotifyValue(true, for: characteristic)
            }
        })
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        if peripheral == temperatureBlePeripheral {
            print("Connecnting", peripheral.description)
            peripheral.delegate = self
            peripheral.discoverServices([.batteryService, .timestampTemperatureCharCBUUID, .timestampTemperatureMeasurmentCBUUID])
        }
        centralManager.stopScan()
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        switch characteristic.uuid {
        case .timestampTemperatureCharCBUUID:
            print("temperature char: \([UInt8](characteristic.value!))")
            if let tempChar: TemperatureCharacteristic = .init(characteristic.value) {
                print("Temperature ", tempChar)
            }
            break
        case .batteryService:
            print("battery service: \([UInt8](characteristic.value!))")
        case .timestampTemperatureMeasurmentCBUUID:
            print("temperature measurment: \([UInt8](characteristic.value!))")

        default:
            break
        }
    }

    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("disconnect")
    }
    
}
