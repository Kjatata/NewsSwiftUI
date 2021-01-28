//
//  SetPasswordView.swift
//  NewsSwiftUI
//
//  Created by User on 28.01.21.
//

import SwiftUI

struct SetPasswordView: View {
    @Binding var selectedPage: String
    @AppStorage("Password") var password = ""
    @AppStorage("addPassword") var havePassword = false
    @State private var password1 = ""
    @State private var password2 = ""
    @State private var password3 = ""
    @State private var showAlert = false
    @State private var alertText = ""
    var body: some View {
        VStack {
            if(havePassword == true) {
                Text("Enter your password")
                InputText(text: "password", input: $password3)
                    .padding()
            }
            Text("Set new password")
            InputText(text: "password", input: $password1)
                .padding()
            Text("Repeat your password")
            InputText(text: "repeat password", input: $password2)
                .padding()
            ButtonSimpleView(text: "Set Password") {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    let regex = try! NSRegularExpression(pattern: "^[A-Za-z0-9]{8,}$")
                    let regMatch1 = regex.firstMatch(in: password1, options: [], range: NSRange(location: 0, length: password1.utf16.count)) != nil
                    let regMatch2 = regex.firstMatch(in: password1, options: [], range: NSRange(location: 0, length: password2.utf16.count)) != nil
                    if(regMatch1 && regMatch2 && password1 == password2) {
                        if(havePassword == false) {
                            password = password1
                            havePassword = true
                            password1 = ""
                            password2 = ""
                            alertText = "Password Added"
                            showAlert = true
                        } else if (havePassword == true && password3 == password) {
                            password = password1
                            havePassword = true
                            password1 = ""
                            password2 = ""
                            alertText = "Password Changed"
                            showAlert = true
                        } else {
                            alertText = "You should enter u password first"
                            showAlert = true
                        }
                    } else {
                        alertText = "U password must have more then 8 symbols A-Z  / a-z / 0-9"
                        showAlert = true
                    }
                }
            }
            if(havePassword == true) {
                ButtonSimpleView(text: "Delete Password") {
                    if (havePassword == true && password3 == password) {
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            self.password = ""
                            self.havePassword = false
                        }
                    } else {
                        alertText = "You should enter u password first"
                        showAlert = true
                    }
                }
            }
        }.alert(isPresented: $showAlert) {
            Alert(title: Text(alertText))
        }
    }
}
