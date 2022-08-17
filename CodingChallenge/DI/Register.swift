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
        register(ApiClient.self) { resolver, args in
            return URLSessionApiClient()
        }.scope(.graph)
        
        register(ShiftsService.self) { resolver, args in
            return ShiftsServiceImpl()
        }.scope(.graph)
    }
}
