//
//  Date+pretty.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 15/08/2022.
//

import Foundation

extension Date {
    
    func shortDate() -> String {
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        return formatter1.string(from: self)
    }
    
}
