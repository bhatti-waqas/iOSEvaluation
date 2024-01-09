//
//  ArticleRowViewModel.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 09/01/2024.
//

import Foundation

struct ArticleRowViewModel: Hashable {
    let id: Int
    let uri: String
    let url: String
    let source: String
    let publishedDate: String
    let section: String
    let nytdSection: String
    let adxKeywords: String
    let byline: String
    let type: String
    let title: String
    let abstract: String
    
    init(article: Article) {
        self.id = article.id
        self.uri = article.uri
        self.url = article.url
        self.source = article.source
        self.publishedDate = article.publishedDate
        self.section = article.section
        self.nytdSection = article.nytdSection ?? ""
        self.adxKeywords = article.adxKeywords ?? ""
        self.byline = article.byline
        self.type = article.type
        self.title = article.title
        self.abstract = article.abstract
    }
}
