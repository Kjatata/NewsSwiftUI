//
//  Info.swift
//  NewsSwiftUI
//
//  Created by User on 23.01.21.
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

struct Info: View {
    @State var news: [Article] = []
    var body: some View {
        List(news, id: \.self.description) { (post) in
            VStack {
                AsyncImage(url: URL(string: post.urlToImage ?? "")!,
                             placeholder: { Text("Loading ...") },
                             image: { Image(uiImage: $0).resizable() })
                    .aspectRatio(contentMode: .fit)
                    .frame(idealHeight: UIScreen.main.bounds.width / 2)
                Button(action: {
                    UIApplication.shared.open(URL(string: post.url ?? "no info")!)
                }, label: {
                    Text(post.title ?? "no info").font(.system(size: 16)).padding(1)
                    Text(post.description ?? "no info").font(.system(size: 10))
                })
                Text(date(date: post.publishedAt ?? "no info")).font(.system(size: 13)).padding()
            }
        }.onAppear() {
            getNews {
                (news) in self.news = news
            }
        }.padding()
    }
    
    func getNews(completion: @escaping ([Article]) -> ()) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=ru&apiKey=51ea6b34f2be4e8b819ba235b717cf44") else { return }
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
    
    func date(date: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy HH:mm"

        let date: NSDate? = dateFormatterGet.date(from: "2016-02-29 12:24:26") as NSDate?
        return dateFormatterPrint.string(from: date! as Date)
    }
}

struct Info_Previews: PreviewProvider {
    static var previews: some View {
        Info()
    }
}
