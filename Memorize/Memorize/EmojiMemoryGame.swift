//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Heba on 12/2/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["😄", "👻", "😌"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
         model.cards
    }
    
    // MARK: - Inent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}