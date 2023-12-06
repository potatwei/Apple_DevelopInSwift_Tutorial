//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Shihang Wei on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 30){
            Text("Hey")
                .padding()
                .background(Color.teal, in: RoundedRectangle(cornerRadius: 8))
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Text("I'm Shihang")
                .padding()
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
