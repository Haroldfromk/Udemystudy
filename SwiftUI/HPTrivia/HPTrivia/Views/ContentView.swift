//
//  ContentView.swift
//  HPTrivia
//
//  Created by Dongik Song on 6/13/25.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    @State private var animateViewsIn = false
    @State private var playGame = false

    var body: some View {
        GeometryReader { geo in
            ZStack {
                AnimatedBackgroundView(geo: geo)
                
                VStack {
                    GameTitleView(animateViewsIn: $animateViewsIn)
                    
                    Spacer()
                    
                    RecentScoresView(animateViewsIn: $animateViewsIn)
                    
                    Spacer()
                    
                    ButtonBarView(animateViewsIn: $animateViewsIn, playGame: $playGame, geo: geo)
                    
                    Spacer()
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear {
            animateViewsIn = true
            playAudio()
        }
        .fullScreenCover(isPresented: $playGame) {
            GamePlayView()
                .onAppear {
                    audioPlayer.setVolume(0, fadeDuration: 2)
                }
                .onDisappear {
                    audioPlayer.setVolume(1, fadeDuration: 3)
                }
        }

    }
    
    private func playAudio() {
        let sound = Bundle.main.path(forResource: "magic-in-the-air", ofType: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(filePath: sound!))
        audioPlayer.numberOfLoops = -1
        //audioPlayer.play()
    }
    
}

#Preview {
    ContentView()
        .environment(Game())
}
