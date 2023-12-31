//
//  MemoryGameView.swift
//  assignment1
//
//  Created by Shihang Wei on 12/16/23.
//

import SwiftUI

struct MemoryGameView: View {
    // setup viewmodel
    var game: MemoryGame
    
    var body: some View {
        VStack {
            HStack { // Theme's title and current score
                Text(game.themeTitle)
                Spacer()
                Text("Score: \(game.score)")
            }
            .font(.largeTitle)
            .bold()
            ScrollView { // cards
                cards
                    .animation(.default, value: game.cards)
            }
            HStack(spacing: 30){ // two buttons
                Button {
                    game.shuffle()
                } label: { buttonLabelFactory("Shuffle") }
                Button {
                    game.newGame()
                } label: { buttonLabelFactory("New Game") }
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(game.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture { game.choose(card) }
            }
        }
        // if color is not defined in switch, use default color black
        .foregroundStyle((game.themeColor != nil) ? game.themeColor! : .black )
    }
    
    // create cool labels for buttons
    private func buttonLabelFactory(_ text: String) -> some View {
        var label: some View {
            Text(text)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .padding()
                .padding(.horizontal, 20)
                .background(
                    Color.white
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 10)
                )
        }
        return label
    }
}


struct CardView: View {
    let card: MemoryGameModel<String>.Card
    
    init(_ card: MemoryGameModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        // front and back stack together and change opacity to "flip" the card
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            // front of the card
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            // back of the card
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        // make card disappear after matched
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    MemoryGameView(game: MemoryGame())
}
