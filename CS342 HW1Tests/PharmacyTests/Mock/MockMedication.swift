//
//  MockMedication.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/11/25.
//
@testable import CS342_HW1

class MockMedication: Medication {
  init() {
      super.init(name: "", dose: anyDose1, route: ConsumptionPath.MOUTH)
  }
}

class MockMedicationSameTypeAlwaysTrue: MockMedication {
  override func isSameTypeAs(other: Medication) -> Bool {
      return true
  }
}

class MockMedicationSameTypeAlwaysFalse: MockMedication {
  override func isSameTypeAs(other: Medication) -> Bool {
      return false
  }
}
