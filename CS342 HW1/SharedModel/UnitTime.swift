//
//  UnitTime.swift
//  CS342 HW1
//
//  Created by Chena Lee on 1/14/25.
//

enum UnitTime: String, CaseIterable, Identifiable {
    case Hour
    case Day
    case Week
    case Year

    var id: UnitTime { self }
    
    func inHour() -> Int {
        switch self {
            case .Hour: return 1
            case .Day: return 24
            case .Week: return 168
            case .Year: return 168 * 52
        }
    }
}
