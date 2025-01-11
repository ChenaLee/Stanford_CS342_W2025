//
//  Patient.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//

import Foundation

class Patient {
    let medicalRecordNumber: String;
    let name: Name;
    let dateOfBirth: Date;
    let bloodType: BloodType;
    
    var height: Height;
    var weight: Weight;
    var prescriptionHistory: [Prescription]
    
    init(name: Name, dateOfBirth: Date, bloodType: BloodType, height: Height, weight: Weight, prescriptionHistory: [Prescription]) {
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.bloodType = bloodType
        self.height = height
        self.weight = weight
        self.prescriptionHistory = prescriptionHistory
        
        self.medicalRecordNumber = UUID().uuidString
    }
    
    init(medicalRecordNumber: String, name: Name, dateOfBirth: Date, bloodType: BloodType, height: Height, weight: Weight, prescriptionHistory: [Prescription]) {
        self.medicalRecordNumber = medicalRecordNumber
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.bloodType = bloodType
        self.height = height
        self.weight = weight
        self.prescriptionHistory = prescriptionHistory
    }
    
    func getAge() -> Int { //NICE_TO_HAVE: Timezone problem unless this code is always locally run.
        return Calendar.current.dateComponents([.year], from: dateOfBirth, to: Date()).year!
    }
    
    func getNameAndAgePrintable() -> String {
        return String(format: "%@, %@ (%d)", name.lastName, name.firstName, getAge());
        //return String(format: "%@, %@ (%@)", name.lastName, name.firstName,
        //              getAge());
    } //NICE_TO_HAVE: make format customizable
    
    func getActivePrescriptions() -> [Prescription] {
        var activePrescriptions: [Prescription] = []
        
        for prescription in prescriptionHistory {
            do {
                if try prescription.isActive() {
                    activePrescriptions.append(prescription)
                }
            } catch {
                //nothing on purpose since no requirement.
            }
        }
        return activePrescriptions
    }
    
    func addPrescription(newPrescription: Prescription) throws {
        for prescription in prescriptionHistory {
            if prescription.isDuplicateAs(other: newPrescription) {
                throw RuntimeError.InvalidInputError("Duplicate prescription is already in your prescription history.")
            }
        }
        prescriptionHistory.append(newPrescription);
    }
    
    func getTransfusableBloodTypes() -> [BloodType] {
        return RecipientToDonorBloodTypes[bloodType] ?? []
    }
}
