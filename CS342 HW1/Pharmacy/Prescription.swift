//
//  Prescription.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//
import Foundation

class Prescription : Equatable {
    let medication: Medication;
    let datePrescribed: Date;
    let frequency: Frequency;
    let duration: Duration; // NICE_TO_HAVE: might be more appropriate to name is a stopCondition.
     
    init(medication: Medication, datePrescribed: Date, frequency: Frequency, duration: Duration) {
        self.medication = medication
        self.datePrescribed = datePrescribed
        self.frequency = frequency
        self.duration = duration
    }
    
    func isDuplicateAs(other: Prescription) -> Bool {
        return isActive() && medication.isSameTypeAs(other: other.medication)
    }
    
    func isActive() -> Bool {
        let expectedEndDate = Calendar.current.date(byAdding: .second, value: Int(duration.components.seconds), to: datePrescribed)

        return Calendar.current.compare(expectedEndDate!, to: Date(), toGranularity: .day)
            == .orderedDescending
    }
    
    static func == (one: Prescription, other: Prescription) -> Bool {
        return one === other //For now.
    }
}
