//
//  PatientDetail.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/15/25.
//
import SwiftUI
import Foundation

struct PatientDetail: View {
    @State var patient: Patient;
    @State var showPrescriptionForm: Bool = false
    
    var body: some View {
        List{
            Section(header: Text("Patient Detail")) {
                HStack {
                    Text("MRN: ");
                    Text(patient.medicalRecordNumber)
                }
                HStack {
                    Text("Name: ");
                    Text(patient.getNamePrintable())
                }
                HStack {
                    Text("Age: ");
                    Text(String(patient.getAge()));
                }
                HStack {
                    Text("DoB: ");
                    Text(patient.dateOfBirth.formatted(.iso8601.year().month().day()));
                }
                HStack {
                    Text("BloodType: ");
                    Text(patient.bloodType.rawValue);
                }
                HStack {
                    Text("Height: ");
                    Text(patient.height.toString());
                }
                HStack {
                    Text("Weight: ");
                    Text(patient.weight.toString());
                }
            }
            Section(header: Text("Current Medications")) {
                ForEach(patient.prescriptionHistory, id: \.self) { prescription in
                    Text(prescription.toShortString());
                }
            }
            
            Button("Prescribe New Medication") {
                showPrescriptionForm.toggle()
            }.sheet(isPresented: $showPrescriptionForm){
                PrescriptionForm(patient: $patient);
            }
        }
    }
}
