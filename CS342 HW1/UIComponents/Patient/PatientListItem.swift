//
//  PatientListItem.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/15/25.
//

import SwiftUI
import Foundation

struct PatientListItem: View {
    var patient: Patient;
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
                Text(patient.getNameAndAgePrintable())
                .foregroundColor(.primary)
                .font(.headline);
                Text(patient.medicalRecordNumber)
                .foregroundColor(.secondary)
                .font(.subheadline);
            
        }
    }
}
