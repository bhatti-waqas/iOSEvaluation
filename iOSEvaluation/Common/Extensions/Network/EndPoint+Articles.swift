//
//  EndPoint+Articles.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 08/01/2024.
//

import Networking
import Foundation

extension Endpoint {
    
    static let baseUrl = "http://api.nytimes.com"
    
    static func articles() -> Self {
        let queryParam = URLQueryItem(name: "api-key", value: "hft8I5L2D3FDXLTtP0KWZTAGJGbwVUiy")
        let path = "/svc/mostpopular/v2/mostviewed/all-sections/7.json"
        return Endpoint(baseURL: baseUrl,
                        path: path,
                        queryItems: [queryParam])
    }
}
