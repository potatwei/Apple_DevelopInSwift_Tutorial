//
//  ContentView.swift
//  DiceRoller
//
//  Created by Shihang Wei on 12/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice: Int = 1
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps().bold())
            
            HStack {
                ForEach(1...numberOfDice, id: \.self) {_ in
                    DiceView()
                }
            }
            
            HStack {
                Button("Romove Dice") {
                    numberOfDice -= 1
                }
                .disabled(numberOfDice == 1)
                
                Button("Add Dice") {
                    numberOfDice += 1
                }
                .disabled(numberOfDice == 3)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
