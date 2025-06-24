//
//  RecentScoresView.swift
//  HPTrivia
//
//  Created by Dongik Song on 6/18/25.
//

import SwiftUI

struct RecentScoresView: View {
    @Binding var animateViewsIn: Bool
    
    var body: some View {
        VStack {
            if animateViewsIn {
                VStack {
                    Text("Recent Scores")
                        .font(.title2)
                    
                    Text("33")
                    Text("27")
                    Text("15")
                    
                }
                .font(.title3)
                .foregroundStyle(.white)
                .padding(.horizontal)
                .background(.black.opacity(0.7))
                .clipShape(.rect(cornerRadius: 15))
                .transition(.opacity)
            }
        }
        .animation(.linear(duration: 1).delay(4), value: animateViewsIn)
    }
}

#Preview {
    RecentScoresView(animateViewsIn: .constant(true))
}
