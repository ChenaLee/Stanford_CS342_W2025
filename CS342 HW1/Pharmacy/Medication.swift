//
//  Medication.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//
class Medication: Hashable, Equatable {
    //NICE_TO_HAVE: I don't like the name part. Medications should have ids that are gauranteed to be unique.
    var name: String;
    var dose: Dose;
    var route: ConsumptionPath;
    
    init(name: String, dose: Dose, route: ConsumptionPath) {
        self.name = name
        self.dose = dose
        self.route = route
    }
    
    static func ==(lhs: Medication, rhs: Medication) -> Bool {
        return lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(dose)
        hasher.combine(route)
    }
    
    func toString() -> String {
        return name + " - " + dose.toString();
    }
    
    func isSameTypeAs(other: Medication) -> Bool {
        return name == other.name
    }
}
