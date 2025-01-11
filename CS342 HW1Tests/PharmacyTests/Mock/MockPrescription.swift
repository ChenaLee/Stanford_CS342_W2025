//
//  MockPrescription.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/11/25.
//
@testable import CS342_HW1

class MockPrescription: Prescription {
    init() {super.init(medication: MockMedication(), datePrescribed: twoWeeksAgo, frequency: anyFrequency, duration: twoWeeks)}
}

class MockPrescriptionActive: MockPrescription {
    override func isActive() -> Bool {
        return true
    }
}

class MockPrescriptionInactive: MockPrescription {
    override func isActive() -> Bool {
        return false
    }
}

class MockPrescriptionDuplicateAlwaysTrue: MockPrescription {
    override func isDuplicateAs(other: Prescription) -> Bool {
        return true
    }
}

class MockPrescriptionDuplicateAlwaysTrueAndActive: MockPrescriptionDuplicateAlwaysTrue {
    override func isActive() -> Bool {
        return true
    }
}

class MockPrescriptionDuplicateAlwaysTrueAndInactive: MockPrescriptionDuplicateAlwaysTrue {
    override func isActive() -> Bool {
        return false
    }
}

class MockPrescriptionDuplicateAlwaysFalse: MockPrescription {
    override func isDuplicateAs(other: Prescription) -> Bool {
        return false
    }
}
