//
//  DBViewModel.swift
//  NewsSwiftUI
//
//  Created by User on 27.01.21.
//

import SwiftUI
import RealmSwift

class DBViewModel: ObservableObject {
    
    @Published var notes: [DataType] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let dbRef = try? Realm() else { return }
        let results = dbRef.objects(DataType.self)
        self.notes = results.compactMap({ (note) -> DataType? in return note})
    }
    
    func addData(object: DataType) {
        guard let dbRef = try? Realm() else { return }
        try? dbRef.write{
            dbRef.add(object)
        }
        fetchData()
    }
    
    func deleteData(object: DataType) {
        guard let dbRef = try? Realm() else { return }
        try? dbRef.write{
            dbRef.delete(object)
            fetchData()
        }
    }
}
