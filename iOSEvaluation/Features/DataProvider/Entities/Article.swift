//
//  Article.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 09/01/2024.
//

struct Article: Decodable {
    let id: Int
    let uri: String
    let url: String
    let source: String
    let publishedDate: String
    let section: String
    let nytdSection: String?
    let adxKeywords: String?
    let byline: String
    let type: String
    let title: String
    let abstract: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case uri
        case url
        case source
        case publishedDate = "published_date"
        case section
        case nytdSection
        case adxKeywords = "ads_keywords"
        case byline, type, title, abstract
    }
}
