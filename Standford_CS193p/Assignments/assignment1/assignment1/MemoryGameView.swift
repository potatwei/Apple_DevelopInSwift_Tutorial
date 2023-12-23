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
            Text("Memorize!")
                .font(.largeTitle)
                .bold()
            ScrollView {
                cards
                    .animation(.default, value: game.cards)
            }
            Button("Shuffle") {
                game.shuffle()
            }
//            Spacer()
//            themeChoosingButtons
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
        .foregroundStyle(.orange)
    }

//    func themeChoosingButton(icons: [String], name: String, symbol: String, ofColor: Color) -> some View {
//        Button(action: {
//            emojis = []
//            let cardToShow = Int.random(in: 3..<icons.count)
//            for i in 0...cardToShow {
//                emojis.append(icons[i])
//            }
//            emojis = emojis.shuffled()
//            themedColor = ofColor
//        }, label: {
//            VStack {
//                Image(systemName: symbol)
//                    .font(.title)
//                Text(name)
//                    .font(.subheadline)
//            }
//            .frame(width: 90.0)
//        })
//        .imageScale(.large)
//        
//    }
//    
//    var halloweenThemeChoosingButton: some View {
//        themeChoosingButton(icons: halloweenTheme, name: "Halloween", symbol: "person.2.crop.square.stack", ofColor: .orange)
//    }
//    
//    var spaceThemeChoosingButton: some View {
//        themeChoosingButton(icons: spaceTheme, name: "Space", symbol: "lasso", ofColor: .blue)
//    }
//    
//    var vehicleThemeChoosingButton: some View {
//        themeChoosingButton(icons: vehicleTheme, name: "Vehicle", symbol: "car.fill", ofColor: .gray)
//    }
//    
//    var themeChoosingButtons: some View {
//        HStack (alignment: .lastTextBaseline) {
//            halloweenThemeChoosingButton
//            vehicleThemeChoosingButton
//            spaceThemeChoosingButton
//        }
//        
//    }
    
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
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    MemoryGameView(game: MemoryGame())
}
