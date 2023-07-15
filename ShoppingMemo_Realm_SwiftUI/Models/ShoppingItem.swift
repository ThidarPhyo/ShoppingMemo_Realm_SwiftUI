//
//  ShoppingItem.swift
//  ShoppingMemo_Realm_SwiftUI
//
//  Created by cmStudent on 2023/07/16.
//

import Foundation
import RealmSwift

class ShoppingItem: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var quantity: Int
    @Persisted var category: String
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
