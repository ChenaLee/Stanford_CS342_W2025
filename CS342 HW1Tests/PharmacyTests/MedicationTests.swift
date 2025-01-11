//
//  MedicationTests.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//


import Foundation
import Testing
@testable import CS342_HW1

struct MedicationTests {
    @Test func isSameTypeAsReturnsTrueWhenSameName() async throws {
        let someMedication = Medication(name: "someMed", dose: anyDose1, route: ConsumptionPath.MOUTH);
        let anotherMedication = Medication(name: "someMed", dose: anyDose2, route: ConsumptionPath.INHALED);
        
        #expect(someMedication.isSameTypeAs(other: anotherMedication))
    }
    
    @Test func isSameTypeAsReturnsFalseWhenDifferentName() async throws {
        let someMedication = Medication(name: "someMed", dose: anyDose1, route: ConsumptionPath.MOUTH);
        let anotherMedication = Medication(name: "anotherMed", dose: anyDose1, route: ConsumptionPath.MOUTH);

        #expect(!someMedication.isSameTypeAs(other: anotherMedication))
    }
}

