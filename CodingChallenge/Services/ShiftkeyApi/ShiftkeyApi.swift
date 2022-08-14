//
//  ShiftkeyApi.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation

class BaseShiftkeyApiResponse {
    
    var `class`: String?
    var alert: Alert?
    var additional: String?
    
    
    
    
    
    static func decoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return decoder;
    }
    
}
struct Alert: Codable {
    let headline: String
    let message: String
    let details: String?
}
