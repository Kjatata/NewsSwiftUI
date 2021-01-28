//
//  DataType.swift
//  NewsSwiftUI
//
//  Created by User on 27.01.21.
//

import SwiftUI
import RealmSwift

class DataType: Object, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var urlToImage = ""
    @objc dynamic var title = ""
    @objc dynamic var Objdescription = ""
    @objc dynamic var publishedAt = ""
    @objc dynamic var url = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
