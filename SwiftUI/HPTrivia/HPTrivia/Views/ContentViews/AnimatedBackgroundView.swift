//
//  AnimatedBackgroundView.swift
//  HPTrivia
//
//  Created by Dongik Song on 6/18/25.
//

import SwiftUI

struct AnimatedBackgroundView: View {
    let geo: GeometryProxy
    
    var body: some View {
        Image(.hogwarts)
            .resizable()
            .frame(width: geo.size.width * 3, height: geo.size.height)
            .padding(.top, 3)
            .phaseAnimator([false, true]) { content, phase in
                content
                    .offset(
                        x: phase
                        ? geo.size.width / 1.1
                        : -geo.size.width / 1.1
                    )
            } animation: { _ in
                    .linear(duration: 60)
                
            }
    }
}

#Preview {
    GeometryReader { geo in
        AnimatedBackgroundView(geo: geo)
            .frame(width: geo.size.width, height: geo.size.height)
    }
    .ignoresSafeArea()
}
