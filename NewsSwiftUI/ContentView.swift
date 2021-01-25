//
//  AppView.swift
//  NewsSwiftUI
//
//  Created by User on 21.01.21.
//

import SwiftUI

class AppParams: ObservableObject {
    @Published var selectedCountry = countries[countries.firstIndex(where: {$0.shortName == Locale.autoupdatingCurrent.regionCode?.lowercased()}) ?? 0].shortName
    @Published var selectedCategory = "business"
    @Published var searchTypePage = "Top Headlines"
    @Published var q = "Apple"
}

struct AppView: View {
    @State var show = false
    @State var selectedPage = "News"
    @ObservedObject private var params = AppParams()
    
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
                                .padding(.top)
                        })
                    }
                    Text("Home")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                }.padding()
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                Spacer(minLength: 0)
                switch(selectedPage) {
                case "News" : InfoView(type: params.searchTypePage)
                case "Search" :
                    if(params.searchTypePage == "Top Headlines") {
                        HeadLinesParamsView()
                    } else {
                        EverythingParamsView()
                    }
                    Spacer()
                    Button(action: {
                        params.searchTypePage = params.searchTypePage == "Top Headlines" ? "Everything" : "Top Headlines"
                    }) {
                        Text("Switch from \(params.searchTypePage)")
                    }.padding()
                default:
                    InfoView(type: params.searchTypePage)
                }
                Spacer(minLength: 0)
            }
            .environmentObject(params)
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
                                .padding(.top)
                        })
                    }.padding()
                    
                    VStack(alignment: .leading, content: {
                        MenuButtonView(image: "info", title: "News", selected: $selectedPage, show: $show)
                        MenuButtonView(image: "book", title: "Search", selected: $selectedPage, show: $show)
                        MenuButtonView(image: "gear", title: "Settings", selected: $selectedPage, show: $show)
                        MenuButtonView(image: "note", title: "Notes", selected: $selectedPage, show: $show)
                    })
                    .padding(.top)
                    .padding(.leading, 40)
                    Spacer(minLength: 0)
                }.frame(width: UIScreen.main.bounds.width - 100)
                .background(Color.orange)
                .offset(x: show ? 0 : UIScreen.main.bounds.width - 100)
            }
            .background(Color.black.opacity(show ? 0.3 : 0))
        }
        .ignoresSafeArea(.all, edges: .all)
        
    }
    
}
