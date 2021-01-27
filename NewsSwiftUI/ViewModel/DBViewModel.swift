//
//  DBViewModel.swift
//  NewsSwiftUI
//
//  Created by User on 27.01.21.
//

import SwiftUI
import RealmSwift

class DBViewModel: ObservableObject {
    
    @Published var notes: [datatype] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let dbRef = try? Realm() else { return }
        let results = dbRef.objects(datatype.self)
        self.notes = results.compactMap({ (note) -> datatype? in return note})
    }
    
    func addData(object: datatype) {
        guard let dbRef = try? Realm() else { return }
        try? dbRef.write{
            dbRef.add(object)
        }
        fetchData()
    }
    
    func deleteData(object: datatype) {
        guard let dbRef = try? Realm() else { return }
        try? dbRef.write{
            dbRef.delete(object)
            fetchData()
        }
    }
}
