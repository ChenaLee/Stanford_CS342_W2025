//
//  PrescriptionForm.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/15/25.
//

import Foundation
import SwiftUI

struct PrescriptionForm: View {
    @Binding var patient: Patient;
    @Environment(\.dismiss) var dismiss

    @State private var medName : String?;
    @State private var medDose : Double?;
    @State private var medDoseUnit : UnitDose?;
    @State private var route : ConsumptionPath?;
    @State private var countPerCycle : Int?;
    @State private var cycleValue : Int?;
    @State private var cycleUnitType : UnitTime?;
    @State private var durationValue : Int?;
    @State private var durationUnit : UnitTime?;
    
    @State private var prescriptionFailed : Bool = false;
    
    func createPrescriptionObj() -> Prescription {
        let dose = Dose(value: medDose!, unit: medDoseUnit!)
        let frequency = Frequency(value: countPerCycle!, cycle: Duration.seconds(cycleValue! * 3600 * cycleUnitType!.inHour()));
        let med = Medication(name: medName!, dose: dose, route: route!);
        return Prescription(medication: med, datePrescribed: Date(), frequency: frequency, duration: Duration.seconds(durationValue! * 3600 * durationUnit!.inHour()));
    }
    
    func prescribe() {
        print("for patient " + patient.getNameAndAgePrintable())
        prescriptionFailed = false
        let prescription = createPrescriptionObj();
        do {
            try patient.addPrescription(newPrescription: prescription)
            dismiss()
        } catch {
            prescriptionFailed = true
        }
    }
    
    func isRequiredFieldsValid() -> Bool {
        return !(medName ?? "").trimmingCharacters(in: .whitespaces).isEmpty &&
            medDose != nil && medDose != 0  &&
            medDoseUnit != nil && route != nil &&
            countPerCycle != nil && countPerCycle != 0 &&
            cycleValue != nil && cycleValue != 0 &&
            cycleUnitType != nil && durationUnit != nil && durationValue != nil && durationValue != 0
    }
    
    
    var body: some View {
        Form {
            HStack {
                Text("Medication Name")
                Text("*").foregroundStyle(.red)
                TextField(text: $medName ?? "", prompt: Text("Bupropion")){}
            }
            HStack {
                Text("Dose")
                Text("*").foregroundStyle(.red)
                TextField(value: $medDose, formatter: NumberFormatter()){}

                Picker("", selection: $medDoseUnit) {
                    ForEach(UnitDose.allCases) { unitDose in
                        Text(unitDose.rawValue).tag(unitDose as UnitDose)
                    }
                } //TODO finish this. Unit isn't iteratable. So prob need new unit type..? union type isn't a thing here.
            }
            HStack {
                Text("Route")
                Text("*").foregroundStyle(.red)
                Picker("", selection: $route) {
                    ForEach(ConsumptionPath.allCases) { route in
                        Text(route.rawValue).tag(route as ConsumptionPath)
                    }
                }
            }
            VStack {
                HStack{
                    Text("Frequency")
                    Text("*").foregroundStyle(.red)
                    TextField(value: $countPerCycle, formatter: NumberFormatter()){}
                    Text("times per")
                }
                HStack{
                    TextField(value: $cycleValue, formatter: NumberFormatter()){}
                    Picker("", selection: $cycleUnitType) {
                        ForEach(UnitTime.allCases) { unitTime in
                            Text(unitTime.rawValue).tag(unitTime as UnitTime)
                        }
                    }
                }
                
            }
            HStack {
                Text("Duration")
                Text("*").foregroundStyle(.red)
                TextField(value: $durationValue, formatter: NumberFormatter()){}
                Picker("", selection: $durationUnit) {
                    ForEach(UnitTime.allCases) { unitTime in
                        Text(unitTime.rawValue).tag(unitTime as UnitTime)
                    }
                }
            }
       }
           
        if (!isRequiredFieldsValid()) {
            Text("Required fields were not completed or an input was invalid").fontWeight(.bold).foregroundStyle(.red).padding().border(.red)
        }
        
        if (prescriptionFailed) {
            Text("Failed to prescribe. It may be because this prescription is a duplicate.").fontWeight(.bold).foregroundStyle(.red).padding().border(.red)
        }
        
        Button("Save", action: prescribe)
            .disabled(!isRequiredFieldsValid())
    }
}
