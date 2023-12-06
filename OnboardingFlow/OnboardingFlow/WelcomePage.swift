//
//  WelcomePage.swift
//  OnboardingFlow
//
//  Created by Shihang Wei on 12/6/23.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(.tint)
                    .frame(width: 150, height: 150)
                
                Image(systemName: "figure.2.and.child.holdinghands")
                    .font(.system(size: 70))
                    .foregroundStyle(.white)
            }
            
            Text("Welcome to MyApp")
                .font(.title)
                .fontWeight(.semibold)
                //.fontWidth(.compressed)
                // restrict the padding to the top
                .padding(.top)
                //.border(.black, width: 1.5)
            
            //Text("Description text----------------------")
            Text("Description text")
                .font(.title2)
                // can change the way the text is aligned
                .multilineTextAlignment(.center)
                //.border(.black, width: 1.5)
        }
        //.border(.orange, width: 1.5)
        .padding()
        //.border(.purple, width: 1.5)
    }
}

#Preview {
    WelcomePage()
}
