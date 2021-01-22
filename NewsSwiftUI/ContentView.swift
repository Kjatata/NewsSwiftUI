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
struct ContentView: View {
    @State var news: [Article] = []
    
    var body: some View {
        VStack {
            Home()
            List(news, id: \.self.description) { (post) in
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text(post.title ?? "no info")
                })
            }.onAppear() {
                Api().getNews {
                    (news) in self.news = news
                }
            }.padding()
            
        }
    }
}

struct Home: View {
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var width = UIScreen.main.bounds.width
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    HStack {
                        Button(action: {}, label: {
                            Image(systemName: "line.horizontal.3")
                                .font(.system(size:22))
                                .foregroundColor(.black)
                        })
                        Spacer()
                        Button(action: {}, label: {
                            Image("logo")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())
                        })
                    }
                    Text("Home")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                }.padding()
                .padding(.top,edges!.top)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                Spacer(minLength: 0)
            }
            
            HStack(spacing: 0) {
                Spacer(minLength: 0)
                VStack {
                    HStack {
                        Spacer(minLength: 0)
                        Button(action: {}, label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                        })
                    }.padding()
                    .padding(.top, edges!.top)
                    
                    VStack(spacing: 15){
                        Text("Menu")
                        
                    }.padding(.horizontal)
                    Spacer(minLength: 0)
                }.frame(width: width - 100)
                .background(Color.green)
            }
            .background(Color.black.opacity(0.3))
        }
        .ignoresSafeArea(.all, edges: .all)
        
    }
}

struct Api {
    func getNews(completion: @escaping ([Article]) -> ()) {
//        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=ru&apiKey=51ea6b34f2be4e8b819ba235b717cf44") else { return }
//        URLSession.shared.dataTask(with: url) { (data, _, error ) in
//            guard let data = data else { return }
//            do {
//                let jsonT = try JSONDecoder().decode(NewsArticles.self, from: data)
//                let v: NewsArticles = jsonT
//                DispatchQueue.main.async {
//                    completion(v.articles)
//                }
//            } catch {
//                print(error)
//            }
//        }.resume()
    }
}

struct MenuButtons {
    var image : String
    var title : String
    
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 15) {
                Image(systemName: image)
                    .font(.system(size: 22))
                
                Text(title)
                    .font(.title2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
