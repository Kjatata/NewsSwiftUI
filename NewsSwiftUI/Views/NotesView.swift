//
//  NotesView.swift
//  NewsSwiftUI
//
//  Created by User on 26.01.21.
//

import SafariServices
import SwiftUI
import RealmSwift

struct NotesView: View {
    @AppStorage("Password") var password = ""
    @AppStorage("addPassword") var havePassword = false
    @State var checkedPassword = false
    @State var password1 = ""
    @StateObject private var modelData = DBViewModel()
    @State private var showShareSheet = false
    @State private var alertText = ""
    @State private var showAlert = false
    var body: some View {
        VStack{
            if(havePassword == false || checkedPassword == true){
                if(modelData.notes.count > 0) {
                    NotesListView(showShareSheet: $showShareSheet, alertText: $alertText, showAlert: $showAlert)
                }
                else {
                    Text("You have no notes :(")
                }
            } else {
                InputText(text: "password", input: $password1)
                    .padding()
                ButtonSimpleView(text: "Check password") {
                    if(password1 == password) {
                        checkedPassword = true
                        alertText = "Success"
                        showAlert = true
                    } else {
                        alertText = "Password Error"
                        showAlert = true
                    }
                }
            }
            
        }.alert(isPresented: $showAlert) {
            Alert(title: Text(alertText))
        }
    }
}
