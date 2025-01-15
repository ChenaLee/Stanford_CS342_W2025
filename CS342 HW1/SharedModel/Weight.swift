//
//  Weight.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//
import Foundation

class Weight {
    let value: Double;
    let unit: UnitMass;
    
    init(value: Double, unit: UnitMass) {
        self.value = value
        self.unit = unit
    }
    
    func toString() -> String {
        return String(value) + " " + unit.symbol
    }
}
