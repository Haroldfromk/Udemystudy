//
//  ContentView.swift
//  VacationInVegas
//
//  Created by Dongik Song on 7/19/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Places", systemImage: "photo") {
                PlaceList()
            }
            
            Tab("Trip History", systemImage: "chart.line.uptrend.xyaxis") {
                TripsChart()
            }
            
            Tab("Chart", systemImage: "chart.pie") {
                VegasChart()
            }
            
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
        .modelContainer(Place.preview)
}
