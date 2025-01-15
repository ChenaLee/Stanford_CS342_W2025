//
//  CS342_HW1App.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/8/25.
//

import SwiftUI

@main
struct CS342_HW1App: App {
    var body: some Scene {
        WindowGroup {
            PatientList(patients: patientsExample)
        }
    }
}

let anyDose1 = Dose(value: 1, unit: UnitDose.Milligram)
let anyDose2 = Dose(value: 2, unit: UnitDose.Milligram)
let anyFrequency = Frequency(value: 1, cycle: Duration.seconds(3600))

let dayInSeconds = 3600*24
let week = Duration.seconds(dayInSeconds*7)
let twoWeeks = week*2
let twoWeeksAgo = Date.init(timeInterval: TimeInterval(-twoWeeks.components.seconds), since: Date())
let oneDayAgo = Date.init(timeInterval: TimeInterval(-dayInSeconds), since: Date())
let twoYearsAndThirtyDaysAgo = Date.init(timeInterval: TimeInterval(-(2*365+30)*dayInSeconds), since: Date())
let oneDayLater = Date.init(timeInterval: TimeInterval(dayInSeconds), since: Date())

let anyHeight = Height(value: 1, unit: UnitLength.meters)
let anyWeight = Weight(value: 1, unit: UnitMass.kilograms)
let anyName1 = Name(firstName: "John", lastName: "Doe", preferredName: nil)
let anyName2 = Name(firstName: "Jennifer", lastName: "An", preferredName: "Jen")

let anyMed1 = Medication(name: "med1", dose: anyDose1, route: ConsumptionPath.INHALED);
let anyMed2 = Medication(name: "med2", dose: anyDose2, route: ConsumptionPath.MOUTH);

let anyPrescription = Prescription(medication: anyMed1, datePrescribed: twoWeeksAgo, frequency: anyFrequency, duration: week)
let anyPrescription2 = Prescription(medication: anyMed2, datePrescribed: oneDayAgo, frequency: anyFrequency, duration: week)


let anyPatientUnderAge1 = Patient(medicalRecordNumber: "2345678", name: anyName1, dateOfBirth: twoWeeksAgo, bloodType: BloodType.AB_NEG, height: anyHeight, weight: anyWeight, prescriptionHistory: [anyPrescription, anyPrescription2])
let anyPatientOverAge1 = Patient(medicalRecordNumber: "1234567", name: anyName2, dateOfBirth: twoYearsAndThirtyDaysAgo, bloodType: BloodType.B_POS, height: anyHeight, weight: anyWeight, prescriptionHistory: [anyPrescription, anyPrescription2])
var patientsExample = Patients(patientList: [anyPatientOverAge1, anyPatientUnderAge1])

// TODO: create at least one patient instance, and try using all proprties and methods as part of multiple unit tests.
// TOOD: add comments? do I have to?
