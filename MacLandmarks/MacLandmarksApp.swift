//
//  MacLandmarksApp.swift
//  MacLandmarks
//
//  Created by Daniel Moura on 07/04/23.
//

import SwiftUI

@main
struct MacLandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        .commands {
            LandmarkCommands()
        }
        
        Settings {
            LandmarkSettings()
        }
    }
}
