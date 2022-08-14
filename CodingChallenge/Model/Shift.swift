//
//  Shift.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation


struct Shift: Codable {
    let shiftID: Int
    let startTime : Date
    let endTime: Date
//    let normalizedStartDateTime : Date
//    let normalizedEndDateTime : Date
    let timezone: String
    let premiumRate: Bool
    let covid: Bool
    let shiftKind: String
    let withinDistance: Int
    let facilityType: FacilityType
    let skill: Skill
    let localizedSpecialty: LocalizedSpecialty

    enum CodingKeys: String, CodingKey {
        case shiftID = "shift_id"
        case startTime = "start_time"
        case endTime = "end_time"
//        case normalizedStartDateTime = "normalized_start_date_time"
//        case normalizedEndDateTime = "normalized_end_date_time"
        case timezone
        case premiumRate = "premium_rate"
        case covid
        case shiftKind = "shift_kind"
        case withinDistance = "within_distance"
        case facilityType = "facility_type"
        case skill
        case localizedSpecialty = "localized_specialty"
    }
}

struct Skill: Codable {
    let id: Int
    let name: String
    let color: String
}

struct FacilityType: Codable {
    let id: Int
    let name: String
    let color: String
    let abbreviation: String?
}


struct LocalizedSpecialty: Codable {
    let id: Int
    let specialtyID: Int
    let stateID: Int
    let name: String
    let abbreviation: String
    let specialty: Specialty

    enum CodingKeys: String, CodingKey {
        case id
        case specialtyID = "specialty_id"
        case stateID = "state_id"
        case name, abbreviation, specialty
    }
}

struct Specialty: Codable {
    let id: Int
    let name: String
    let color: String
    let abbreviation: String?
}


