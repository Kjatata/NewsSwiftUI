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
    @EnvironmentObject var params: AppParams
    var type: String
    var body: some View {
        List(news, id: \.self.description) { (post) in
            HStack {
                ButtonSafariView(content: VStack{
                    KFImage(URL(string: post.urlToImage ?? "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX10028469.jpg")!)
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

        }.onAppear() {
            if(type == "Top Headlines") {
                if(params.q == "") {
                    getNews(url: "https://newsapi.org/v2/top-headlines?country=\(params.country)&category=\(params.category)&apiKey=51ea6b34f2be4e8b819ba235b717cf44") {
                        (news) in self.news = news
                    }
                } else {
                    getNews(url: "https://newsapi.org/v2/top-headlines?q=\(params.q)&apiKey=51ea6b34f2be4e8b819ba235b717cf44") {
                        (news) in self.news = news
                    }
                }
            } else {
                getNews(url: "https://newsapi.org/v2/everything?q=\(params.q)&sources=\(params.sourse)&apiKey=51ea6b34f2be4e8b819ba235b717cf44") {
                    (news) in self.news = news
                }
            }
        }.padding()
    }
    
    func showSheet(){
        self.showShareSheet = true
    }
    
    func addData(post: Article){
        let newdata = DataType()
        newdata.urlToImage = post.urlToImage ?? "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX10028469.jpg"
        newdata.title = post.title ?? "no info"
        newdata.Objdescription = post.description ?? "no info"
        newdata.publishedAt = transformDate(dateP: post.publishedAt ?? "no info")
        newdata.url = post.url ?? "https://itransition.by"
        if(!DBViewModel().haveSameObj(object: newdata)) {
            showAlert = true
            DBViewModel().addData(object: newdata)
        } else {
            self.alertText = "This note was added earlier"
            showAlert = true
        }
    }
}
