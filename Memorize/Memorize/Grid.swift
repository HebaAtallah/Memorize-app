//
//  Grid.swift
//  Memorize
//
//  Created by Heba on 1/10/21.
//  Copyright © 2021 Cognitev. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geo in
            self.body(for: GridLayout(itemCount: self.items.count, in: geo.size))
        }
    }
    
    func body(for size: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: size)
        }
    }
    
    func body(for item: Item, in size: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
            .frame(width: size.itemSize.width, height: size.itemSize.height)
            .position(size.location(ofItemAt: index))
    }
    
    // 👇🏻 is a substitutional for 👆🏻
    
//    func body(for item: Item, in size: GridLayout) -> some View {
//        let index = items.firstIndex(matching: item)
//        return Group { // Group is a view builder
//            if index != nil {
//                viewForItem(item)
//                .frame(width: size.itemSize.width, height: size.itemSize.height)
//                .position(size.location(ofItemAt: index!))
//            }
//            // else will return empty content
//        }
//    }
}
