//
//  RealmMigrator.swift
//  ShoppingMemo_Realm_SwiftUI
//
//  Created by Thidar Phyo on 7/16/23.
//

import Foundation
import RealmSwift


// TODO: RealmMigratorの作成
enum RealmMigrator {
  static private func migrationBlock(migration: Migration, oldSchemaVersion: UInt64) {
      if oldSchemaVersion < 1 {
          // add new fields
          migration.enumerateObjects(ofType: ShoppingList.className()) { _, newObject in
              newObject!["items"] = List<ShoppingItem>()
          }
      }
  }

  static var configuration: Realm.Configuration {
    Realm.Configuration(schemaVersion: 1, migrationBlock: migrationBlock)
      
  }
}
