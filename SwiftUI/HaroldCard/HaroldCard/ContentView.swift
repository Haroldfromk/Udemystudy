//
//  ContentView.swift
//  HaroldCard
//
//  Created by Dongik Song on 9/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .ignoresSafeArea(.all)
            VStack {
                Image("turtle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200.0, height: 150.0)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(.white, lineWidth: 5)
                    )
                
                Text("Harold Song")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundStyle(.white)
                Text("iOS Developer")
                    .foregroundStyle(.white)
                    .font(.system(size: 25))
                
                Divider()
                InfoView(
                    text: "010-1234-5678", imageName: "phone.fill"
                )
                InfoView(
                    text: "dongik369@naver.com", imageName: "envelope.fill"
                )
                
            }
        }
    }
}

#Preview {
    ContentView()
}


