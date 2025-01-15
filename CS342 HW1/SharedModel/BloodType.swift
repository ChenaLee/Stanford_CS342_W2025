//
//  BloodType.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//

enum BloodType: String, CaseIterable, Identifiable {
    case A_POS = "A+"
    case A_NEG = "A-"
    case B_POS = "B+"
    case B_NEG = "B-"
    case O_POS = "O+"
    case O_NEG = "O-"
    case AB_POS = "AB+"
    case AB_NEG = "AB-"
    var id: BloodType { self }
}

let RecipientToDonorBloodTypes: [BloodType: [BloodType]] = [
    BloodType.A_POS: [BloodType.A_POS, BloodType.A_NEG, BloodType.O_POS, BloodType.O_NEG],
    BloodType.A_NEG: [BloodType.A_NEG, BloodType.O_NEG],
    BloodType.B_POS: [BloodType.B_POS, BloodType.B_NEG, BloodType.O_POS, BloodType.O_NEG],
    BloodType.B_NEG: [BloodType.B_NEG, BloodType.O_NEG],
    BloodType.O_POS: [BloodType.O_POS, BloodType.O_NEG],
    BloodType.O_NEG: [BloodType.O_NEG],
    BloodType.AB_POS: [BloodType.A_POS, BloodType.A_NEG, BloodType.B_POS, BloodType.B_NEG,
                       BloodType.O_POS, BloodType.O_NEG, BloodType.AB_POS, BloodType.AB_NEG],
    BloodType.AB_NEG:[BloodType.A_NEG, BloodType.B_NEG, BloodType.O_NEG, BloodType.AB_NEG]
]
