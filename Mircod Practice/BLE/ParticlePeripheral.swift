//
//  ParticlePeripheral.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 09.07.2021.
//

import Foundation
import CoreBluetooth

class ParticlePeripheral: NSObject {
    let advertiseUUID = CBUUID(string: "0xD03A")
    
    let genericUUId = CBUUID(string: "0x1800")
    let genericAttribute = CBUUID(string: "0x1801")
    let batteryService = CBUUID(string: "0x180F")
    let deviceInformation = CBUUID(string: "0x180A")
    
    let timestampTemperatureMeasurmentCBUUID = CBUUID(string: "0xD03A")
    let timestampTemperatureCharCBUUID = CBUUID(string: "ffed")
}
