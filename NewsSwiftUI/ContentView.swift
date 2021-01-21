//
//  ContentView.swift
//  NewsSwiftUI
//
//  Created by User on 21.01.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Get") {
            guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=51ea6b34f2be4e8b819ba235b717cf44") else { return }
            let session = URLSession.shared
            session.dataTask(with: url) { (data, response, error ) in
                if let response = response {
                    print(response)
                }
                
                guard let data = data else { return }
                print(data)
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }.resume()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
