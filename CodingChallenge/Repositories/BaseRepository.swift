//
//  BaseRepository.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 15/08/2022.
//

import Foundation

protocol BaseRepository {
    associatedtype Item;
    
    var allItems : [Item] { get }
    
    
    
}
