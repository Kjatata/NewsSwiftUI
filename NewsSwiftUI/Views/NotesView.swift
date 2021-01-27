//
//  NotesView.swift
//  NewsSwiftUI
//
//  Created by User on 26.01.21.
//

import SafariServices
import SwiftUI
import Kingfisher
import RealmSwift

struct NotesView: View {
    @State private var showAlert = false
    @StateObject private var modelData = DBViewModel()
    @State private var showShareSheet = false
    var body: some View {
        ScrollView {
            VStack {
                ForEach(modelData.notes) { note in
                    HStack {
                        ButtonSafariView(content: VStack{
                            KFImage(URL(string: note.urlToImage)!)
                                    .loadDiskFileSynchronously()
                                    .cacheMemoryOnly()
                                    .resizable()
                                .frame(idealHeight: 140)

                            Text(note.title).font(.system(size: 16)).padding(1)
                            Text(note.Objdescription).font(.system(size: 10))
                            Text(note.publishedAt).font(.system(size: 13)).padding()
                        }, url: note.url).frame(height: 335)
                        Spacer()
                        ButtonSideView(funct: {() -> () in
                                        showAlert = true
                                        modelData.deleteData(object: note)},
                                       color: .red,
                                       text: "TAP HERE TO REMOVE THAT NOTE")
                        ButtonSideView(funct: showSheet,
                                       color: .blue,
                                       text: "TAP HERE SHARE THAT NOTES")
                            .sheet(isPresented: $showShareSheet) {
                                ShareSheet(activityItems: [note.url])
                            }
                    }.buttonStyle(PlainButtonStyle())
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Note Deleted"))
                    }
                }.padding()
            }.padding()
        }
    }
    
    func showSheet(){
        self.showShareSheet = true
    }
}

