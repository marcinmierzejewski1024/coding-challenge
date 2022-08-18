//
//  Register.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation

import Resolver


extension Resolver : ResolverRegistering {
    public static func registerAllServices() {
        register(ApiClient.self) { _, _ in
            return URLSessionApiClient()
        }.scope(.graph)
        
        register(ShiftsService.self) { _, _ in
            return ShiftsServiceImpl()
        }.scope(.graph)
    }
}
