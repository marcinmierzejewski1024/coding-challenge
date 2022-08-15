//
//  ShiftsServiceImpl.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation
import Resolver



class ShiftsServiceImpl : Resolving, ShiftsService {
    
    lazy var apiClient : ApiClient = resolver.resolve()
    
    func getShifts(request: ShiftServiceRequest) async throws -> ShiftServiceResponse {
        
        let apiRequest = request.toApiRequest();
        let data = try await self.apiClient.httpRequestAsync(apiRequest);
        
//        let string = String(data: data, encoding: .utf8);
        let response = try BaseShiftkeyApiResponse.decoder().decode(ShiftServiceResponse.self, from: data)
        return response
        
    }
    
    
    
}
