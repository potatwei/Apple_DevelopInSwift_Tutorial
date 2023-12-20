//
//  ContentView.swift
//  assignment1
//
//  Created by Shihang Wei on 12/16/23.
//

import SwiftUI

struct ContentView: View {
    let halloweenTheme = ["😈","😈","👻","👻","💀","💀","🎃","🎃","🙀","🙀","🍭","🍭","🤖","🤖","🧠","🧠"]
    let vehicleTheme = ["🚗","🚗","🚌","🚌","🚂","🚂","🚁","🚁","✈️","✈️"]
    let spaceTheme = ["🛰️","🛰️","🚀","🚀","🛸","🛸","👽","👽"]
    
    @State var emojis: [String] = []
    @State var themedColor: Color = .black
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .bold()
            ScrollView {
                cards
            }
            Spacer()
            themeChoosingButtons
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(themedColor)
    }

    func themeChoosingButton(icons: [String], name: String, symbol: String, ofColor: Color) -> some View {
        Button(action: {
            emojis = []
            let cardToShow = Int.random(in: 3..<icons.count)
            for i in 0...cardToShow {
                emojis.append(icons[i])
            }
            emojis = emojis.shuffled()
            themedColor = ofColor
        }, label: {
            VStack {
                Image(systemName: symbol)
                    .font(.title)
                Text(name)
                    .font(.subheadline)
            }
            .frame(width: 90.0)
        })
        .imageScale(.large)
        
    }
    
    var halloweenThemeChoosingButton: some View {
        themeChoosingButton(icons: halloweenTheme, name: "Halloween", symbol: "person.2.crop.square.stack", ofColor: .orange)
    }
    
    var spaceThemeChoosingButton: some View {
        themeChoosingButton(icons: spaceTheme, name: "Space", symbol: "lasso", ofColor: .blue)
    }
    
    var vehicleThemeChoosingButton: some View {
        themeChoosingButton(icons: vehicleTheme, name: "Vehicle", symbol: "car.fill", ofColor: .gray)
    }
    
    var themeChoosingButtons: some View {
        HStack (alignment: .lastTextBaseline) {
            halloweenThemeChoosingButton
            vehicleThemeChoosingButton
            spaceThemeChoosingButton
        }
        
    }
    
}


struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
