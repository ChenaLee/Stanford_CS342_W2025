//
//  BloodType.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//

enum BloodType {
    case A_POS
    case A_NEG
    case B_POS
    case B_NEG
    case O_POS
    case O_NEG
    case AB_POS
    case AB_NEG
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
