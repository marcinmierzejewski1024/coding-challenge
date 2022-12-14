//
//  ApiClient.swift
//  iWykop
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation

public struct ApiRequestBody {
    var body : [String:String]
    
    func toData() throws -> Data {
        let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
        
        return jsonData
        
    }
}

public typealias ApiRequestHeaders = [String:String]

public enum ApiRequest {
    case get(url:String, headers: ApiRequestHeaders?)
    case post(url:String, body: ApiRequestBody, headers: ApiRequestHeaders?)
    case delete(url:String, body: ApiRequestBody, headers: ApiRequestHeaders?)
    
    func method() -> String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        }
    }
}

public protocol ApiClient {
    func httpRequestAsync(_ request: ApiRequest) async throws -> Data
    func httpRequest(_ request: ApiRequest, completion: @escaping (_ data: Data?, _ error: Error?) -> Void)
    
}

extension ApiClient {
    public func httpRequestAsync(_ request: ApiRequest) async throws -> Data {
        try await withCheckedThrowingContinuation({ cont in
            httpRequest(request) { data, error in
                if let error = error {
                    cont.resume(throwing: error)
                    return
                }
                cont.resume(returning: data!)
            }
        })
    }
}
