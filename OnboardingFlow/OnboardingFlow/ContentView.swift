//
//  ContentView.swift
//  OnboardingFlow
//
//  Created by Shihang Wei on 12/6/23.
//

import SwiftUI

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct ContentView: View {
    var body: some View {
        TabView{
            WelcomePage()
            FeaturesPage()
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
        .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
