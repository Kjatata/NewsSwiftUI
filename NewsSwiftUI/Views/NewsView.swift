//
//  NewsView.swift
//  NewsSwiftUI
//
//  Created by User on 23.01.21.
//

import SafariServices
import SwiftUI
import Kingfisher
import RealmSwift

struct NewsView: View {
    @State var news: [Article] = []
    @State private var showAlert = false
    @State private var alertText = "Note Added"
    @State private var showShareSheet = false
    @EnvironmentObject var params: ParamsViewModel
    
    var body: some View {
        HStack {
            if news.count > 0 {
                List(news, id: \.self.description) { (post) in
                    HStack {
                        ButtonSafariView(content: VStack{
                            KFImage(URL(string: post.urlToImage ?? "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX10028469.jpg"))
                                    .loadDiskFileSynchronously()
                                    .cacheMemoryOnly()
                                    .resizable()
                                .frame(idealHeight: 140)
                                          
                            Text(post.title ?? "no info").font(.system(size: 16)).padding(1)
                            Text(post.description ?? "no info").font(.system(size: 10))
                            Text(transformDate(dateP: post.publishedAt ?? "no info")).font(.system(size: 13)).padding()
                        }, url: post.url ?? "no info").frame(height: 335)
                        
                        Spacer()
                        ButtonSideView(funct: {() -> () in addData(post: post)},
                                       color: .orange,
                                       text: "TAP HERE TO ADD IN U NOTES")
                        ButtonSideView(funct: showSheet,
                                       color: .green,
                                       text: "TAP HERE SHARE THAT NOTES")
                            .sheet(isPresented: $showShareSheet) {
                                ShareSheet(activityItems: [post.url ?? "no url"])
                            }

                    }.buttonStyle(PlainButtonStyle())
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text(self.alertText))
                    }
                }
            } else {
                Text("You have no news :(")
            }
            
        }.onAppear() {
            if(params.searchTypePage == "Top Headlines") {
                if(params.q == "") {
                    getNews(url: "https://newsapi.org/v2/top-headlines?country=\(params.country)&category=\(params.category)&apiKey=d0c23a06bb2e4bfaa7cfe0543fc8dc59") {
                        (news) in self.news = news
                    }
                } else {
                    getNews(url: "https://newsapi.org/v2/top-headlines?q=\(params.q)&apiKey=d0c23a06bb2e4bfaa7cfe0543fc8dc59") {
                        (news) in self.news = news
                    }
                }
            } else {
                getNews(url: "https://newsapi.org/v2/everything?q=\(params.q)&sources=\(params.sourse)&apiKey=d0c23a06bb2e4bfaa7cfe0543fc8dc59") {
                    (news) in self.news = news
                }
            }
        }.padding()
        
        
    }
    
    func showSheet(){
        self.showShareSheet = true
    }
    
    func addData(post: Article){
        print("ok")
        let newdata = DataType()
        newdata.urlToImage = post.urlToImage ?? "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX10028469.jpg"
        newdata.title = post.title ?? "no info"
        newdata.Objdescription = post.description ?? "no info"
        newdata.publishedAt = transformDate(dateP: post.publishedAt ?? "no info")
        newdata.url = post.url ?? "https://itransition.by"
        if(!DBViewModel().haveSameObj(object: newdata)) {
            self.alertText = "Note Added"
            showAlert = true
            DBViewModel().addData(object: newdata)
        } else {
            self.alertText = "This note was added earlier"
            showAlert = true
        }
    }
}
