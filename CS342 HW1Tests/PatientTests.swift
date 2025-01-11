//
//  PatientTests.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//

import Foundation
import Testing
import Mockingbird
@testable import CS342_HW1

let activePrescription1 = MockPrescriptionActive()
let activePrescription2 = MockPrescriptionActive()
let inactivePrescription1 = MockPrescriptionInactive()
let inactivePrescription2 = MockPrescriptionInactive()

struct PatientTests {
    let anyPatientUnderAge1 = Patient(name: anyName1, dateOfBirth: twoWeeksAgo, bloodType: BloodType.AB_NEG, height: anyHeight, weight: anyWeight, prescriptionHistory: [])
    let anyPatientOverAge1 = Patient(name: anyName2, dateOfBirth: twoYearsAndThirtyDaysAgo, bloodType: BloodType.B_POS, height: anyHeight, weight: anyWeight, prescriptionHistory: [])
    let anyPatientWithNoPrescription = Patient(name: anyName1, dateOfBirth: twoWeeksAgo, bloodType: BloodType.AB_NEG, height: anyHeight, weight: anyWeight, prescriptionHistory: [])
    let anyPatientWithOnlyInactivePrescriptions = Patient(name: anyName2, dateOfBirth: twoYearsAndThirtyDaysAgo, bloodType: BloodType.B_POS, height: anyHeight, weight: anyWeight, prescriptionHistory: [inactivePrescription1, inactivePrescription2])
    let anyPatientWithBothInactiveAndActivePrescriptions = Patient(name: anyName2, dateOfBirth: twoYearsAndThirtyDaysAgo, bloodType: BloodType.B_POS, height: anyHeight, weight: anyWeight, prescriptionHistory: [inactivePrescription1, activePrescription1])
    let anyPatientWithOnlyActivePrescriptions = Patient(name: anyName2, dateOfBirth: twoYearsAndThirtyDaysAgo, bloodType: BloodType.B_POS, height: anyHeight, weight: anyWeight, prescriptionHistory: [activePrescription1, activePrescription2])
    
    @Test func isGetAgeSuccessful() async throws {
        #expect(anyPatientUnderAge1.getAge() == 0)
        #expect(anyPatientOverAge1.getAge() == 2)
    }
    
    @Test func isGetNameAndAgePrintableSuccessful() async throws {
        #expect(anyPatientOverAge1.getNameAndAgePrintable() == "Doe, Jennifer (2)")
    }
    
    @Test func getActivePrescriptionsSuccessful() async throws {
        #expect(anyPatientWithNoPrescription.getActivePrescriptions() == [])
        #expect(anyPatientWithOnlyInactivePrescriptions.getActivePrescriptions() == [])
        #expect(anyPatientWithOnlyActivePrescriptions.getActivePrescriptions() == [activePrescription1, activePrescription2])
        #expect(anyPatientWithBothInactiveAndActivePrescriptions.getActivePrescriptions() == [activePrescription1])
    }

    @Test func getTransfusableBloodTypesSuccessful() async throws {
        #expect(anyPatientUnderAge1.getTransfusableBloodTypes() == [BloodType.A_NEG, BloodType.B_NEG, BloodType.O_NEG, BloodType.AB_NEG])
        #expect(anyPatientOverAge1.getTransfusableBloodTypes() == [BloodType.B_POS, BloodType.B_NEG, BloodType.O_POS, BloodType.O_NEG])
    }
    
    @Test func addPrescriptionFailsWhenDuplicateIsActive() async throws {
        let patientWithDuplicateActive = Patient(name: anyName2, dateOfBirth: twoYearsAndThirtyDaysAgo, bloodType: BloodType.B_POS, height: anyHeight, weight: anyWeight, prescriptionHistory: [MockPrescriptionDuplicateAlwaysTrueAndActive()])

        let expectedError = RuntimeError.InvalidInputError("Duplicate prescription is already in your prescription history.")

        #expect(throws: expectedError) {
            try patientWithDuplicateActive.addPrescription(newPrescription: MockPrescription())
        }
    }
    
    @Test func addPrescriptionSucceedsWhenNoDuplicateIsActive() async throws {
        let patientWithNoDuplicateActive = Patient(name: anyName2, dateOfBirth: twoYearsAndThirtyDaysAgo, bloodType: BloodType.B_POS, height: anyHeight, weight: anyWeight, prescriptionHistory: [MockPrescriptionDuplicateAlwaysTrueAndInactive()])
        let patientWithNoDuplicate = Patient(name: anyName2, dateOfBirth: twoYearsAndThirtyDaysAgo, bloodType: BloodType.B_POS, height: anyHeight, weight: anyWeight, prescriptionHistory: [MockPrescriptionDuplicateAlwaysFalse()])

        do {
            try patientWithNoDuplicateActive.addPrescription(newPrescription: MockPrescription())
        } catch {
            XCTFail("Add Prescription was unsuccessful when it should be.")
        }
        
        do {
            try patientWithNoDuplicate.addPrescription(newPrescription: MockPrescription())
        } catch {
            XCTFail("Add Prescription was unsuccessful when it should be.")
        }
    }
}
