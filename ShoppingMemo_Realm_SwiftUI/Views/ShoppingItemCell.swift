//
//  ShoppingItemCell.swift
//  ShoppingMemo_Realm_SwiftUI
//
//  Created by cmStudent on 2023/07/16.
//

import SwiftUI

struct ShoppingItemCell: View {
    
    let item: ShoppingItem
    var selected: Bool
    let isSelected: (Bool) -> Void
    
    var body: some View {
        HStack {
            Image(systemName: selected ? "checkmark.square": "square")
                .onTapGesture {
                    isSelected(!selected)
                }
            
            VStack(alignment: .leading) {
                Text(item.title)
                Text("\(item.quantity)")
                    .opacity(0.4)
            }
            Spacer()
            Text("\(item.quantity)")
        }.opacity(selected ? 0.4 : 1.0)
    }
}

struct ShoppingItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingItemCell(item: ShoppingItem(), selected: true, isSelected: { _ in })
    }
}
