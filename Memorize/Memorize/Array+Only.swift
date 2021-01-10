//
//  Array+Only.swift
//  Memorize
//
//  Created by Heba on 1/10/21.
//  Copyright © 2021 Cognitev. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first :nil 
    }
}
