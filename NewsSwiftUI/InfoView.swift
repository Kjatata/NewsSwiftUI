//
//  InfoView.swift
//  NewsSwiftUI
//
//  Created by User on 23.01.21.
//

import SafariServices
import SwiftUI


struct InfoView: View {
    @State var news: [Article] = []
    @EnvironmentObject var params: AppParams
    var type: String
    var body: some View {
        List(news, id: \.self.description) { (post) in
            VStack {
                SafariButton(content: VStack{
                    AsyncImage(url: URL(string: post.urlToImage ?? "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX10028469.jpg")!,
                                 placeholder: { Text("Loading ...") },
                                 image: { Image(uiImage: $0).resizable() })
                        .aspectRatio(contentMode: .fit)
                        .frame(idealHeight: UIScreen.main.bounds.width / 2)
                    Text(post.title ?? "no info").font(.system(size: 16)).padding(1).frame(width: UIScreen.main.bounds.width / 1.2, alignment: .trailing)
                    Text(post.description ?? "no info").font(.system(size: 10)).frame(width: UIScreen.main.bounds.width / 1.2, alignment: .trailing)
                    Text(transformDate(dateP: post.publishedAt ?? "no info")).font(.system(size: 13)).padding()
                }, url: post.url ?? "no info")
            }
        }.onAppear() {
            if(type == "Top Headlines") {
                getNews(url: "https://newsapi.org/v2/top-headlines?country=\(params.selectedCountry)&category=\(params.selectedCategory)&apiKey=51ea6b34f2be4e8b819ba235b717cf44") {
                    (news) in self.news = news
                }
            } else {
                getNews(url: "https://newsapi.org/v2/everything?q=\(params.q)&apiKey=51ea6b34f2be4e8b819ba235b717cf44") {
                    (news) in self.news = news
                }
            }
        }.padding()
    }
}
