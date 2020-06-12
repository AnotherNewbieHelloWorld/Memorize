//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Apple User on 12.06.2020.
//  Copyright © 2020 Alena Khoroshilova. All rights reserved.
//

import Foundation

class EmojiMemoryGame {
    private var memoryGame: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["⛱","🍉","🌞","🦑","🌈"]
        let numberOfPairs = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairs) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access the Model
    
    var cards: [MemoryGame<String>.Card] {
        memoryGame.cards
    }
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        memoryGame.choose(card: card)
    }
}
