//
//  ArticleResponse.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 09/01/2024.
//

struct ArticleResponse: Decodable {
    let results: [Article]
    
    enum CodingKeys: CodingKey {
        case results
    }
}
