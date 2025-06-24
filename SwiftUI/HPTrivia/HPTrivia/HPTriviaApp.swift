//
//  HPTriviaApp.swift
//  HPTrivia
//
//  Created by Dongik Song on 6/13/25.
//

import SwiftUI

@main
struct HPTriviaApp: App {
    private var game = Game()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(game)
        }
    }
}

/*
 App Development Plan:
 - Game Intro Screen
 - Gameplay Screen
 - Game logic (questions, scores, etc.)
 - Celebration
 - Audio
 - Animations
 - In-app purchases
 - Store
 - Instructions screen
 - Books
 - Persist scores
 */
