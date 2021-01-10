//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Heba on 1/10/21.
//  Copyright © 2021 Cognitev. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
