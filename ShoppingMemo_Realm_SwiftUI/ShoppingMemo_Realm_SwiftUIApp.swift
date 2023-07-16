//
//  ShoppingMemo_Realm_SwiftUIApp.swift
//  ShoppingMemo_Realm_SwiftUI
//
//  Created by cmStudent on 2023/07/16.
//

import SwiftUI

@main
struct ShoppingMemo_Realm_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.realmConfiguration, RealmMigrator.configuration)
        }
    }
}
