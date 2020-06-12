//
//  MemoryGame.swift
//  Memorize
//
//  Created by Apple User on 12.06.2020.
//  Copyright © 2020 Alena Khoroshilova. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
        
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var content: CardContent
        var isFaceUp = true
        var isMatched = false
        var id: Int
    }
}
