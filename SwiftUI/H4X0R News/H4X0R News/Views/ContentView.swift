//
//  ContentView.swift
//  H4X0R News
//
//  Created by Dongik Song on 9/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManaer = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManaer.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4X0R News")
        }
        .onAppear {
            self.networkManaer.fetchData()
        }
    }
}



#Preview {
    ContentView()
}


