//
//  Article.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 14/10/2023.
//

struct Article: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
    let episode: [String]
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case status
        case species
        case image
        case episode
    }
}
