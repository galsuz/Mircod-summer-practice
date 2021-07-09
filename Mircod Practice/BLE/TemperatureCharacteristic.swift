//
//  TemperatureCharacteristic.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 09.07.2021.
//

import Foundation
struct TemperatureCharacteristic {

    private let temperature: UInt16
    private let timestamp: UInt32
    private let availableMeasurements: UInt16
    private let proximity: UInt8

    public var temeprature: Double {
        Double(self.temperature) / 100
    }

    public var date: Date {
        Date(timeIntervalSince1970: Double(timestamp))
    }

    public var availableMeasurments: Int {
        Int(availableMeasurements)
    }
}

extension TemperatureCharacteristic {

    init?(_ data: Data?) {
        guard let data = data else { return nil }

        let array = [UInt8](data)

        guard array.count == 9 else { return nil }

        self.temperature = UInt16(array[0]) << 8 | UInt16(array[1])
        self.timestamp = UInt32(array[2]) << 24 | UInt32(array[3]) << 16 | UInt32(array[4]) << 8 | UInt32(array[5])
        self.availableMeasurements = UInt16(array[6]) << 8 | UInt16(array[7])
        self.proximity = array[8]
    }
}
