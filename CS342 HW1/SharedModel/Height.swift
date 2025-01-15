//
//  Height.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//
import Foundation

class Height {
    let value: Double;
    let unit: UnitLength;
    
    init(value: Double, unit: UnitLength) {
        self.value = value
        self.unit = unit
    }
    
    func toString() -> String {
        return String(value) + " " + unit.symbol
    }
}
