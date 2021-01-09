//
//  EmojiMemoryGameGameView.swift
//  Memorize
//
//  Created by Heba on 12/2/20.
//  Copyright © 2020 Cognitev. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView:View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                    Text(self.card.content)
                } else {
                    RoundedRectangle(cornerRadius: 10.0).fill()
                }
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.75))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameGameView(viewModel: EmojiMemoryGame())
    }
}
