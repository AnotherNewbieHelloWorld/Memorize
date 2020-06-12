//
//  ContentView.swift
//  Memorize
//
//  Created by Apple User on 12.06.2020.
//  Copyright © 2020 Alena Khoroshilova. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var emojiMemoryGame: EmojiMemoryGame
    var body: some View {
        let font: Font = emojiMemoryGame.cards.count < 5 ? .largeTitle : .headline
        return HStack {
            ForEach(emojiMemoryGame.cards) { card in
                CardView(card: card).onTapGesture {
                    self.emojiMemoryGame.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font(font)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }.aspectRatio(2/3, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiMemoryGame: EmojiMemoryGame())
    }
}
