//
//  HeadLinesParamsView.swift
//  NewsSwiftUI
//
//  Created by User on 23.01.21.
//

import SwiftUI

struct ParamsHeadLinesView: View {
    @Binding var selectedCountry: Int
    @Binding var selectedCategory: Int
    @EnvironmentObject var params: AppParams
    
    var body: some View {
        VStack {
            Text("Choose country")
                .font(.system(size: 16))
                .frame(alignment: Alignment.trailing)
                .padding(.top, 30)
            Picker(selection: $selectedCountry, label: Text("Country")) {
                ForEach(0 ..< countries.count) {
                    Text(countries[$0].fullName).font(.system(size: 10)).padding()
                }
            }
            .onChange(of: selectedCountry) { _ in
                self.params.country = countries[selectedCountry].shortName
                self.params.selectedCountry = selectedCountry
                self.params.q = ""
            }
            .frame(height: 50)
            .clipped()
            Text("Choose Category")
                .font(.system(size: 16))
                .frame(alignment: Alignment.trailing)
                .padding(.top, 25)
            Picker(selection: $selectedCategory, label: Text("Category")) {
                ForEach(0 ..< categories.count) {
                    Text(categories[$0]).font(.system(size: 10)).padding()
                }
            }
            .onChange(of: selectedCategory) { _ in
                self.params.category = categories[selectedCategory]
                self.params.selectedCategory = selectedCategory
                self.params.q = ""
            }
            .frame(height: 50)
            .clipped()
            Text("Your search word: " + params.q)
                .padding(.top, 30)
                .font(.system(size: 16))
            InputText(text: "Enter your search word here", input: $params.q)
                .padding()
            Spacer()
        }.frame(alignment: .top)
    }
}
