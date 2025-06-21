//
//  CurrencyIcon.swift
//  LOTRConverter17
//
//  Created by Dongik Song on 3/7/25.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImage: ImageResource
    let currencyName: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Currency image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            // Currency name
            Text(currencyName)
                .padding(3)
                .background(.brown.opacity(0.75))
                .font(.caption)
                .frame(maxWidth: .infinity)
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}


#Preview() {
    CurrencyIcon(currencyImage: .goldpenny, currencyName: "Gold Penny")
}

