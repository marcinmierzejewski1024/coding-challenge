//
//  ShiftsService.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation

public struct ShiftServiceRequest {
    
    static let BaseURL = "https://staging-app.shiftkey.com/api/v2/available_shifts"
    
    enum ListType : String {
        case Week = "week"
        case FourDay = "4day"
        case List = "list"
    }
    
    var type : ListType?;
    var start : Date?;
    var end : Date?;
    var address : String
    var radius : Int?
    
    
    func headers() -> ApiRequestHeaders {
        return ["Content-Type":"application/json","Accept":"application/json"]
    }
    
    func urlWithParamsEncoded() -> String {
        
        var urlItems = [URLQueryItem]()
        if let type = type {
            urlItems.append(URLQueryItem(name: "type", value: type.rawValue))
        }
        
        
        if let start = start {
            urlItems.append(URLQueryItem(name: "start", value: start.YYYYMMDDString().urlEncoded))
        }
        if let end = end {
            urlItems.append(URLQueryItem(name: "end", value: end.YYYYMMDDString()))
        }
        
        if let radius = radius {
            urlItems.append(URLQueryItem(name: "radius", value: radius.description.urlEncoded))
        }
        
        urlItems.append(URLQueryItem(name: "address", value: self.address.urlEncoded))

        var urlComponents = URLComponents(string: ShiftServiceRequest.BaseURL)
        urlComponents?.queryItems = urlItems;
        
        
        
        return urlComponents!.url!.absoluteString;
    }
    
    func toApiRequest() -> ApiRequest{
        return .get(url: self.urlWithParamsEncoded(), headers: self.headers())
    }
}

extension ShiftServiceRequest : Mockable {
    
    typealias T = ShiftServiceRequest
    static var mocked: ShiftServiceRequest {
        return ShiftServiceRequest(address: "Dallas, TX")
    }
    
    
}


public struct ShiftServiceResponse : Codable {
    
    var alert: Alert?
    var additional: String?

    var data:[ShiftsWithDate]?
    var meta:Meta?
    
}

public struct Meta : Codable {
    let lat : Double
    let lng : Double
}




protocol ShiftsService {
    func getShifts(request:ShiftServiceRequest) async throws -> ShiftServiceResponse;
}




class MockShiftService : ShiftsService {
    
    var responseResult : ShiftServiceResponse?;
    
    func getShifts(request: ShiftServiceRequest) async throws -> ShiftServiceResponse {

        if let responseResult = responseResult {
            return responseResult;
        }
        throw "mock error"
    }
    
    
}
