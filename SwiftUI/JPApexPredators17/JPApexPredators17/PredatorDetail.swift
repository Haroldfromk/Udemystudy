//
//  PredatorDetail.swift
//  JPApexPredators17
//
//  Created by Dongik Song on 4/10/25.
//

import SwiftUI
import MapKit

struct PredatorDetail: View {
    let predator: ApexPredator
    
    @State var position: MapCameraPosition
    
    @Namespace var namespace
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    // Background Image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            LinearGradient(stops: [
                                Gradient.Stop(color: .clear, location: 0.8),
                                Gradient.Stop(color: .black, location: 1)
                            ], startPoint: .top, endPoint: .bottom)
                        }
                    
                    // Dino Image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: geo.size.width/1.5,
                            height: geo.size.height/3.7
                        )
                        .scaleEffect(x: -1)
                        .shadow(color:.black, radius: 7)
                        .offset(y: 20)
                }
                VStack(alignment: .leading) {
                    // Dino Name
                    Text(predator.name)
                        .font(.largeTitle)
                    
                    // Current Location
                    NavigationLink {
                        PredatorMap(
                            positoin: .camera(
                                MapCamera(
                                    centerCoordinate: predator.location,
                                    distance: 1000,
                                    heading: 250,
                                    pitch: 80))
                        )
                        .navigationTransition(.zoom(sourceID: 1, in: namespace))
                    } label: {
                        Map(position: $position) {
                            Annotation(predator.name, coordinate: predator.location) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                            .annotationTitles(.hidden)
                        }
                        .frame(height: 125)
                        .clipShape(.rect(cornerRadius: 15))
                        .overlay(alignment: .trailing) {
                            Image(systemName: "greaterthan")
                                .imageScale(.large)
                                .font(.title3)
                                .padding(.trailing, 5)
                        }
                        .overlay(alignment: .topLeading) {
                            Text("Current Location")
                                .padding([.leading, .bottom], 5)
                                .padding(.trailing, 8)
                                .background(.black.opacity(0.33))
                                .clipShape(.rect(bottomTrailingRadius: 15))
                        }
                        .clipShape(.rect(cornerRadius: 15))
                    }
                    .matchedTransitionSource(id: 1, in: namespace)
                    
                    // Appears In
                    Text("Appears In:")
                        .font(.title3)
                    
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("•" + movie)
                            .font(.subheadline)
                    }
                    
                    // Movie Moments
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.bottom, 1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                            
                    }
                    // Link to Webpage
                    Text("Read More:")
                        .font(.caption)
                    
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                }
                .padding()
                .padding(.bottom)
                .frame(width: geo.size.width, alignment: .leading)
                
            }
            .ignoresSafeArea()
            .toolbarBackground(.automatic)
        }
    }
}

#Preview {
    let predator = Predators().apexPredators[2]
    NavigationStack{
        PredatorDetail(
            predator: predator,
            position: .camera(
                MapCamera(
                    centerCoordinate: predator.location,
                    distance: 30000
                )
            )
        )
        .preferredColorScheme(.dark)
    }
}


