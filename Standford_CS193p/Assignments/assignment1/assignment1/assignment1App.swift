//
//  assignment1App.swift
//  assignment1
//
//  Created by Shihang Wei on 12/16/23.
//

import SwiftUI

@main
struct assignment1App: App {
    @State private var game = MemoryGame()
    var body: some Scene {
        WindowGroup {
            MemoryGameView(game: game)
        }
    }
}
