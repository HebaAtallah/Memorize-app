//
//  Grid.swift
//  Memorize
//
//  Created by Amr on 1/9/21.
//  Copyright © 2021 Cognitev. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView

    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }

    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            return self.body(for: item, in: layout)
        }
    }

    func body(for item: Item, in layout: GridLayout)  -> some View  {
        let index = items.firstIndex(matching: item)
        return Group {
            if index != nil {
                 viewForItem(item).frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index!))
            }
        }
    }
}

