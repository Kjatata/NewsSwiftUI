//
//  TopBarView.swift
//  NewsSwiftUI
//
//  Created by User on 28.01.21.
//

import SwiftUI

struct TopBarView: View {
    @Binding var show: Bool
    @Binding var selectedPage: String
    
    var body: some View {
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
            Text(selectedPage)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
        }.padding()
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}
