//
//  MemmoryGame.swift
//  assignment1
//
//  Created by Shihang Wei on 12/23/23.
//

import SwiftUI

@Observable class MemoryGame {
    //private static let halloweenTheme = ["😈","👻","💀","🎃","🙀","🍭","🤖","🧠"]
    //private static let vehicleTheme = ["🚗","🚌","🚂","🚁","✈️"]
    //private static let spaceTheme = ["🛰️","🚀","🛸","👽"]
    
    private static let cards = ["😈","👻","💀","🎃","🙀","🍭","🤖","🧠"]
    
    private static func createMemoryGame() -> MemoryGameModel<String> {
        return MemoryGameModel(numberOfPairsOfCards: 8) { pairIndex in
            if cards.indices.contains(pairIndex){
                return cards[pairIndex]
            } else {
                return "🧨"
            }
        }
    }
    
    private var game = createMemoryGame()
    
    var cards: Array<MemoryGameModel<String>.Card> {
        return game.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        game.shuffle()
    }
    
    func choose(_ card: MemoryGameModel<String>.Card) {
        game.choose(card)
    }
    
    
}
