//
//  Patients.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/15/25.
//
import Foundation

@Observable class Patients: Equatable, Hashable {
    var patientList: [Patient] = []
    
    init(patientList: [Patient]) {
        self.patientList = patientList
    }
    
    static func ==(lhs: Patients, rhs: Patients) -> Bool {
        return lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(patientList)
    }
    
    func register(patient: Patient) {
        patientList.append(patient)
    }
}
