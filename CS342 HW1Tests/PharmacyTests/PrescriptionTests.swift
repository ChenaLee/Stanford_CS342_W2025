//
//  PrescriptionTests.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//

import Foundation
import Testing
@testable import CS342_HW1

struct PrescriptionTests {
/*
 Based on requirements clarified: https://github.com/orgs/CS342/discussions/92
 */
    
    let anyPrescription = Prescription(medication: MockMedicationSameTypeAlwaysFalse(), datePrescribed: twoWeeksAgo, frequency: anyFrequency, duration: week)
    let anyPrescription2 = Prescription(medication: MockMedicationSameTypeAlwaysTrue(), datePrescribed: oneDayAgo, frequency: anyFrequency, duration: week)
    let anyPrescription3 = Prescription(medication: MockMedicationSameTypeAlwaysFalse(), datePrescribed: Date(), frequency: anyFrequency, duration: week)
    
    @Test func isDuplicateAsReturnsTrueWhenMedicationIsSameTypeAndActive() async throws {
        #expect(anyPrescription2.isDuplicateAs(other: anyPrescription3))
    }
    
    @Test func isDuplicateAsReturnsFalseWhenMedicationIsNotSameType() async throws {
        #expect(!anyPrescription.isDuplicateAs(other: anyPrescription3))
    }
    
    @Test func isActiveReturnsFalseWhenDurationPassedSincePrescribedDate() async throws {
        #expect(try !anyPrescription.isActive())
    }
    
    @Test func isActiveReturnsTrueWhenDurationNotPassedSincePrescribedDate() async throws {
        #expect(try anyPrescription2.isActive())
    }
}



