//
//  SelectBooksView.swift
//  HPTrivia
//
//  Created by Dongik Song on 6/20/25.
//

import SwiftUI

struct SelectBooksView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(Game.self) private var game
    
    @State private var showTempAlert = false
    
    private var store = Store()
    
    var activeBooks: Bool {
        for book in game.bookQuestions.books {
            if book.status == .active {
                return true
            }
        }
        
        return false
    }
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Which books would you like to see questions from?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(game.bookQuestions.books) { book in
                            if book.status == .active || (book.status == .locked && store.purchased.contains(book.image)) {
                                ActiveBookView(book: book)
                                    .task {
                                        game.bookQuestions.changeStatus(of: book.id, to: .active)
                                    }
                                    .onTapGesture {
                                        game.bookQuestions.changeStatus(of: book.id, to: .inactive)
                                    }
                            } else if book.status == .inactive {
                                InactiveBookViews(book: book)
                                    .onTapGesture {
                                        game.bookQuestions.changeStatus(of: book.id, to: .active)
                                    }
                            } else {
                                LockedBookView(book: book)
                                    .onTapGesture {
                                        let product = store.products[book.id-4]
                                        
                                        Task {
                                            await store.purchase(product)
                                        }
                                    }
                            }
                        }
                    }
                    .padding()
                }
                
                if !activeBooks {
                    Text("You must select at least 1 book.")
                }
                
                Button("Done") {
                    game.bookQuestions.saveStatus()
                    dismiss()
                }
                .font(.largeTitle)
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .foregroundStyle(.white)
                .disabled(!activeBooks)
            }
            .foregroundStyle(.black)
        }
        .interactiveDismissDisabled()
        .task {
            await store.loadProducts()
        }
    }
}


#Preview {
    SelectBooksView()
        .environment(Game())
}
