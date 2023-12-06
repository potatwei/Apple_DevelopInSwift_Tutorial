//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Shihang Wei on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hey")
                .padding()
                .background(Color.teal, in: RoundedRectangle(cornerRadius: 8))
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
