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
        cards.shuffle()
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter {index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
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

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
