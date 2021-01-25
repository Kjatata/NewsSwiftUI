//
//  HeadLinesParamsView.swift
//  NewsSwiftUI
//
//  Created by User on 23.01.21.
//

import SwiftUI

struct Country {
    var fullName: String
    var shortName: String
}

let countries = [
    Country(fullName: "United Arab Emirates", shortName: "ae"),
    Country(fullName: "Argentina", shortName: "ar"),
    Country(fullName: "Austria", shortName: "at"),
    Country(fullName: "Australia", shortName: "au"),
    Country(fullName: "Belgium", shortName: "be"),
    Country(fullName: "Bulgaria", shortName: "bg"),
    Country(fullName: "Brasil", shortName: "br"),
    Country(fullName: "Canada", shortName: "ca"),
    Country(fullName: "Schweiz", shortName: "ch"),
    Country(fullName: "China", shortName: "cn"),
    Country(fullName: "Colombia", shortName: "co"),
    Country(fullName: "Cuba", shortName: "cu"),
    Country(fullName: "Czech Republic", shortName: "cz"),
    Country(fullName: "Germany", shortName: "de"),
    Country(fullName: "Egypt", shortName: "eg"),
    Country(fullName: "France", shortName: "fr"),
    Country(fullName: "United Kingdom", shortName: "gb"),
    Country(fullName: "Greece", shortName: "gr"),
    Country(fullName: "Hong Kong", shortName: "hk"),
    Country(fullName: "Hungary", shortName: "hu"),
    Country(fullName: "Indonesia", shortName: "id"),
    Country(fullName: "Ireland", shortName: "ie"),
    Country(fullName: "Israel", shortName: "il"),
    Country(fullName: "India", shortName: "in"),
    Country(fullName: "Italy", shortName: "it"),
    Country(fullName: "Japan", shortName: "jp"),
    Country(fullName: "South Korea", shortName: "kr"),
    Country(fullName: "Lithuania", shortName: "lt"),
    Country(fullName: "Latvia", shortName: "lv"),
    Country(fullName: "Morocco", shortName: "ma"),
    Country(fullName: "Mexico", shortName: "mx"),
    Country(fullName: "Malaysia", shortName: "my"),
    Country(fullName: "Nigeria", shortName: "ng"),
    Country(fullName: "Netherlands", shortName: "nl"),
    Country(fullName: "Norway", shortName: "no"),
    Country(fullName: "New Zealand", shortName: "nz"),
    Country(fullName: "Philippines", shortName: "ph"),
    Country(fullName: "Poland", shortName: "pl"),
    Country(fullName: "Portugal", shortName: "pt"),
    Country(fullName: "Romania", shortName: "ro"),
    Country(fullName: "Serbia", shortName: "rs"),
    Country(fullName: "Russia", shortName: "ru"),
    Country(fullName: "Saudi Arabia", shortName: "sa"),
    Country(fullName: "Sweden", shortName: "se"),
    Country(fullName: "Singapore", shortName: "sg"),
    Country(fullName: "Slovenia", shortName: "si"),
    Country(fullName: "Slovakia", shortName: "sk"),
    Country(fullName: "Thailand", shortName: "th"),
    Country(fullName: "Turkey", shortName: "tr"),
    Country(fullName: "Taiwan", shortName: "tw"),
    Country(fullName: "Ukraine", shortName: "ua"),
    Country(fullName: "United States", shortName: "us"),
    Country(fullName: "Venezuela", shortName: "ve"),
    Country(fullName: "South Africa", shortName: "za")
]

let categories = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
]

struct HeadLinesParamsView: View {
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
            }
            .frame(height: 50)
            .clipped()
            Text("Choose Category")
                .font(.system(size: 16))
                .frame(alignment: Alignment.trailing)
                .padding(.top, 30)
            Picker(selection: $selectedCategory, label: Text("Category")) {
                ForEach(0 ..< categories.count) {
                    Text(categories[$0]).font(.system(size: 10)).padding()
                }
            }
            .onChange(of: selectedCategory) { _ in
                self.params.category = categories[selectedCategory]
                self.params.selectedCategory = selectedCategory
            }
            .frame(height: 50)
            .clipped()
            Spacer()
        }.frame(alignment: .top)
    }
}
