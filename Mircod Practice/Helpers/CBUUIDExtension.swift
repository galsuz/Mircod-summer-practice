//
//  CBUUIDExtension.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 09.07.2021.
//

import Foundation
import CoreBluetooth

extension CBUUID {
    static let advertiseUUID = CBUUID(string: "0xD03A")
    
    static let genericUUId = CBUUID(string: "0x1800")
    static let genericAttribute = CBUUID(string: "0x1801")
    static let batteryService = CBUUID(string: "0x180F")
    static let deviceInformationCBUUID = CBUUID(string: "0x180A")
    
    static let timestampTemperatureMeasurmentCBUUID = CBUUID(string: "0xD03A")
    static let timestampTemperatureCharCBUUID = CBUUID(string: "ffed")
}
