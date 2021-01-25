//
//  utils.swift
//  NewsSwiftUI
//
//  Created by User on 24.01.21.
//

import SwiftUI

struct NewsArticles: Decodable {
    var articles: [Article] = []
}

struct Article: Decodable {
    var author: String?
    var description: String?
    var title: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var source: Source
}

struct Source: Decodable {
    var name: String?
}

struct NewsItemView: View {
    var text: String
    var body: some View {
        Text(text)
    }
}

func getNews(url: String, completion: @escaping ([Article]) -> ()) {
    guard let url = URL(string: url) else { return }
    URLSession.shared.dataTask(with: url) { (data, _, error ) in
        guard let data = data else { return }
        do {
            let jsonT = try JSONDecoder().decode(NewsArticles.self, from: data)
            let v: NewsArticles = jsonT
            DispatchQueue.main.async {
                completion(v.articles)
            }
        } catch {
            print(error)
        }
    }.resume()
}

func transformDate(dateP: String) -> String {
    let SubstrDate = String(dateP.prefix(10))
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd"

    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "MMM dd, yyyy"

    let date: NSDate? = dateFormatterGet.date(from: SubstrDate) as NSDate?
    if(date !== nil) {
        return dateFormatterPrint.string(from: date! as Date)
    }
    return "no"
}
