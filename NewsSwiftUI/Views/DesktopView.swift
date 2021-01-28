//
//  ApplicationView.swift
//  NewsSwiftUI
//
//  Created by User on 27.01.21.
//

import SwiftUI

struct DesktopView: View {
    @State var selectedPage = "News"
    @State var show = false
    @ObservedObject private var params = ParamsViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                TopBarView(show: $show, selectedPage: $selectedPage)
                Spacer(minLength: 0)
                switch(selectedPage) {
                    case "News" : NewsView()
                    case "Search" :
                        if(params.searchTypePage == "Top Headlines") {
                            ParamsHeadLinesView(selectedCountry: $params.selectedCountry, selectedCategory: $params.selectedCategory)
                        } else {
                            ParamsEverythingView(selectedSource: $params.selectedSource)
                        }
                        Spacer()
                        ButtonSwitchNews()
                        Spacer(minLength: 5)
                    case "Notes":
                        NotesView()
                    default:
                        NewsView()
                }
                Spacer(minLength: 0)
            }
            .environmentObject(params)
            SideBarView(show: $show, selectedPage: $selectedPage)
        }
        .ignoresSafeArea(.all, edges: .all)
        
    }
    
}

