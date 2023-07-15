//
//  ShoppingListItemsView.swift
//  ShoppingMemo_Realm_SwiftUI
//
//  Created by cmStudent on 2023/07/16.
//

import SwiftUI
import RealmSwift

struct ShoppingListItemsView: View {
    
    @ObservedRealmObject var shoppingList: ShoppingList
    @State private var isPresented: Bool = false
    @State private var selectedItemIds: [ObjectId] = []
    @State private var selectedCategory: String = "All"
    
    var items: [ShoppingItem] {
        return Array(shoppingList.items)
    }
    
    var body: some View {
        VStack {
            
            if items.isEmpty {
                Text("No items")
            }
            
            List {
                ForEach(items) { item in
                    
                    NavigationLink {
                        AddShoppingListItemView(shoppingList: shoppingList, itemToEdit: item)
                    } label: {
                        ShoppingItemCell(item: item, selected: selectedItemIds.contains(item.id)) { selected in
                            if selected {
                                selectedItemIds.append(item.id)
                                if let indexToDelete = shoppingList.items.firstIndex(where: { $0.id == item.id }) {
                                    // delete the item
                                    $shoppingList.items.remove(at: indexToDelete)
                                }
                            }
                        }
                    }

                    
                  
                }.onDelete(perform: $shoppingList.items.remove)
            }
            
            .navigationTitle(shoppingList.title)
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // action
                    isPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }.sheet(isPresented: $isPresented) {
            AddShoppingListItemView(shoppingList: shoppingList)
        }
    }
}

struct ShoppingListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShoppingListItemsView(shoppingList: ShoppingList())
        }
    }
}
