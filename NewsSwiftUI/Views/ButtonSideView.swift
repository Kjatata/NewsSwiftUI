//
//  ButtonSideView.swift
//  NewsSwiftUI
//
//  Created by User on 27.01.21.
//

import SwiftUI

struct ButtonSideView: View {
    @State var funct: () -> ()
    @State var color: Color
    @State var text: String
    var body: some View {
        Button(action: {
            self.funct()
        }) {
            Text(text)
                .font(.system(size: 16))
                .foregroundColor(self.color)
                .frame(width: 335, alignment: .leading)
        }
        .rotationEffect(Angle(degrees: 90))
        .padding(.horizontal, -160)
    }
}
