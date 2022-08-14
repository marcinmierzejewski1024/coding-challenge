//
//  Mocks.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation



extension Shift : Mockable {
    typealias T = Shift
    
    
    static var mocked : Shift = {
let json = """
{
    "shift_id": 3517834,
    "start_time": "2022-08-14T19:00:00+00:00",
    "end_time": "2022-08-15T03:00:00+00:00",
    "normalized_start_date_time": "2022-08-14 15:00:00",
    "normalized_end_date_time": "2022-08-14 23:00:00",
    "timezone": "Eastern",
    "premium_rate": false,
    "covid": false,
    "shift_kind": "Evening Shift",
    "within_distance": 30,
    "facility_type": {
        "id": 8,
        "name": "Skilled Nursing Facility",
        "color": "#AF52DE"
    },
    "skill": {
        "id": 2,
        "name": "Long Term Care",
        "color": "#007AFF"
    },
    "localized_specialty": {
        "id": 21,
        "specialty_id": 6,
        "state_id": 21,
        "name": "Geriatric Nurse Assistant",
        "abbreviation": "GNA",
        "specialty": {
            "id": 6,
            "name": "Certified Nursing Aide",
            "color": "#007AFF",
            "abbreviation": "CNA"
        }
    }
}
"""
        
        let data = json.data(using: .utf8);
        return try! BaseShiftkeyApiResponse.decoder().decode(Shift.self, from: data!);
        
    }()
}
