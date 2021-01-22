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
    
    var body: some View {
        VStack {
            Home()
            
        }
    }
}

struct Home: View {
    @State var news: [Article] = []
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var width = UIScreen.main.bounds.width
    @State var show = false
    @State var selectedIndex = ""
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation(.spring()) {
                                show.toggle()
                            }
                        }, label: {
                            Image(systemName: "line.horizontal.3")
                                .font(.system(size:22))
                                .foregroundColor(.black)
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
                if(selectedIndex == "News") {
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
                Spacer(minLength: 0)
            }
            
            HStack(spacing: 0) {
                Spacer(minLength: 0)
                VStack {
                    HStack {
                        Spacer(minLength: 0)
                        Button(action: {
                            withAnimation(.spring()) {
                                show.toggle()
                            }
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                        })
                    }.padding()
                    .padding(.top, edges!.top)
                    
                    VStack(alignment: .leading, content: {
                        MenuButtons(image: "info", title: "News", selected: $selectedIndex, show: $show)
                        MenuButtons(image: "book", title: "Search", selected: $selectedIndex, show: $show)
                        MenuButtons(image: "gear", title: "Settings", selected: $selectedIndex, show: $show)
                        MenuButtons(image: "note", title: "Notes", selected: $selectedIndex, show: $show)
                    })
                    .padding(.top)
                    .padding(.leading, 40)
                    Spacer(minLength: 0)
                }.frame(width: width - 100)
                .background(Color.orange)
                .offset(x: show ? 0 : width - 100)
            }
            .background(Color.black.opacity(show ? 0.3 : 0))
        }
        .ignoresSafeArea(.all, edges: .all)
        
    }
}

struct Api {
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
}

struct MenuButtons: View {
    var image : String
    var title : String
    @Binding var selected: String
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = title
                print(selected)
                show.toggle()
            }
        }) {
            HStack(spacing: 15) {
                Image(systemName: image)
                    .font(.system(size: 22))
                
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding(.vertical)
            .padding(.trailing)
        }
        .padding(-10)
        .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
