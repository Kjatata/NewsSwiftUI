//
//  SideBarView.swift
//  NewsSwiftUI
//
//  Created by User on 28.01.21.
//

import SwiftUI

struct SideBarView: View {
    @Binding var show: Bool
    @Binding var selectedPage: String
    
    var body: some View {
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
                    ButtonMenuView(image: "info", title: "News", selected: $selectedPage, show: $show)
                    ButtonMenuView(image: "book", title: "Search", selected: $selectedPage, show: $show)
                    ButtonMenuView(image: "checkmark.square", title: "Set Password", selected: $selectedPage, show: $show)
                    ButtonMenuView(image: "note", title: "Notes", selected: $selectedPage, show: $show)
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
}
