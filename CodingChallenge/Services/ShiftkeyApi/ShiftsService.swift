//
//  ShiftsService.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation

struct ShiftServiceRequest  {
    enum ListType : String {
        case Week
        case FourDay = "4day"
        case List
    }
    
    var type : ListType?;
    var start : Date?;
    var end : Date?;
    var address : String
    var radius : Int?
}

extension ShiftServiceRequest : Mockable {
    
    typealias T = ShiftServiceRequest
    static var mocked: ShiftServiceRequest {
        return ShiftServiceRequest(address: "Dallas, TX")
    }
}


class ShiftServiceResponse : BaseShiftkeyApiResponse {
    var data:[Shift]?
    var meta:Meta?
    
}

struct Meta : Codable {
    let lat : Double
    let lng : Double
}



protocol ShiftsService {
    func getShifts(request:ShiftServiceRequest) async throws -> ShiftServiceResponse;
}

