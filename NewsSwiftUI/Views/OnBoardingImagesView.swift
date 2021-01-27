//
//  OnBoardingImagesView.swift
//  NewsSwiftUI
//
//  Created by User on 27.01.21.
//

import SwiftUI

struct OnBoardingImagesView: View {
    @Binding var isPresenting: Bool
    var body: some View {
        ZStack {
            VStack {
                TabView {
                    ForEach(0 ..< 3) { item in
                        ZStack {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height - 90)
                            Image("img\(item)")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.height - 150)
                            Button(action: {
                                isPresenting = false
                            }, label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.orange)
                                    .padding(.leading,  UIScreen.main.bounds.width - 80)
                            }).padding(.bottom, UIScreen.main.bounds.height - 120)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
        }
    }
}
