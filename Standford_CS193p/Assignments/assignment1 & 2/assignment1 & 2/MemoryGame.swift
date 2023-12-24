//
//  MemmoryGame.swift
//  assignment1
//
//  Created by Shihang Wei on 12/23/23.
//

import SwiftUI

@Observable class MemoryGame {
    
    private static func createMemoryGame() -> MemoryGameModel<String> {
        // shuffle makes sure all emojis can be displaied
        // when numberOfPairs is less than elements in emojis
        let emojis = chosenTheme.emojis.shuffled()
        return MemoryGameModel(numberOfPairsOfCards: chosenTheme.numberOfPairs) { pairIndex in
            // when index in range return emoji on the index, else return "🧨"
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            } else {
                return "🧨"
            }
        }
    }
    
    // containing 6 themes
    private static var themes: [Theme] = [
        Theme(name: "Halloween", emojis: ["😈","👻","💀","🎃","🙀","🍭","🤖","🧠"],
              numberOfPairs: 8, color: "orange"),
        Theme(name: "Vehicle", emojis: ["🚗","🚌","🚂","🚁","✈️"],
              numberOfPairs: 6, color: "blue"),
        Theme(name: "Space", emojis: ["🛰️","🚀","🛸","👽","☄️","🪐"],
              numberOfPairs: 6, color: "gray"),
        Theme(name: "Career", emojis: ["🧑‍🌾","🧑‍🍳","🧑‍🎤","🧑‍🎨","🧑‍🚒","🧑‍✈️","🧑‍🎓","🕵️","👷","💂","🧑‍🚀"],
              numberOfPairs: 10, color: "mint"),
        Theme(name: "Animal", emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️"],
              numberOfPairs: 9, color: "red"),
        Theme(name: "Food", emojis: ["🥐","🌽","🍓","🥘","🍖","🧇","🥑","🍟","🍜","🍣"],
              numberOfPairs: 10, color: "yellow")
    ]
    
    static var chosenTheme = themes.randomElement()!
    
    private var game = createMemoryGame()
    
    var cards: Array<MemoryGameModel<String>.Card> {
        return game.cards
    }
    
    // make string color to Color.
    var themeColor: Color? {
        switch MemoryGame.chosenTheme.color {
        case "orange":
            return Color.orange
        case "blue":
            return Color.blue
        case "gray":
            return Color.gray
        case "mint":
            return Color.mint
        case "red":
            return Color.red
        case "yellow":
            return Color.yellow
        default:
            print("Color not defined")
            return nil
        }
    }
    
    var themeTitle: String {
        MemoryGame.chosenTheme.name
    }
    
    var score: Int {
        return game.score
    }
    
    // MARK: - Intents
    
    func shuffle() {
        game.shuffle()
    }
    
    func choose(_ card: MemoryGameModel<String>.Card) {
        game.choose(card)
    }
    
    func newGame() {
        MemoryGame.chosenTheme = MemoryGame.themes.randomElement()!
        game = MemoryGame.createMemoryGame()
    }
    
    // MARK: - Themes
    
    struct Theme {
        let name: String
        let emojis: [String]
        let numberOfPairs: Int
        let color: String
    }
    
}
