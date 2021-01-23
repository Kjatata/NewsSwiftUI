//
//  ContentView.swift
//  NewsSwiftUI
//
//  Created by User on 21.01.21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Home()
            
        }
    }
}

struct Home: View {
    var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var width = UIScreen.main.bounds.width
    @State var show = false
    @State var selectedPage = "News"
        
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
                if(selectedPage == "News") {
                    Info()
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
                        MenuButtons(image: "info", title: "News", selected: $selectedPage, show: $show)
                        MenuButtons(image: "book", title: "Search", selected: $selectedPage, show: $show)
                        MenuButtons(image: "gear", title: "Settings", selected: $selectedPage, show: $show)
                        MenuButtons(image: "note", title: "Notes", selected: $selectedPage, show: $show)
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

struct MenuButtons: View {
    var image : String
    var title : String
    @Binding var selected: String
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = title
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

