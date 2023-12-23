//
//  MemorryGameModel.swift
//  assignment1
//
//  Created by Shihang Wei on 12/23/23.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable{ // let dont-care type be care-a-little-bit
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex)a", content: content))
            cards.append(Card(id: "\(pairIndex)b", content: content))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Identifiable, Equatable {
        var id: String
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
