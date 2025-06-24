//
//  LockedBookView.swift
//  HPTrivia
//
//  Created by Dongik Song on 6/23/25.
//

import SwiftUI

struct LockedBookView: View {
    @State var book: Book
    
    var body: some View {
        ZStack {
            Image(book.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 7)
                .overlay {
                    Rectangle().opacity(0.75)
                }
            
            Image(systemName: "lock.fill")
                .font(.largeTitle)
                .imageScale(.large)
                .shadow(color: .white, radius: 2)
        }
    }
}

#Preview {
    LockedBookView(book: BookQuestions().books[0])
}
