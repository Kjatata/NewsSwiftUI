//
//  NewsView.swift
//  NewsSwiftUI
//
//  Created by User on 23.01.21.
//

import SafariServices
import SwiftUI
import Kingfisher

struct NewsView: View {
    @State var news: [Article] = []
    @EnvironmentObject var params: AppParams
    var type: String
    var body: some View {
        List(news, id: \.self.description) { (post) in
            VStack {
                SafariButton(content: VStack{
                    KFImage(URL(string: post.urlToImage ?? "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX10028469.jpg")!)
                            .loadDiskFileSynchronously()
                            .cacheMemoryOnly()
                            .resizable()
                        .frame(idealHeight: 140)
                                  
                    Text(post.title ?? "no info").font(.system(size: 16)).padding(1).frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                    Text(post.description ?? "no info").font(.system(size: 10)).frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                    Text(transformDate(dateP: post.publishedAt ?? "no info")).font(.system(size: 13)).padding()
                }, url: post.url ?? "no info")
            }
        }.onAppear() {
            if(type == "Top Headlines") {
                getNews(url: "https://newsapi.org/v2/top-headlines?country=\(params.country)&category=\(params.category)&apiKey=51ea6b34f2be4e8b819ba235b717cf44") {
                    (news) in self.news = news
                }
            } else {
                getNews(url: "https://newsapi.org/v2/everything?q=\(params.q)&sources=\(params.sourse)&apiKey=51ea6b34f2be4e8b819ba235b717cf44") {
                    (news) in self.news = news
                }
            }
        }.padding()
    }
}
