//
//  URLSessionApiClient.swift
//  iWykop
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation

public class URLSessionApiClient : NSObject, ApiClient, URLSessionDelegate, URLSessionDataDelegate {
    
    var session:URLSession?

    
    public func httpRequest(_ request: ApiRequest, completion: (@escaping (Data?, Error?) -> Void)) {
     
        var urlString : String?;
        var connectionBody : Data?;
        let httpMethod = request.method()
        var connectionHeaders : ApiRequestHeaders?
        
        switch request {
        case .Get(let url, let headers):
            urlString = url;
            connectionHeaders = headers;
            
        case .Post(let url, let body, let headers):
            urlString = url;
            connectionBody = try! body.toData()
            connectionHeaders = headers;

            
        case .Delete(let url, let body, let headers):
            urlString = url;
            connectionBody = try! body.toData()
            connectionHeaders = headers;

        }
        
        if let urlString = urlString {
                
            let urlFromString = URL(string: urlString)!
            var urlRequest = URLRequest(url: urlFromString)
            urlRequest.httpBody = connectionBody;
            urlRequest.httpMethod = httpMethod;
            urlRequest.allHTTPHeaderFields = connectionHeaders;
            
            
            let configuration = URLSessionConfiguration.default
            let mainqueue = OperationQueue.main
            if (self.session == nil) {
                session = URLSession(configuration: configuration, delegate:self, delegateQueue: mainqueue)
            }

            let dataTask = session!.dataTask(with: urlRequest) { data, response, error in
                completion(data,error);
            }
            
            

            dataTask.resume();
        }
        
    }
    
}
