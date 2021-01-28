//
//  EverythingParamsView.swift
//  NewsSwiftUI
//
//  Created by User on 25.01.21.
//

import SwiftUI

struct ParamsEverythingView: View {
    @EnvironmentObject var params: ParamsViewModel
    @Binding var selectedSource: Int
    var body: some View {
        VStack {
            Text("Your search word: " + params.q)
                .padding(.top, 30)
                .font(.system(size: 16))
            InputText(text: "Enter your search word here", input: $params.q)
                .padding()
            Text("Choose Source")
                .font(.system(size: 16))
                .frame(alignment: Alignment.trailing)
                .padding(.top, 30)
            Picker(selection: $selectedSource, label: Text("Country")) {
                ForEach(0 ..< sources.count) {
                    Text(sources[$0].name ?? "no info").font(.system(size: 10)).padding()
                }
            }
            .onChange(of: selectedSource) { _ in
                self.params.sourse = sources[selectedSource].id ?? "no info"
                self.params.selectedSource = selectedSource
                self.params.q = ""
            }
            .frame(height: 50)
            .clipped()
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
