//
//  TestData.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/10/25.
//

@testable import CS342_HW1
import Foundation

let anyDose1 = Dose(value: 1, unit: UnitMass.milligrams)
let anyDose2 = Dose(value: 2, unit: UnitMass.milligrams)
let anyFrequency = Frequency(value: 1, cycle: Duration.seconds(3600))

let dayInSeconds = 3600*24
let week = Duration.seconds(dayInSeconds*7)
let twoWeeks = week*2
let twoWeeksAgo = Date.init(timeInterval: TimeInterval(-twoWeeks.components.seconds), since: Date())
let oneDayAgo = Date.init(timeInterval: TimeInterval(-dayInSeconds), since: Date())
let twoYearsAndThirtyDaysAgo = Date.init(timeInterval: TimeInterval(-(2*365+30)*dayInSeconds), since: Date())

let anyHeight = Height(value: 1, unit: UnitLength.meters)
let anyWeight = Weight(value: 1, unit: UnitMass.kilograms)
let anyName1 = Name(firstName: "John", lastName: "Doe", preferredName: nil)
let anyName2 = Name(firstName: "Jennifer", lastName: "Doe", preferredName: "Jen")
