//
//  EndPoint+Articles.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 14/10/2023.
//

import Networking

extension Endpoint {
    
    static let baseUrl = "http://api.nytimes.com"
    
    static func articles() -> Self {
        .init(baseURL: baseUrl, path: "/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=hft8I5L2D3FDXLTtP0KWZTAGJGbwVUiy")
    }
}
