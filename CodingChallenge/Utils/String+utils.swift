//
//  String+utils.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 15/08/2022.
//

import Foundation


extension String {
    var urlEncoded: String? {
        let allowedCharacterSet = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "~-_."))
        return addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)
    }
}

extension String: Error {}
