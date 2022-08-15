//
//  Date+pretty.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 15/08/2022.
//

import Foundation

extension Date {
    
    func YYYYMMDDString() -> String {
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd"
        return formatter1.string(from: self)
    }

    func shortTime() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }

}
