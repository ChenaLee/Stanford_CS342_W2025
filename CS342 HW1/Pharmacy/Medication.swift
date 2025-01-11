//
//  Medication.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//

class Medication {
    //NICE_TO_HAVE: I don't like the name part. Medications should have ids that are gauranteed to be unique.
    let name: String;
    let dose: Dose;
    let route: ConsumptionPath;
    
    init(name: String, dose: Dose, route: ConsumptionPath) {
        self.name = name
        self.dose = dose
        self.route = route
    }
    
    func isSameTypeAs(other: Medication) -> Bool {
        return name == other.name
    }
}
