//
//  SimpleButtonView.swift
//  NewsSwiftUI
//
//  Created by User on 28.01.21.
//

import SwiftUI

struct ButtonSimpleView: View {
    var text: String
    var action: () -> ()
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(text)
                .font(.system(size: 13))
                .padding(4)
        }
        .foregroundColor(.black)
        .border(Color.black, width: 2)
        .cornerRadius(3)
    }
}

