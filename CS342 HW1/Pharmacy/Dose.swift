//
//  Dose.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//
import Foundation

struct Dose {
    public let value: Double;
    public let unit: Unit; // NICE_TO_HAVE: Might need to create custom unit type that extends Unit, since there are more unit types in medical world than what swift has by default.
}
