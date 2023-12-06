//
//  FeatureCard.swift
//  OnboardingFlow
//
//  Created by Shihang Wei on 12/6/23.
//

import SwiftUI

struct FeatureCard: View {
    let iconName : String
    let description: String
    
    var body: some View {
        HStack{
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing, 10)
            
            Text(description)
            
            Spacer()
        }
        .padding()
        .background(.tint, in: RoundedRectangle(cornerRadius: 12))
        .foregroundColor(.white)
    }
}

#Preview {
    FeatureCard(iconName: "person.2.crop.square.stack.fill",
                   description: "A multiline description about a feature paired with the image on the left.")
}
