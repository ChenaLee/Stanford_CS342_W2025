//
//  ConsumptionPath.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//

enum ConsumptionPath: String, CaseIterable, Identifiable {
    case MOUTH
    case SUBCUTANEOUSLY
    case INHALED
    var id: ConsumptionPath { self }
}
