//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Heba on 12/2/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> 

    var gameTheme: EmojiTheme

    var score: Int {
        return model.score
    }
    
    static func createMemoryGame(theme: EmojiTheme) -> MemoryGame<String> {
        let emojis: Array<String> = theme.themeEmojies
        let randomPairs = (2..<5).randomElement()!
        return MemoryGame<String>(numberOfPairsOfCards: randomPairs) { pairIndex in
            return emojis[pairIndex]
        }
    }

    init() {
        let randomTheme = EmojiTheme.generateRandomTheme()
        model = EmojiMemoryGame.createMemoryGame(theme: randomTheme)
        self.gameTheme = randomTheme
    }

    func startNewGame() {
        let randomTheme = EmojiTheme.generateRandomTheme()
        self.gameTheme = randomTheme
        model = EmojiMemoryGame.createMemoryGame(theme: randomTheme)
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

enum EmojiTheme: CaseIterable, CustomStringConvertible {


    case Holloween
    case SmileyFaces
    case Food
    case Flags

    var themeEmojies: [String] {
        switch self {
        case .Holloween:
           return ["😈", "👻", "👹", "👺", "🤡"]
        case .SmileyFaces:
           return ["😄", "🥶", "😌", "😇", "🤮"]
        case .Food:
            return ["🦐", "🐟", "🍗", "🥡"]
        case .Flags:
            return ["🇦🇹", "🇪🇬", "🇧🇷", "🇰🇲"]
        }
    }

    var themeColor: Color {
        switch self {
        case .Holloween:
            return .orange
        case .SmileyFaces:
            return .blue
        case .Food:
            return .red
        case .Flags:
            return .yellow
        }
    }

    var description: String {
        switch self {
        case .Holloween:
            return "Holloween"
        case .SmileyFaces:
            return "SmileyFaces"
        case .Food:
            return "Food"
        case .Flags:
            return "Flags"
        }
    }
    static func generateRandomTheme() -> EmojiTheme {
        EmojiTheme.allCases.randomElement() ?? .Holloween
    }
}
