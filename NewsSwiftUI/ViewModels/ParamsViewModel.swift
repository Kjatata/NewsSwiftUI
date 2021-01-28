//
//  ParamsViewModel.swift
//  NewsSwiftUI
//
//  Created by User on 28.01.21.
//

import SwiftUI

class ParamsViewModel: ObservableObject {
    @Published var country = countries[countries.firstIndex(where: {$0.shortName == Locale.autoupdatingCurrent.regionCode?.lowercased()}) ?? 0].shortName
    @Published var category = "business"
    @Published var searchTypePage = "Top Headlines"
    @Published var q = ""
    @Published var sourse = "abc-news"
    @Published var selectedSource = 0
    @Published var selectedCategory = 0
    @Published var selectedCountry = countries.firstIndex(where: {$0.shortName == Locale.autoupdatingCurrent.regionCode?.lowercased()}) ?? 0
}
