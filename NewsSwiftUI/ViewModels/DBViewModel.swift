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
    
    func isSame(object1: DataType, object2: DataType) -> Bool {
        return object1.title == object2.title &&
            object1.publishedAt == object2.publishedAt &&
            object1.Objdescription == object2.Objdescription &&
            object1.url == object2.url &&
            object1.urlToImage == object2.urlToImage
    }
    
    func haveSameObj(object: DataType) -> Bool {
        guard let dbRef = try? Realm() else { return false }
        let results = dbRef.objects(DataType.self)
        return results.first(where: {isSame(object1: $0, object2: object)}) != nil ? true : false
    }
}
