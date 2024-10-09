//
//  ExchangeRate.swift
//  LOTRConverter17
//
//  Created by Dongik Song on 9/10/24.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack {
            // Left Currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange rate text
            Text(text)
            
            // Right Currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ExchangeRate(leftImage: .silverpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .silverpenny)
}

