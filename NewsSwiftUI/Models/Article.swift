//
//  Article.swift
//  NewsSwiftUI
//
//  Created by User on 26.01.21.
//

import Foundation

struct Article: Decodable {
    var author: String?
    var description: String?
    var title: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var source: Source
}
