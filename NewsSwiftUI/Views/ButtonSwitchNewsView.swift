//
//  ButtonSwitchNewsView.swift
//  NewsSwiftUI
//
//  Created by User on 28.01.21.
//

import SwiftUI

struct ButtonSwitchNews: View {
    @EnvironmentObject var params: ParamsViewModel
    var body: some View {
        Button(action: {
            params.searchTypePage = params.searchTypePage == "Top Headlines" ? "Everything" : "Top Headlines"
        }) {
            Text("Switch from \(params.searchTypePage)")
        }.padding()
        .font(.system(size: 14))
        .frame(height: 30)
        .foregroundColor(.black)
        .clipped()
        .cornerRadius(6.5)
    }
}
