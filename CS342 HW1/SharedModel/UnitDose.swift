//
//  UnitDose.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/15/25.
//

enum UnitDose: String, CaseIterable, Identifiable {
    case Milligram = "mg"
    case Gram = "g"
    case Milliliter = "mL"
    case Liter = "L"

    var id: UnitDose { self }
}
