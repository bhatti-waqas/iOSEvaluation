//
//  ArticleResponse.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 14/10/2023.
//

struct ArticleResponse: Decodable {
    let results: [Article]
    
    enum CodingKeys: CodingKey {
        case results
    }
}
