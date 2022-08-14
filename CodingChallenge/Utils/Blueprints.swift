//
//  Blueprints.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation

protocol Mockable {
    associatedtype T;
    
    static var mocked : T { get }
}
