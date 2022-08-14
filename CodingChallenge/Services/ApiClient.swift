//
//  ApiClient.swift
//  iWykop
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation

public struct ApiRequestBody {
    var body : [String:String];
    
    func toData() throws -> Data {
        let jsonData = try JSONSerialization.data(withJSONObject: self.body, options: [])

        return jsonData

    }
}

public typealias ApiRequestHeaders = [String:String]


public enum ApiRequest {
    case Get(url:String, headers: ApiRequestHeaders?)
    case Post(url:String, body: ApiRequestBody, headers: ApiRequestHeaders?)
    case Delete(url:String, body: ApiRequestBody, headers: ApiRequestHeaders?)
    
    func method() ->String {
        switch self {
        case .Get:
            return "GET"
        case .Post:
            return "POST"
        case .Delete:
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
            self.httpRequest(request) { data, error in
                if let error = error {
                    cont.resume(throwing: error)
                    return
                }
                cont.resume(returning: data!)
            }
        })
    }
}
