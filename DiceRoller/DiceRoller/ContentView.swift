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
                .foregroundStyle(.white)
            
            HStack {
                ForEach(1...numberOfDice, id: \.self) {_ in
                    DiceView()
                }
            }
            
            HStack {
                Button("Romove Dice", systemImage: "minus.circle.fill") {
                    numberOfDice -= 1
                }
                .disabled(numberOfDice == 1)
                .symbolRenderingMode(.multicolor)
                
                
                Button("Add Dice", systemImage: "plus.circle.fill") {
                    numberOfDice += 1
                }
                .disabled(numberOfDice == 5)
                .symbolRenderingMode(.multicolor)
            }
            .padding()
            .labelStyle(.iconOnly)
            .font(.title)
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.appBackground)
        .tint(.white)
    }
}

#Preview {
    ContentView()
}
