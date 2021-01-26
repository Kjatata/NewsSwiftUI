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
    @State private var notes: [datatype] = []
    var body: some View {
        HStack {
            List(notes, id: \.self.url) { (note) in
                HStack {
                    SafariButtonView(content: VStack{
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
                    Button(action: {
                        print(notes)
                        showAlert = true
                        guard let realm = try? Realm() else {return}
                        try? realm.write({
                            realm.delete(note)
                        })
                    }) {
                        Text("TAP HERE TO REMOVE THAT NOTE")
                            .font(.system(size: 16))
                            .foregroundColor(.red)
                            .frame(width: 335, alignment: .leading)
                    }.alert(isPresented: $showAlert) {
                        Alert(title: Text("Note Deleted"))
                    }
                    .rotationEffect(Angle(degrees: 90))
                    .padding(.horizontal, -160)
                }.buttonStyle(PlainButtonStyle())
            }.padding()
        }.onAppear() {
            let realm = try! Realm().objects(datatype.self)
            for i in realm {
                notes.append(i)
            }
        }.padding()
    }
}

