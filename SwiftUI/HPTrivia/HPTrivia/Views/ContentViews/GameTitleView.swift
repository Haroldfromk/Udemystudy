//
//  GameTitleView.swift
//  HPTrivia
//
//  Created by Dongik Song on 6/18/25.
//

import SwiftUI

struct GameTitleView: View {
    @Binding var animateViewsIn: Bool
    
    var body: some View {
        VStack {
            if animateViewsIn {
                VStack {
                    Image(systemName: "bolt.fill")
                        .imageScale(.large)
                        .font(.largeTitle)
                    
                    Text("HP")
                        .font(.custom("PartyLetPlain", size: 70))
                        .padding(.bottom, -50)
                    
                    Text("Trivia")
                        .font(.custom("PartyLetPlain", size: 60))
                }
                .padding(.top, 70)
                .transition(.move(edge: .top))
            }
        }
        .animation(.easeInOut(duration: 0.7).delay(2), value: animateViewsIn)
    }
}

#Preview {
    GameTitleView(animateViewsIn: .constant(true))
}
