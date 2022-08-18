//
//  Mocks.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation



extension Shift : Mockable {
    typealias ReturnType = Shift
    
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
        
        let data = json.data(using: .utf8)
        return try! BaseShiftkeyApiResponse.decoder().decode(Shift.self, from: data!)
        
    }()
}



extension ShiftsWithDate : Mockable {
    typealias ReturnType = ShiftsWithDate
    
    static var mocked : ShiftsWithDate = {
        let json = """
{
    "date": "2022-08-15",
    "shifts": [
    {
        "shift_id": 3435069,
        "start_time": "2022-08-15T11:00:00+00:00",
        "end_time": "2022-08-15T23:00:00+00:00",
        "normalized_start_date_time": "2022-08-15 07:00:00",
        "normalized_end_date_time": "2022-08-15 19:00:00",
        "timezone": "Eastern",
        "premium_rate": false,
        "covid": false,
        "shift_kind": "Day Shift",
        "within_distance": 40,
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
            "id": 131,
            "specialty_id": 8,
            "state_id": 21,
            "name": "Licensed Practical Nurse",
            "abbreviation": "LPN",
            "specialty": {
                "id": 8,
                "name": "Licensed Vocational/Practical Nurse",
                "color": "#AF52DE",
                "abbreviation": "LVN/LPN"
            }
        }
    },
{
                    "shift_id": 3517887,
                    "start_time": "2022-08-15T11:00:00+00:00",
                    "end_time": "2022-08-15T19:00:00+00:00",
                    "normalized_start_date_time": "2022-08-15 07:00:00",
                    "normalized_end_date_time": "2022-08-15 15:00:00",
                    "timezone": "Eastern",
                    "premium_rate": false,
                    "covid": false,
                    "shift_kind": "Day Shift",
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
                },
                {
                    "shift_id": 3538241,
                    "start_time": "2022-08-15T11:00:00+00:00",
                    "end_time": "2022-08-15T19:00:00+00:00",
                    "normalized_start_date_time": "2022-08-15 07:00:00",
                    "normalized_end_date_time": "2022-08-15 15:00:00",
                    "timezone": "Eastern",
                    "premium_rate": false,
                    "covid": false,
                    "shift_kind": "Day Shift",
                    "within_distance": 40,
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
                },
                {
                    "shift_id": 3538322,
                    "start_time": "2022-08-15T11:00:00+00:00",
                    "end_time": "2022-08-15T19:00:00+00:00",
                    "normalized_start_date_time": "2022-08-15 07:00:00",
                    "normalized_end_date_time": "2022-08-15 15:00:00",
                    "timezone": "Eastern",
                    "premium_rate": false,
                    "covid": false,
                    "shift_kind": "Day Shift",
                    "within_distance": 40,
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
                        "id": 131,
                        "specialty_id": 8,
                        "state_id": 21,
                        "name": "Licensed Practical Nurse",
                        "abbreviation": "LPN",
                        "specialty": {
                            "id": 8,
                            "name": "Licensed Vocational/Practical Nurse",
                            "color": "#AF52DE",
                            "abbreviation": "LVN/LPN"
                        }
                    }
                },
                {
                    "shift_id": 3538433,
                    "start_time": "2022-08-15T11:00:00+00:00",
                    "end_time": "2022-08-15T19:00:00+00:00",
                    "normalized_start_date_time": "2022-08-15 07:00:00",
                    "normalized_end_date_time": "2022-08-15 15:00:00",
                    "timezone": "Eastern",
                    "premium_rate": false,
                    "covid": false,
                    "shift_kind": "Day Shift",
                    "within_distance": 40,
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
                        "id": 186,
                        "specialty_id": 9,
                        "state_id": 21,
                        "name": "Registered Nurse",
                        "abbreviation": "RN",
                        "specialty": {
                            "id": 9,
                            "name": "Registered Nurse",
                            "color": "#F5657C",
                            "abbreviation": "RN"
                        }
                    }
                },
                {
                    "shift_id": 3590884,
                    "start_time": "2022-08-15T11:00:00+00:00",
                    "end_time": "2022-08-15T19:00:00+00:00",
                    "normalized_start_date_time": "2022-08-15 07:00:00",
                    "normalized_end_date_time": "2022-08-15 15:00:00",
                    "timezone": "Eastern",
                    "premium_rate": false,
                    "covid": false,
                    "shift_kind": "Day Shift",
                    "within_distance": 40,
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
                        "id": 131,
                        "specialty_id": 8,
                        "state_id": 21,
                        "name": "Licensed Practical Nurse",
                        "abbreviation": "LPN",
                        "specialty": {
                            "id": 8,
                            "name": "Licensed Vocational/Practical Nurse",
                            "color": "#AF52DE",
                            "abbreviation": "LVN/LPN"
                        }
                    }
                },
                {
                    "shift_id": 3598726,
                    "start_time": "2022-08-15T11:00:00+00:00",
                    "end_time": "2022-08-15T19:00:00+00:00",
                    "normalized_start_date_time": "2022-08-15 07:00:00",
                    "normalized_end_date_time": "2022-08-15 15:00:00",
                    "timezone": "Eastern",
                    "premium_rate": false,
                    "covid": false,
                    "shift_kind": "Day Shift",
                    "within_distance": 60,
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
                },
    ]

}
"""
        
        let data = json.data(using: .utf8)
        let result = try! BaseShiftkeyApiResponse.decoder().decode(ShiftsWithDate.self, from: data!)
        
        return result
    }()
}
