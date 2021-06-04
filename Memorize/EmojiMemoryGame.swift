//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Christoph on 03.06.21.
//

import Foundation



class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚗","🚕","🏎","✈️","🚜","🛶","🚡","🦼","🚛","🚁","🚤","🛸","🚲","🛵","🛴","🛰","🚂","🛺","🚀","🚑","🚐","🛻","🚚","🏍"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - intend(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
