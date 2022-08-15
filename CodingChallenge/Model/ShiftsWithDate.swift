//
//  ShiftsWithDate.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 15/08/2022.
//

import Foundation


struct ShiftsWithDate : Codable, Equatable
{
    let date : Date
    let shifts: [Shift]
}
