//
//  PatientForm.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/15/25.
//

import Foundation
import SwiftUI

struct PatientForm: View {
    @Environment(\.dismiss) var dismiss

    var patients: Patients;
    @State private var firstName : String?;
    @State private var lastName : String?;
    @State private var dob : Date?;
    @State private var heightInCm : Double?;
    @State private var heightInFoot_ft : Int?;
    @State private var heightInFoot_in : Int?;
    @State private var heightUnitMeterOn: Bool = true;
    
    @State private var weight: Double?;
    @State private var weightUnitKgOn: Bool = false
    @State private var bloodType: BloodType?;
    
    func createPatientObj() -> Patient {
        let name = Name(firstName: firstName ?? "", lastName: lastName ?? "", preferredName: nil);
        var height: Height? = nil
        if (heightUnitMeterOn) {
            height = Height(value: heightInCm!, unit: UnitLength.centimeters)
        } else {
            height = Height(value: Double(12*heightInFoot_ft! + heightInFoot_in!), unit: UnitLength.inches)
        }
        let weight = Weight(value: weight!, unit: weightUnitKgOn ? UnitMass.kilograms : UnitMass.pounds)
                
        return Patient(name: name, dateOfBirth: dob!, bloodType: bloodType!, height: height!, weight: weight, prescriptionHistory: [])
    }
    
    func registerPatient() {
        let patient = createPatientObj();
        patients.register(patient: patient)
        dismiss()
    }
    
    
    func isRequiredFieldsValid() -> Bool {
        return !(firstName ?? "").trimmingCharacters(in: .whitespaces).isEmpty &&
                !(lastName ?? "").trimmingCharacters(in: .whitespaces).isEmpty &&
                dob ?? oneDayLater <=  Date() &&
                weight != nil && weight != 0  &&
                (heightUnitMeterOn && heightInCm != nil && heightInCm != 0) || (!heightUnitMeterOn && heightInFoot_ft != nil && heightInFoot_ft != 0 && heightInFoot_in != nil && heightInFoot_in != 0)
    }
    
    
    var body: some View {
        let heightUnitFootOn = Binding<Bool>(
            get: { !self.heightUnitMeterOn },
            set: {
                self.heightUnitMeterOn = !$0
                self.heightInCm = nil
            }
        )
        let weightUnitLbOn = Binding<Bool>(
            get: { !self.weightUnitKgOn},
            set: {
                self.weightUnitKgOn = !$0
                self.heightInFoot_ft = nil
                self.heightInFoot_in = nil
            }
        )
        Form {
            HStack {
                Text("First Name")
                Text("*").foregroundStyle(.red)
                TextField(text: $firstName ?? "", prompt: Text("Chena")){}
            }
            HStack {
                Text("Last Name")
                Text("*").foregroundStyle(.red)
                TextField(text: $lastName ?? "", prompt: Text("Lee")){}
            }
            DatePicker(selection: $dob ?? oneDayLater, displayedComponents: [.date]){
                HStack{
                    Text("Date of Birth")
                    Text("*").foregroundStyle(.red)
                }
            }
            HStack{
                Text("Height")
                Text("*").foregroundStyle(.red)
                if heightUnitMeterOn {
                    TextField(value: $heightInCm, formatter: NumberFormatter()){}
                } else {
                    TextField(value: $heightInFoot_ft, formatter: NumberFormatter()){}
                    Text("ft")
                    TextField(value: $heightInFoot_in, formatter: NumberFormatter()){}
                }
                Toggle("in", isOn: heightUnitFootOn)
                    .toggleStyle(.button)
                Toggle("cm", isOn: $heightUnitMeterOn)
                    .toggleStyle(.button)
            }
            HStack{
                Text("Weight")
                Text("*").foregroundStyle(.red)
                if weightUnitKgOn {
                    TextField(value: $weight, formatter: NumberFormatter()){}
                    
                } else {
                    TextField(value: $weight, formatter: NumberFormatter()){}
                }
                Toggle("lb", isOn: weightUnitLbOn)
                    .toggleStyle(.button)
                Toggle("kg", isOn: $weightUnitKgOn)
                    .toggleStyle(.button)
            }

            HStack{
                Text("Blood Type")
                Picker("", selection: $bloodType) {
                    ForEach(BloodType.allCases) { bloodType in
                        Text(bloodType.rawValue).tag(bloodType as BloodType)
                    }
                }
            }

        }
        
        if (!isRequiredFieldsValid()) {
            Text("Required fields were not completed or an input was invalid").fontWeight(.bold).foregroundStyle(.red).padding().border(.red)
        }
        
        Button("Save", action: registerPatient)
            .disabled(!isRequiredFieldsValid())
    }
}
