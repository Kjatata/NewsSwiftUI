//
//  SafariButtonView.swift
//  NewsSwiftUI
//
//  Created by User on 24.01.21.
//

import SafariServices
import SwiftUI

struct ButtonSafariView<Content: View>: View {
    var content: Content
    var url: String
    
    @State var showSafariView = false
    
    @ViewBuilder var body: some View {
        Button(action: {
            showSafariView = true
        }) {
            content.fullScreenCover(isPresented: $showSafariView) {
                SafariView(url: URL(string: url)!).edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    var url: URL
        
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let safariView = SFSafariViewController(url: url)
        return safariView
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }
}
