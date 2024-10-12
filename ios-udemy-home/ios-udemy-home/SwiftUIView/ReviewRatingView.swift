//
//  ReviewRatingView.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/10/24.
//

import SwiftUI

struct ReviewRatingView: View {
    let rating: Double
    let reviewCount: Int

    var body: some View {
        HStack(spacing: 4, content: {
            Text(rating.description)
                .foregroundStyle(.orange)
                .font(.system(size: 10, weight: .semibold))
            Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 10)
                .foregroundStyle(.yellow)
            Text(reviewCount.formatted().withBrackets)
                .foregroundStyle(.gray)
                .font(.system(size: 10))
        })
    }
}

#Preview {
    ReviewRatingView(rating: 4.5, reviewCount: 3341)
}
