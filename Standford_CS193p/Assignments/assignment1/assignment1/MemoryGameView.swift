//
//  MemoryGameView.swift
//  assignment1
//
//  Created by Shihang Wei on 12/16/23.
//

import SwiftUI

struct MemoryGameView: View {
    var game: MemoryGame
    
    var body: some View {
        VStack {
            HStack {
                Text(game.themeTitle)
                Spacer()
                Text("Score: \(game.score)")
            }
            .font(.largeTitle)
            .bold()
            ScrollView {
                cards
                    .animation(.default, value: game.cards)
            }
            HStack(spacing: 30){
                Button("Shuffle") {
                    game.shuffle()
                }
                Button("New Game") {
                    game.newGame()
                }
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(game.cards) { card in
                VStack {
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture { game.choose(card) }
                    Text(card.hasSeen ? "True" : "False")
                }
            }
        }
        .foregroundStyle((game.themeColor != nil) ? game.themeColor! : .black )
    }
}


struct CardView: View {
    let card: MemoryGameModel<String>.Card
    
    init(_ card: MemoryGameModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    MemoryGameView(game: MemoryGame())
}
