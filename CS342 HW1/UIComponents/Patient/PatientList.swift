//
//  PatientList.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/14/25.
//

import SwiftUI
import Foundation

struct PatientList: View {
    
    // TODO: UI test (watch intro video)
    // TODO: test coverage (unit test)
    
    var patients: Patients
    @State var lastNameToSearch : String = "";
    
    var searchResults: [Patient] {
        var result : [Patient] = []
        if lastNameToSearch.isEmpty {
            result = patients.patientList
        } else {
            result = patients.patientList.filter { $0.getLastName() == lastNameToSearch }
        }
        
        return result.sorted(by: {$0.getLastName() < $1.getLastName()})
    }
    
    var body: some View {
        NavigationStack {
            List(searchResults, id: \.self) { patient in
                NavigationLink {
                    PatientDetail(patient:patient);
                } label: {
                    PatientListItem(patient: patient);
                }
            }
            
            NavigationLink {
                PatientForm(patients: patients);
            } label: {
                Text("Add Patient")
            }
        }
        .searchable(text: $lastNameToSearch)

    }
}

#Preview {
    PatientList(patients: patientsExample)
}
