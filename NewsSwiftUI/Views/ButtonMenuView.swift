//
//  MenuButtonView.swift
//  NewsSwiftUI
//
//  Created by User on 24.01.21.
//

import SwiftUI

struct ButtonMenuView: View {
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
