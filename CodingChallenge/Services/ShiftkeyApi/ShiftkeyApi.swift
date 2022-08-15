//
//  ShiftkeyApi.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation

public struct BaseShiftkeyApiResponse : Codable {
    
    var `class`: String?
    var alert: Alert?
    var additional: String?
    
    
    
    
    
    static func decoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        

        
        decoder.dateDecodingStrategy = .custom({ decoder in
            
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)

            let formatters = [DateFormatter.iso8601Full, DateFormatter.yyyyMMdd];

            for formatter in formatters {
                if let date = formatter.date(from: dateString) {
                    return date
                }
            }

            if let date = ISO8601DateFormatter().date(from: dateString){
                return date
            }

            

            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateString)")
        })
        return decoder;
    }
    
    
}
public struct Alert: Codable {
    let headline: String
    let message: String
    let details: String?
}




extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
