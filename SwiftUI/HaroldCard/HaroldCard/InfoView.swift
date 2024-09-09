//
//  InfoView.swift
//  HaroldCard
//
//  Created by Dongik Song on 9/7/24.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(.white)
            .frame(height: 50)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundStyle(.green)
                    Text(text)
                }
                
            )
            .padding(.all)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    InfoView(text: "hi", imageName: "phone.fill")
}
