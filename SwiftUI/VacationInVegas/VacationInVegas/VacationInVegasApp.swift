//
//  VacationInVegasApp.swift
//  VacationInVegas
//
//  Created by Dongik Song on 9/3/24.
//

import SwiftUI

@main
struct VacationInVegasApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Place.self)
    }
}
