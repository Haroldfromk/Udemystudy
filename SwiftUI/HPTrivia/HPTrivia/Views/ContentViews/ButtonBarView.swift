//
//  ButtonBarView.swift
//  HPTrivia
//
//  Created by Dongik Song on 6/18/25.
//

import SwiftUI

struct ButtonBarView: View {
    @Binding var animateViewsIn: Bool
    
    let geo: GeometryProxy
    
    var body: some View {
        HStack {
            Spacer()
            
            InstructionsButton(animateViewsIn: $animateViewsIn, geo: geo)
            
            Spacer()
            
            PlayButton(animateViewsIn: $animateViewsIn, geo: geo)
            
            Spacer()
            
            SettingsButton(animateViewsIn: $animateViewsIn, geo: geo)
            
            Spacer()
            
        }
        .frame(width: geo.size.width)
    }
}

#Preview {
    GeometryReader { geo in
        ButtonBarView(animateViewsIn: .constant(true), geo: geo)
    }
}
