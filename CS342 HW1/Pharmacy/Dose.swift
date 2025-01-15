//
//  Dose.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//
import Foundation

struct Dose: Hashable, Equatable {
    public let value: Double;
    public let unit: UnitDose;
    
    func toString() -> String {
        return String(value) + unit.rawValue;
    }
}
