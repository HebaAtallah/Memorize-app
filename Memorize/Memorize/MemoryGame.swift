//
//  MemoryGame.swift
//  Memorize
//
//  Created by Heba on 12/2/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var indexOfTheOneAndOnlyFacedUpCard: Int? {
        get {
             cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
              for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }



   mutating func choose(card: Card) {
        print("card chosen: \(card)")
    if let choosenIndex = cards.firstIndex(matching: card), !cards[choosenIndex].isFaceUp, !cards[choosenIndex].isMatched {
        if let potentialMatchIndex = indexOfTheOneAndOnlyFacedUpCard {
            if cards[choosenIndex].content == cards[potentialMatchIndex].content {
                cards[choosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            cards[choosenIndex].isFaceUp = true
        } else {
            indexOfTheOneAndOnlyFacedUpCard = choosenIndex
        }
      }
    }

    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
