//
//  ContentView.swift
//  NewsSwiftUI
//
//  Created by User on 21.01.21.
//

import SwiftUI

struct NewsArticles: Decodable {
    var articles: [Article] = []
}

struct Article: Decodable {
    var author: String
    var description: String
    var title: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var source: Source
}

struct Source: Decodable {
    var name: String
}

struct ContentView: View {
    @State var news: [Article] = []
    var body: some View {
        HStack {
            List(news, id: \.self.description) { (post) in
                Text(post.title)
            }.onAppear() {
                Api().getNews {
                    (news) in self.news = news
                }
            }
        }
    }
}

struct Api {
    func getNews(completion: @escaping ([Article]) -> ()) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=51ea6b34f2be4e8b819ba235b717cf44") else { return }
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
