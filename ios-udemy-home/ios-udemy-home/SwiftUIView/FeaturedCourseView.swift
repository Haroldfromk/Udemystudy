//
//  FeaturedCourseView.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/10/24.
//

import SwiftUI

struct FeaturedCourseView: View {
    let imageLink: String
    let title: String
    let author: String
    let rating: Double
    let reviewCount: Int
    let price: Decimal
    
    var onTap: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            AsyncImage(url: URL(string: imageLink)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140)
                    .border(Color.gray.opacity(0.3))
                    .clipped()
            } placeholder: {
                PlaceholderImageView()
                    .frame(height: 140)
            }.padding(.bottom, 4)
            
            Text(title)
                .font(.system(size: 12, weight: .bold, design: .default))
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(4)
            Text(author)
                .font(.system(size: 10, weight: .regular, design: .default))
                .foregroundStyle(.gray)
            ReviewRatingView(rating: rating, reviewCount: reviewCount)
            Text(price.priceFormat)
                .font(.system(size: 10, weight: .bold))
            Spacer()
        }
        .onTapGesture {
            onTap?()
        }
    }
}

#Preview {
    FeaturedCourseView(
        imageLink: "https://picsum.photos/300/200",
        title: "iOs & Swift: Server Driven UI Compositional Layout & SwiftUI",
        author: "Kelvin Fok",
        rating: 4.5,
        reviewCount: 224,
        price: 19.99
    )
}
