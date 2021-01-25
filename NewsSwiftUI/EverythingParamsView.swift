//
//  EverythingParamsView.swift
//  NewsSwiftUI
//
//  Created by User on 25.01.21.
//

import SwiftUI

struct EverythingParamsView: View {
    @EnvironmentObject var params: AppParams
    var body: some View {
        VStack {
            Text("Your search word: " + params.q)
                .padding(.top, 30)
                .font(.system(size: 16))
            InputText(text: "Username", input: $params.q)
                .padding()
            Spacer()
        }.frame(alignment: .top)
    }
}

struct InputText: View {
    var text: String = ""
    @Binding var input: String
    var body: some View {
        TextField(text, text: $input)
            .padding()
            .background(Color.gray.brightness(0.37))
            .font(.system(size: 10))
            .frame(height: 30)
            .clipped()
            .cornerRadius(6.5)
    }
}
