//
//  MemorryGameModel.swift
//  assignment1
//
//  Created by Shihang Wei on 12/23/23.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    private(set) var score: Int = 0
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // create a pair of new cards and append into cards array
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex) // get content using passed in function
            cards.append(Card(id: "\(pairIndex)a", content: content))
            cards.append(Card(id: "\(pairIndex)b", content: content))
        }
        cards.shuffle() // shuffle cards after all cards are pushed in
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        // get the index of the only card face up, if multiple cards return nil
        get { cards.indices.filter {index in cards[index].isFaceUp }.only }
        // set only execute when picking a new card
        set {
            cards.indices.forEach { index in
                // decrease the score when card has seen and face up and not matched
                if cards[index].hasSeen && cards[index].isFaceUp && !cards[index].isMatched{
                    score -= 1
                }
                // set card hasSeen after its fliped down when face up
                if !cards[index].hasSeen && cards[index].isFaceUp {
                    cards[index].hasSeen = true
                }
                cards[index].isFaceUp = (newValue == index)
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            // can only choose cards that is not face up and not matched
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard { // unwrap
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        score += 2
                    }
                } else { // when indexOfOneAndOnlyFaceUpCard is nil
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
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var hasSeen = false
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
